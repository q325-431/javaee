<%@ page import="beans.User" %><%--
Created by IntelliJ IDEA.
User: yfuxzpskbr
Date: 2022/6/29
Time: 17:16
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link rel="shortcut icon" href="./res/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/sweetalert.css">
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/sweetalert-dev.js"></script>
    <title>商品详情页</title>
</head>

<body>
<!-- 导航条 -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Brand</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/index.jsp">小黑市首页<span class="sr-only">(current)</span></a></li>
                <li><a href="#">hi,欢迎来到小黑市&nbsp;${user.username}</a></li>
                <c:if test="${isLogin!=true}">
                    <li><a href="sign_login.jsp?tag=0">请登录</a></li>
                    <li><a href="sign_login.jsp?tag=1">免费注册</a></li>
                </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${isLogin==true}">
                    <li><img src="./res/headimg/${user.user_id}.jpg" alt="" width="50" height="50"
                             style="border-radius: 25px;"></li>
                </c:if>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">我的小黑市<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="user.jsp">我的主页</a></li>
                        <li><a href="${pageContext.request.contextPath}/orders.jsp">我的订单</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="./sign_login.jsp?tag=0">切换账号</a></li>
                    </ul>
                </li>
                <li><a href="purchaseCart.jsp">购物车</a></li>
                <li><a href="sale.jsp">我要当卖家</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>

</html>