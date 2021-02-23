package com.sx.web.controller;

import com.sx.base.ApiResponse;
import com.sx.base.Status;
import com.sx.model.Comment;
import com.sx.service.CommentService;
import com.sx.service.impl.CommentServiceImpl;
import com.sx.web.dto.UserDTO;
import com.sx.web.servlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import java.util.List;
import java.util.Map;

@WebServlet("/comment")
public class CommentController extends BaseServlet {

    private CommentService commentService = new CommentServiceImpl();

    public ApiResponse query(Map map){

        int goodsId = Integer.parseInt((String) map.get("goodsId"));

        List<Comment> list = commentService.queryCommentByGoodsId(goodsId);

        if(list == null)
            return ApiResponse.ofStatus(Status.BAD_REQUEST);

        return ApiResponse.ofSuccess(list);
    }

    public ApiResponse add(Map map){

        int goodsId = Integer.parseInt((String) map.get("goodsId"));

        String content = (String) map.get("content");

        UserDTO user = (UserDTO) session.getAttribute("user");

        Boolean result = commentService.insertComment(goodsId, user.getAccount(), content);

        if(!result)
            return ApiResponse.ofStatus(Status.BAD_REQUEST);

        return ApiResponse.ofSuccess(null);
    }

}
