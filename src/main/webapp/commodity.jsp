<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>所有商品</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">

    <style>
        .commodity-content .commod-cont .right-cont .cont-list .saler {
            text-decoration: underline;
        }
        
        .commodity-content .commod-cont .right-cont .cont-list .title {
            margin-bottom: 0;
        }
        
        .commodity-content .commod-cont .right-cont .cont-list .item .img {
            border-bottom: 1px solid #eaeaea;
            height: 280px;
            width: 280px;
        }
        
        .commodity-content .commod-cont .right-cont .cont-list .item .img img {
            height: 100%;
            width: 100%;
        }
    </style>
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
                        <img src="/static/img/logo.png">
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


    <div class="content content-nav-base commodity-content">
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
        <div class="commod-cont-wrap">
            <div class="commod-cont w1200 layui-clear">
                <div class="left-nav">
                    <div class="title">所有分类</div>
                    <div class="list-box">
                        <dl>
                            <dt>手机 / 智能手机 / 通讯产品</dt>
                            <dd><a href="javascript:;">手机</a></dd>
                            <dd><a href="javascript:;">手机配件</a></dd>
                            <dd><a href="javascript:;">通讯产品</a></dd>
                        </dl>
                        <dl>
                            <dt>笔记本 / 平板 / 台式电脑</dt>
                            <dd><a href="javascript:;">笔记本电脑</a></dd>
                            <dd><a href="javascript:;">笔记本配件</a></dd>
                            <dd><a href="javascript:;">平板电脑</a></dd>
                            <dd><a href="javascript:;">台式整机</a></dd>
                        </dl>
                        <dl>
                            <dt>相机 / 单反 / 摄像机</dt>
                            <dd><a href="javascript:;">数码相机</a></dd>
                            <dd><a href="javascript:;">相机配件</a></dd>
                            <dd><a href="javascript:;">数码摄像机</a></dd>
                        </dl>
                        <dl>
                            <dt>DIY硬件 / 外设 / 模拟攒机</dt>
                            <dd><a href="javascript:;">装机硬件</a></dd>
                            <dd><a href="javascript:;">硬件外设</a></dd>
                            <dd><a href="javascript:;">拓展配件</a></dd>
                        </dl>
                        <dl>
                            <dt>数码产品 / MP3 / 移动电源 </dt>
                            <dd><a href="javascript:;">随身视听</a></dd>
                            <dd><a href="javascript:;">移动存储</a></dd>
                            <dd><a href="javascript:;">电子教育</a></dd>
                        </dl>
                        <dl>
                            <dt>办公打印 / 投影 / 监控</dt>
                            <dd><a href="javascript:;">办公打印</a></dd>
                            <dd><a href="javascript:;">投影显示</a></dd>
                            <dd><a href="javascript:;">视频监控</a></dd>
                        </dl>
                    </div>
                </div>
                <div class="right-cont-wrap">
                    <div class="right-cont">
                        <div class="sort layui-clear">
                            <a class="active" href="javascript:;" event='volume'>销量</a>
                            <a href="javascript:;" event='price'>价格</a>
                            <a href="javascript:;" event='newprod'>新品</a>
                            <a href="javascript:;" event='collection'>收藏</a>
                        </div>
                        <div class="prod-number" id="list_length">
                            <span>
                                <!-- ${res.length} -->
                            </span>
                        </div>
                        <div class="cont-list layui-clear" id="list-cont">

                        </div>
                        <div id="demo" style="text-align: center;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nickName.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/util/commodity.js"></script>

</body>

</html>