layui.use(['jquery'], function () {

    var $ = layui.jquery;

    $.ajax({
        url: "/user",
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType: "json",
        data: {"method": "vaild"},
        success: function (data) {
            if (data.code === 200) {

                $("#top_login a").text(data.data.nickName);

                $("#top_login a").attr("href", "/preson-information.jsp");

            }
        }
    })

})
