layui.config({base: "/static/js/util/"}).use(['jquery', 'car'], function () {
    var $ = layui.jquery,
        layer = layui.layer,
        car = layui.car;

    $.ajax({
        url: '/shopping',
        type: 'POST',
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        async: false,
        cache: false,
        dataType: "json",
        data: {"method": "query"},
        success: function (data) {
            if (data.code === 200) {

                let list = data.data.goods;
                //let sum = 0;
                for (let j = 0; j < list.length; j++) {
                    let item = `<ul class="item-content layui-clear" data-id="${list[j].id}">
                                    <li class="th th-chk">
                                        <div class="select-all">
                                            <div class="cart-checkbox">
                                                <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all"
                                                    value="true">
                                            </div>
                                        </div>
                                    </li>
                                    <li class="th th-item">
                                        <div class="item-cont">
                                            <a href="javascript:;"><img src="${list[j].goodsPhoto}" alt=""></a>
                                            <div clbass="text">
                                                <div class="title">${list[j].goodsTitle}</div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="th th-price">
                                        <span class="th-su">${list[j].goodsPrice}</span>
                                    </li>
                                    <li class="th th-amount">
                                        <div class="box-btn layui-clear">
                                            <div class="less layui-btn ">-</div>
                                            <input class="Quantity-input" type="" name="" value="${list[j].goodsCounts}" disabled="disabled">
                                            <div class="add layui-btn ">+</div>
                                        </div>
                                    </li>
                                    <li class="th th-sum">
                                        <span class="sum">${list[j].goodsPrice}</span>
                                    </li>
                                    <li class="th th-op">
                                        <span><a  class="dele-btn" href="javascript:;">删除</a></span>
                                    </li>
                                </ul>`;
                    $("#list-cont").append(item);
                    //console.log(list[j].goodsCounts);
                    //sum += (list[j].goodsCounts * list[j].goodsPrice);
                    //console.log(sum)
                }
                // console.log(list);
                //$(".pieces-total").val("￥" + sum);
            } else if (data.code === 10001) {
                window.location.href = "/";
            }

        }

    });
    car.init();

    $(".buys").on("click", function () {
        $.ajax({
            url: '/shopping',
            type: 'POST',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            async: false,
            cache: false,
            dataType: "json",
            data: {"method": "buys"},
            success: function (data) {
                if (data === 200) {
                    layer.msg("购买成功");
                    $('#list-cont').empty();
                }else{
                    layer.msg(data.message);
                }
            }
        });
    });

    $('.empty').on('click', function (){

        $.ajax({
            url: '/shopping',
            type: 'POST',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            async: false,
            cache: false,
            dataType: "json",
            data: {"method": "empty"},
            success: function (data) {
                if (data === 200) {
                    layer.msg("删除成功");
                    $('#list-cont').empty();
                }else{
                    layer.msg(data.message);
                }
            }
        });

    });
})
