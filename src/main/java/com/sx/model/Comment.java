package com.sx.model;

import java.io.Serializable;

public class Comment  implements Serializable {

    private int commentId;

    private int goodsId;

    private String userAccount;

    private String commentContent;

    public Comment() {
    }

    public Comment(Object commentId, Object goodsId, Object userAccount, Object commentContent) {
        this.commentId = (int) commentId;
        this.goodsId = (int) goodsId;
        this.userAccount = (String) userAccount;
        this.commentContent = (String) commentContent;
    }

    public Comment(int commentId, int goodsId, String userAccount, String commentContent) {
        this.commentId = commentId;
        this.goodsId = goodsId;
        this.userAccount = userAccount;
        this.commentContent = commentContent;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getUserId() {
        return userAccount;
    }

    public void setUserId(int userId) {
        this.userAccount = userAccount;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }


    @Override
    public String
    toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"commentId\":")
                .append(commentId);
        sb.append(",\"goodsId\":")
                .append(goodsId);
        sb.append(",\"userAccount\":\"")
                .append(userAccount).append('\"');
        sb.append(",\"commentContent\":\"")
                .append(commentContent).append('\"');
        sb.append('}');
        return sb.toString();
    }
}
