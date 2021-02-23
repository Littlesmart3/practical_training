package com.sx.service.impl;

import com.sx.base.BaseDao;
import com.sx.model.User;
import com.sx.service.UserService;
import com.sx.web.dto.UserDTO;

import java.util.*;

public class UserServiceImpl implements UserService {

    @Override
    public boolean createUser(User user) {

        String sql = "INSERT INTO user(account, password, nick_name, money, identity) " +
                "VALUES(?, ?, ?, ?, ?)";

        Random random = new Random();

        Object[] data = {user.getAccount(), user.getPassword(),
                user.getNickName(), (random.nextDouble() * 10000 + 5000), user.getIdentity()};

        int result = BaseDao.executeInsertOrUpdate(sql, Arrays.asList(data), 0);

        return result != 0;
    }

    @Override
    public boolean updateUser(String password, String nickName, double money, int id) {

        String sql = "UPDATE user SET ";

        List<Object> data = new ArrayList<>();


            if (password != null && password.length() != 0) {

                sql += "password = ? ";

                data.add(password);

            }


        if (nickName != null &&  nickName.length() != 0) {

            if (password != null)
                sql += ", ";

            sql += "nick_name = ? ";

            data.add(nickName);
        }

        if (money != -1) {

            sql += "money = ? ";

            data.add(money);

        }

        sql += "WHERE id = ?";

        data.add(id);

        int result = BaseDao.executeInsertOrUpdate(sql, data, 1);

        return (result != 0);
    }

    @Override
    public UserDTO findUserInfoById(int id) {

        String sql = "SELECT id, account, nick_name, money, identity FROM user WHERE id = ?";

        List<Map<String, Object>> list = BaseDao.executeQuery(sql, Arrays.asList(new Object[]{id}));

        if (list.size() == 0)
            return null;

        Map<String, Object> data = list.get(0);

        UserDTO userDTO = new UserDTO(data.get("id"), data.get("account"), data.get("nick_name"),
                data.get("money"), data.get("identity"));

        return userDTO;
    }

    @Override
    public UserDTO findUserInfoByAccount(String account, String password) {

        String sql = "SELECT id, account, password, nick_name, money, identity FROM user WHERE account = ?";

        List<Map<String, Object>> list = BaseDao.executeQuery(sql, Arrays.asList(new Object[]{account}));

        if (list.size() == 0)
            return null;

        Map<String, Object> data = list.get(0);

        if ((password != null) && !(data.get("password").equals(password)))
            return null;

        UserDTO userDTO = new UserDTO(data.get("id"), data.get("account"), data.get("nick_name"),
                data.get("money"), data.get("identity"));

        return userDTO;
    }

}
