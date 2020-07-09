package com.zhangjiarui.mysql;

import com.zhangjiarui.UseDB.Admin;

import java.sql.*;
import java.util.ArrayList;

public class LinkDB {
    private String DRIVER = "com.mysql.cj.jdbc.Driver";
    private String DATABASE_URL = "jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
    private Connection conn = null;

    public void connect() {
        try {
            //连接数据库student为数据库名
            Class.forName(DRIVER);
            String url = DATABASE_URL;
            String user = "root";
            String pwd = "zhangjiarui1";
            conn = DriverManager.getConnection(url, user, pwd);
            System.out.println("数据库连接成功！");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void closeConn() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("关闭数据库连接！");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public boolean Login(Admin a) {
        boolean flag = false;
        connect();
        try {
            //登录验证
            String sql = "select * from person where xm=?";
            //System.out.println("1");
            PreparedStatement pars = conn.prepareStatement(sql);
            //System.out.println("2");
            pars.setString(1, a.getName());
            ResultSet rs = pars.executeQuery();
            //System.out.println("3");
            if (rs != null && rs.next()) {
                String p = rs.getString(2);
                if (a.getPwd().equals(p)) {
                    flag = true;
                } else {
                    System.out.println("输入密码有误，请返回重新输入");
                }
            } else
                System.out.print("没有该用户，请返回重新输入");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeConn();
        return flag;
    }

    public ArrayList<Admin> showAdmin() {
        connect();
        ArrayList<Admin> list = new ArrayList<Admin>();
        try {
            //显示所有用户信息
            String sql = "select * from person";
            PreparedStatement pars = conn.prepareStatement(sql);
            ResultSet rs = pars.executeQuery();
            while (rs != null && rs.next()) {
                Admin b = new Admin();
                b.setName(rs.getString(1));
                b.setPwd(rs.getString(2));
                list.add(b);
            }
            closeConn();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int insertAdmin(Admin c) {
        int flag = 0;
        connect();
        String sql = "insert into person(xm,pwd) values(?,?)";
        try {
            //添加用户
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getPwd());
            flag = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;

    }

    public int updateAdmin(String name, String pwd) {
        int flag = 0;
        connect();
        try {
            //根据用户名修改密码
            String sql = "update person set pwd=? where xm=?";
            PreparedStatement past = conn.prepareStatement(sql);
            past.setString(1, pwd);
            past.setString(2, name);
            flag = past.executeUpdate();
            closeConn();
        } catch (Exception e) {
            System.out.println(e);

        }
        return flag;
    }

    public int delAdmin(String name) {
        connect();
        int flag = 0;
        try {
            //根据用户名删除用户信息
            String sql = "delete from person where xm=?";
            PreparedStatement past = conn.prepareStatement(sql);
            past.setString(1, name);
            flag = past.executeUpdate();
            closeConn();
        } catch (Exception e) {
            System.out.println(e);
        }
        return flag;
    }
}

