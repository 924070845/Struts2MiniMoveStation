package com.java.dao;

import com.java.conn.Conn;
import com.java.entity.Label;
import com.opensymphony.xwork2.ActionContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LabelDao implements IBaseDao<Label> {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

    @Override
    public int insertOne(Label label) {
        int rs = 0;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;
        try{
            String sql_insert = "INSERT INTO `label`(NAME, addtime) VALUES(?,?)";
            pst = dbc.prepareStatement(sql_insert);
            pst.setString(1, label.getLabelName());
            pst.setString(2, df.format(new Date()));  // 添加当前时间，记录用户注册的时刻
            rs = pst.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return rs;
    }

    @Override
    public int deleteOne(Integer labelID) {
        int rs = 0;
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_delect = "DELETE  FROM label WHERE id = ?";
            PreparedStatement pst = conn.prepareStatement(sql_delect);
            pst.setInt(1, labelID);

            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    @Override
    public List<Label> selectAll() {
        List<Label> labelList = new ArrayList<Label>();
        ResultSet rs = null;

        try {
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_select = "SELECT * FROM `label`";
            PreparedStatement pst = dbc.prepareStatement(sql_select);
            rs = pst.executeQuery();
            while (rs.next()) {
                Label label = new Label();
                label.setLabelID(rs.getInt("id"));
                label.setLabelName(rs.getString("name"));
                label.setAddtime(rs.getString("addtime"));
                System.out.println("标签编号"+label.getLabelID()+"标签名"+label.getLabelName()+"添加时间"+label.getAddtime());
                labelList.add(label);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionContext.getContext().getSession().put("labelList", labelList);
        return labelList;
    }

    @Override
    public List<Label> selectByID(Integer id) {
        return null;
    }

    @Override
    public Label updateOne(Label label) {
        return null;
    }

}
