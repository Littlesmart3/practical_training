<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 = request.getSession();
    //System.out.println(session1.getAttribute("user"));
    if (session1.getAttribute("user") == null)
        response.sendRedirect("/");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
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
            <a href="/">首页</a>
        </p>
        <div class="sn-quick-menu">
            <div class="login" id="top_login"><a href="/login.jsp">登录</a></div>
            <div class="sp-cart"><a href="/shopcart.jsp">购物车</a></div>
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
<div class="content content-nav-base  login-content">
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


    <div style="width:800px;margin:20px auto;margin-bottom: 190px;">
        <h4 style="font-size: 30px;margin-left: 15px;margin-bottom: 25px;">修改个人信息</h4>
        <form id="update" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-block">
                    <input id="nickName" type="text" name="title" lay-verify="title" autocomplete="off" placeholder=""
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input id="password" type="password" name="password" lay-verify="pass" placeholder="请输入密码"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux" id="info">请填写6到12位密码</div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1" id="modify">提交修改</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="footer" style="position:absolute; bottom:0px; width:100%;">
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

<script>
    layui.use(['jquery', 'layer'], function () {

        var $ = layui.$,
            layer = layui.layer;

        $.ajax({
            url: "/user",
            type: "POST",
            async: false,
            cache: false,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            data: {"method": "vaild"},
            success: function (data) {
                if (data.code === 200) {

                    data = data.data;

                    $("#top_login a").text(data.nickName);

                    $("#top_login a").attr("href", "/preson-information.jsp");

                    $("#nickName").append(data.nickName);
                    if(data.identity === 1){
                        $('.sp-cart a').text("管理商品");
                        $('.sp-cart a').attr("href", "/management.jsp");
                    }
                }
            }
        });

        var btn = document.getElementById("modify");

        btn.onclick = function() {

            var nickName = $("#nickName").val();
            var password = $("#password").val();


            $.ajax({
                url: "/user",
                type: "POST",
                async: true,
                cache: false,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                data: { "nickName": nickName,"password": password, "method":"update"},
                success: function(data, res) {

                    if (res.code === 200) {
                        layer.msg("修改成功")
                    }else{
                        layer.msg(data.message);

                    }
                }
            });

        }
    });
</script>

</body>

</html>