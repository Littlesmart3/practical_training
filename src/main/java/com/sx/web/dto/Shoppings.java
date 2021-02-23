package com.sx.web.dto;

import java.io.Serializable;

public class Shoppings implements Serializable {

    private int goodsId;

    private String goodsTitle;

    private double goodsPrice;

    private int goodsCounts;

    private String goodsPhoto;

    public Shoppings() {
    }

    public Shoppings(Object goodsId, Object goodsTitle, Object goodsPrice, Object goodsCounts, Object goodsPhoto) {
        this.goodsId = (int) goodsId;
        this.goodsTitle = (String) goodsTitle;
        this.goodsPrice = (double) goodsPrice;
        this.goodsCounts = (int) goodsCounts;
        this.goodsPhoto = (String) goodsPhoto;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsTitle() {
        return goodsTitle;
    }

    public void setGoodsTitle(String goodsTitle) {
        this.goodsTitle = goodsTitle;
    }

    public double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public int getGoodsCounts() {

        return goodsCounts;
    }

    public void setGoodsCounts(int goodsCounts) {
        this.goodsCounts = goodsCounts;
    }

    public String getGoodsPhoto() {
        return goodsPhoto;
    }

    public void setGoodsPhoto(String goodsPhoto) {
        this.goodsPhoto = goodsPhoto;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"goodsId\":")
                .append(goodsId);
        sb.append(",\"goodsTitle\":\"")
                .append(goodsTitle).append('\"');
        sb.append(",\"goodsPrice\":")
                .append(goodsPrice);
        sb.append(",\"goodsCounts\":\"")
                .append(goodsCounts).append('\"');
        sb.append(",\"goodsPhoto\":\"")
                .append(goodsPhoto).append('\"');
        sb.append('}');
        return sb.toString();
    }
}
