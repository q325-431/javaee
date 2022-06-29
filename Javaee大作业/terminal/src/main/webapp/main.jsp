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
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/sweetalert-dev.js"></script>
    <title>计院小黑市</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body {
            background-color: #eee;
            position: relative;
        }

        .header-items li {
            list-style: none;
            display: inline;
            padding: 5px;
            font-size: 14px;
            line-height: 20px;
            color: #777;
        }

        .left-nav > dd {
            list-style: none;
            height: 68.75px;
            font-size: 16px;
            color: #ffffff;
            padding: 10px;
            padding-top: 5px;
            background-color: #232f3e;
        }

        .left-nav > dd:hover {
            background-color: #ff8c00;
            padding-left: 35px;
            transition: padding-left 0.5s;
        }

        .left-nav > dt {
            height: 50px;
            text-align: center;
            line-height: 50px;
            font-size: 20px;
            color: #1e9ed1;
        }

        .left-items > li,
        .left-items > li > a,
        .left-items > li > a:hover {
            list-style: none;
            display: inline;
            font-size: 12px;
            color: #ddd;
            padding: 5px;
            padding: 0;
        }

        .carousel-inner > .item
        :hover {
            cursor: pointer;
            transform: scale(1.1, 1.1);
            transition: transform 1s;
        }

        .goods-items {
            display: inline-block;
            margin-top: 20px;
            /* height: 250px; */
        }

        .goods-class {
            margin-top: 10px;
            background-color: #dddddd;
            border: 2px solid #aaaaaa;
            border-radius: 5px;
        }

        .good-title {
            text-align: center;
            color: #777;
        }

        .foot-list {
            display: inline-block;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .foot-list > li,
        li > a {
            list-style: none;
            float: left;
            color: #1e9ed1;
            margin-left: 2px;
            margin-right: 13px;
        }

        .foot-list > li > a:hover {
            color: #1e9ed1;
            text-decoration: underline;
        }

        #copyright {
            text-align: center;
            margin-bottom: 30px;
        }

        .thumbnail p {
            color: #ff8c00;
            font-size: 18px;
        }

        .thumbnail img {
            cursor: pointer;
        }

        .navbar a {
            font: 600 16px/18px 'Open Sans', sans-serif;
        }

        .navbar a:hover {
            background-image: -webkit-linear-gradient(bottom, red, #fd8403, yellow);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .merName {
            height: 25px;
            overflow: hidden;
            /* background-color: red; */
            mmargin: 0;
            padding: 0 5px;
        }

        .merDes {
            height: 30px;
            font-size: 15px;
            width: 230px;
            line-height: 16px;
            /* margin-right: 3px; */
            margin-bottom: 10px;
            /* background-color: red; */
            overflow: hidden;
        }

        .chooseCnt {
            background-color: red;
            height: 200px;
            width: 400px;
            position: fixed;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            margin: auto;
            z-index: 20;
            display: none;
            background-image: url("./res/bbbb.jpg?v=new Date()");
            background-size: cover;
            background-repeat: no-repeat;
        }

        #cover908 {
            position: fixed;
            height: 100%;
            width: 100%;
            background-color: #eeeeeeee;
            z-index: 10;
            display: none;
        }

        .change-btn {
            outline: none;
            height: 35px;
            width: 100px;
            color: orange;
        }

        .count {
            font-size: 20px;
            color: skyblue;
        }

        .buy-now {
            background-color: red;
            height: 200px;
            width: 400px;
            position: fixed;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            margin: auto;
            z-index: 20;
            display: none;
            background-image: url("./res/bbbb.jpg?v=new Date()");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .close_ {
            margin: 2px 2px 0 0;
            height: 20px;
            width: 20px;
            padding-top: 1px;
            font-size: 16px;
            padding-left: 1px;
            float: right;
            border: 1px solid orange;
            border-radius: 10px;
            text-align: center;
            line-height: 18px;
            background-color: #ffc741cc;
            cursor: pointer;
        }
    </style>
    <script>
        var merName;
        var merPrice;
        var cnt;
        var merID;
        $(function () {
            window.alert = swal; //sweetalert
        });

        function addToCart(str, obj) {
            $("#cover908").css("display", "block");
            $(".chooseCnt").css("display", "block");
            let index = $(obj).attr("name");
            //alert(index);
            merID = $(obj).attr("tag");
            //alert(merID);
            let id1, id2;
            switch (str) {
                case "book":
                    id1 = "#book1-" + index;
                    id2 = "#book2-" + index;
                    break;
                case "pen":
                    id1 = "#pen1-" + index;
                    id2 = "#pen2-" + index;
                    break;
                case "sport":
                    id1 = "#sport1-" + index;
                    id2 = "#sport2-" + index;
                    break;
                case "bed":
                    id1 = "#bed1-" + index;
                    id2 = "#bed2-" + index;
                    break;
                case "clo":
                    id1 = "#clo1-" + index;
                    id2 = "#clo2-" + index;
                    break;
                case "shuma":
                    id1 = "#shuma1-" + index;
                    id2 = "#shuma2-" + index;
                    break;
                case "other":
                    id1 = "#other1-" + index;
                    id2 = "#other2-" + index;
                    break;
            }
            merName = $(id1).html();
            merPrice = $(id2).html();
            merPrice = merPrice.substring(1, merPrice.length);
            console.log(merName + "  " + merPrice);
        }

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

        function confirm() {
            if (${user.user_id==null}) {
                alert("请先登录!");
                $("#cover908").css("display", "none");
                $(".chooseCnt").css("display", "none");
                return;
            }
            cnt = $(".count").html();
            console.log(merName + " " + merPrice + " ", cnt);
            $.post("addToCart", {
                "user_id": "${user.user_id}",
                "merName": merName,
                "merPrice": merPrice,
                "cnt": cnt
            }, function (data) {
                //回调函数
                alert("加入成功");
            }, "text");
            $("#cover908").css("display", "none");
            $(".chooseCnt").css("display", "none");
        }

        function buyItem(str, obj) {
            $("#cover908").css("display", "block");
            $(".buy-now").css("display", "block");
            let index = $(obj).attr("name");
            //alert(index);
            merID = $(obj).attr("tag");
            //alert(merID);
            let id1, id2;
            switch (str) {
                case "book":
                    id1 = "#book1-" + index;
                    id2 = "#book2-" + index;
                    break;
                case "pen":
                    id1 = "#pen1-" + index;
                    id2 = "#pen2-" + index;
                    break;
                case "sport":
                    id1 = "#sport1-" + index;
                    id2 = "#sport2-" + index;
                    break;
                case "bed":
                    id1 = "#bed1-" + index;
                    id2 = "#bed2-" + index;
                    break;
                case "clo":
                    id1 = "#clo1-" + index;
                    id2 = "#clo2-" + index;
                    break;
                case "shuma":
                    id1 = "#shuma1-" + index;
                    id2 = "#shuma2-" + index;
                    break;
                case "other":
                    id1 = "#other1-" + index;
                    id2 = "#other2-" + index;
                    break;
            }
            merName = $(id1).html();
            merPrice = $(id2).html();
            merPrice = merPrice.substring(1, merPrice.length);
            console.log(merName + "  " + merPrice + " " + merID);
        }

        function buy_confirm() {
            if (${user.user_id==null}) {
                alert("请先登录!");
                $("#cover908").css("display", "none");
                $(".buy-now").css("display", "none");
                return;
            }
            cnt = $("span[name='count']").html();
            console.log(merID + " " + merName + " " + merPrice + " ", cnt);
            $.post("buyServlet", {
                "user_id": "${user.user_id}",
                "status": "未付款",
                "merID": merID,
                "cnt": cnt
            }, function (data) {
                //回调函数
                if (data == 'true') {
                    alert("购买成功");
                }
            }, "text");
            $("#cover908").css("display", "none");
            $(".buy-now").css("display", "none");
        }
        function close_(cls) {
            $("#cover908").css("display", "none");
            $(cls).css("display", "none");
        }
    </script>
</head>

<body>
<div id="cover908"></div>
</div>
<div class="chooseCnt">
    <div class="close_" onclick="close_('.chooseCnt')">
        ×
    </div>
    <h3 style="text-align: center;">请选择数量</h3>
    <div style="text-align: center;margin-top: 40px;margin-bottom: 20px;">
        <button class="btn change-btn" onclick="change(this,-1)" style="outline: none">少买一个</button>
        <span class="count">1</span>
        <button class="btn change-btn" onclick="change(this,1)" style="outline: none">多买一个</button>
    </div>
    <button class="btn" style="outline:none;width: 181px;margin: 5px 109px;" onclick="confirm()">
        确认加入购物车
    </button>
</div>
<div class="buy-now">
    <div class="close_" onclick="close_('.buy-now')">
        ×
    </div>
    <h3 style="text-align: center;">请选择数量</h3>
    <div style="text-align: center;margin-top: 40px;margin-bottom: 20px;">
        <button class="btn change-btn" onclick="change(this,-1)" style="outline: none">少买一个</button>
        <span class="count" name="count">1</span>
        <button class="btn change-btn" onclick="change(this,1)" style="outline: none">多买一个</button>
    </div>
    <button class="btn" style="outline:none;width: 181px;margin: 5px 109px;" onclick="buy_confirm()">
        立即购买
    </button>
</div>
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
<!-- 导航图 -->
<div class="container">
    <div class="row" style="height: 530px;">
        <div class="col-xs-3" style="padding:0;height: 530px;">
            <dl class="left-nav">
                <dt>计院小黑市</dt>
                <%--各类书籍侧边导航--%>
                <dd>各类书籍
                    <c:choose>
                        <c:when test="${not empty booksList}">
                            <ul class="left-items">
                                <c:forEach items="${booksList}" var="mer" varStatus="s">
                                    <c:if test="${s.index<3}">
                                        <li><a href="#">${mer.merName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="left-items">
                                <li><a href="#">缺货</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </dd>
                <%--文具用品侧边导航--%>
                <dd>文具用品
                    <c:choose>
                        <c:when test="${not empty stationeryList}">
                            <ul class="left-items">
                                <c:forEach items="${stationeryList}" var="mer" varStatus="s">
                                    <c:if test="${s.index<3}">
                                        <li><a href="#">${mer.merName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="left-items">
                                <li><a href="#">缺货</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </dd>
                <%--运动器材侧边导航--%>
                <dd>运动器材
                    <c:choose>
                        <c:when test="${not empty sportsList}">
                            <ul class="left-items">
                                <c:forEach items="${sportsList}" var="mer" varStatus="s">
                                    <c:if test="${s.index<3}">
                                        <li><a href="#">${mer.merName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="left-items">
                                <li><a href="#">缺货</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </dd>
                <%--床上用品侧边导航--%>
                <dd>床上用品
                    <c:choose>
                        <c:when test="${not empty beddingList}">
                            <ul class="left-items">
                                <c:forEach items="${beddingList}" var="mer" varStatus="s">
                                    <c:if test="${s.index<3}">
                                        <li><a href="#">${mer.merName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="left-items">
                                <li><a href="#">缺货</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </dd>
                <%--穿搭物品侧边导航--%>
                <dd>穿搭物品
                    <c:choose>
                        <c:when test="${not empty clothesList}">
                            <ul class="left-items">
                                <c:forEach items="${clothesList}" var="mer" varStatus="s">
                                    <c:if test="${s.index<3}">
                                        <li><a href="#">${mer.merName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="left-items">
                                <li><a href="#">缺货</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </dd>
                <%--数码物品侧边导航--%>
                <dd>数码物品
                    <c:choose>
                        <c:when test="${not empty digitalList}">
                            <ul class="left-items">
                                <c:forEach items="${digitalList}" var="mer" varStatus="s">
                                    <c:if test="${s.index<3}">
                                        <li><a href="#">${mer.merName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="left-items">
                                <li><a href="#">缺货</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </dd>
                <%--其他物品侧边导航--%>
                <dd>其他物品
                    <c:choose>
                        <c:when test="${not empty othersList}">
                            <ul class="left-items">
                                <c:forEach items="${othersList}" var="mer" varStatus="s">
                                    <c:if test="${s.index<3}">
                                        <li><a href="#">${mer.merName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="left-items">
                                <li><a href="#">缺货</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </dd>
            </dl>
        </div>
        <div class="col-xs-9" style="height: 52px;"></div>
        <div class="col-xs-9" style="height: 480px;">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                    <li data-target="#myCarousel" data-slide-to="4"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="./res/pen.jpg" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="./res/book2.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="./res/books1.jpg" alt="Third slide">
                    </div>
                    <div class="item">
                        <img src="./res/cup.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="./res/juanchi.jpg" alt="Second slide">
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="carousel-control right" href="#myCarousel" data-slide="next"> <span _ngcontent-c3=""
                                                                                              aria-hidden="true"
                                                                                              class="glyphicon glyphicon-chevron-right"></span></a>
                <a class="carousel-control left" href="#myCarousel" data-slide="prev"> <span _ngcontent-c3=""
                                                                                             aria-hidden="true"
                                                                                             class="glyphicon glyphicon-chevron-left"></span></a>
            </div>
        </div>
    </div>
</div>
<!-- 商品页 -->
<div class="container">
    <!-- 各类书籍 -->
    <div class="row goods-class">
        <c:forEach items="${booksList}" var="mer" varStatus="s">
            <c:if test="${s.index==0}">
                <div class="row">
                    <h2 class="col-xs-12 good-title">
                        &gt;&gt;&gt;&gt;&gt;各类书籍&lt;&lt;&lt;&lt;&lt;
                    </h2>
                </div>
            </c:if>
            <c:if test="${s.index<8}">
                <div class="col-xs-3 goods-items">
                    <div class="thumbnail">
                        <img src=".${mer.merRes}" width="224" height="200">
                        <div class="caption">
                            <h3 class="merName" id="book1-${s.index}">${mer.merName}</h3>
                            <div class="merDes">${mer.merDes}</div>
                            <p id="book2-${s.index}">￥${mer.merPrice}</p>
                            <p>
                                <button name="${s.index}" class="btn btn-primary" role="button"
                                        tag="${mer.merID}" onclick="addToCart('book',this)" style="outline: none">加入购物车
                                </button>
                                <button name="${s.index}" style="outline: none" tag="${mer.merID}"
                                        class="btn btn-default" role="button"
                                        onclick="buyItem('book',this)">
                                    立即购买
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <!-- 文具用品 -->
    <div class="row goods-class">
        <c:forEach items="${stationeryList}" var="mer" varStatus="s">
            <c:if test="${s.index==0}">
                <div class="row">
                    <h2 class="col-xs-12 good-title">
                        &gt;&gt;&gt;&gt;&gt;文具用品&lt;&lt;&lt;&lt;&lt;
                    </h2>
                </div>
            </c:if>
            <c:if test="${s.index<8}">
                <div class="col-xs-3 goods-items">
                    <div class="thumbnail">
                        <img src=".${mer.merRes}" width="224" height="200">
                        <div class="caption">
                            <h3 class="merName" id="pen1-${s.index}">${mer.merName}</h3>
                            <div class="merDes">${mer.merDes}</div>
                            <p id="pen2-${s.index}">￥${mer.merPrice}</p>
                            <p>
                                <button name="${s.index}" class="btn btn-primary" role="button"
                                        onclick="addToCart('pen',this)" style="outline: none">加入购物车
                                </button>
                                <button name="${s.index}" style="outline: none" tag="${mer.merID}"
                                        class="btn btn-default" role="button"
                                        onclick="buyItem('pen',this)">
                                    立即购买
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <!-- 运动器材 -->
    <div class="row goods-class">
        <c:forEach items="${sportsList}" var="mer" varStatus="s">
            <c:if test="${s.index==0}">
                <div class="row">
                    <h2 class="col-xs-12 good-title">
                        &gt;&gt;&gt;&gt;&gt;运动器材&lt;&lt;&lt;&lt;&lt;
                    </h2>
                </div>
            </c:if>
            <c:if test="${s.index<8}">
                <div class="col-xs-3 goods-items">
                    <div class="thumbnail">
                        <img src=".${mer.merRes}" width="224" height="200">
                        <div class="caption">
                            <h3 class="merName" id="sport1-${s.index}">${mer.merName}</h3>
                            <div class="merDes">${mer.merDes}</div>
                            <p id="sport2-${s.index}">￥${mer.merPrice}</p>
                            <p>
                                <button name="${s.index}" class="btn btn-primary" role="button"
                                        onclick="addToCart('sport',this)" style="outline: none">加入购物车
                                </button>
                                <button name="${s.index}" style="outline: none" tag="${mer.merID}"
                                        class="btn btn-default" role="button"
                                        onclick="buyItem('sport',this)">
                                    立即购买
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <!-- 床上用品 -->
    <div class="row goods-class">
        <c:forEach items="${beddingList}" var="mer" varStatus="s">
            <c:if test="${s.index==0}">
                <div class="row">
                    <h2 class="col-xs-12 good-title">
                        &gt;&gt;&gt;&gt;&gt;床上用品&lt;&lt;&lt;&lt;&lt;
                    </h2>
                </div>
            </c:if>
            <c:if test="${s.index<8}">
                <div class="col-xs-3 goods-items">
                    <div class="thumbnail">
                        <img src=".${mer.merRes}" width="224" height="200">
                        <div class="caption">
                            <h3 class="merName" id="bed1-${s.index}">${mer.merName}</h3>
                            <div class="merDes">${mer.merDes}</div>
                            <p id="bed2-${s.index}">￥${mer.merPrice}</p>
                            <p>
                                <button name="${s.index}" class="btn btn-primary" role="button"
                                        onclick="addToCart('bed',this)" style="outline: none">加入购物车
                                </button>
                                <button name="${s.index}" style="outline: none" tag="${mer.merID}"
                                        class="btn btn-default" role="button"
                                        onclick="buyItem('bed',this)">
                                    立即购买
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <!-- 穿搭物品 -->
    <div class="row goods-class">
        <c:forEach items="${clothesList}" var="mer" varStatus="s">
            <c:if test="${s.index==0}">
                <div class="row">
                    <h2 class="col-xs-12 good-title">
                        &gt;&gt;&gt;&gt;&gt;穿搭物品&lt;&lt;&lt;&lt;&lt;
                    </h2>
                </div>
            </c:if>
            <c:if test="${s.index<8}">
                <div class="col-xs-3 goods-items">
                    <div class="thumbnail">
                        <img src=".${mer.merRes}" width="224" height="200">
                        <div class="caption">
                            <h3 class="merName" id="clo1-${s.index}">${mer.merName}</h3>
                            <div class="merDes">${mer.merDes}</div>
                            <p id="clo2-${s.index}">￥${mer.merPrice}</p>
                            <p>
                                <button name="${s.index}" class="btn btn-primary" role="button"
                                        onclick="addToCart('clo',this)" style="outline: none">加入购物车
                                </button>
                                <button name="${s.index}" style="outline: none" tag="${mer.merID}"
                                        class="btn btn-default" role="button"
                                        onclick="buyItem('clo',this)">
                                    立即购买
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <!-- 数码物品 -->
    <div class="row goods-class">
        <c:forEach items="${digitalList}" var="mer" varStatus="s">
            <c:if test="${s.index==0}">
                <div class="row">
                    <h2 class="col-xs-12 good-title">
                        &gt;&gt;&gt;&gt;&gt;数码物品&lt;&lt;&lt;&lt;&lt;
                    </h2>
                </div>
            </c:if>
            <c:if test="${s.index<8}">
                <div class="col-xs-3 goods-items">
                    <div class="thumbnail">
                        <img src=".${mer.merRes}" width="224" height="200">
                        <div class="caption">
                            <h3 class="merName" id="shuma1-${s.index}">${mer.merName}</h3>
                            <div class="merDes">${mer.merDes}</div>
                            <p id="shuma2-${s.index}">￥${mer.merPrice}</p>
                            <p>
                                <button name="${s.index}" class="btn btn-primary" role="button"
                                        onclick="addToCart('shuma',this)" style="outline: none">加入购物车
                                </button>
                                <button name="${s.index}" style="outline: none" tag="${mer.merID}"
                                        class="btn btn-default" role="button"
                                        onclick="buyItem('shuma',this)">
                                    立即购买
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <!-- 其他物品 -->
    <div class="row goods-class">
        <c:forEach items="${othersList}" var="mer" varStatus="s">
            <c:if test="${s.index==0}">
                <div class="row">
                    <h2 class="col-xs-12 good-title">
                        &gt;&gt;&gt;&gt;&gt;其他物品&lt;&lt;&lt;&lt;&lt;
                    </h2>
                </div>
            </c:if>
            <c:if test="${s.index<8}">
                <div class="col-xs-3 goods-items">
                    <div class="thumbnail">
                        <img src=".${mer.merRes}" width="224" height="200">
                        <div class="caption">
                            <h3 class="merName" id="other1-${s.index}">${mer.merName}</h3>
                            <div class="merDes">${mer.merDes}</div>
                            <p id="other2-${s.index}">￥${mer.merPrice}</p>
                            <p>
                                <button name="${s.index}" class="btn btn-primary" role="button"
                                        onclick="addToCart('other',this)" style="outline: none">加入购物车
                                </button>
                                <button name="${s.index}" style="outline: none" tag="${mer.merID}"
                                        class="btn btn-default" role="button"
                                        onclick="buyItem('other',this)">
                                    立即购买
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>
<!-- 底部 -->
<div class="container" style="margin-top: 80px">
    <div class="row">
        <div class="col-xs-12" style="border: 1px solid #999;">

        </div>
    </div>
    <div class="row">
        <div class="col-xs-1"></div>
        <div class="col-xs-10" style="text-align: center;">
            <ul class="foot-list">
                <li><a href="" style="border: none;">关于我们</a></li>
                <li><a>联系我们</a></li>
                <li><a href="#">人才招聘</a></li>
                <li><a href="#">商家入驻</a></li>
                <li><a href="#">广告服务</a></li>
                <li><a href="#">手机界面</a></li>
                <li><a href="#">友情链接</a></li>
                <li><a href="#">销售联盟</a></li>
                <li><a href="#">讨论社区</a></li>
                <li><a href="#">热情公益</a></li>
            </ul>
        </div>
        <div class="col-xs-1"></div>
    </div>
    <div class="row">
        <div class="col-xs-12">
        </div>
    </div>
</div>
</body>

</html>