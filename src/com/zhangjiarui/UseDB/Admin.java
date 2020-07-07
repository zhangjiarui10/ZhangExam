package com.zhangjiarui.UseDB;

import com.opensymphony.xwork2.ActionSupport;

public class Admin extends ActionSupport {
    private String name;
    private String pwd;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    @Override
    public String execute() throws Exception {

        return "success";
    }
}
