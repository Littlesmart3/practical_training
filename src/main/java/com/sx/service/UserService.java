package com.sx.service;

import com.sx.model.User;
import com.sx.web.dto.UserDTO;

public interface UserService {

    public boolean createUser(User user);

    public boolean updateUser(String password, String nickName, double money, int id);

    public UserDTO findUserInfoById(int id);

    public UserDTO findUserInfoByAccount(String account, String password);

}
