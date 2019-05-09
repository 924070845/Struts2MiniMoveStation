package com.java.dao;

public interface IPasswordDao<T> {

    // 检查旧密码是正确
    public String selectOldPassword(T t);

    // 修改新的个人密码
    public void updateNewPassword(T t);

}
