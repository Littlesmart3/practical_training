<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 = request.getSession();
    //System.out.println(session1.getAttribute("user"));
    if (session1.getAttribute("user") != null)
        response.sendRedirect("/");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <style>
        .bg-danger {
            float: left;
            display: block;
            padding: 9px 0 !important;
            line-height: 20px;
            margin-right: 10px;
            color: red;
        }

        .bg-success {
            float: left;
            display: block;
            padding: 9px 0 !important;
            line-height: 20px;
            margin-right: 10px;
            color: green;
        }
    </style>
</head>

<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="index.jsp">首页</a>
        </p>
        <div class="sn-quick-menu">
            <div class="login"><a href="login.jsp">登录</a></div>
            <div class="sp-cart"><a href="shopcart.jsp">购物车</a></div>
        </div>
    </div>
</div>


<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="/" title="数码商城">
                    <img src="${pageContext.request.contextPath}/static/img/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base  login-content" style="padding-bottom:117px">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="commodity.jsp" class="active">所有商品</a>
                    <a href="javascript:;">今日团购</a>
                    <a href="javascript:;">数码资讯</a>
                    <a href="javascript:;">关于我们</a>
                </div>
            </div>
        </div>
    </div>


    <div style="width:800px;margin:20px auto">
        <h4 style="font-size: 30px;margin-left: 55px;margin-bottom: 25px;">注册</h4>
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-block">
                    <input id="nickName" type="text" name="title" lay-verify="title" autocomplete="off" placeholder=""
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" id="username" name="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？"
                           placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input id="password" type="password" name="password" lay-verify="pass" placeholder="请输入密码"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux" id="info">密码至少包含数字和英文，长度6-20</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户类型</label>
                <div class="layui-input-block">
                    <input id="radio1" type="radio" name="user" value="0" title="买家用户" checked="">
                    <input id="radio2" type="radio" name="user" value="1" title="卖家用户">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1" id="zhuce">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>


<div class="footer" style="bottom:0px; width:100%;">
    <div class="ng-promise-box">
        <div class="ng-promise w1200">
            <p class="text">
                <a class="icon1" href="javascript:;">7天无理由退换货</a>
                <a class="icon2" href="javascript:;">满99元全场免邮</a>
                <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
            </p>
        </div>
    </div>
    <div class="mod_help w1200">
        <p>
            <a href="javascript:;">关于我们</a>
            <span>|</span>
            <a href="javascript:;">帮助中心</a>
            <span>|</span>
            <a href="javascript:;">售后服务</a>
            <span>|</span>
            <a href="javascript:;">数码资讯</a>
            <span>|</span>
            <a href="javascript:;">关于货源</a>
        </p>
        <p class="coty">数码商城版权所有 &copy; 2012-2020</p>
    </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>

<script type="text/javascript">
    layui.use(['jquery', 'layer', 'form'], function () {

        var $ = layui.$,
            layer = layui.layer; form = layui.form;

        var btn = document.getElementById("zhuce");

        //点击注册按钮
        btn.onclick = function () {
            var nickName = document.getElementById("nickName").value;
            var account = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var identity = $("input[type='radio']").filter(':checked').val();
            if (account === "" || password === "") {
                layer.msg('用户名或者密码不能为空');
            } else {

                $.ajax({
                    type: 'POST',
                    url: '/user',
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    async: true,
                    cache: false,
                    dataType: "json",
                    data: {"nickName": nickName, "account": account, "password": password,
                        "identity": identity, "method": "signup"},
                    success: function (data) {
                        if (data.code === 200) {
                            location.href = '/login.jsp';
                        } else {
                            layer.msg(data.message);
                        }
                    }
                });
            }

            return false;
        }

    })
</script>

</body>

</html>