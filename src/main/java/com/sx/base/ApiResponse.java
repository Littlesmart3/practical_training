package com.sx.base;

import java.io.Serializable;

public class ApiResponse implements Serializable {

    //状态码
    private int code;

    //状态信息
    private String message;

    //数据
    private Object data;

    //是否更多
    private boolean more;


    public ApiResponse(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ApiResponse() {
        this.code = Status.SUCCESS.getCode();
        this.message = Status.SUCCESS.getStandardMessage();
    }


    public static ApiResponse ofMessage(int code, String message) {
        return new ApiResponse(code, message, null);
    }

    public static ApiResponse ofSuccess(Object data) {
        return new ApiResponse(Status.SUCCESS.getCode(), Status.SUCCESS.getStandardMessage(), data);
    }

    public static ApiResponse ofStatus(Status status) {
        return new ApiResponse(status.getCode(), status.getStandardMessage(), null);
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"code\":")
                .append(code);
        sb.append(",\"message\":\"")
                .append(message).append('\"');
        sb.append(",\"data\":")
                .append(data);
        sb.append(",\"more\":")
                .append(more);
        sb.append('}');
        return sb.toString();
    }
}
