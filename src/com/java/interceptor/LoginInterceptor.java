package com.java.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class LoginInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        // 取出名为user的Session属性
        String username = (String) ActionContext.getContext().getSession().get("username");
        String type = (String) ActionContext.getContext().getSession().get("type");
        System.out.println("拦截器中"+username+type);
        // 如果user不为空，且类型为普通用户
        if (username != null && "user".equals(type)) {
            return invocation.invoke();
        }
        ((ActionSupport) invocation.getAction()).addActionError("您还未登录，请先登录");
        return "login";
    }
}
