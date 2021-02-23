<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 = request.getSession();
    //System.out.println(session1.getAttribute("user"));
    if(session1.getAttribute("user") != null)
        response.sendRedirect("/");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
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
                <div class="sp-cart"><a href="/shopcart.jsp">购物车</a> </div>
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
                        <input type="text" name="title" required lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
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
                        <a href="/commodity.jsp" class="active">所有商品</a>
                        <a href="javascript:;">今日团购</a>
                        <a href="javascript:;">数码资讯</a>
                        <a href="javascript:;">关于我们</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="login-bg">
            <div class="login-cont w1200">
                <div class="form-box">
                    <legend>登录</legend>
                    <div class="layui-form-item">
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <!-- <span>用户名：</span>  -->
                                <input type="text" name="username" id="username" lay-verify="required|phone" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline veri-code">
                            <div class="layui-input-inline">
                                <!-- <span>密码：</span> -->
                                <input id="password" type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item login-btn">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="layui-btn" lay-filter="demo1" id="login">登录</button>
                            <!-- <input type="submit" class="layui-btn" id="login" value="登录"> -->
                        </div>
                        <div>
                            <br>
                            <span style="float:right;"><a href="/signup.jsp">免费注册</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
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

        layui.use(['jquery'], function () {

            var $ = layui.jquery,
                layer = layui.layer;

            //获取页面中的元素
            var btn = document.getElementById("login");

            btn.onclick = function() {

                var username = document.getElementById("username").value;

                var password = document.getElementById("password").value;

                if (username.value === "" || password.value === "") {
                    layer.msg("用户名或密码不能为空！");
                } else {
                    console.log(username)
                    console.log(password)
                    //使用ajax发送数据
                    $.ajax({
                        type: "POST",
                        url: "/user",
                        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                        async: true,
                        cache: false,
                        dataType: "json",
                        data: {"method": "login", "account": username, "password": password},
                        success: function(res) {

                            if (res.code === 200) {
                                window.location.href = "/";
                            } else
                                layer.msg(res.message);
                        }
                    });
                }
            }
        })
    </script>
</body>

</html>