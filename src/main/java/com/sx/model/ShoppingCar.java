package com.sx.model;

import java.io.Serializable;
import java.util.List;

public class ShoppingCar implements Serializable {

    private int shoppingCarId;

    private int userId;

    private int goodsId;

    private int shoppingCounts;


    public ShoppingCar() {
    }

    public ShoppingCar(int shoppingCarId, int userId, int goodsId, int shoppingCounts) {
        this.shoppingCarId = shoppingCarId;
        this.userId = userId;
        this.goodsId = goodsId;
        this.shoppingCounts = shoppingCounts;
    }


    public int getShoppingCarId() {
        return shoppingCarId;
    }

    public void setShoppingCarId(int shoppingCarId) {
        this.shoppingCarId = shoppingCarId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getShoppingCounts() {
        return shoppingCounts;
    }

    public void setShoppingCounts(int shoppingCounts) {
        this.shoppingCounts = shoppingCounts;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"shoppingCarId\":")
                .append(shoppingCarId);
        sb.append(",\"userId\":")
                .append(userId);
        sb.append(",\"goodsId\":")
                .append(goodsId);
        sb.append(",\"shoppingCounts\":")
                .append(shoppingCounts);
        sb.append('}');
        return sb.toString();
    }
}
