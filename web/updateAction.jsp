<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/7/9
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改判断</title>

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
<%@ page language="java" import="java.util.*,com.zhangjiarui.mysql.LinkDB" pageEncoding="UTF-8" %>
<%@ page import="com.zhangjiarui.MD5.MD5" %>
<jsp:useBean id="c" class="com.zhangjiarui.UseDB.Admin" scope="session"></jsp:useBean>
<body>
<ol class="breadcrumb">
    <li><a href="MainPage.html">主页</a></li>
    <li><a href="login1.html">登录</a></li>
    <li><a href="login_Successful.html">登录成功</a></li>
    <li class="active">修改</li>
</ol>
</body>
<%
    String name = request.getParameter("name");
    String pwd = request.getParameter("password1");
    LinkDB db = new LinkDB();
    int flag = db.updateAdmin(name, MD5.md5(pwd));
    if (flag > 0) {
        out.print("恭喜!" + name + "修改成功.");
        out.print("<a href=login_Successful.jsp>点击返回</a>");
    } else {
        out.print("抱歉!" + name + "修改失败.");
        out.print("<a href=login_Successful.jsp>点击返回</a>");
    }
%>

</html>
