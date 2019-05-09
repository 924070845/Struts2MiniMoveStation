package com.java.action;

import com.java.dao.RootDao;
import com.java.entity.Root;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RootAction extends ActionSupport implements ModelDriven {
    public Root root = new Root();

    // 管理员登录
    public String loginRoot() {
        RootDao rootDao = new RootDao();
        int count = rootDao.doLogin(root);
        if (count != 0) {
            ActionContext.getContext().getSession().put("adminName", root.getRootName());
            ActionContext.getContext().getSession().put("type", "root");  // 添加一个管理员类型
            return "loginRootSUCCESS";
        } else {
            addFieldError("adminName_password_ERROR", "用户名或密码错误");
            return "loginRootERROR";
        }
    }

    // 手动校验函数开始####################################################################################################################

    // 对非空的校验
    public void validateLoginAdmin() {
        System.out.println("进入了validateLoginAdmin方法进行登录校验");
        if (root.getRootName() == null || "".equals(root.getRootName()))
            addFieldError("adminNameNULL", "账号不能为空");
        if (root.getPassword() == null || "".equals(root.getPassword()))
            addFieldError("passwordNULL", "密码不能为空");
    }

    @Override
    public Object getModel() {
        return root;
    }

}
