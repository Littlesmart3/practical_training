<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
                <div class="sp-cart"><a href="/shopcart.jsp">购物车</a></div>
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

    <div class="content content-nav-base datails-content">

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


        <div class="data-cont-wrap w1200">
            <div class="crumb">
                <a href="javascript:;">首页</a>
                <span>></span>
                <a href="javascript:;">所有商品</a>
                <span>></span>
                <a href="javascript:;">产品详情</a>
            </div>
            <div class="product-intro layui-clear" id="product">
                <div class="preview-wrap">
                    <a href="javascript:;"><img src=""></a>
                </div>
                <div class="itemInfo-wrap">
                    <div class="itemInfo">
                        <div class="title">
                            <!-- <h4>${goodsMsg.goodsTitle}</h4> -->
                        </div>
                        <div class="summary">
                            <p class="activity">
                                <span>价格</span><strong class="price">
                                    <!-- <i>￥</i>${goodsMsg.goodsPrice} -->
                                </strong>
                            </p>
                        </div>
                        <div class="choose-attrs">
                            <div class="number layui-clear"><span class="title1">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>
                                <div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                        maxlength="4" type="" name="" value="1"><span class="add btn">+</span>
                                </div>
                            </div>
                        </div>
                        <div class="choose-btns" id="shopcart">
                            <a class="layui-btn layui-btn-danger car-btn">
                                <i class="layui-icon layui-icon-cart-simple" id="1"></i>加入购物车
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="aside">
                <h4>热销推荐</h4>
                <div class="item-list">
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/static/img/details_img2.jpg">
                        <p><span>【AirPods套装】Apple iPhone 11 </span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/static/img/apple-12.jpg">
                        <p><span>Apple iPhone 12 Pro Max (A2412)</span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/static/img/details_img2.jpg">
                        <p><span>Apple 苹果7 iPhone7（A1660） </span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/static/img/details_img2.jpg">
                        <p><span>Apple MacBook Air 13.3</span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/static/img/details_img2.jpg">
                        <p><span>雷柏（RAPOO）VH160有线耳机</span><span class="pric">￥99.00</span></p>
                    </div>
                </div>
            </div>
            <div class="detail">
                <div class="layui-tab" id="details">
                    <ul class="layui-tab-title">
                        <li class="layui-this">详情</li>
                        <li id="comment">评论</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <a href="javascript:;">
                                <img src="">
                            </a>
                            <!-- {goodsMsg.goodsIntroduce} -->
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-form layui-form-pane" action="" style="width : 800px; margin-left: auto; float: right;">
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">发表评论</label>
                                    <div class="layui-input-block">
                                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <a class="layui-btn" id="publish">发表</a>
                                </div>
                            </div>
                            <table class="layui-table" lay-skin="line" style="width : 800px; margin-left: auto;">
                                <colgroup>
                                    <col width="500">
                                    <col width="150">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>评论</th>
                                        <th>账号</th>
                                    </tr>
                                </thead>
                                <tbody id="comment_list">
                                    <!-- <tr>
                                        <td>{commentId}</td>
                                        <td>{commentContent}</td>
                                        <td>{nickName}</td>
                                    </tr> -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nickName.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/util/details.js"></script>

</body>

</html>