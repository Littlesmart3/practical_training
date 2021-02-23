package com.sx.model;

import java.io.Serializable;

public class User implements Serializable {

    private int id;

    private String account;

    private String password;

    private String nickName;

    private double money;

    private int identity;




    public User() {
    }

    public User(String account, String password, String nickName) {
        this.account = account;
        this.password = password;
        this.nickName = nickName;
        this.identity = 0;
    }

    public User(String account, String password, String nickName, int identity) {
        this.account = account;
        this.password = password;
        this.nickName = nickName;
        this.identity = identity;
    }

    public User(String account, String password, String nickName, double money, int identity) {
        this.account = account;
        this.password = password;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
        sb.append(",\"password\":\"")
                .append(password).append('\"');
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
