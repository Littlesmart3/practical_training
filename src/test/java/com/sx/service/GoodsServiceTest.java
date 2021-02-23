package com.sx.service;

import com.sx.service.impl.GoodsServiceImpl;
import com.sx.web.dto.GoodsDTO;
import org.junit.jupiter.api.Test;

import java.util.List;

public class GoodsServiceTest {

    private GoodsService goodsService = new GoodsServiceImpl();

    @Test
    public void queryGoodsTest(){

        List<GoodsDTO> result = goodsService.queryGoods(-1);

        for(GoodsDTO goodsDTO : result)
            System.out.println(goodsDTO.toString());
    }
}
