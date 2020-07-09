<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/7/9
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改页面</title>

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
    <script type="text/javascript">
        function check() {
            var pwd = document.form1.password1.value;
            var pwd1 = document.form1.password2.value;
            //alert(pwd+" "+pwd1);
            if (pwd != pwd1) {
                alert("两次密码不一致！！");
                document.form1.password1.value = "";
                document.form1.password2.value = "";
            } else
                document.form1.submit();
        }
    </script>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="MainPage.html">主页</a></li>
    <li><a href="login1.html">登录</a></li>
    <li><a href="login_Successful.html">登录成功</a></li>
    <li class="active">修改</li>
</ol>
<form name="form1" class="form-horizontal" action="updateAction.jsp" method="post">
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail3" name="name" placeholder="Name" value="<%=request.getParameter("name")%>" readonly>
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail2" class="col-sm-2 control-label">Old Password</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail2" name="pwd" placeholder="Password" value="<%=request.getParameter("password")%>" readonly>
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">New Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3" name="password1" placeholder="Password">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword2" class="col-sm-2 control-label">Repeat</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword2" name="password2" placeholder="Repeat">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Remember me
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="button" class="btn btn-default" onclick="check()" value="Sign in"></input>
        </div>
    </div>
</form>
</body>
</html>
