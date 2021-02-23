package com.sx.web.dto;

import java.io.Serializable;
import java.util.List;

public class ShoppingCarDTO implements Serializable {

    private int userId;

    private List<Shoppings> goods;

    public ShoppingCarDTO() {
    }

    public ShoppingCarDTO(int userId, List<Shoppings> goods) {
        this.userId = userId;
        this.goods = goods;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<Shoppings> getGoods() {
        return goods;
    }

    public void setGoods(List<Shoppings> goods) {
        this.goods = goods;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"userId\":")
                .append(userId);
        sb.append(",\"goods\":")
                .append(goods);
        sb.append('}');
        return sb.toString();
    }
}
