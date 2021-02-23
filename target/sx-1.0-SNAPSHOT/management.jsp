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
    <title>商品管理</title>
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


        <div style="width:1280px;margin:20px auto">
            <table class="layui-hide" id="demo" lay-filter="demo"></table>

            <button type="button" value="添加商品" class="layui-btn"><a href="/add.jsp"
                    style="color:white;">添加商品</a></button>
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

    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nickName.js"></script>

    <script type="text/html" id="barDemo">
        <a href="javascript:;" class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a href="javascript:;" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>


    <script>
        layui.use(['jquery','layer','table'], function() {
            var table = layui.table,
                $ = layui.$,
                layer = layui.layer;

            $.ajax({
                type: 'GET',
                url: '/goods',
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                async: false,
                cache: false,
                dataType: "json",
                data: {"method":"queryGoods", "goodsSaler": 1},
                success: function (data){
                    table.render({
                        elem: '#demo',
                        cols: [
                            [ //标题栏
                                {
                                    field: 'goodsId',
                                    title: 'ID',
                                    width: 80,
                                    sort: true
                                }, {
                                    field: 'goodsTitle',
                                    title: '标题',
                                    width: 120
                                }, {
                                    field: 'goodsPrice',
                                    title: '价格',
                                    minWidth: 150
                                }, {
                                    field: 'goodsCount',
                                    title: '库存',
                                    minWidth: 160
                                }, {
                                    fixed: 'right',
                                    title: '操作',
                                    toolbar: '#barDemo',
                                    width: 150
                                }
                            ]
                        ],
                        data: data.data
                            //,skin: 'line' //表格风格
                            ,
                        even: true
                            //,page: true //是否显示分页
                            //,limits: [5, 7, 10]
                            //,limit: 5 //每页默认显示的数量
                    });
                }
            });
            table.on('tool(demo)', function(obj) {
                var data = obj.data;
                console.log(data);
                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function(index) {
                        $.ajax({
                            type: 'POST',
                            url: '/goods',
                            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                            async: true,
                            cache: false,
                            dataType: "json",
                            data: {"method":"delete", "goodsId": data.goodsId},
                            success: function (data){
                                layer.close(index);
                                if(data.code === 200){
                                    obj.del();
                                }else{
                                    layer.msg(data.message);
                                }
                            }
                        });
                    });
                } else if (obj.event === 'edit') {
                    window.location.href = "/modification.jsp?goodsId=" + data.goodsId;
                }
            });


        });
    </script>
</body>

</html>