package com.sx.service;

import com.sx.base.BaseDao;
import org.junit.jupiter.api.Test;

import java.util.*;


public class BaseDaoTest {

    @Test
    public void insertTest() {

        String sql = "INSERT INTO user(account, password, nick_name, money, identity) " +
                "VALUES(?, ?, ?, ?, ?)";

        Random random = new Random();

        Object[] data = {"czz", "123456", "czz", (random.nextDouble() * 10000 + 5000), 1};

        int result = BaseDao.executeInsertOrUpdate(sql, Arrays.asList(data), 0);

        System.out.println(result);
    }

    @Test
    public void deleteTest() {

        String sql = "DELETE FROM user WHERE id = ?";

        boolean result = BaseDao.executeDelete(sql, Arrays.asList(new Object[]{4}));

        System.out.println(result);

    }


    @Test
    public void queryTest() {

        String sql = "SELECT * FROM user";

        List<Map<String, Object>> list = BaseDao.executeQuery(sql, null);

        Set<String> set = list.get(0).keySet();

        set.forEach(s -> System.out.println(s));

    }

}
