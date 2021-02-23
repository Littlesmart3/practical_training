package com.sx.service;

import com.sx.service.impl.ShoppingCarServiceImpl;
import com.sx.web.dto.ShoppingCarDTO;
import org.junit.jupiter.api.Test;

public class ShoppingCarServiceTest {

    private ShoppingCarService shoppingCarService = new ShoppingCarServiceImpl();

    @Test
    public void insertTest(){

        int userId = 3;
        int goodsId = 3;
        int goodsCount = 10;

        Boolean result = shoppingCarService.updateGoodsCount(userId, goodsId, goodsCount);

        System.out.println(result);

    }

    @Test
    public void queryTest(){

        ShoppingCarDTO shoppingCarDTO = shoppingCarService.queryShoppingCar(1);

        System.out.println(shoppingCarDTO.toString());
    }

}
