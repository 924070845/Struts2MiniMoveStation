package com.java.action;

import com.java.dao.LabelDao;
import com.java.entity.Label;
import com.java.dao.IBaseDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LabelAction extends ActionSupport implements ModelDriven {

    public Label label = new Label();
    List<Label> labelList;
    private int id;
    private IBaseDao labelDao = new LabelDao();
    // 用于校验
    private static Pattern p = null;
    private static Matcher m = null;
    private static boolean flg;

    // 添加标签函数
    public String insertLabel() {
        labelDao.insertOne(label);
        addActionMessage(" ✔ 添加成功");
        return "insertLabelSUCCESS";
    }

    // 查询全部标签
    public String selectAllLabel() {
        labelList = labelDao.selectAll();
        return "selectAllLabelSUCCESS";
    }

    // 删除标签
    public String deleteLabel() {
        labelDao.deleteOne(id);
        addActionMessage(" ✔ 删除成功");
        return "deleteLabelSUCCESS";
    }


    // 手动校验规则开始*############################################################################################################
    // 校验添加标签框是否为空以及是否符合规范
    public void validateInsertLabel() {
        System.out.println("进入了validateInsertLabel方法进行登录校验");
        if (label.getLabelName() == null || "".equals(label.getLabelName()))
            addFieldError("labelNameNULL", "标签名不能为空");
        else {
            /**标签名：由汉字组成，1~8位*/
            p = Pattern.compile("^[\\u4e00-\\u9fa5]{1,8}");
            m = p.matcher(label.getLabelName());
            flg = m.matches();
            if (!flg) addFieldError("labelNameERROR", "标签名由汉字组成，1~8位");
        }

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public Object getModel() {
        return label;
    }
}
