package com.sx.service.impl;

import com.sx.base.BaseDao;
import com.sx.model.Goods;
import com.sx.service.GoodsService;
import com.sx.service.ShoppingCarService;
import com.sx.service.UserService;
import com.sx.web.dto.ShoppingCarDTO;
import com.sx.web.dto.Shoppings;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class ShoppingCarServiceImpl implements ShoppingCarService {

    private final UserService userService = new UserServiceImpl();

    private final GoodsService goodsService = new GoodsServiceImpl();

    @Override
    public Boolean updateGoodsCount(int userId, int goodsId, int goodsCount) {

        String sql = "SELECT COUNT(shopping_car_id) FROM shopping_car WHERE user_id = ? AND goods_id = ?";

        List<Object> data = new ArrayList(Arrays.asList(userId, goodsId));

        List<Map<String, Object>> list = BaseDao.executeQuery(sql, data);

        int result = Integer.parseInt(String.valueOf(list.get(0).get("COUNT(shopping_car_id)")));

        if (result == 0) {

            sql = "INSERT INTO shopping_car(user_id, goods_id, shopping_counts) VALUES(?, ?, ?)";

            data.add(goodsCount);

            result = BaseDao.executeInsertOrUpdate(sql, data, 0);

        } else {

            sql = "UPDATE shopping_car SET shopping_counts = ? WHERE user_id = ? AND goods_id = ?";

            data.add(0, goodsCount);

            result = BaseDao.executeInsertOrUpdate(sql, data, 1);
        }

        return (result != 0);
    }

    @Override
    public Boolean deleteGoods(int userId, int goodsId) {

        String sql = "DELETE FROM shopping_car WHERE user_id = ?";

        List<Object> data = new ArrayList<>();

        data.add(userId);

        if(goodsId != -1){

            sql += "AND goods_id = ?";

            data.add(goodsId);

        }

        return BaseDao.executeDelete(sql, data);
    }

    @Override
    public double buyGoods(int userId, double money) {

        String sql = "SELECT (s.shopping_counts * g.goods_price) AS price, s.goods_id AS goods_id," +
                "s.shopping_counts AS goods_counts FROM shopping_car AS s " +
                "LEFT JOIN goods AS g ON s.goods_id = g.goods_id WHERE s.user_id = ?";

        List<Map<String, Object>> list = BaseDao.executeQuery(sql, Arrays.asList(new Object[]{userId}));

        double sum = 0;

        for(Map<String, Object> data : list){
            sum += (double)data.get("price");
        }

        if(sum > money)
            return -1;
        else{
            money -= sum;

            userService.updateUser(null, null, money, userId);

            for(Map<String, Object> data : list){
                sql = "UPDATE goods SET goods_counts = (goods_counts - 1) , goods_sales = (goods_sales + 1) WHERE goods_id = ?";
                BaseDao.executeInsertOrUpdate(sql, Arrays.asList(new Object[]{data.get("goods_id")}), 1);
            }

            deleteGoods(userId, -1);

            return money;
        }
    }

    @Override
    public ShoppingCarDTO queryShoppingCar(int userId) {

        String sql = "SELECT s.goods_id AS goods_id, g.goods_title AS goods_title, " +
                "g.goods_price AS goods_price, s.shopping_counts AS goods_counts, " +
                "g.goods_photo AS goods_photo FROM shopping_car AS s LEFT JOIN goods AS g " +
                "ON s.goods_id = g.goods_id WHERE user_id = ? ";

        List<Map<String, Object>> list = BaseDao.executeQuery(sql, Arrays.asList(new Object[]{userId}));

        if(list.size() == 0)
            return null;

        List<Shoppings> result = new ArrayList<>();

        Shoppings shoppings;

        for(Map<String, Object> data : list){
           shoppings = new Shoppings(data.get("goods_id"), data.get("goods_title"), data.get("goods_price"),
                   data.get("goods_counts"), data.get("goods_photo"));

           result.add(shoppings);
        }

        return new ShoppingCarDTO(userId, result);
    }
}
