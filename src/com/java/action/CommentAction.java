package com.java.action;


import com.java.dao.CommentDao;
import com.java.entity.Comment;
import com.java.dao.IBaseDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.List;

public class CommentAction extends ActionSupport implements ModelDriven {

    public Comment comment = new Comment();
    private int movie_id;
    private int user_id;
    private int id;
    List<Comment> commentList;
    private IBaseDao commentDao = new CommentDao();

    // 将用户的评论插入到数据库中
    public String insertComment(){

        movie_id = (Integer) ActionContext.getContext().getSession().get("movie_id");
        user_id = (Integer) ActionContext.getContext().getSession().get("user_id");

        comment.setContent(comment.getContent());
        comment.setMovie_id(movie_id);
        comment.setUser_id(user_id);

        int rs = commentDao.insertOne(comment);
        if (rs != 0) {
            System.out.println("InsertSuccess!!");
            addActionMessage(" ✔ 添加成功");
            return "InsertCommentSUCCESS";
        } else {
            ActionContext.getContext().getSession().put("message", "InsertError!!");
            System.out.println("ERROR");
            return "InsertCommentERROR";
        }

    }

    // 后台查询所有人的评论
    public String selectAllComment(){
        commentList = commentDao.selectAll();
        return "selectAllCommentSUCCESS";
    }

    // 按电影编号查找到该电影的所有评论
    public String selectIDComment(){
        movie_id = (Integer) ActionContext.getContext().getSession().get("movie_id");
        commentList = commentDao.selectByID(movie_id);
        System.out.println("点击电影传回的电影编号"+movie_id);
        return "selectIDCommentSUCCESS";
    }

    // 查询个人的所有评论
    public String selectPersonalComment(){
        CommentDao commentDao = new CommentDao();
        user_id = (Integer) ActionContext.getContext().getSession().get("user_id");
        commentList = commentDao.selectPersonalComment(user_id);
        System.out.println("个人评论区查到的标号为："+user_id);
        return "selectPersonalCommentSUCCESS";
    }

    // 后台删除用户的评论
    public String deleteUserComment(){
            commentDao.deleteOne(id);
            System.out.println("要删除的评论编号为："+id);
            addActionMessage(" ✔ 删除成功");
            return "deleteUserCommentSUCCESS";
    }

    // 校验##############################################################################################################
    // 校验评论框
    public void validateInsertComment(){
        if (comment.getContent() == null || "".equals(comment.getContent()))
            addFieldError("contentNULL","您没有输入任何评论内容！");
    }


    @Override
    public Object getModel() {
        return comment;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
