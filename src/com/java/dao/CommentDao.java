package com.java.dao;

import com.java.conn.Conn;
import com.java.entity.Comment;
import com.opensymphony.xwork2.ActionContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

public class CommentDao implements IBaseDao<Comment> {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

    // 查看个人的所有评论记录
    public List<Comment> selectPersonalComment(int user_id ){
        List<Comment> commentList = new ArrayList<>();
        ResultSet rs = null;
        try{
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_selectId = "SELECT * FROM user, movie, `comment` " +
                    "WHERE `user`.id=`comment`.user_id AND movie.id=`comment`.movie_id AND user.id = ?" ;
            PreparedStatement pst = dbc.prepareStatement(sql_selectId);
            pst.setInt(1, user_id);
            rs = pst.executeQuery();
            while (rs.next()){
                Comment comment = new Comment();
                comment.setCommentID(rs.getInt("comment.id"));
                comment.setUser_id(rs.getInt("comment.user_id"));
                comment.setUserName(rs.getString("user.name"));
                comment.setUser_face(rs.getString("user.face"));
                comment.setMovie_id(rs.getInt("comment.movie_id"));
                comment.setContent(rs.getString("comment.content"));
                comment.setCommentID(rs.getInt("comment.id"));
                comment.setAddtime(rs.getString("comment.addtime"));
                commentList.add(comment);
                System.out.println("comment.getCommentID():"+comment.getCommentID());
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        Collections.reverse(commentList);
        ActionContext.getContext().getSession().put("commentList", commentList);
        ActionContext.getContext().getSession().put("commentListSize", commentList.size());
        System.out.println(commentList.size());

        return commentList;
    }

    @Override
    public int insertOne(Comment comment) {
        int rs = 0;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;
        try {
            String sql_insert = "INSERT INTO `comment`(content, movie_id, user_id, addtime) VALUES(?,?,?,?)";
            pst = dbc.prepareStatement(sql_insert);
            pst.setString(1, comment.getContent());
            pst.setInt(2, comment.getMovie_id());
            pst.setInt(3, comment.getUser_id());
            pst.setString(4, df.format(new Date()));  // 添加当前时间，记录用户注册的时刻
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // 后台删除用户评论
    @Override
    public int deleteOne(Integer comment_id) {
        int rs = 0;
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_delect = "DELETE  FROM comment WHERE id = ?";
            PreparedStatement pst = conn.prepareStatement(sql_delect);
            pst.setInt(1, comment_id);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    @Override
    public Comment updateOne(Comment comment) {
        return null;
    }

    @Override
    public List<Comment> selectAll() {
        List<Comment> commentList = new ArrayList<>();
        ResultSet rs = null;

        try {
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_select = "SELECT * FROM user, movie, `comment` " +
                    "WHERE `user`.id=`comment`.user_id AND movie.id=`comment`.movie_id";
            PreparedStatement pst = dbc.prepareStatement(sql_select);
            rs = pst.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setUser_id(rs.getInt("user_id"));
                comment.setUserName(rs.getString("user.name"));
                comment.setUser_face(rs.getString("user.face"));
                comment.setMovie_id(rs.getInt("movie_id"));
                comment.setMovieName(rs.getString("movie.title"));
                comment.setContent(rs.getString("content"));
                comment.setCommentID(rs.getInt("comment.id"));
                comment.setAddtime(rs.getString("comment.addtime"));
                commentList.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionContext.getContext().getSession().put("commentList", commentList);
        ActionContext.getContext().getSession().put("commentsAllList", commentList.size());
        System.out.println("commentsAllList:"+ commentList.size());
        return commentList;
    }

    // 多表联查查询当前电影的评论信息
    @Override
    public List<Comment> selectByID(Integer movie_id) {

        List<Comment> commentList = new ArrayList<>();
        ResultSet rs = null;
        try{
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_selectId = "SELECT * FROM user, movie, `comment` " +
                    "WHERE `user`.id=`comment`.user_id AND movie.id=`comment`.movie_id AND movie.id = ?" ;
            PreparedStatement pst = dbc.prepareStatement(sql_selectId);
            pst.setInt(1, movie_id);
            rs = pst.executeQuery();
            while (rs.next()){
                Comment comment = new Comment();
                comment.setUser_id(rs.getInt("comment.user_id"));
                comment.setUserName(rs.getString("user.name"));
                comment.setUser_face(rs.getString("user.face"));
                comment.setMovie_id(rs.getInt("comment.movie_id"));
                comment.setContent(rs.getString("comment.content"));
                comment.setCommentID(rs.getInt("comment.id"));
                comment.setAddtime(rs.getString("comment.addtime"));
                commentList.add(comment);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        Collections.reverse(commentList);
        ActionContext.getContext().getSession().put("commentList", commentList);
        ActionContext.getContext().getSession().put("commentAllListSize", commentList.size());
        System.out.println("commentAllListSize:"+commentList.size());
        return commentList;
    }

}
