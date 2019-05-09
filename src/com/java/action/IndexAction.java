package com.java.action;

import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport  {

    // 进入前台首页
    public String index(){
        return "indexOK";
    }

    // 进入后台首页
    public String controlIndex(){
        return "controlIndexSUCCESS";
    }

    // 进入管理员登录页面
    public String adminIndex(){
        return "adminIndexSUCCESS";
    }

    // 进入添加标签页面
    public String labelIndex_add(){
        return "labelIndex_addSUCCESS";
    }

    // 添加电影页面
    public String movieIndex_add(){
        return "movieIndex_addSUCCESS";
    }

    // 添加管理员页面
    public String admin_Index_add(){
        return "admin_Index_addSUCCESS";
    }

    // 进入Root登录界面
    public String rootIndex(){
        return "rootIndexSUCCESS";
    }
}
