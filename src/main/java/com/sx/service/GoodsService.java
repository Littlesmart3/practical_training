package com.sx.service;

import com.sx.model.Goods;
import com.sx.web.dto.GoodsDTO;

import java.util.List;

public interface GoodsService {

    public boolean updateGoods(int goodsId, String goodsTitle, double goodsPrice, String goodsTag,
                            String goodsPhoto, int goodsSales, int goodsCount,
                            String goodsOutline, String goodsIntroduce, int userId, int type);

    public boolean deleteGoods(int goodsId);

    public Goods goodsInfoByGoodsId(int goodsId);

    public List<GoodsDTO> queryGoods(int userId);

}
