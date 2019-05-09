package com.java.dao;

import com.java.conn.Conn;
import com.java.entity.Root;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RootDao implements ILoginDao<Root> {

    // root用户登录
    @Override
    public int doLogin(Root root) {
        ResultSet rs = null;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;
        int count = 0;
        try {
            String sql = "SELECT password FROM `root` WHERE `name`= ?";     // 这个函数返回一条SQL语句
            pst = dbc.prepareStatement(sql);
            System.out.println(root.getRootName());
            System.out.println(root.getPassword());
            pst.setString(1, root.getRootName());
            rs = pst.executeQuery();
            while (rs.next()) {
                String password = rs.getString("password");
                if (password.equals(root.getPassword())) {
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
