layui.use(["jquery"], function () {

    var $ = layui.jquery,
        layer = layui.layer;

    var id = null;

    var cur = 1;

    $(function () {
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]);
            return null; //返回参数值
        }

        id = getUrlParam('goodsId');

        $.ajax({
            url: '/goods',
            type: 'GET',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            async: false,
            cache: false,
            dataType: "json",
            data: {"goodsId": id, "method": "info"},
            success: function (res) {

                if (res.code === 200) {

                    let data = res.data;

                    $('#product a img').attr('src', data.goodsPhoto);
                    $('#product a img').css("width", "282px");
                    $('#product a img').css("height", "282px");
                    var title = `<h4>${data.goodsTitle}</h4>`;
                    $('#product .title').append(title);
                    document.title = data.goodsTitle;
                    var price = `<i>￥</i>${data.goodsPrice} `;
                    $('#product .price').append(price);
                    var count = `&nbsp;&nbsp;&nbsp;<spon>${data.goodsCount}</spon>`;
                    $('#product .number-cont').append(count);
                    $('#details a img').attr('src', data.goodsIntroduce);
                    $('#product .choose-btns a').attr('id', data.goodsId);

                }
            },
        });
    })

    $('.number-cont .btn').on('click', function () {
        if ($(this).hasClass('add')) {
            cur++;

        } else {
            if (cur > 1) {
                cur--;
            }
        }
        $('.number-cont input').val(cur)
    })

    $("#shopcart").on("click", function () {

        $.ajax({
            url: '/shopping',
            type: 'POST',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            async: true,
            cache: false,
            dataType: "json",
            data: {"goodsId": id, "buys": cur, "method": "update"},
            success: function (data) {

                if (data.code === 200) {
                    layer.msg("添加成功");
                } else {
                    layer.msg(data.message);
                }
            }
        })
    });

    $("#publish").on("click", function () {

        var content = $(".layui-textarea").val();

        $.ajax({
            url: '/comment',
            type: 'POST',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            async: true,
            cache: false,
            dataType: "json",
            data: {"method": "add", "goodsId": id, "content": content},
            success: function (data) {
                if(data.code === 200){
                    layer.msg("发布成功");
                    $("#comment").empty();
                    $("#comment").trigger("click");
                }else {
                    layer.msg(data.message);
                }
            }
        })
    });


    $("#comment").on("click", function () {

        $.ajax({
            url: '/comment',
            type: 'GET',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            async: true,
            cache: false,
            dataType: "json",
            data: {"method": "query", "goodsId": id},
            success: function (data) {
                if (data.code === 200) {

                    data = data.data;

                    for (let i = 0; i < data.length; i++) {
                        let str = `<tr>
                                      <td>${data[i].commentContent}</td>
                                      <td>${data[i].userAccount}</td>
                                   </tr>`;
                        $('#comment_list').append(str);
                    }
                }
            }
        })
    });
})