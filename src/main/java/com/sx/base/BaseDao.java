package com.sx.base;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.sql.*;
import java.util.*;

public class BaseDao {

    private static DataSource dataSource = null;

    static {

        try {
            Properties properties = new Properties();

            properties.load(BaseDao.class.getClassLoader().getResourceAsStream("application.properties"));

            dataSource = DruidDataSourceFactory.createDataSource(properties);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static Connection open() {
        Connection connection = null;

        try {
            connection = dataSource.getConnection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return connection;
    }

    private static void close(ResultSet set, PreparedStatement ps, Connection connection) {

        try {
            if (set != null)
                set.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if (ps != null) ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if (connection != null) connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static boolean executeDelete(String sql, List<Object> data) {

        Connection connection = null;

        PreparedStatement ps = null;

        try {

            connection = BaseDao.open();

            ps = connection.prepareStatement(sql);

            for (int i = 0; i < data.size(); i++) {

                ps.setObject(i + 1, data.get(i));

            }

            int i = ps.executeUpdate();

            return (i != 0);

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            close(null, ps, connection);

        }

        return false;
    }


    public static int executeInsertOrUpdate(String sql, List<Object> data, int type) {

        Connection connection = null;

        PreparedStatement ps = null;

        try {

            connection = open();

            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            for (int i = 0; i < data.size(); i++) {

                ps.setObject(i + 1, data.get(i));

            }

            int i = ps.executeUpdate();

            if(type == 1){
                return i;
            }

            ResultSet set = ps.getGeneratedKeys();

            if (set.next()) {
                return set.getInt(1);
            }

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            close(null, ps, connection);

        }

        return 0;
    }


    public static List<Map<String, Object>> executeQuery(String sql, List<Object> data) {

        Connection connection = null;

        PreparedStatement ps = null;

        ResultSet set = null;

        try {

            connection = open();

            ps = connection.prepareStatement(sql);

            for (int i = 0; i < data.size(); i++) {

                ps.setObject(i + 1, data.get(i));

            }

            set = ps.executeQuery();

            List<Map<String, Object>> list = new ArrayList<>();

            int count = set.getMetaData().getColumnCount();

            while (set.next()) {

                Map<String, Object> map = new HashMap<>();

                for (int i = 1; i <= count; i++) {

                    Object v = set.getObject(i);

                    String k = set.getMetaData().getColumnLabel(i);

                    map.put(k, v);

                }

                list.add(map);

            }

            return list;

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            close(set, ps, connection);

        }

        return null;
    }
}
