<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Ebook－登录界面</title>
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <link rel="stylesheet" href="asserts/mycss/index.css">

</head>
<body ontouchstart style="background-color: #f8f8f8;">
<br>
<div class="page-hd">

    <div class="login-icon tcenter"><img src="asserts/images/faces/wechat.gif"></div>

    <form id="form" action="user-login" method="post">

        <div class="weui_cells weui_cells_form">

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">账号</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input name="phoneNumber" class="weui_input" type="text" id="account" required placeholder="手机号" emptyTips="请输入账号"
                           pattern="[0-9a-zA-Z]{3,21}" maxlength="21" notMatchTips="请输入正确的帐号">
                </div>
                <div class="weui_cell_ft">
                    <i class="weui_icon_warn"></i>
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">密码</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input name="password" class="weui_input" type="password" id="password" required placeholder="输入你的密码"
                           emptyTips="请输入密码">
                </div>
                <div class="weui_cell_ft">
                    <i class="weui_icon_warn"></i>
                </div>
            </div>


        </div>
        <div class="weui_btn_area">
            <a id="formSubmitBtn" href="javascript:;" class="weui_btn weui_btn_primary bg-green">登录</a>
        </div>
    </form>
    <div class="below-links">
        <a id="forgot" class="left" href="javascript:;">忘记密码?</a>
        <a class="right" href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx95311e6c3749af30&redirect_uri=http%3a%2f%2fpxyzmy.com.cn%2fBBS%2fviews%2fau-register&response_type=code&scope=snsapi_userinfo&state=STATE">注册账号</a>
    </div>


</div>



<div class="social-login tcenter">

    <a href="#" class="icon icon-13 f-black" id="qqlogin"></a>

    <a id="wechatlogin" href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx95311e6c3749af30&redirect_uri=http%3a%2f%2fpxyzmy.com.cn%2fBBS%2fviews%2fau-wechatLogin&response_type=code&scope=snsapi_userinfo&state=STATE" class="icon icon-14 f-green"></a>

    <a id="webologin" href="#" class="icon icon-15 f-red"></a>

</div>


<div class="weui_cells_title" style="height:60px;">&nbsp;</div>

<!-- <div class="weui-footer weui-footer-fixed-bottom">
<footer class="weui-footer weui-footer-fixed-bottom">


    <label for="weuiAgree" class="weui-agree">
        <input id="weuiAgree" class="weui-agree-checkbox" checked value="on" type="checkbox">
            <span class="weui-agree-text">
                阅读并同意<a href="javascript:void(0);">《相关条款》</a>
            </span>

    </label>


    <p class="weui-footer-links">
        <a href="javascript:void(0);" class="weui-footer-link">About Us</a>
        <a href="javascript:void(0);" class="weui-footer-link">Learn More</a>
    </p>
    <p class="weui-footer__text">Copyright &copy; 2017-Book Lending System </p>

<<<<<<< Updated upstream
</div> -->

<!--<script src="asserts/jquery.min.js"></script>-->


<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js">
	
</script>
<script src="asserts/weui/js/zepto.min.js"></script>
<script type="text/javascript">
	<%
		if(request.getParameter("state")!=null){
	%>
		$.toptips("登录状态有误，请重新登录");
	<%}
	%>
	
    $("#qqlogin").click(function () {
        $.toast("功能暂未开放");
    });
    $("#forgot").click(function () {
        $.toast("功能暂未开放");
    });
    $("#webologin").click(function () {
        $.toast("功能暂未开放");
    });
    $("#wechatlogin").click(function () {
        $.toast("登录中...请稍候...");
    });
    $("#checkbox").click(function () {
        if (!$("#checkbox").get(0).checked) {
            $("#formSubmitBtn").removeClass("weui_btn_disabled");
        } else {
            $("#formSubmitBtn").addClass("weui_btn_disabled");
        }

    });


    var $form = $("#form");
    $form.form();

    $("#formSubmitBtn").on("click", function () {

        if ($(this).hasClass('weui_btn_disabled')) {
            return;
        }
         $form.validate(function (error) {
            if (error) {

            } else {
                $.showLoading('登录中');
                setTimeout(function () {
                    
                }, 1000);
            }
        });
 
        $form.submit();
    });


</script>
</body>
</html>

