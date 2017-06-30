<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>我的个人信息</title>
</head>

<link rel="stylesheet" href="asserts/weui/css/weui.css"/>
<link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
<link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
<body>

<body ontouchstart style="background-color: #f8f8f8;">


<div class="weui-header bg-green">
    <div class="weui-header-left"><a class="icon icon-109 f-white" href="user-login">返回</a></div>
    <h1 class="weui-header-title">用户信息</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>





<div class="page-hd">

    <div class="tcenter"><img style="border-radius: 100px;width: 100px;height:100px;"
                              src="asserts/images/faces/wechat.gif"></div>


</div>


<div class="weui_panel weui_panel_access">
    <div class="weui_panel_hd">账号信息</div>

    <div class="weui_panel_bd">

        <div class="weui_media_box weui_media_text">

            <h4 class="weui_media_desc" style="float: right">${session.user.phoneNumber }</h4>

            <h4 class="weui_media_desc f-black">手机号:</h4>

        </div>


        <div class="weui_media_box weui_media_text">

            <h4 class="weui_media_desc" style="float: right">${session.user.identityId }</h4>
            <h4 class="weui_media_desc f-black">身份证号:</h4>

        </div>

        <div class="weui_media_box weui_media_text">

            <h4 class="weui_media_desc" style="float: right">${session.user.gender}</h4>
            <h4 class="weui_media_desc f-black">性别:</h4>

        </div>


    </div>

    <a href="javascript:void(0);" class="weui_panel_ft f-black" id="alter-password">修改密码</a>
    <a href="javascript:void(0);" class="weui_panel_ft f-black" id="alter-face">更改头像</a>
    <input style="display: none" class="upload_face" type="file">

</div>



<div class="weui-footer-fixed-bottom page-bd">
    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_bd">

            <div class="weui_media_box weui_media_text">
                <p class="weui_media_desc"><a href="javascript:;" class="weui_btn bg-red" id="switch">切换帐号</a></p>
            </div>

        </div>
    </div>

</div>


</body>


<script src="asserts/weui/js/zepto.min.js"></script>
<script>
    $(function () {

        $("#alter-password").click(function () {
            $.prompt("请输入原密码", "原密码", function (text) {
                //ajax will goes here
                if (text === '${session.user.password}') {
                    $.prompt("请输入新密码", "新密码", function (text) {
                        $.ajax({
                        	type:'POST',
                            url:'user-changePass?userId=${session.user.userId}&password='+text,
                            dataType : 'json',
                            success: function (data){
                               if(data.state==1){
                                    $.toast("更改成功");
                                }
                               else{
                            	   $.toast("更改失败",'wrong');                      	   
                               }
                            },
                            error: function(){
                            	$.toast("服务器错误",'wrong');
                            }
                        });
                    }, function () {

                    });

                } else {
                    $.toast("原密码错误", "forbidden");
                }

            }, function () {
            });
        });


        $(".upload_face").change(function(){
			
        });


        $("#alter-face").click(function () {


            $(".upload_face").trigger('click');
//
//            $.modal({
//                title: "支付方式",
//                text: "选择你的支付方式",
//                media:"<h1>adsada</h1>",
//                buttons: [
//                    { text: "支付宝", onClick: function(){ $.alert("你选择了支付宝"); } },
//                    { text: "微信支付", onClick: function(){ $.alert("你选择了微信支付"); } },
//                    { text: "取消", className: "default"},
//                ]
//            });

        });


        $("#switch").click(function () {
            $.confirm("确定要注销当前帐号吗？", "注销确认", function (text) {
               window.location.href="user-logout";
            }, function () {
				
            });
        });




    });
</script>


</body>
</html>