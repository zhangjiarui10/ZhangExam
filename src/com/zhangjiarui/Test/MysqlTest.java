package com.zhangjiarui.Test;

import com.zhangjiarui.UseDB.Admin;
import com.zhangjiarui.mysql.LinkDB;

public class MysqlTest {
    public static void main(String[] args) {
        LinkDB linkDB = new LinkDB();
        Admin admin = new Admin();
        //第一次测试数据库连接，没有问题
        admin.setName("zjr");
        admin.setPwd("zhang");
        linkDB.Login(admin);
    }
}
