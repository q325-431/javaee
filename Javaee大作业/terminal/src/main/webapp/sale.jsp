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
    <title>我要卖</title>
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
                <li><a href="${pageContext.request.contextPath}/index.jsp">小黑市首页<span
                        class="sr-only">(current)</span></a></li>
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
                <li><a href="./sale.html">我要当卖家</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- 售卖信息 -->
<div class="container" style="margin-top: 100px;">
    <div class="row">
        <div class="col-xs-12">
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="item-name" class="col-sm-4 control-label">售卖物品名称</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="item-name" placeholder="请输入你的售卖物品的名称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="classify" class="col-sm-4 control-label">售卖物品分类</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="classify">
                            <option value="">各类书籍</option>
                            <option value="">文具用品</option>
                            <option value="">运动器材</option>
                            <option value="">床上用品</option>
                            <option value="">穿搭物品</option>
                            <option value="">数码物品</option>
                            <option value="">其他物品</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="description" class="col-sm-4 control-label">售卖物品描述</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" rows="5" id="description"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="item-price" class="col-sm-4 control-label">售卖物品价格</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="item-price" placeholder="请输入价格,单位元">
                    </div>
                </div>
                <div class="form-group">
                    <label for="item-amount" class="col-sm-4 control-label">售卖物品的数量</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="item-amount" placeholder="请输入数量">
                    </div>
                </div>
                <div class="form-group">
                    <label for="item-img" class="col-sm-4 control-label">售卖物品图片</label>
                    <div class="col-sm-4">
                        <input type="file" class="form-control" id="item-img">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-4">
                        <button class="btn btn-default" style="outline: none;">我要卖它</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>