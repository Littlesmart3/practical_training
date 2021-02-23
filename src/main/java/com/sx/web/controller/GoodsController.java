package com.sx.web.controller;

import com.sx.base.ApiResponse;
import com.sx.base.Status;
import com.sx.model.Goods;
import com.sx.service.GoodsService;
import com.sx.service.impl.GoodsServiceImpl;
import com.sx.utils.FileUtil;
import com.sx.web.dto.GoodsDTO;
import com.sx.web.dto.UserDTO;
import com.sx.web.servlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import java.util.List;
import java.util.Map;

@WebServlet(value = "/goods")
public class GoodsController extends BaseServlet {

    private final GoodsService goodsService = new GoodsServiceImpl();

    public ApiResponse queryGoods(Map map) {

        int flag = Integer.parseInt((String) map.get("goodsSaler"));

        UserDTO user = (UserDTO) session.getAttribute("user");

        List<GoodsDTO> result = goodsService.queryGoods(flag == 1 ? user.getId() : -1);

        if (result == null) {

            return ApiResponse.ofStatus(Status.BAD_REQUEST);

        }

        return ApiResponse.ofSuccess(result);
    }


    public ApiResponse info(Map map) {

        int goodsId = Integer.parseInt((String) map.get("goodsId"));

        Goods goods = goodsService.goodsInfoByGoodsId(goodsId);

        if (goods == null) {

            return ApiResponse.ofStatus(Status.BAD_REQUEST);

        }

        return ApiResponse.ofSuccess(goods);
    }

    public ApiResponse add(Map map) {

        UserDTO user = (UserDTO) session.getAttribute("user");

        String goodsTitle = (String) map.get("goodsTitle");

        double goodsPrice = Double.parseDouble((String) map.get("goodsPrice"));

        int goodsSaler = user.getId();

        int goodsCount = Integer.parseInt((String) map.get("goodsCount"));

        String goodsPhoto = FileUtil.getPhoto();

        String goodsIntroduce = FileUtil.getIntroduce();

        boolean result = goodsService.updateGoods(-1, goodsTitle, goodsPrice, null,
                goodsPhoto, -1, goodsCount, null, goodsIntroduce, goodsSaler, 0);

        if (result)
            return ApiResponse.ofSuccess(null);

        return ApiResponse.ofStatus(Status.BAD_REQUEST);
    }

    public ApiResponse update(Map map) {

        int goodsId = Integer.parseInt((String) map.get("goodsId"));

        String goodsTitle = (String) map.get("goodsTitle");

        double goodsPrice = Double.parseDouble((String) map.get("goodsPrice"));

        int goodsCount = Integer.parseInt((String) map.get("goodsCount"));

        boolean result = goodsService.updateGoods(goodsId, goodsTitle, goodsPrice, null, "null",
                0, goodsCount, null, "null", -1, 1);

        if (result)
            return ApiResponse.ofSuccess(null);

        return ApiResponse.ofStatus(Status.BAD_REQUEST);
    }

    public ApiResponse delete(Map map) {

        int goodsId = Integer.parseInt((String) map.get("goodsId"));

        boolean result = goodsService.deleteGoods(goodsId);

        if (result)
            return ApiResponse.ofSuccess(null);
        else
            return ApiResponse.ofStatus(Status.BAD_REQUEST);

    }

}
