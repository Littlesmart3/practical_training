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
    <title>个人中心</title>
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
                <div class="/login" id="top_login"><a href="login.jsp">登录</a></div>
                <div class="sp-cart"><a href="/shopcart.jsp">购物车</a> </div>
            </div>
        </div>
    </div>

    <div class="header">
        <div class="headerLayout w1200">
            <div class="headerCon">
                <h1 class="mallLogo">
                    <a href="index.jsp" title="数码商城">
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
                        <a href="commodity.jsp" class="active">所有商品</a>
                        <a href="javascript:;">今日团购</a>
                        <a href="javascript:;">数码资讯</a>
                        <a href="javascript:;">关于我们</a>
                    </div>
                </div>
            </div>
        </div>


        <div style="width:800px;margin:20px auto; margin-bottom:190px">
            <h4 style="font-size: 30px;margin-left: 15px;margin-bottom: 25px;">个人信息</h4>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block">
                        <span name="title" lay-verify="title" autocomplete="off" style="line-height:36px;" id="nickName"></span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户类型</label>
                    <div class="layui-input-block">
                        <span name="title" lay-verify="title" autocomplete="off" style="line-height:36px;" id="identity"></span>
                        <!-- <input type="text" name="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" autocomplete="off" class="layui-input"> -->
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">账户余额</label>
                    <div class="layui-input-inline">
                        <span name="money" lay-verify="title" autocomplete="off" style="line-height:36px;" id="money"></span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" style="color:white;"><a href="modify_information.jsp" style="color:white;">修改个人信息</a> </button>
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
        layui.use(['jquery', 'form'], function() {

            var $ = layui.$;

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
                        $("#identity").append(data.identity === 0 ? "普通用户" : "卖家");
                        $("#money").append(data.money);
                        if(data.identity === 1){
                            $('.sp-cart a').text("管理商品");
                            $('.sp-cart a').attr("href", "/management.jsp");
                        }
                    }
                }
            })
        })
    </script>

</body>

</html>