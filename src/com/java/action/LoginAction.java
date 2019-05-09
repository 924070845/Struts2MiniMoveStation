package com.java.action;

import com.java.dao.LoginService;
import com.java.entity.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven {
    public User user = new User();

    @Override
    public String execute(){
        int count = LoginService.validLogin(user);
        if (count != 0)
            return "guke";
        return "shangjia";
    }

    @Override
    public Object getModel() {
        return user;
    }
}
