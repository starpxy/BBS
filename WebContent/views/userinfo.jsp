<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="cn">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title>我的个人信息</title>
</head>

<link rel="stylesheet" href="asserts/weui/css/weui.css" />
<link rel="stylesheet" href="asserts/weui/css/weui2.css" />
<link rel="stylesheet" href="asserts/weui/css/weui3.css" />
<link rel="stylesheet" href="asserts/layui/css/layui.css" />
<body>
<body ontouchstart style="background-color: #f8f8f8;">


	<div class="weui-header bg-green">
		<div class="weui-header-left">
			<a class="icon icon-109 f-white" href="user-login">返回</a>
		</div>
		<h1 class="weui-header-title">用户信息</h1>
		<div class="weui-header-right">
			<a href="user-login" class="icon icon-27 f-white"></a>
		</div>
	</div>





	<div class="page-hd">

		<div class="tcenter">
			<a href="javascript:;"  id="alter-face"><img style="border-radius: 100px; width: 100px; height: 100px;"
				src="asserts/images/faces/wechat.gif"></a>
				<br><br>
			<p style="font-size: 20px">
				<b>${session.user.name}</b>
			</p>
		</div>
	</div>
	 <input style="display: none" class="upload_face" type="file">


	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">账号信息</div>

		<div class="weui_panel_bd">
			<div class="weui_media_box weui_media_text">
			
		
			
			
				<a id="phone-number">
					<h4 class="weui_media_desc" style="float: right">${session.user.phoneNumber }</h4>
					<h4 class="weui_media_desc f-black">手机号/账号:</h4>
				</a>

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
		<a href="user-qrCode" class="weui_panel_ft f-black">我的个人二维码</a>
		<a href="javascript:void(0);" class="weui_panel_ft f-black"
			id="check-login-history">我的登录历史</a>
					<a href="javascript:void(0);" class="weui_panel_ft f-black"
			id="check-favorite">我的收藏</a> 
	</div>

	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">更多</div>
		
		<a href="user-settings" class="weui_panel_ft f-black"
			>个人设置</a>
			
	</div>



	<div style="height: 100px">&nbsp;</div>
	<div class="weui-footer-fixed-bottom page-bd" style="position: fixed; bottom: 0px; width: 100%">
		<div class="weui_panel weui_panel_access">
			<div class="weui_panel_bd">
				<div class="weui_media_box weui_media_text">
					<p class="weui_media_desc">
						<a href="javascript:;" class="weui_btn bg-red" id="switch">退出登录</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>





<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/layui/layui.js"></script>
<script>
	$(function() {
		layui.use('layer', function() {

			var layer = layui.layer;
			$("#check-login-history").click(function() {
				//TODO AJAX goes here
				//ajax 请求成功后，返回按时间由最近到过去排序的历史登录数据list，第一条的动态变量填入下面的string的［］中，动态化
				var timeline_list='	<li class="timeline-item"> <div class="timeline-item-head-first"> <i class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i> </div> <div class="timeline-item-tail"></div> <div class="timeline-item-content"> <h4 class="recent">［congcong］ 您最近一次登录地点是 ［北京市］ </h4> <p class="recent">［2017-07-23 18:23:08］</p> </div> </li>';
				//第二条至倒数第二条后面的填入下面的string的［］中，动态化
				for(var i=1;i<3;i++){
					timeline_list+='   <li class="timeline-item"> <div  class="timeline-item-head"> <i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> </div> <div class="timeline-item-tail" ></div> <div class="timeline-item-content"> <h4>［congcong］ 您在 ［北京市］ 登录了一次 </h4><p>［2017-07-21 18:23:08］</p></div> </li>';
				}
				//最后一条的填入下面的string的［］中，动态化
				timeline_list+='   <li class="timeline-item"> <div  class="timeline-item-head"> <i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> </div> <div class="timeline-item-tail hide" ></div> <div class="timeline-item-content"> <h4>［congcong］ 您在 ［北京市］ 登录了一次 </h4><p>［2017-07-21 18:23:08］</p></div> </li>';

				$(".timeline ul").html(timeline_list);
				
				layer.open({
					type : 1,
					title : '登录历史',
					content : $('#login-history'),
					btn : [ '关闭' ],
					area : [ '300px', '400px' ],
					btn1 : function(index) {

					
						layer.close(index);


							
					}
				});

			});
		});
		$(".upload_face").change(function() {

		});

		$("select[name='select2']").change(function() {
			//TODO
			$.toast("fre is changed=>>>>" + $(this).val());
		});

		$("#alter-face").click(function() {
			$(".upload_face").trigger('click');
		});

		$("#switch").click(function() {
			$.confirm("确定要注销当前帐号吗？", "注销确认", function(text) {
				window.location.href = "user-logout";
			}, function() {

			});
		});
	});
</script>


</body>
</html>