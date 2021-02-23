package com.sx.model;

import java.io.Serializable;

public class Goods  implements Serializable {

    private int goodsId;

    private String goodsTitle;

    private double goodsPrice;

    private String goodsTag;

    private String goodsPhoto;

    private int goodsSaler;

    private int goodsSales;

    private int goodsCount;

    private String goodsOutline;

    private String goodsIntroduce;

    public Goods() {
    }

    public Goods(Object goodsId, Object goodsTitle, Object goodsPrice, Object goodsTag,
                 Object goodsPhoto, Object goodsSaler, Object goodsSales, Object goodsCount,
                 Object goodsOutline, Object goodsIntroduce) {
        this.goodsId = (int) goodsId;
        this.goodsTitle = (String) goodsTitle;
        this.goodsPrice = (double) goodsPrice;
        this.goodsTag = (String) goodsTag;
        this.goodsPhoto = (String) goodsPhoto;
        this.goodsSaler = (int) goodsSaler;
        this.goodsSales = (int) goodsSales;
        this.goodsCount = (int) goodsCount;
        this.goodsOutline = (String) goodsOutline;
        this.goodsIntroduce = (String) goodsIntroduce;
    }

    public Goods(String goodsTitle, double goodsPrice, String goodsTag, String goodsPhoto,
                 int goodsSaler, int goodsCount, String goodsOutline, String goodsIntroduce) {
        this.goodsTitle = goodsTitle;
        this.goodsPrice = goodsPrice;
        this.goodsTag = goodsTag;
        this.goodsPhoto = goodsPhoto;
        this.goodsSaler = goodsSaler;
        this.goodsSales = 0;
        this.goodsCount = goodsCount;
        this.goodsOutline = goodsOutline;
        this.goodsIntroduce = goodsIntroduce;
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

    public String getGoodsTag() {
        return goodsTag;
    }

    public void setGoodsTag(String goodsTag) {
        this.goodsTag = goodsTag;
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

    public String getGoodsOutline() {
        return goodsOutline;
    }

    public void setGoodsOutline(String goodsOutline) {
        this.goodsOutline = goodsOutline;
    }

    public String getGoodsIntroduce() {
        return goodsIntroduce;
    }

    public void setGoodsIntroduce(String goodsIntroduce) {
        this.goodsIntroduce = goodsIntroduce;
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
        sb.append(",\"goodsTag\":\"")
                .append(goodsTag).append('\"');
        sb.append(",\"goodsPhoto\":\"")
                .append(goodsPhoto).append('\"');
        sb.append(",\"goodsSaler\":")
                .append(goodsSaler);
        sb.append(",\"goodsSales\":")
                .append(goodsSales);
        sb.append(",\"goodsCount\":")
                .append(goodsCount);
        sb.append(",\"goodsOutline\":\"")
                .append(goodsOutline).append('\"');
        sb.append(",\"goodsIntroduce\":\"")
                .append(goodsIntroduce).append('\"');
        sb.append('}');
        return sb.toString();
    }
}
