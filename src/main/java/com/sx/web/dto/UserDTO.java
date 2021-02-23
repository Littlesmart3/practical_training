package com.sx.web.dto;

import java.io.Serializable;

public class UserDTO implements Serializable {

    private int id;

    private String account;

    private String nickName;

    private double money;

    private int identity;

    public UserDTO() {
    }

    public UserDTO(Object id, Object account, Object nickName, Object money, Object identity) {
        this.id = (int)id;
        this.account = (String) account;
        this.nickName = (String) nickName;
        this.money = (double) money;
        this.identity = (int) identity;
    }

    public UserDTO(int id, String account, String nickName, double money, int identity) {
        this.id = id;
        this.account = account;
        this.nickName = nickName;
        this.money = money;
        this.identity = identity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public int getIdentity() {
        return identity;
    }

    public void setIdentity(int identity) {
        this.identity = identity;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"id\":")
                .append(id);
        sb.append(",\"account\":\"")
                .append(account).append('\"');
        sb.append(",\"nickName\":\"")
                .append(nickName).append('\"');
        sb.append(",\"money\":")
                .append(money);
        sb.append(",\"identity\":")
                .append(identity);
        sb.append('}');
        return sb.toString();
    }
}
