package com.sx.service;

import com.sx.model.Comment;

import java.util.List;

public interface CommentService {

    public Boolean insertComment(int goodsId, String userAccount, String commentContent);

    public List<Comment> queryCommentByGoodsId(int goodsId);

}
