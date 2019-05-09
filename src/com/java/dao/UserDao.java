package com.java.dao;

import com.java.conn.Conn;
import com.java.entity.User;
import com.opensymphony.xwork2.ActionContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDao implements IBaseDao<User>, IPasswordDao<User> {
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

    // 登录验证 用户名和密码
    public List<User> doLogin(User user) {
        List<User> userList = new ArrayList();
        ResultSet rs = null;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;

        try {
            String sql = "SELECT * FROM `user` WHERE `name`= ? and `password`= ?";     // 这个函数返回一条SQL语句
            pst = dbc.prepareStatement(sql);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            rs = pst.executeQuery();
            while (rs.next()) {
                user.setUserID(rs.getInt("id"));
                user.setUsername(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setImage(rs.getString("face"));
                System.out.println("user.getImage():" + user.getImage());
                userList.add(user);
            }
        } catch (Exception e) {
            System.out.println("判断失败");
            e.printStackTrace();
        }

        return userList;
    }

    // 查询个人信息
    public List<User> selectUser(User user) {
        List<User> userList = new ArrayList<User>();
        ResultSet rs = null;

        try {
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_select = "SELECT * FROM `user` WHERE name = ?";
            PreparedStatement pst = dbc.prepareStatement(sql_select);
            pst.setString(1, user.getUsername());

            rs = pst.executeQuery();
            while (rs.next()) {
                user.setUsername(rs.getString("name"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionContext.getContext().getSession().put("userList", userList);
        return userList;
    }

    // 修改新的个人密码
    @Override
    public void updateNewPassword(User user) {
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_updatepassword = "update user set password=? where name=?";
            PreparedStatement pst = conn.prepareStatement(sql_updatepassword);
            pst.setString(1, user.getNewPassword());
            pst.setString(2, user.getUsername());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 查找输入到注册框中的用户名在数据库中是否是存在的
    public int selectRegisterUser(User user){

        ResultSet rs = null;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;
        int count = 0;

        try {

            String sql = "SELECT name FROM `user` WHERE `name`= ?";     // 这个函数返回一条SQL语句
            pst = dbc.prepareStatement(sql);
            pst.setString(1, user.getUsername());
            rs = pst.executeQuery();
            if (rs.next()) count = 1;
            else count = 0;
        } catch (Exception e) {
            System.out.println("判断失败");
            e.printStackTrace();
        }
        return count;
    }

    // 注册普通用户
    @Override
    public int insertOne(User user) {
        int rs = 0;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;


        try {
            String sql_insert = "INSERT INTO `user`(NAME, PASSWORD, email, phone, addtime) VALUES(?,?,?,?,?)";
            pst = dbc.prepareStatement(sql_insert);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getPhone());
            pst.setString(5, df.format(new Date()));  // 添加当前时间，记录用户注册的时刻

            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // 删除用户
    @Override
    public int deleteOne(Integer userID) {
        int rs = 0;
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_delect = "DELETE  FROM user WHERE id = ?";
            PreparedStatement pst = conn.prepareStatement(sql_delect);
            pst.setInt(1, userID);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // 修改个人信息
    @Override
    public User updateOne(User user) {
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_update = "update user set phone=?, email=?, face=? where name=?";
            PreparedStatement pst = conn.prepareStatement(sql_update);
            pst.setString(1, user.getPhone());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getImage());
            pst.setString(4, user.getUsername());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // 查询到所有的已注册用户
    @Override
    public List<User> selectAll() {
        List<User> userList = new ArrayList<User>();
        ResultSet rs = null;
        try {
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_select = "SELECT * FROM `user`";
            PreparedStatement pst = dbc.prepareStatement(sql_select);
            rs = pst.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("id"));
                user.setUsername(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddtime(rs.getString("addtime"));


                System.out.println("编号" + user.getUserID() + "用户名" + user.getUsername() + "添加时间" + user.getAddtime());
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionContext.getContext().getSession().put("userList", userList);
        return userList;
    }

    // 检查旧密码是正确
    @Override
    public String selectOldPassword(User user) {
        String oldPassword = null;
        ResultSet rs = null;
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql = "SELECT password FROM user WHERE name = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, user.getUsername());
            rs = pst.executeQuery();
            while (rs.next()) {
                oldPassword = rs.getString("password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 将按用户名查到的旧密码返回到UserAction里用于检查。
        return oldPassword;
    }

    @Override
    public List<User> selectByID(Integer id) {
        return null;
    }
}
