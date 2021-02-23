package com.sx.web.dto;

import java.io.Serializable;

public class GoodsDTO implements Serializable {

    private int goodsId;

    private String goodsTitle;

    private double goodsPrice;

    private String goodsPhoto;

    private int goodsCount;

    private int goodsSales;

    private int goodsSaler;

    private String nickName;

    public GoodsDTO() {
    }



    public GoodsDTO(Object goodsId, Object goodsTitle, Object goodsPrice,
                    Object goodsPhoto,Object goodsSales, Object goodsSaler, Object nickName, Object goodsCount) {
        this.goodsId = (int) goodsId;
        this.goodsTitle = (String) goodsTitle;
        this.goodsPrice = (double) goodsPrice;
        this.goodsPhoto = (String) goodsPhoto;
        this.goodsSales = (int) goodsSales;
        this.goodsSaler = (int) goodsSaler;
        this.nickName = (String) nickName;
        this.goodsCount = (int) goodsCount;
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

    public String getGoodsPhoto() {
        return goodsPhoto;
    }

    public void setGoodsPhoto(String goodsPhoto) {
        this.goodsPhoto = goodsPhoto;
    }

    public int getGoodsSaler() {
        return goodsSaler;
    }

    public void setGoodsSaler(int goodsSaler) {
        this.goodsSaler = goodsSaler;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public int getGoodsSales() {
        return goodsSales;
    }

    public void setGoodsSales(int goodsSales) {
        this.goodsSales = goodsSales;
    }

    public int getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(int goodsCount) {
        this.goodsCount = goodsCount;
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
        sb.append(",\"goodsPhoto\":\"")
                .append(goodsPhoto).append('\"');
        sb.append(",\"goodsCount\":")
                .append(goodsCount);
        sb.append(",\"goodsSales\":")
                .append(goodsSales);
        sb.append(",\"goodsSaler\":")
                .append(goodsSaler);
        sb.append(",\"nickName\":\"")
                .append(nickName).append('\"');
        sb.append('}');
        return sb.toString();
    }
}
