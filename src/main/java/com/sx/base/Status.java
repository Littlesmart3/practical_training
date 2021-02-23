package com.sx.base;

public enum Status {

    //成功
    SUCCESS(200, "成功"),
    //请求无效
    BAD_REQUEST(400, "请求错误"),

    NOT_FOUND(404, "未找到资源"),

    INTERNAL_SERVER_ERROR(500, "内部服务错误"),

    NOT_LOGIN(10001, "用户未登录"),

    NOT_UNLIVE_USER(10002, "用户已存在"),

    NOT_VALID_USER(10003, "账号或密码错误"),

    NOT_VALID_ACCOUNT(10004, "账号格式错误"),

    NOT_VALID_PASSWORD(10005, "密码格式错误"),

    NOT_VALID_NICKNAME(10006, "昵称格式错误"),

    NOT_VALOD_IDENTITY(10007, "非法用户身份"),

    NOT_ENOUGH_MONEY(20001, "可用余额不足");


    private int code;

    private String standardMessage;

    Status(int code, String standardMessage) {
        this.code = code;
        this.standardMessage = standardMessage;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getStandardMessage() {
        return standardMessage;
    }

    public void setStandardMessage(String standardMessage) {
        this.standardMessage = standardMessage;
    }

}
