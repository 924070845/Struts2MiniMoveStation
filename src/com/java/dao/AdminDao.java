package com.java.dao;

import com.java.conn.Conn;
import com.java.entity.Admin;
import com.opensymphony.xwork2.ActionContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AdminDao implements IBaseDao<Admin>, ILoginDao<Admin>, IPasswordDao<Admin> {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

    // 检查旧密码是正确
    @Override
    public String selectOldPassword(Admin admin) {
        String oldPassword = null;
        ResultSet rs = null;
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            System.out.println("管理员传进来的名字为" + admin.getAdminName());
            String sql = "SELECT `password` FROM `admin` WHERE name = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, admin.getAdminName());
            rs = pst.executeQuery();
            System.out.println("SQL语句为" + pst);
            while (rs.next()) {
                oldPassword = rs.getString("password");
                System.out.println("管理员取出的旧密码是：" + oldPassword);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 将按用户名查到的旧密码返回到UserAction里用于检查。
        return oldPassword;
    }

    // 修改新的个人密码
    @Override
    public void updateNewPassword(Admin admin) {
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_updatepassword = "UPDATE `admin` SET `password`= ? WHERE `name`= ?";
            PreparedStatement pst = conn.prepareStatement(sql_updatepassword);
            pst.setString(1, admin.getNewPassword());
            pst.setString(2, admin.getAdminName());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // 添加一个管理员
    @Override
    public int insertOne(Admin admin) {
        int rs = 0;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;
        try {
            String sql_insert = "INSERT INTO `admin`(NAME, PASSWORD, addtime) VALUES(?,?,?)";
            pst = dbc.prepareStatement(sql_insert);
            pst.setString(1, admin.getAdminName());
            pst.setString(2, admin.getPassword());
            pst.setString(3, df.format(new Date()));  // 添加当前时间，记录用户注册的时刻
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // 删除管理员
    @Override
    public int deleteOne(Integer adminID) {
        int rs = 0;
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_delect = "DELETE  FROM `admin` WHERE id = ?";
            PreparedStatement pst = conn.prepareStatement(sql_delect);
            pst.setInt(1, adminID);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // 查找所有的管理员信息
    @Override
    public List<Admin> selectAll() {
        List<Admin> adminList  = new ArrayList<Admin>();
        ResultSet rs = null;

        try {
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_select = "SELECT * FROM `admin`";
            PreparedStatement pst = dbc.prepareStatement(sql_select);
            rs = pst.executeQuery();
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminID(rs.getInt("id"));
                admin.setAdminName(rs.getString("name"));
                admin.setAddtime(rs.getString("addtime"));
                adminList.add(admin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionContext.getContext().getSession().put("adminList", adminList);
        return adminList;
    }

    // 登录验证管理员名和密码
    @Override
    public int doLogin(Admin admin) {
        ResultSet rs = null;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;
        int count = 0;
        try {
            String sql = "SELECT password FROM `admin` WHERE `name`= ?";     // 这个函数返回一条SQL语句
            pst = dbc.prepareStatement(sql);
            System.out.println(admin.getAdminName());
            System.out.println(admin.getPassword());
            pst.setString(1, admin.getAdminName());
            rs = pst.executeQuery();
            while (rs.next()) {
                String password = rs.getString("password");
                if (password.equals(admin.getPassword())) {
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

    @Override
    public Admin updateOne(Admin admin) {
        return null;
    }

    @Override
    public List<Admin> selectByID(Integer id) {
        return null;
    }
}
