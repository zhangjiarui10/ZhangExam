package com.zhangjiarui.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.net.httpserver.HttpServer;
import com.zhangjiarui.UseDB.Admin;
import com.zhangjiarui.mysql.LinkDB;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;

public class login_judge extends ActionSupport {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    Admin user = (Admin) context.getBean("uesr");
    LinkDB DB = (LinkDB) context.getBean("DB");
    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        user.setName(name);
        user.setPwd(password);
        if(DB.Login(user))
            return "success";
        else
            return "error";
    }
}
