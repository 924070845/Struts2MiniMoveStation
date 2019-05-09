package com.java.dao;

import com.java.entity.User;

public class LoginService {
    User user = new User();

    public static int validLogin(User user){
        LoginDao loginDao = new LoginDao();
        int count = loginDao.login(user);
        return count;
    }

}
