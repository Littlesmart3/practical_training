<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
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


    <div class="content content-nav-base shopcart-content">
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
        <div class="cart w1200">
            <div class="cart-table-th">
                <div class="th th-chk">
                    <div class="select-all">
                        <div class="cart-checkbox">
                            <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                        </div>
                        <label>&nbsp;&nbsp;全选</label>
                    </div>
                </div>
                <div class="th th-item">
                    <div class="th-inner">
                        商品
                    </div>
                </div>
                <div class="th th-price">
                    <div class="th-inner">
                        单价
                    </div>
                </div>
                <div class="th th-amount">
                    <div class="th-inner">
                        数量
                    </div>
                </div>
                <div class="th th-sum">
                    <div class="th-inner">
                        小计
                    </div>
                </div>
                <div class="th th-op">
                    <div class="th-inner">
                        操作
                    </div>
                </div>
            </div>
            <div class="OrderList">
                <div class="order-content" id="list-cont">
                </div>
            </div>

            <div class="FloatBarHolder layui-clear">
                <div class="th th-chk">
                    <div class="select-all">
                        <div class="cart-checkbox">
                            <input class="check-all check" id="" name="select-all" type="checkbox" value="true">
                        </div>
                        <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
                    </div>
                </div>
                <div class="th batch-deletion">
                    <span class="batch-dele-btn"><a href="javascript:;" class="empty">清空</a></span>
                </div>
                <div class="th Settlement">
                    <button class="layui-btn buys">结算</button>
                </div>
                <div class="th total">
                    <p>应付：<span class="pieces-total">0</span></p>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nickName.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/util/shopcart.js"></script>
</body>

</html>