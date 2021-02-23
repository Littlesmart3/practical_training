<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<body id="list-cont">
<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="index.jsp">首页</a>
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
                <a href="#" title="数码商城">
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


<div class="content">
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
    <div class="category-con">
        <div class="category-inner-con w1200">
            <div class="category-type">
                <h3>全部分类</h3>
            </div>
            <div class="category-tab-content">
                <div class="nav-con">
                    <ul class="normal-nav layui-clear">
                        <li class="nav-item">
                            <div class="title">智能手机</div>
                            <p><a href="#">手机</a><a href="#">手机配件</a><a href="#">通讯产品</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">电脑</div>
                            <p><a href="#">笔记本电脑</a><a href="#">平板电脑</a><a href="#">台式电脑</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">数码相机</div>
                            <p><a href="#">单反</a><a href="#">相机配件</a><a href="#">数码摄像机</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">硬件外设</div>
                            <p><a href="#">装机硬件</a><a href="#">硬件外设</a><a href="#">拓展配件</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">数码产品</div>
                            <p><a href="#">随身视听</a><a href="#">移动存储</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">办公产品</div>
                            <p><a href="#">打印机</a><a href="#">投影</a><a href="#">视频监控</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item">
                            <div class="title">智能家具</div>
                            <p><a href="#">智能穿戴</a><a href="#">影音电视</a><a href="#">游戏机</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                        <li class="nav-item nobor">
                            <div class="title">网络无线</div>
                            <p><a href="#">服务器</a><a href="#">无线网络</a><a href="#">网络设备</a></p>
                            <i class="layui-icon layui-icon-right"></i>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="category-banner">
            <div class="w1200">
                <img src="${pageContext.request.contextPath}/static/img/banner1.jpg">
            </div>
        </div>
    </div>


    <div class="product-list-box" id="product-list-box">
        <div class="product-list-cont w1200">
            <h4>热销推荐</h4>
            <div class="product-item-box layui-clear"></div>
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
        <p class="copy">数码商城版权所有 &copy; 2012-2020</p>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nickName.js"></script>

<script>

    layui.use(['jquery'], function () {

        var $ = layui.jquery;

        $.ajax({
            type: "GET",
            url: "/goods",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            async: false,
            cache: false,
            dataType: "json",
            data: {"method": "queryGoods", "goodsSaler": 0},
            success: function (data) {

                if (data.code === 200) {

                    let list = data.data;
                    for (let j = 0; j < 5; j++) {
                        for (let i = 0; i < list.length; i++) {
                            let item = '<div class="list-item">' +
                                '<a target="_blank" href="/details.jsp?goodsId=' + list[i].goodsId + '">' +
                                '<img src="' + list[i].goodsPhoto + '"></a>' +
                                '<p>' + list[i].goodsTitle + '</p>' +
                                '<span>￥' + list[i].goodsPrice + '</span></div>';
                            $('.product-item-box').append(item);
                        }
                    }
                }
            }
        });
    })

</script>
</body>

</html>