package com.sx.web.controller;

import com.sx.base.ApiResponse;
import com.sx.base.Status;
import com.sx.service.ShoppingCarService;
import com.sx.service.impl.ShoppingCarServiceImpl;
import com.sx.web.dto.ShoppingCarDTO;
import com.sx.web.dto.UserDTO;
import com.sx.web.servlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import java.util.Map;

@WebServlet(value = "/shopping")
public class ShoppingCarController extends BaseServlet {

    private final ShoppingCarService shoppingCarService = new ShoppingCarServiceImpl();

    public ApiResponse query(Map map) {

        UserDTO user = (UserDTO) session.getAttribute("user");

        ShoppingCarDTO data = shoppingCarService.queryShoppingCar(user.getId());

        return ApiResponse.ofSuccess(data);
    }

    public ApiResponse update(Map map) {

        int goodsId = Integer.parseInt((String) map.get("goodsId"));

        int buys = Integer.parseInt((String) map.get("buys"));

        UserDTO user = (UserDTO) session.getAttribute("user");

        boolean result = shoppingCarService.updateGoodsCount(user.getId(), goodsId, buys);

        if (result) {

            return ApiResponse.ofSuccess(null);

        } else {

            return ApiResponse.ofStatus(Status.BAD_REQUEST);

        }

    }

    public ApiResponse delete(Map map) {

        int goodsId = Integer.parseInt((String) map.get("goodsId"));

        UserDTO user = (UserDTO) session.getAttribute("user");

        boolean result = shoppingCarService.deleteGoods(user.getId(), goodsId);

        if (result) {

            return ApiResponse.ofSuccess(null);

        } else {

            return ApiResponse.ofStatus(Status.BAD_REQUEST);

        }
    }

    public ApiResponse buys(Map map) {

        UserDTO user = (UserDTO) session.getAttribute("user");

        double result = shoppingCarService.buyGoods(user.getId(), user.getMoney());

        if (result == -1) {

            return ApiResponse.ofStatus(Status.NOT_ENOUGH_MONEY);

        } else {

            return ApiResponse.ofSuccess(null);

        }

    }

    public ApiResponse empty(Map map) {

        UserDTO user = (UserDTO) session.getAttribute("user");

        boolean result = shoppingCarService.deleteGoods(user.getId(), -1);

        if (result) {

            return ApiResponse.ofSuccess(null);

        } else {

            return ApiResponse.ofStatus(Status.BAD_REQUEST);

        }

    }
}
