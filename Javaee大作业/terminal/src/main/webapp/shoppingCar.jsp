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
    <title>购物车</title>
    <style>
        body {
            font: 600 16px/18px 'Open Sans', sans-serif;
        }

        .table > tbody > tr > td {
            width: 100px;
            line-height: 40px;
            text-align: center;
        }

        .table > tbody > tr > th {
            text-align: center;
        }

        .count {
            text-align: center;
            line-height: 40px;
        }
    </style>
    <script>

        function change(obj, number) {
            if (number == -1) {
                let span = $(obj).next();
                let pre = parseInt(span.html());
                pre += number;
                if (pre < 1) {
                    pre = 1;
                }
                span.html(pre);
            } else {
                let span = $(obj).prev();
                let pre = parseInt(span.html());
                pre += number;
                span.html(pre);
            }
        }

        function calcTotle() {
            let price = document.getElementsByClassName("price ");
            let count = document.getElementsByClassName("count ");
            let sum = 0;
            for (let i = 0; i < price.length; i++) {
                sum += parseInt(count[i].innerText) * parseFloat(price[i].innerHTML.substring(1, price[i].innerHTML.length)).toFixed(2);
            }
            document.getElementById("totle-price ").innerHTML = "￥ " + parseFloat(sum).toFixed(2);
        }

        function deleteItem(obj) {
            let index = $(obj).attr("name");
            let merName = $("#merName-"+index).html();
            let time_ = $("#time_-"+index).html();
            let cnt = $("#cnt-"+index).html();
            console.log(merName+time_);
            $.ajax({
                url:"deleteItem",
                type:"POST",
                data:{
                    user_id:"${user.user_id}",
                    merName:merName,
                    time_:time_,
                },
                success:function (data) {
                    if(data=="true"){
                        //响应成功的回调函数
                        location.href="${pageContext.request.contextPath}/purchaseCart.jsp";
                    }
                },
                async:false,
                dataType:"text"
            });
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
                <li><a href="./shoppingCar.html">购物车</a></li>
                <li><a href="./sale.html">我要当卖家</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <table id="dd-table" class="table table-bordered">
                <tr>
                    <th>商品名称</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${cartList}" var="cart" varStatus="s">
                    <tr>
                        <td id="merName-${s.index}">${cart.merName}</td>
                        <td class="price">￥${cart.merPrice}</td>
                        <td>
                            <button class="btn" style="outline: none;" onclick="change(this,-1);calcTotle();">-</button>
                            <span id="cnt-${s.index}" class="count">${cart.cnt}</span>
                            <button class="btn" style="outline: none;" onclick="change(this,1);calcTotle();">+</button>
                        </td>
                        <td id="time_-${s.index}">${cart.time_}</td>
                        <td>
                            <button name="${s.index}" class="btn btn-block "
                                    style="outline: none;"
                                    onclick="calcTotle();deleteItem(this);">
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>合计</td>
                    <td colspan="2 " id="totle-price ">
                        <script>
                            calcTotle();
                        </script>
                    </td>
                    <td>2021-6-6 15:22:00</td>
                    <td>
                        <button class="btn btn-block " style="outline: none; ">立即够买</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
<%--    分页条--%>
    <div class="row">
        <div class="col-xs-offset-3 col-xs-6" style="text-align: center;">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>

</html>