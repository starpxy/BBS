<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>验证失败</title>
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>

</head>

<body ontouchstart style="background-color: #f8f8f8;">


<div class="weui_msg" id="msg2">
    <div class="weui_icon_area"><i class="weui_icon_warn weui_icon_msg"></i></div>
    <div class="weui_text_area">
        <h2 class="weui_msg_title">验证失败</h2>
        <p class="weui_msg_desc">不好意思,您的验证没有通过,可以尝试到网站个人中心添加头像样本</p>
    </div>
    <div class="weui_opr_area">
    <p class="weui_btn_area">
    <a href="scanFace.jsp" class="weui_btn weui_btn_warn">返回</a>
    </p>
    </div>
    <div class="weui_extra_area">

    </div>
</div>

<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/layui/layui.js"></script>
<script>
    $(function () {
        layui.use('layer', function () {
            layer = layui.layer;
            $("#get-back").click(function () {
                history.back();
            });

        });


    });
</script>

</body>
</html>