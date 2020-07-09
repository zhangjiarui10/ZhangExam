<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/7/9
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录成功</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    [endif]-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.zhangjiarui.UseDB.Admin" %>
<jsp:useBean id="db" class="com.zhangjiarui.mysql.LinkDB" scope="session"></jsp:useBean>
<body>
<ol class="breadcrumb">
    <li><a href="MainPage.html">主页</a></li>
    <li><a href="login1.html">登录</a></li>
    <li class="active">显示</li>
</ol>
<table class="table table-hover">
    <tr>
        <th>用户名</th>
        <th>密码</th>
        <th>操作</th>
    </tr>
        <%
        ArrayList<Admin> list = db.showAdmin();
        for (int i = 0; i < list.size(); i++) {
            Admin b = list.get(i);
    %>
    <tr>
        <td><%=b.getName()%>
        </td>
        <td><%=b.getPwd()%>
        </td>
        <td><a href="del.jsp?name=<%=b.getName()%>">删除</a>
            <a href="update.jsp?name=<%=b.getName()%>&pwd=<%=b.getPwd() %>">修改</a></td>
    </tr>
        <%}%>
</body>
</html>
