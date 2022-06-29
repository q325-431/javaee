<%@ page import="beans.User" %>
<%@ page import="beans.Order" %>
<%@ page import="java.util.List" %><%--
Created by IntelliJ IDEA.
User: yfuxzpskbr
Date: 2021/6/6
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
    <title>我的订单</title>
    <style>
        body {
            font: 600 16px/18px 'Open Sans', sans-serif;
        }

        .table > tbody > tr > td {
            width: 100px;
            line-height: 100px;
            text-align: center;
            user-select: none;
        }

        .table > tbody > tr > th {
            text-align: center;
        }

        .nav-tabs > li > a {
            user-select: none;
        }
    </style>
    <script>
        var top_index = ${top_index};
        var start = ${start};
        var bot_index = ${index};
        var first = true;

        function choose(number) {
            top_index = number;
            $(".up-1").hide();
            $(".up-2").hide();
            $(".up-3").hide();
            $(".up-4").hide();
            $(".up-5").hide();
            $(".li-1").removeClass("active");
            $(".li-2").removeClass("active");
            $(".li-3").removeClass("active");
            $(".li-4").removeClass("active");
            $(".li-5").removeClass("active");
            $(".up-" + number).show();
            $(".li-" + number).addClass("active");
            if (first) {
                first = false;
            } else {
                //发送请求更新数据
                $.get("orders.jsp", {
                    start: start,
                    top_index: top_index
                }, function (data) {
                    //回调函数
                }, "text");
                location.href = "${pageContext.request.contextPath}/orders.jsp?start=" + start + "&top_index=" + top_index;
            }
        }

        function change(number) {
            bot_index = number;
            $("#a1").removeClass("active");
            $("#a2").removeClass("active");
            $("#a3").removeClass("active");
            $("#a4").removeClass("active");
            $("#a5").removeClass("active");
            $("#a" + number).addClass("active");
            start = (number - 1) * 5;
            //发送请求更新数据
            $.get("orders.jsp", {
                start: start,
                top_index: top_index
            }, function (data) {
                //回调函数
            }, "text");
            location.href = "${pageContext.request.contextPath}/orders.jsp?start=" + start + "&top_index=" + top_index;
        }

        function previous() {
            if (bot_index == 1) {
                return;
            }
            bot_index--;
            change(bot_index);
        }

        function next() {
            if (bot_index == ${size}) {
                return;
            }
            bot_index++;
            change(bot_index);
        }
    </script>
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
                <li><a>hi,欢迎来到小黑市&nbsp;${user.username}</a></li>
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
                    <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
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

<div class="container-fluid">
    <!-- 顶部分栏 -->
    <div class="row">
        <div class="col-xs-12">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active li-1"><a onclick="choose(1)">未付款</a></li>
                <li role="presentation" class="li-2"><a onclick="choose(2)">待收货</a></li>
                <li role="presentation" class="li-3"><a onclick="choose(3)">待评价</a></li>
                <li role="presentation" class="li-4"><a onclick="choose(4)">已完成</a></li>
                <li role="presentation" class="li-5"><a onclick="choose(5)">我的售卖</a></li>
            </ul>
        </div>
    </div>
    <!-- 未付款 -->
    <div class="row up-1" style="height:650px;margin-top:30px;">
        <div class="col-xs-12">
            <table id="table1" class="table table-bordered">
                <tr>
                    <th>序号</th>
                    <th>订单编号</th>
                    <th>商品名称</th>
                    <th>图片</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>状态</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${unPay}" var="o" varStatus="s">
                    <tr>
                        <td>${s.count}</td>
                        <td>${o.orderID}</td>
                        <td>${o.merName}</td>
                        <td><img src=".${o.merRes}" width="112" height="100" style="border-radius: 10px;"></td>
                        <td>￥${o.merPrice}</td>
                        <td>${o.cnt}</td>
                        <td>${o.status}</td>
                        <td>${o.time_}</td>
                        <td>
                            <button class="btn btn-block" style="margin-top: 15px;outline: none;">立即付款</button>
                            <button class="btn btn-block" style="outline:none;">取消订单</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 待收货 -->
    <div class="row up-2" style="height:650px;margin-top:30px;">
        <div class="col-xs-12">
            <table id="table2" class="table table-bordered">
                <tr>
                    <th>序号</th>
                    <th>订单编号</th>
                    <th>商品名称</th>
                    <th>图片</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>状态</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${receive}" var="o" varStatus="s">
                    <tr>
                        <td>${s.count}</td>
                        <td>${o.orderID}</td>
                        <td>${o.merName}</td>
                        <td><img src=".${o.merRes}" width="112" height="100" style="border-radius: 10px;"></td>
                        <td>￥${o.merPrice}</td>
                        <td>${o.cnt}</td>
                        <td>${o.status}</td>
                        <td>${o.time_}</td>
                        <td>
                            <button class="btn btn-block" style="margin-top: 15px;outline: none;">确认收货</button>
                            <button class="btn btn-block" style="outline:none;">申请退货</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 待评价 -->
    <div class="row up-3" style="height:650px;margin-top:30px;">
        <div class="col-xs-12">
            <table id="table3" class="table table-bordered">
                <tr>
                    <th>序号</th>
                    <th>订单编号</th>
                    <th>商品名称</th>
                    <th>图片</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>状态</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${prise}" var="o" varStatus="s">
                    <tr>
                        <td>${s.count}</td>
                        <td>${o.orderID}</td>
                        <td>${o.merName}</td>
                        <td><img src=".${o.merRes}" width="112" height="100" style="border-radius: 10px;"></td>
                        <td>￥${o.merPrice}</td>
                        <td>${o.cnt}</td>
                        <td>${o.status}</td>
                        <td>${o.time_}</td>
                        <td>
                            <button class="btn btn-block" style="margin-top: 15px;outline: none;">立即评价</button>
                            <button class="btn btn-block" style="outline:none;">再次购买</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 已完成 -->
    <div class="row up-4" style="height:650px;margin-top:30px;">
        <div class="col-xs-12">
            <table id="table4" class="table table-bordered">
                <tr>
                    <th>序号</th>
                    <th>订单编号</th>
                    <th>商品名称</th>
                    <th>图片</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>状态</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${already}" var="o" varStatus="s">
                    <tr>
                        <td>${s.count}</td>
                        <td>${o.orderID}</td>
                        <td>${o.merName}</td>
                        <td><img src=".${o.merRes}" width="112" height="100" style="border-radius: 10px;"></td>
                        <td>￥${o.merPrice}</td>
                        <td>${o.cnt}</td>
                        <td>${o.status}</td>
                        <td>${o.time_}</td>
                        <td>
                            <button class="btn btn-block" style="margin-top: 15px;outline: none;">增加追评</button>
                            <button class="btn btn-block" style="outline:none;">申请退货</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 我的售卖 -->
    <div class="row up-5" style="height:650px;margin-top:30px;">
        <div class="col-xs-12">
            <table id="dd-table" class="table table-bordered">
                <tr>
                    <th>序号</th>
                    <th>商品名称</th>
                    <th>图片</th>
                    <th>价格</th>
                    <th>剩余数量</th>
                    <th>状态</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${mySale}" var="o" varStatus="s">
                    <tr>
                        <td>${s.count}</td>
                        <td>${o.orderID}</td>
                        <td>${o.merName}</td>
                        <td><img src=".${o.merRes}" width="112" height="100" style="border-radius: 10px;"></td>
                        <td>￥${o.merPrice}</td>
                        <td>${o.cnt}</td>
                        <td>${o.status}</td>
                        <td>${o.time_}</td>
                        <td>
                            <button class="btn btn-block" style="margin-top: 15px;outline: none;">下架商品</button>
                            <button class="btn btn-block" style="outline:none;">增加数量</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 分页条 -->
    <div class="row">
        <div class="col-xs-offset-3 col-xs-6" style="text-align: center;">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a aria-label="Previous" onclick="previous()">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${size}" var="i">
                        <c:choose>
                            <c:when test="${index==i}">
                                <li class="active" id="a${i}" onclick="change(${i})"><a>${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="" id="a${i}" onclick="change(${i})"><a>${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <li>
                        <a aria-label="Next" onclick="next()">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    <c:choose>
    <c:when test="${top_index==-1}">
        choose(1);
    </c:when>
    <c:otherwise>
        choose(${top_index});
    </c:otherwise>
    </c:choose>
</script>
</body>

</html>