package com.sx.service;

import com.sx.model.User;
import com.sx.service.impl.UserServiceImpl;
import com.sx.web.dto.UserDTO;
import org.junit.jupiter.api.Test;

public class UserServiceTest {

    private UserService userService = new UserServiceImpl();

    @Test
    public void createUserTest() {

        User user = new User("wxx000", "123456", "wxx");

        boolean result = userService.createUser(user);

        System.out.println(result);

    }

    @Test
    public void updateUserTest() {

        Boolean result;

        //result = userService.updateUser("123123", null, 12);
        //
        //System.out.println(result);
        //
        //result = userService.updateUser(null, "wxxx",12);
        //
        //System.out.println(result);

        result = userService.updateUser("123456", "wxx", -1, 12);

        System.out.println(result);

    }

    @Test
    public void findUserInfoByIdTest(){

        UserDTO user = userService.findUserInfoById(5);

        System.out.println(user.toString());

    }

    @Test
    public void findUserInfoByAccountTest(){

        UserDTO user = userService.findUserInfoByAccount("czz006", "123");

        System.out.println(user == null ? null : user.toString());
    }


}
