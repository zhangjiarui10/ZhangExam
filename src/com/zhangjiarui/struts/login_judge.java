package com.zhangjiarui.struts;

import com.opensymphony.xwork2.ActionSupport;

public class login_judge extends ActionSupport {
    public static void main(String[] args) {
        System.out.println("123");
    }
    @Override
    public String execute() throws Exception {
        return "success";
    }
}
