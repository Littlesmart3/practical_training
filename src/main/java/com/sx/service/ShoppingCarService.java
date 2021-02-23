package com.sx.service;


import com.sx.web.dto.ShoppingCarDTO;

import java.util.List;

public interface ShoppingCarService {

    public Boolean updateGoodsCount(int userId, int goodsId, int goodsCount);

    public Boolean deleteGoods(int userId, int goodsId);

    public double buyGoods(int userId, double money);

    public ShoppingCarDTO queryShoppingCar(int userId);

}
