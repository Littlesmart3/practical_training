layui.use(['jquery'], function () {

    var $ = layui.jquery;

    // login();

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
                        let item = `<div class="item">
                                    <div class="img">
                                        <a target='_blank' href="details.jsp?goodsId=${list[i].goodsId}"><img src="${list[i].goodsPhoto}"></a>
                                    </div>
                                    <div class="text">
                                        <p class="price">
                                            <span class="pri">￥${list[i].goodsPrice}</span>
                                            <span class="nub">${list[i].goodsSales}付款</span>
                                        </p>
                                        <p class="title">${list[i].goodsTitle}</p>
                                        <a href="javascript:;" class="saler">
                                            <p>${list[i].nickName}</p>
                                        </a>
                                    </div>
                                </div>`;
                        $('#list-cont').append(item);
                    }
                }
            }
        }
    });
})
