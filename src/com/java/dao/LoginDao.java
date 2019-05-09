package com.java.dao;

import com.java.conn.Conn;
import com.java.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {

    public int login(User user){

        ResultSet rs = null;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;
        int count = 0;
        try {
            String sql = "SELECT password FROM `user` WHERE `name`= ?";     // 这个函数返回一条SQL语句
            pst = dbc.prepareStatement(sql);
            System.out.println(user.getUsername());
            System.out.println(user.getPassword());
            pst.setString(1, user.getUsername());
            rs = pst.executeQuery();
            while (rs.next()) {
                String password = rs.getString("password");
                if (password.equals(user.getPassword())) {
                    count = 1;
                    System.out.println("查找用户名密码成功");
                } else count = 0;
            }
        } catch (Exception e) {
            System.out.println("判断失败");
            e.printStackTrace();
        }
        return count;

    }


}
