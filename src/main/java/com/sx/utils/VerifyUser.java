package com.sx.utils;

import com.sx.base.Status;

public class VerifyUser {

    public static Status verifyUserAccountAndPassword(String account, String password) {

        if (account == null || account.length() <= 5 || account.length() >= 10)
            return Status.NOT_VALID_ACCOUNT;

        if (password == null || password.length() <= 5 || password.length() >= 15)
            return Status.NOT_VALID_PASSWORD;

        return Status.SUCCESS;
    }

    public static Status verifyUserMessage(String account, String password, String nickName, int identity) {

        Status status = verifyUserAccountAndPassword(account, password);

        if (status != Status.SUCCESS)
            return status;

        if (nickName == null || nickName.length() <= 1 || nickName.length() >= 7)
            return Status.NOT_VALID_NICKNAME;

        if (0 < identity || identity > 1)
            return Status.NOT_VALOD_IDENTITY;

        return Status.SUCCESS;
    }


    public static Status verifyUserNicknameAndPassword(String nickName, String password) {

        if (password.length() != 0) {
            if (password.length() <= 5 || password.length() >= 15)
                return Status.NOT_VALID_PASSWORD;

        }

        if (nickName.length() != 0) {
            if (nickName.length() <= 1 || nickName.length() >= 7)
                return Status.NOT_VALID_NICKNAME;
        }

        return Status.SUCCESS;
    }

}
