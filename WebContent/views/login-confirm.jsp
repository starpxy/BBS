<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">

    <title>微信安全登录</title>

    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>


</head>
<body ontouchstart style="background-color: #f8f8f8;">

<div class="page-hd">

    <div class="weui_msg" id="msg1">
        <div class="weui_icon_area"><i class="weui_icon_msg weui_icon_info"></i></div>
        <div class="weui_text_area">
            <h2 class="weui_msg_title">确认登陆</h2>
            <p class="weui_msg_desc">您确认登陆Ebook图书管理员系统吗？</p>
        </div>
        <div class="weui_opr_area">
            <p class="weui_btn_area">
                <a id="con" class="weui_btn weui_btn_primary">确认登陆</a>
                <a id="cancel" href="javascript:;" class="weui_btn weui_btn_default">取消</a>
            </p>
        </div>
        <div class="weui_extra_area">

        </div>
    </div>

</div>


<script src="asserts/weui/js/zepto.min.js"></script>

<script>
    $(function () {
        $("#con").click(function () {
        	$.ajax({
                type:'POST',
                data:{"param":"${request.param}"},
                url:'au-adminGranted',
                dataType : 'json',
                success: function (data){
					if(data.state==1){
						$.confirm("登陆成功！", "确定", function () {
						}, function () {
	                     	    
	                	 });
					}
					else if(data.state==2){
						$.confirm("您的微信未关联账号！", "确定", function () {
						 }, function () {
	                     	    
	                	 });
					}
					else if(data.state==3){
						$.confirm("您的账号不是管理员账号！", "确定", function () {
						 }, function () {
	                     	    
	                	 });
					}
					else {
						$.confirm("二维码失效！", "确定", function () {
						 }, function () {
	                     	    
	                	 });
					}
                },
                error: function(){
                }
             });
        });
        $("#cancel").click(function () {
        	history.back();
        });
    });


</script>



</body>
</html>