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
    <title>商品修改</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
            <div class="login"><a href="/login.jsp">登录</a></div>
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
                    <a href="/commodity.jsp" class="active">所有商品</a>
                    <a href="javascript:;">今日团购</a>
                    <a href="javascript:;">数码资讯</a>
                    <a href="javascript:;">关于我们</a>
                </div>
            </div>
        </div>
    </div>


    <div style="width:800px;margin:20px auto">

    </div>

    <div style="width:800px;margin:20px auto">
        <h4 style="font-size: 30px;margin-left: 55px;margin-bottom: 25px;">商品修改</h4>
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">商品标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                           class="layui-input" id="input1">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品价格</label>
                <div class="layui-input-block">
                    <input type="text" name="price" lay-verify="title" autocomplete="off" placeholder="请输入价格"
                           class="layui-input" id="input2">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品库存</label>
                <div class="layui-input-inline">
                    <input type="text" name="count" lay-verify="pass" autocomplete="off" class="layui-input"
                           placeholder="1" id="input3">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品图片</label>
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="uploadP">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品详情</label>
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="uploadD">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo2">
                        <p id="demoText1"></p>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">修改</button>
                </div>
            </div>
        </form>
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
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nickName.js"></script>

<script type="text/javascript">
    layui.use('upload', function () {
        var $ = layui.jquery,
            upload = layui.upload,
            layer = layui.layer,
            form = layui.form;


        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg); //匹配目标参数
            if (r != null) return unescape(r[2]);
            return null; //返回参数值
        }

        var id = getUrlParam('goodsId');

        $.ajax({
            url: "/goods",
            type: "POST",
            async: false,
            cache: false,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            data: {"method": "info", "goodsId": id},
            success: function (data) {

                if (data.code === 200) {
                    data = data.data;
                    $('#input1').val(data.goodsTitle);
                    $('#input2').val(data.goodsPrice);
                    $('#input3').val(data.goodsCount);
                }else{
                    layer.msg(data.message);
                }

            }
        });


        var uploadInstOne = upload.render({
            elem: '#uploadP',
            url: 'https://httpbin.org/post',
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
        });

        var uploadInstTwo = upload.render({
            elem: '#uploadD',
            url: 'https://httpbin.org/post',
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo2').attr('src', result); //图片链接（base64）
                });
            }
        });

        form.on("submit(demo1)", function (data){
            console.log(data);
            data = data.field;

            var title = data.title;

            var count = data.count;

            var price = data.price;

            $.ajax({
                url: "/goods",
                type: "POST",
                async: false,
                cache: false,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                data: {"method": "update", "goodsId": id, "goodsTitle":title,
                    "goodsPrice": price, "goodsCount": count},
                success: function (data) {

                    if (data.code === 200) {
                        window.location.href = "/details.jsp?goodsId=" + id;
                    }else{
                        layer.msg(data.message);
                    }

                }
            });

            return false;

        })
    })
</script>

</body>

</html>