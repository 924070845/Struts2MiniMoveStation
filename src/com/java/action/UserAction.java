package com.java.action;

import com.java.dao.UserDao;
import com.java.entity.User;
import com.java.dao.IBaseDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserAction extends ActionSupport implements ModelDriven {

    public User user = new User();
    List<User> userList;
    private int id;
    private IBaseDao userDao = new UserDao();

    // 用于校验
    private static Pattern p = null;
    private static Matcher m = null;
    private static boolean flg;

    // 上传文件的操作
    private File face;
    private String faceFileName;
    private String faceContentType;
    private String savePath;
    private String realname;
    private String path;
    private String target;

    // 核心业务处理方法开始***********************************************************************************************

    // 点击登录按钮
    public String loginIndexUser(){
        return "loginIndexUserSUCCESS";
    }

    // 点击进入注册页面
    public String registerIndexUser(){
        return "registerIndexUserSUCCESS";
    }

    // 用户登录
    public String loginUser() {

        UserDao userdao = new UserDao();
        List<User> userList = userdao.doLogin(user);
        Iterator it = userList.iterator();
        if (it.hasNext()) {
            user = (User) it.next();
            System.out.println("数据库中user表的头像信息为："+user.getImage());
            path = user.getImage();
            System.out.println("path:"+path);
            ActionContext.getContext().getSession().put("user_id",user.getUserID());
            ActionContext.getContext().getSession().put("path",path);
            ActionContext.getContext().getSession().put("username", user.getUsername());
            ActionContext.getContext().getSession().put("type", "user");  // 添加一个用户类型
            return "loginSUCCESS";
        } else {
            addFieldError("username_password_ERROR", "用户名或密码错误");
            return "loginERROR";
        }
    }

    // 用户注册
    public String registerUser() {
        UserDao userDao = new UserDao();
        user.setUsername(user.getUsername());
        user.setPassword(user.getPassword());
        user.setRePassword(user.getRePassword());
        user.setEmail(user.getEmail());
        user.setPhone(user.getPhone());

        // 检查用户所要注册的用户名是否存在于数据库
        int count = userDao.selectRegisterUser(user);
        if (count == 1){
            addFieldError("Duplicate_username","该用户名已被注册，请重新尝试");
            return "registerERROR";
        }
        int rs = userDao.insertOne(user);
        if (rs != 0) {
            ActionContext.getContext().getSession().put("username", user.getUsername());
            System.out.println("InsertSuccess!!");
            return "registerSUCCESS";
        } else {
            ActionContext.getContext().getSession().put("message", "InsertError!!");
            System.out.println("ERROR");
            return "registerERROR";
        }
    }

    // 查询到个人的信息
    public String selectUser() {

        UserDao selectUser = new UserDao();
        String username = (String) ActionContext.getContext().getSession().get("username");
        user.setUsername(username);
        userList = selectUser.selectUser(user);
        return "selectSUCCESS";
    }

    // 用户自主修改个人信息
    public String updateinfoUser() throws IOException {

        if (face!=null){
            //文件上传
            //观察封装文件信息的三个参数
            System.out.println(face);
            System.out.println(faceFileName);
            System.out.println(faceContentType);
            //文件上传
            @SuppressWarnings("resource")
            FileInputStream fis = new FileInputStream(face);
            realname = UUID.randomUUID() + faceFileName;
            System.out.println("realname=" + realname);
            target = ServletActionContext.getServletContext().getRealPath(savePath);
            System.out.println("1保存流路劲为"+target+"\\"+realname);
            @SuppressWarnings("resource")
            FileOutputStream fos = new FileOutputStream(target + "\\" + realname);
            System.out.println("2保存流路劲为"+target+"/"+realname);
            byte[] buf = new byte[1024];
            int len = 0;
            while ((len = fis.read(buf)) > 0) {
                fos.write(buf, 0, len);
            }
            //由于img不可同时出现在user和Action中user中用image储存文件路径
            user.setImage(realname);
        }
//        user.setUsername(user.getUsername());
//        user.setEmail(user.getEmail());
//        user.setPhone(user.getPhone());
        userDao.updateOne(user);

        return "updateinfoSUCCESS";
    }

    // 退出登录
    public String removeUser() {
        ActionContext.getContext().getSession().remove("username");
        ActionContext.getContext().getSession().remove("type");
        ActionContext.getContext().getSession().remove("path");
        return "removeSUCCESS";
    }

    // 来到修改密码页面
    public String comPwdUser(){
        return "comPwdUserSUCCESS";
    }

    // 修改个人密码
    public String updatepasswordUser() {
        UserDao userDao = new UserDao();
        String username = (String) ActionContext.getContext().getSession().get("username");
        String type = (String) ActionContext.getContext().getSession().get("type");
        System.out.println("修改密码函数：session中的值为" + username + type);
        user.setUsername(username);
        user.setOldPassword(user.getOldPassword());
        user.setNewPassword(user.getNewPassword());
        System.out.println("旧密码为：" + user.getOldPassword());
        System.out.println("新密码为：" + user.getNewPassword());
        String oldpwd = userDao.selectOldPassword(user);
        System.out.println("调用函数返回的密码为" + oldpwd);
        if (user.getOldPassword().equals(oldpwd)) {
            userDao.updateNewPassword(user);
        } else {
            addFieldError("oldPasswordERROR", "原密码错误，请确认后重新输入");
            return "updatepasswordERROR";
        }
        return "updatepasswordSUCCESS";
    }

    // 查看所有用户，管理员页面展示出来
    public String selectAllUser(){
        userList = userDao.selectAll();
        return "selectAllUserSUCCESS";
    }

    // 删除用户
    public String deleteUser(){
        userDao.deleteOne(id);
        return "deleteUserSUCCESS";
    }

    // 核心业务处理方法结束***********************************************************************************************


    // 手动校验规则开始*############################################################################################################
    // 校验登录框是否为空
    public void validateLoginUser() {
        System.out.println("进入了validateLoginUser方法进行登录校验");
        if (user.getUsername() == null || "".equals(user.getUsername()))
            addFieldError("usernameNULL", "用户名不能为空");
        if (user.getPassword() == null || "".equals(user.getPassword()))
            addFieldError("passwordNULL", "密码不能为空");
    }

    // 校验注册是否非空以及是否符合标准
    public void validateRegisterUser() {
        System.out.println("进入了 validateRegisterUser 方法进行注册校验");
        if (user.getUsername() == null || "".equals(user.getUsername()))
            addFieldError("usernameNULL", "用户名不能为空");
        else{
            /**用户名：由字母数字下划线组成且开头必须是字母，不能超过12位*/
            p = Pattern.compile("[a-zA-Z]{1}[a-zA-Z0-9_]{1,11}");
            m = p.matcher(user.getUsername());
            flg = m.matches();
            if (!flg) addFieldError("usernameERROR","由字母数字下划线组成且开头必须是字母，最长12位");
        }

        if (user.getEmail() == null || "".equals(user.getEmail()))
            addFieldError("emailNULL", "邮箱不能为空");
        else{
            /**邮箱：xxx@xxx.xxx*/
            p = Pattern.compile("[a-zA-Z0-9]+[@]{1}[a-zA-Z0-9]+[.][a-z]+");
            m = p.matcher(user.getEmail());
            flg = m.matches();
            if (!flg) addFieldError("emailERROR","邮箱格式为xxx@xxx.xxx");
        }

        if (user.getPhone() == null || "".equals(user.getPhone()))
            addFieldError("phoneNULL", "手机号码不能为空");
        else{
            /**手机号：全数字，长度为11位*/
            p = Pattern.compile("[0-9]{11}");
            m = p.matcher(user.getPhone());
            flg = m.matches();
            if (!flg) addFieldError("phoneERROR","全数字，长度为11位");
        }

        if (user.getPassword() == null || "".equals(user.getPassword()))
            addFieldError("passwordNULL", "密码不能为空");
        else{
            /**密码：字母、数字点、下划线构成，6到16位*/
            p = Pattern.compile("[a-zA-Z0-9_.]{6,16}");
            m = p.matcher(user.getPassword());
            flg = m.matches();
            if (!flg) addFieldError("passwordERROR","字母、数字点、下划线构成，6到16位");
        }

        if (user.getRePassword() == null || "".equals(user.getRePassword()))
            addFieldError("repasswordNULL","确认密码不能为空");
        else{
            /**确认密码必须与原密码保持一致*/
            if (!user.getRePassword().equals(user.getPassword()))
                addFieldError("repasswordERROR","确认密码必须与原密码保持一致");
        }
    }

    // 检验修改个人信息表单中的数据是否符合规定
    public void validateUpdateinfoUser(){
        if (user.getEmail() == null || "".equals(user.getEmail()))
            addFieldError("emailNULL", "邮箱不能为空");
        else{
            /**邮箱：xxx@xxx.xxx*/
            p = Pattern.compile("[a-zA-Z0-9]+[@]{1}[a-zA-Z0-9]+[.][a-z]+");
            m = p.matcher(user.getEmail());
            flg = m.matches();
            if (!flg) addFieldError("emailERROR","邮箱格式为xxx@xxx.xxx");
        }

        if (user.getPhone() == null || "".equals(user.getPhone()))
            addFieldError("phoneNULL", "手机号码不能为空");
        else{
            /**手机号：全数字，长度为11位*/
            p = Pattern.compile("[0-9]{11}");
            m = p.matcher(user.getPhone());
            flg = m.matches();
            if (!flg) addFieldError("phoneERROR","全数字，长度为11位");
        }
    }

    // 检验修改密码时输入的新密码是否符合规定
    public void validateUpdatepasswordUser(){
        if (user.getOldPassword() == null || "".equals(user.getOldPassword()))
            addFieldError("oldpasswordNULL","旧密码不能为空");

        if (user.getNewPassword() == null || "".equals(user.getNewPassword()))
            addFieldError("passwordNULL", "密码不能为空");
        else{
            /**密码：字母、数字点、下划线构成，6到16位*/
            p = Pattern.compile("[a-zA-Z0-9_.]{6,16}");
            m = p.matcher(user.getNewPassword());
            flg = m.matches();
            if (!flg) addFieldError("passwordERROR","字母、数字点、下划线构成，6到16位");
        }

        if (user.getReNewPassword() == null || "".equals(user.getReNewPassword()))
            addFieldError("repasswordNULL","确认密码不能为空");
        else{
            /**确认密码必须与原密码保持一致*/
            if (!user.getReNewPassword().equals(user.getNewPassword()))
                addFieldError("repasswordERROR","确认密码必须与原密码保持一致");
        }
    }

    // 手动校验规则结束################################################################################################################




    @Override
    public Object getModel() {
        return user;
    }

    public File getFace() {
        return face;
    }

    public void setFace(File face) {
        this.face = face;
    }

    public String getFaceFileName() {
        return faceFileName;
    }

    public void setFaceFileName(String faceFileName) {
        this.faceFileName = faceFileName;
    }

    public String getFaceContentType() {
        return faceContentType;
    }

    public void setFaceContentType(String faceContentType) {
        this.faceContentType = faceContentType;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}