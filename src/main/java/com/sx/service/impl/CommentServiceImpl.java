package com.sx.service.impl;

import com.sx.base.BaseDao;
import com.sx.model.Comment;
import com.sx.service.CommentService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class CommentServiceImpl implements CommentService {

    @Override
    public Boolean insertComment(int goodsId, String userAccount, String commentContent) {

        String sql = "INSERT INTO comment(goods_id, user_account, comment_content) " +
                "VALUES(?, ?, ?)";

        Object[] data = {goodsId, userAccount, commentContent};

        int result = BaseDao.executeInsertOrUpdate(sql, Arrays.asList(data), 0);

        return (result != 0);

    }

    @Override
    public List<Comment> queryCommentByGoodsId(int goodsId) {

        String sql = "SELECT * FROM comment WHERE goods_id = ?";

        List<Map<String, Object>> list = BaseDao.executeQuery(sql, Arrays.asList(new Object[]{goodsId}));

        if (list.size() == 0)
            return null;

        List<Comment> result = new ArrayList<>();

        Comment comment;

        for (Map<String, Object> data : list) {
            comment = new Comment(data.get("comment_id"), data.get("goods_id"),
                    data.get("user_account"), data.get("comment_content"));
            result.add(comment);
        }

        return result;
    }
}
