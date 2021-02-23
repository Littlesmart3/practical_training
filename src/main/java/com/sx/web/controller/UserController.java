package com.sx.web.controller;

import com.sx.base.ApiResponse;
import com.sx.base.Status;
import com.sx.model.User;
import com.sx.service.UserService;
import com.sx.service.impl.UserServiceImpl;
import com.sx.utils.VerifyUser;
import com.sx.web.dto.UserDTO;
import com.sx.web.servlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import java.util.Map;


@WebServlet(value = "/user")
public class UserController extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    public ApiResponse login(Map map) {

        String account = (String) map.get("account");
        account = account.trim();

        String password = (String) map.get("password");
        password = password.trim();

        Status status = VerifyUser.verifyUserAccountAndPassword(account, password);

        if (status != Status.SUCCESS)
            return ApiResponse.ofStatus(status);

        UserDTO user = userService.findUserInfoByAccount(account, password);

        if (user == null)
            return ApiResponse.ofStatus(Status.NOT_VALID_PASSWORD);


        session.setAttribute("user", user);

        return ApiResponse.ofSuccess(null);
    }

    public ApiResponse signup(Map map) {

        String account = (String) map.get("account");
        account = account.trim();

        String password = (String) map.get("password");
        password = password.trim();

        String nickName = (String) map.get("nickName");
        nickName = nickName.trim();

        int identity = Integer.valueOf((String) map.get("identity"));

        Status status = VerifyUser.verifyUserMessage(account, password, nickName, identity);

        if (status != Status.SUCCESS)
            return ApiResponse.ofStatus(status);

        UserDTO userDTO = userService.findUserInfoByAccount(account, null);
        if (userDTO != null)
            return ApiResponse.ofStatus(Status.NOT_UNLIVE_USER);

        if (userService.createUser(new User(account, password, nickName, identity)))
            return ApiResponse.ofSuccess(null);

        return ApiResponse.ofStatus(Status.BAD_REQUEST);
    }

    public ApiResponse vaild(Map map) {

        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user != null)
            return ApiResponse.ofSuccess(user);

        return ApiResponse.ofStatus(Status.BAD_REQUEST);
    }


    public ApiResponse update(Map map) {

        UserDTO user = (UserDTO) session.getAttribute("user");

        String password = (String) map.get("password");
        password = password.trim();

        String nickName = (String) map.get("nickName");
        nickName = nickName.trim();

        Status status = VerifyUser.verifyUserNicknameAndPassword(nickName, password);

        if (status != Status.SUCCESS)
            return ApiResponse.ofStatus(status);

        boolean b = userService.updateUser(password, nickName, -1, user.getId());

        if(!b)
            return ApiResponse.ofStatus(Status.BAD_REQUEST);

        return ApiResponse.ofSuccess(null);
    }
}
