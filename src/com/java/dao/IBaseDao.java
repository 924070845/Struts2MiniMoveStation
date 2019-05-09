package com.java.dao;

import com.java.entity.Label;

import java.util.List;

public interface IBaseDao<T> {

    // 添加一条记录
    public int insertOne(T t);

    // 删除一条记录
    public int deleteOne(Integer id);

    // 跟新一条记录
    public T updateOne(T t);

    // 查找所有
    public List<T> selectAll();

    // 按ID号查询
    public List<T> selectByID(Integer id);

}
