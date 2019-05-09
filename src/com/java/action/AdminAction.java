package com.java.action;

import com.java.dao.AdminDao;
import com.java.entity.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.bcel.internal.generic.ACONST_NULL;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AdminAction extends ActionSupport implements ModelDriven {
    public Admin admin = new Admin();
    List<Admin> adminList;
    private int id;

    // 用于校验
    private static Pattern p = null;
    private static Matcher m = null;
    private static boolean flg;

    // 核心业务处理方法开始***********************************************************************************************



    // 管理员登录
    public String loginAdmin() {
        AdminDao adminDao = new AdminDao();
        int count = adminDao.doLogin(admin);
        if (count != 0) {
            ActionContext.getContext().getSession().put("adminName", admin.getAdminName());
            System.out.println("表单获取到的adminName是：" + admin.getAdminName());
            ActionContext.getContext().getSession().put("type", "admin");  // 添加一个管理员类型
            return "loginSUCCESS";
        } else {
            addFieldError("adminName_password_ERROR", "用户名或密码错误");
            return "loginERROR";
        }
    }

    // 退出登录
    public String removeAdmin() {
        ActionContext.getContext().getSession().remove("adminName");
        ActionContext.getContext().getSession().remove("type");
        return "removeSUCCESS";
    }

    // 修改个人密码
    public String updateAdminPasswordAdmin() {
        AdminDao updatepassword = new AdminDao();
        String adminName = (String) ActionContext.getContext().getSession().get("adminName");
        String type = (String) ActionContext.getContext().getSession().get("type");
        System.out.println("管理员修改密码函数：session中的值为" + adminName + type);
        admin.setAdminName(adminName);
        admin.setOldPassword(admin.getOldPassword());
        admin.setNewPassword(admin.getNewPassword());
        admin.setReNewPassword(admin.getReNewPassword());

        System.out.println("管理员旧密码为：" + admin.getOldPassword());
        System.out.println("管理员新密码为：" + admin.getNewPassword());
        String oldpwd = updatepassword.selectOldPassword(admin);
        System.out.println("调用函数返回的密码为" + oldpwd);
        if (admin.getOldPassword().equals(oldpwd)) {
            updatepassword.updateNewPassword(admin);
            return "updatepasswordSUCCESS";
        } else {
            addFieldError("oldPasswordERROR", "原密码错误，请确认后重新输入");
            return "updatepasswordERROR";
        }
    }

    // 查找出所有的管理员
    public String selectAllAdmin() {
        AdminDao adminDao = new AdminDao();
        adminList = adminDao.selectAll();
        ActionContext.getContext().getSession().put("adminList", adminList);
        return "selectAllAdminSUCCESS";
    }

    // 删除管理员
    public String deleteAdmin() {
        AdminDao adminDao = new AdminDao();
        adminDao.deleteOne(id);
        return "deleteAdminSUCCESS";
    }

    // 添加管理员
    public String addAdmin() {
        AdminDao adminDao = new AdminDao();
        admin.setAdminName(admin.getAdminName());
        admin.setPassword(admin.getPassword());
        int rs = adminDao.insertOne(admin);

        if (rs != 0) {
            System.out.println("InsertSuccess!!");
            return "addAdminSUCCESS";
        } else {
            ActionContext.getContext().getSession().put("message", "InsertError!!");
            System.out.println("ERROR");
            return "addAdminERROR";
        }
    }

    // 进入管理员修密码页面
    public String updatePasswordAdmin() {
        return "updatePasswordAdminSUCCESS";
    }

    // 手动校验函数开始####################################################################################################################

    public void validateLoginAdmin() {

        System.out.println("进入了validateLoginAdmin方法进行登录校验");
        if (admin.getAdminName() == null || "".equals(admin.getAdminName()))
            addFieldError("adminNameNULL", "账号不能为空");
        if (admin.getPassword() == null || "".equals(admin.getPassword()))
            addFieldError("passwordNULL", "密码不能为空");
    }

    // 检验修改密码时输入的新密码是否符合规定
    public void validateUpdateAdminPasswordAdmin() {
        if (admin.getOldPassword() == null || "".equals(admin.getOldPassword()))
            addFieldError("oldpasswordNULL", "旧密码不能为空");

        if (admin.getNewPassword() == null || "".equals(admin.getNewPassword()))
            addFieldError("passwordNULL", "密码不能为空");
        else {
            /**密码：字母、数字点、下划线构成，6到16位*/
            p = Pattern.compile("[a-zA-Z0-9_.]{6,16}");
            m = p.matcher(admin.getNewPassword());
            flg = m.matches();
            if (!flg) addFieldError("passwordERROR", "字母、数字点、下划线构成，6到16位");
        }

        if (admin.getReNewPassword() == null || "".equals(admin.getReNewPassword()))
            addFieldError("repasswordNULL", "确认密码不能为空");
        else {
            /**确认密码必须与原密码保持一致*/
            if (!admin.getReNewPassword().equals(admin.getNewPassword()))
                addFieldError("repasswordERROR", "确认密码必须与原密码保持一致");
        }
    }

    // 检查添加一个管理员时的输入是否为空以及是否符合规定
    public void validateAddAdmin() {

        if (admin.getAdminName() == null || "".equals(admin.getAdminName()))
            addFieldError("adminNameNULL", "管理员名称不能为空");
        else {
            /**用户名：由字母数字下划线组成且开头必须是字母，不能超过12位*/
            p = Pattern.compile("[a-zA-Z]{1}[a-zA-Z0-9_]{1,11}");
            m = p.matcher(admin.getAdminName());
            flg = m.matches();
            if (!flg) addFieldError("adminNameERROR", "由字母数字下划线组成且开头必须是字母，最长12位");
        }

        if (admin.getPassword() == null || "".equals(admin.getPassword()))
            addFieldError("passwordNULL", "密码不能为空");
        else {
            /**密码：字母、数字点、下划线构成，6到16位*/
            p = Pattern.compile("[a-zA-Z0-9_.]{6,16}");
            m = p.matcher(admin.getPassword());
            flg = m.matches();
            if (!flg) addFieldError("passwordERROR", "字母、数字点、下划线构成，6到16位");
        }

        if (admin.getReNewPassword() == null || "".equals(admin.getReNewPassword()))
            addFieldError("repasswordNULL", "重复密码不能为空");
        else {
            /**确认密码必须与原密码保持一致*/
            if (!admin.getReNewPassword().equals(admin.getPassword()))
                addFieldError("repasswordERROR", "重复密码必须与原密码保持一致");
        }
    }


    @Override
    public Object getModel() {
        return admin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


}
