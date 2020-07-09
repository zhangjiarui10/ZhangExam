package com.zhangjiarui.servlet;

import com.zhangjiarui.UseDB.Admin;
import com.zhangjiarui.mysql.LinkDB;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(value = "/loginT",urlPatterns = "/loginT")
@WebServlet("/loginT")
public class regServlet extends HttpServlet {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    Admin user = (Admin) context.getBean("uesr");
    LinkDB DB = (LinkDB) context.getBean("DB");
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password1");
        user.setName(name);
        user.setPwd(password);
        System.out.println(user.getName()+"++"+user.getPwd());
        if(DB.insertAdmin(user)==0)
            response.sendRedirect("reg_failed.html");
        else
            response.sendRedirect("reg_Successful.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
