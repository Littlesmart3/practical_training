package com.sx.service;

import com.sx.model.Comment;
import com.sx.service.impl.CommentServiceImpl;
import org.junit.jupiter.api.Test;

import java.util.List;

public class CommentServiceTest {

    private CommentService commentService = new CommentServiceImpl();

    @Test
    public void insertComment() {

        Boolean result;
        for (int i = 0; i < 10; ++i) {
            result = commentService.insertComment(1, "czz000", "hahaha");
            System.out.println(result);
        }
    }

    @Test
    public void queryCommentByGoodsId(){

        List<Comment> list = commentService.queryCommentByGoodsId(1);

        if(list == null)
            System.out.println("false");

        list.forEach(comment -> System.out.println(comment.toString()));

    }

}
