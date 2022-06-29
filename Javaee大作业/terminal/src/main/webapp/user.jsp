<%@ page import="beans.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %><%--
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
    <link rel="shortcut icon" href="./res/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/sweetalert.css">
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/sweetalert-dev.js"></script>
    <title>个人主页</title>
    <style>
        .navbar a {
            font: 600 16px/18px 'Open Sans', sans-serif;
        }

        .navbar a:hover {
            background-image: -webkit-linear-gradient(bottom, red, #fd8403, yellow);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
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

        #user-table {
            overflow-x: hidden;
            overflow-y: scroll;
        }

        .nav-pills > li > a {
            display: block;
        }

        #user-table > .row > .table > tr > .none {
            border-top: none;
        }

        .info-title {
            font-size: 18px;
            color: orange;
            height: 15px;
            text-indent: 5em;
        }

        .info-left {
            font-size: 18px;
            color: #555;
        }

        .info-right {
            font-size: 18px;
        }

        .form-horizontal .control-label {
            text-align: center;
        }

        .tcdkk {
            background-image: url("./res/background-register.jpg");
            position: absolute;
            color: deepskyblue;
            font-size: 16px;
            display: none;
            width: 877px;
            height: 576px;
            left: 293px;
        }
    </style>
    <script>
        var checkCode_;
        var time = 120;
        var timer;
        var valid = false;
        $(function () {
            window.alert = swal;
        });

        function checkPwd() {
            //获取密码
            let password = $("#new-password").val();
            if (password.length < 8) { //密码小于八位不合格
                return false;
            }
            //密码是否为纯数字
            for (let i = 0; i < password.length; i++) {
                if (password[i] < '0' || password[i] > '9') {
                    return true;
                }
            }
            return false;
        }

        function btn_modify() {
            let isLogin = '<%=session.getAttribute("isLogin")%>';
            if (isLogin == 'null') {
                alert("用户未登录,请进行登录");
                return;
            }
            $("#modify-password").fadeIn(500);
        }

        function btn_phone() {
            let isLogin = '<%=session.getAttribute("isLogin")%>';
            if (isLogin == 'null') {
                alert("用户未登录,请进行登录");
                return;
            }
            $("#phone-bd").fadeIn(500);
        }

        function btn_email() {
            let isLogin = '<%=session.getAttribute("isLogin")%>';
            if (isLogin == 'null') {
                alert("用户未登录,请进行登录");
                return;
            }
            $("#email-bd").fadeIn(500);
        }

        function modify_password() {
            //获取原密码
            let old_password = $("#old-password").val();
            //获取现密码
            let new_password = $("#new-password").val();
            //获取重复密码
            let new_password_ = $("#new-password_").val();
            if (old_password == '') {
                alert("原密码不能为空");
                return;
            }
            if (!checkPwd()) {
                alert("新密码不能低于八位,不能为纯数字");
                return;
            }
            if (new_password_ != new_password) {
                alert("新密码与确认密码输入不一致");
                return;
            }
            if (old_password == new_password) {
                alert("新密码不能和原密码相同");
                return;
            }
            //获取用户ID
            <%!String email=null;%>
            <%
                User user = (User) session.getAttribute("user");
                if(user!=null){
                    email = user.getEmail();
                }
            %>
            let email = '<%=email%>';
            $("button[onclick='modify_password()']").html("请稍等...");
            $("button[onclick='modify_password()']").disabled = true;
            //发送修改密码请求
            $.post("modifyPwdServlet", {
                email: email,
                old_password: old_password,
                new_password: new_password
            }, function (date) {
                if (date != "修改成功,请重新登录") {
                    alert(date);
                } else {
                    alert("修改成功,请重新登录,3s后刷新");
                    setTimeout(function () {
                        location.href = "./user.jsp";
                    }, 3000);
                }
                $("button[onclick='modify_password()']").html("修改");
                $("button[onclick='modify_password()']").disabled = false;
            }, "text");
        }

        function checkEmail_phone(email_phone) {
            let sign_ep_tag = false;
            //先检测是不是电话
            let reg = /^1[3458]\d{9}$/;
            sign_ep_tag = reg.test(email_phone);
            if (sign_ep_tag) return sign_ep_tag;
            //再检测是不是邮箱
            reg = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
            return reg.test(email_phone);
        }

        function sendCode(tag) {
            //获取电话或手机
            let email_phone;
            if (tag == "mobile_phone")
                email_phone = $("#phone-number").val();
            else
                email_phone = $("#email").val();
            //检测手机符不符合规则
            if (!checkEmail_phone(email_phone)) {
                alert("手机或邮箱格式错误");
                return;
            }
            //启动倒计时
            valid = true;
            timer = setInterval(function () {
                time--;
                if (tag == "mobile_phone")
                    $("#sendCheckCode-p").html(time + "s内有效");
                else
                    $("#sendCheckCode-e").html(time + "s内有效");
                if (time == 0) {
                    valid = false;
                    clearTimeout(timer);
                    time = 120;
                    if (tag == "mobile_phone")
                        $("#sendCheckCode-p").html("重新发送");
                    else
                        $("#sendCheckCode-e").html("重新发送");
                }
            }, 1000);
            $.post("sendCodeServlet", {
                email_phone: email_phone
            }, function (data) {
                checkCode_ = data;
            }, "text");
        }

        function modifyEmailPhone(tag) {
            let email_phone;
            //获取手机号
            if (tag == "mobile_phone")
                email_phone = $("#phone-number").val();
            else
                email_phone = $("#email").val();
            //获取验证码
            let checkCode;
            if (tag == "mobile_phone")
                checkCode = $("#checkCode-p").val();
            else
                checkCode = $("#checkCode-e").val();
            //获取UID
            <%
                user = (User)session.getAttribute("user");
                String user_id="";
                if(user!=null){
                    user_id = user.getUser_id();
                }
            %>
            let user_id = '<%=user_id%>'
            if (valid && checkCode == checkCode_) {
                //请求修改手机
                $.post("modifyEmailPhoneServlet", {
                    user_id: user_id,
                    email_phone: email_phone
                }, function (data) {
                    if (data == "true") {
                        alert("修改成功");
                        if (tag == "mobile_phone")
                            $("#phone-bd").fadeOut(500);
                        else
                            $("#email-bd").fadeOut(500);
                        setTimeout(function () {
                            location.href = "./user.jsp";
                        }, 1000);
                    } else {
                        alert("服务器错误,代码8391");
                    }
                }, "text");

            } else if (valid) {
                alert("验证码错误");
            } else {
                alert("验证码过期");
            }
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
                        <li><a href="./user.jsp">我的主页</a></li>
                        <li><a href="${pageContext.request.contextPath}/orders.jsp">我的订单</a></li>
                        <li role="separator" class="divider"></li>
                        <link rel="shortcut icon" href="./res/favicon.ico" type="image/x-icon">
                    </ul>
                </li>
                <li><a href="purchaseCart.jsp">购物车</a></li>
                <li><a href="sale.jsp">我要当卖家</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-xs-3">
            <div class="row">
                <div class="col-xs-12">
                    <div class="list-group nav navbar-scroll">
                        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">个人信息</a>
                        <a href="#info1" class="list-group-item list-group-item-action">用户信息</a>
                        <a href="#info2" class="list-group-item list-group-item-action">实名认证</a>
                        <a href="#info3" class="list-group-item list-group-item-action">其他信息</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">账户安全</a>
                        <a href="#info4" class="list-group-item list-group-item-action">修改密码</a>
                        <a href="#info5" class="list-group-item list-group-item-action">绑定手机</a>
                        <a href="#info6" class="list-group-item list-group-item-action">绑定邮箱</a>
                    </div>
                </div>
            </div>
        </div>
        <div style="background-color: pink;width: 0px;height: 0px;position: relative;z-index: 10;">
            <%--修改密码--%>
            <div id="modify-password" class="tcdkk col-xs-9">
                <div class="row" style="margin-top: 200px;">
                    <div class="col-xs-12">
                        <div class="form-horizontal" role="form">
                            <div class="form-group" style="margin-top: 15px;">
                                <label for="old-password" class="col-sm-offset-2 col-sm-2 control-label">原密码</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" id="old-password" placeholder="请输入原密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new-password" class="col-sm-offset-2 col-sm-2 control-label">新密码</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" id="new-password" placeholder="请输入新密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new-password_" class="col-sm-offset-2 col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" id="new-password_"
                                           placeholder="请再次输入新密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-6">
                                    <button class="btn btn-info" style="outline: none;"
                                            onclick="modify_password()">
                                        修改
                                    </button>
                                    <button class="btn btn-info" style="outline: none;"
                                            onclick="modify_password()">
                                        取消修改
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--绑定手机--%>
            <div id="phone-bd" class="tcdkk col-xs-9">
                <div class="row" style="margin-top: 222px;">
                    <div class="col-xs-12">
                        <div class="form-horizontal" role="form">
                            <div class="form-group" style="margin-top: 15px;">
                                <label for="phone-number" class="col-sm-offset-2 col-sm-2 control-label">手机号</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="phone-number" placeholder="请输入手机号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="checkCode-p" class="col-sm-offset-2 col-sm-2 control-label">验证码</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="checkCode-p" placeholder="请输入验证码">
                                </div>
                                <div class="col-sm-2">
                                    <button style="outline: none;" class="btn btn-info" id="sendCheckCode-p"
                                            onclick="sendCode('mobile_phone')">发送验证码
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-6">
                                    <button class="btn btn-info" style="outline: none;"
                                            onclick="modifyEmailPhone('mobile_phone')">绑定
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--绑定邮箱--%>
            <div id="email-bd" class="tcdkk col-xs-9">
                <div class="row" style="margin-top: 222px;">
                    <div class="col-xs-12">
                        <div class="form-horizontal" role="form">
                            <div class="form-group" style="margin-top: 15px;">
                                <label for="email" class="col-sm-offset-2 col-sm-2 control-label">邮箱地址</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="email" placeholder="请输入邮箱">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="checkCode-e" class="col-sm-offset-2 col-sm-2 control-label">验证码</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="checkCode-e" placeholder="请输入验证码">
                                </div>
                                <div class="col-sm-2">
                                    <button style="outline: none;" class="btn btn-info" id="sendCheckCode-e"
                                            onclick="sendCode('email')">发送验证码
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-6">
                                    <button class="btn btn-info" style="outline: none;"
                                            onclick="modifyEmailPhone('email');$('#email-bd').fadeOut(500);">绑定
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-9 innerbox" style="background-color: #eeeeee;height: 576px;" id="user-table">
            <!-- 用户信息 -->
            <div class="form-horizontal" id="info1">
                <div class="form-group">
                    <label class="col-sm-2 control-label info-left" style="line-height: 100px;">头像</label>
                    <div class="col-sm-10 info-right">
                        <p class="form-control-static">
                            <c:if test="${isLogin==true}">
                                <img src="./res/headimg/${user.user_id}.jpg" width="100" height="100"
                                     style="border-radius: 50px;">
                            </c:if>
                        </p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label info-left">用户ID</label>
                    <div class="col-sm-10 info-right">
                        <p class="form-control-static info-right">${user.user_id}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label info-left">用户名</label>
                    <div class="col-sm-10 info-right">
                        <p class="form-control-static">${user.username}</p>
                    </div>
                </div>
            </div>
            <!-- 实名认证 -->
            <div class="form-horizontal" id="info2">
                <div class="form-group">
                    <label class="col-sm-2 control-label info-left">真实姓名</label>
                    <div class="col-sm-10 info-right">
                        <p class="form-control-static">${user.realname}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label info-left">身份证号</label>
                    <div class="col-sm-10 info-right">
                        <p class="form-control-static">${user.idnumber}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label info-left">性别</label>
                    <div class="col-sm-10 info-right">
                        <p class="form-control-static">${user.gender}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label info-left">生日</label>
                    <div class="col-sm-10 info-right">
                        <p class="form-control-static">
                            <%
                                user = (User) session.getAttribute("user");
                                if (user != null) {
                                    Date date = user.getBirthday();
                                    String substring = date.toString().substring(0, date.toString().indexOf(' '));
                                    out.println(substring);
                                    System.out.println(user);
                                }
                            %>
                        </p>
                    </div>
                </div>
            </div>
            <!-- 其他信息 -->
            <div class="form-horizontal" id="info3">
                <div class="form-group">
                    <label class="col-sm-2 control-label info-left">地址</label>
                    <div class="col-sm-10 info-right">
                        <p class="form-control-static">${user.address}</p>
                    </div>
                </div>
            </div>
            <!-- 账户安全 -->
            <div class="form-horizontal">
                <!-- 修改密码 -->
                <div class="form-group" style="position: relative;" id="info4">
                    <div class="form-group">
                        <label class="col-sm-2 control-label info-left">修改密码</label>
                        <div class="col-sm-4">
                            <div class="btn btn-info"
                                 onclick="btn_modify();">点击修改密码
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 绑定手机邮箱 -->
                <div class="form-group" style="position: relative;" id="info5">

                    <div class="form-group">
                        <label class="col-sm-2 control-label info-left">绑定手机</label>
                        <c:choose>
                            <c:when test="${user.mobile_phone==null}">
                                <div class="col-sm-4">
                                    <div class="btn btn-info"
                                         onclick="btn_phone();">点击绑定手机
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-sm-10 info-right">
                                    <p class="form-control-static">${user.mobile_phone}</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
                <div class="form-group" style="position: relative;" id="info6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label info-left">绑定邮箱</label>
                        <c:choose>
                            <c:when test="${user.email==null}">
                                <div class="col-sm-4">
                                    <div class="btn btn-info"
                                         onclick="btn_email()">点击绑定邮箱
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-sm-10 info-right">
                                    <p class="form-control-static">${user.email}</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 底部 -->
<div class="container">
    <div class="row">
        <div class="col-xs-12" style="margin-top:30px;border: 1px solid #999;">

        </div>
    </div>
    <div class="row">
        <div class="col-xs-1"></div>
        <div class="col-xs-10" style="text-align: center;">
            <ul class="foot-list">
                <li><a href="#" style="border: none;">关于我们</a></li>
                <li><a href="#">联系我们</a></li>
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