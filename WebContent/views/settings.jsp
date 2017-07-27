<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="cn">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title></title>
</head>

<link rel="stylesheet" href="asserts/weui/css/weui.css" />
<link rel="stylesheet" href="asserts/weui/css/weui2.css" />
<link rel="stylesheet" href="asserts/weui/css/weui3.css" />
<link rel="stylesheet" href="asserts/layui/css/layui.css" />
<link rel="stylesheet" href="asserts/mycss/sco.message.css">
<body>
<body ontouchstart style="background-color: #f8f8f8;">


	<div class="weui-header bg-green">
		<div class="weui-header-left">
			<a class="icon icon-109 f-white" href="userinfo.jsp">返回</a>
		</div>
		<h1 class="weui-header-title">个人设置</h1>
		<div class="weui-header-right">
			<a href="user-login" class="icon icon-27 f-white"></a>
		</div>
	</div>





	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">账号设置</div>

		<div class="weui_panel_bd">
			<div class="weui_media_box weui_media_text">
			
			
				<a id="phone-number">
					<h4 class="weui_media_desc" style="float: right">${session.user.phoneNumber }</h4>
					<a class="weui_media_desc f-black">修改手机号:</a>
				</a>

			</div>

		</div>
		<a
				href="javascript:void(0);" class="weui_panel_ft f-black"
				id="user-name">修改姓名</a>
		<a
			href="javascript:void(0);" class="weui_panel_ft f-black"
			id="alter-password">修改密码</a>
	</div>

	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">其他设置</div>
		
	</div>
	<div class="weui_cells">
		<div class="weui_cell weui_cell_select weui_select_after">

			<div class="weui_cell_hd">
				<label for="" class="weui_label f14">设置推荐评率</label>
			</div>

			<div class="weui_cell_bd weui_cell_primary">
				<select class="weui_select select2 f13" name="select2" value="">
					<option value="1">一天</option>
					<option value="7">一星期</option>
					<option value="14">半个月</option>
					<option value="0">从不</option>
				</select>
			</div>
		</div>
	</div>





<script src="asserts/jquery.min.js"></script>
<script src="asserts/sco.message.js"></script>
<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/layui/layui.js"></script>
<script>
	$(function() {
		layui.use('layer', function() {
			var layer = layui.layer;
		$("#alter-password")
				.click(
						function() {
							$
									.prompt(
											"请输入原密码",
											"原密码",
											function(text) {
												//ajax will goes here
												if (text === '${session.user.password}') {
													$
															.prompt(
																	"请输入新密码",
																	"新密码",
																	function(
																			text) {
																		$
																				.ajax({
																					type : 'POST',
																					url : 'user-changePass?userId=${session.user.userId}&password='
																							+ text,
																					dataType : 'json',
																					success : function(
																							data) {
																						if (data.state == 1) {
																							$
																									.toast("更改成功");
																						} else {
																							$
																									.toast(
																											"更改失败",
																											'wrong');
																						}
																					},
																					error : function() {
																						$
																								.toast(
																										"服务器错误",
																										'wrong');
																					}
																				});
																	},
																	function() {

																	});

												} else {
													$.toast("原密码错误",
															"forbidden");
												}

											}, function() {
											});
						});

		$("select[name='select2']").val('${session.user.recommendFre }');
		$("select[name='select2']").change(function() {
			//TODO
			$.ajax({
				type : 'POST',
				url : 'user-changeRecommendFre',
				data:{'fre':$(this).val()},
				dataType : 'json',
				success : function(data) {
					if(data.state==1){
						layer.msg('修改成功',{icon : 1,anim : 1,time : 2000});
					}
					else{
						$.scojs_message("修改失败", $.scojs_message.TYPE_ERROR);
					}
				},
				error : function() {
					$.scojs_message("服务器异常", $.scojs_message.TYPE_ERROR);
				}
			});
		});

		$("#user-name").click(function() {
			
			$.prompt("更改昵称", "请输入昵称", function(text) {

				if(text.trim()!=""){
					//TODO--ajax goes here
					//After SUCCESS ajax
					$.ajax({
					type : 'POST',
					url : 'user-changeName',
					data:{'name':text},
					dataType : 'json',
					success : function(data) {
						if(data.state==1){
							layer.msg('修改成功',{icon : 1,anim : 1,time : 2000});
							$("#user-name").children('h4:first').html(text);
						}
						else{
							$.scojs_message("修改失败", $.scojs_message.TYPE_ERROR);
						}
					},
					error : function() {
						$.scojs_message('服务器错误', $.scojs_message.TYPE_ERROR);
					}
				});
				}else{
					$.scojs_message("请输入昵称" , $.scojs_message.TYPE_ERROR);
				}
			});
		});

		$("#phone-number").click(function() {
			$.prompt("更新手机号", "请输入更新手机号", function(text) {
				var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
				if (reg.test(text)) {
					$.ajax({
						type : 'POST',
						url : 'user-changePhoneNumber',
						data:{'phoneNumber':text},
						dataType : 'json',
						success : function(data) {
							if(data.state==1){
								$("#phone-number .weui_media_desc").html(text);
								layer.msg('修改成功',{icon : 1,anim : 1,time : 2000});
							}
							else{
								$.scojs_message("修改失败", $.scojs_message.TYPE_ERROR);
							}
						},
						error : function() {
							$.scojs_message('服务器错误', $.scojs_message.TYPE_ERROR);
						}
					});
				} else {
					$.scojs_message("请输入正确的手机号码", $.scojs_message.TYPE_ERROR);
				}
			});

		});

		});
	});
</script>


</body>
</html>