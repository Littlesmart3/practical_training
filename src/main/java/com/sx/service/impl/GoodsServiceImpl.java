package com.sx.service.impl;

import com.sx.base.BaseDao;
import com.sx.model.Goods;
import com.sx.service.GoodsService;
import com.sx.utils.FileUtil;
import com.sx.web.dto.GoodsDTO;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class GoodsServiceImpl implements GoodsService {

    @Override
    public boolean updateGoods(int goodsId, String goodsTitle, double goodsPrice,
                               String goodsTag, String goodsPhoto, int goodsSales,
                               int goodsCount, String goodsOutline, String goodsIntroduce,
                               int userId, int type) {

        String sql = null;

        List<Object> data = new ArrayList<>();

        if (type == 0) {

            sql = "INSERT INTO goods(goods_title, goods_price, goods_tag, goods_photo, goods_sales, " +
                    "goods_count, goods_outline, goods_introduce, goods_saler) " +
                    "VALUES(?, ?, null, ?, 0, ?, null, ?, ?) ";

            data.add(goodsTitle);
            data.add(goodsPrice);
            data.add(goodsPhoto);
            data.add(goodsCount);
            data.add(goodsIntroduce);
            data.add(userId);

        } else if(type == 1){

            sql = "UPDATE goods SET ";

            if (goodsTitle != null) {

                sql += "goods_title = ? ,";

                data.add(goodsTitle);
            }

            if (goodsPrice != -1) {

                sql += "goods_price = ? ,";

                data.add(goodsPrice);

            }

            if (goodsPhoto != null) {

                sql += "goods_photo = ? ,";

                data.add(FileUtil.getPhoto());

            }

            if (goodsCount != -1) {

                sql += "goods_count = ? ,";

                data.add(goodsCount);

            }

            if (goodsIntroduce != null) {

                sql += "goods_introduce = ? ";

                data.add(FileUtil.getIntroduce());

            }

            sql += "WHERE goods_id = ? ";
            data.add(goodsId);
        }

        System.out.println(sql);

        int result = BaseDao.executeInsertOrUpdate(sql, data, type);

        return (result != 0);
    }

    @Override
    public boolean deleteGoods(int goodsId) {

        String sql = "DELETE FROM goods WHERE goods_id = ? ";

        return BaseDao.executeDelete(sql, Arrays.asList(new Object[]{goodsId}));
    }

    @Override
    public Goods goodsInfoByGoodsId(int goodsId) {

        String sql = "SELECT * FROM goods WHERE goods_id = ? ";

        List<Map<String, Object>> list =
                BaseDao.executeQuery(sql, Arrays.asList(new Object[]{goodsId}));

        if (list.size() == 0)
            return null;

        return new Goods(list.get(0).get("goods_id"), list.get(0).get("goods_title"),
                list.get(0).get("goods_price"), list.get(0).get("goods_tag"), list.get(0).get("goods_photo"),
                list.get(0).get("goods_saler"), list.get(0).get("goods_sales"), list.get(0).get("goods_count"),
                list.get(0).get("goods_outline"), list.get(0).get("goods_introduce"));
    }

    @Override
    public List<GoodsDTO> queryGoods(int userId) {

        String sql = "SELECT g.goods_id AS goods_id, g.goods_title AS goods_title, g.goods_price AS goods_price, " +
                "g.goods_photo AS goods_photo, g.goods_sales AS goods_sales, g.goods_saler AS user_id, " +
                "u.nick_name AS nick_name, g.goods_count AS goods_count FROM goods AS g LEFT JOIN user AS u ON g.goods_saler = u.id ";

        List<Object> data = new ArrayList<>();

        if (userId != -1) {

            sql += "WHERE g.goods_saler = ? ";

            data.add(userId);
        }

        List<Map<String, Object>> list = BaseDao.executeQuery(sql, data);

        if (list.size() == 0)
            return null;

        List<GoodsDTO> result = new ArrayList<>();

        GoodsDTO goodsDTO;

        for (Map<String, Object> m : list) {

            goodsDTO = new GoodsDTO(m.get("goods_id"), m.get("goods_title"), m.get("goods_price"),
                    m.get("goods_photo"), m.get("goods_sales"), m.get("user_id"), m.get("nick_name"),
                    m.get("goods_count"));

            result.add(goodsDTO);
        }

        return result;
    }
}
