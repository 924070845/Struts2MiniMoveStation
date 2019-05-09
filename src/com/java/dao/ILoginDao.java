package com.java.dao;

public interface ILoginDao<T> {

    // 登录接口
    public int doLogin(T t);
}
