<%@page import="com.bbs.converters.TimeUtils"%>
<%@page import="com.bbs.entities.rules.BookItemRule"%>
<%@page import="com.bbs.entities.BookItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bbs.entities.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=0">

<title>管理员系统</title>
<link rel="stylesheet" href="asserts/bootstrap.min.css">
<link rel="stylesheet" href="asserts/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="asserts/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" href="asserts/fbicons/css/font-awesome.min.css">
<link rel="stylesheet" href="asserts/css/_all-skins.min.css">
<link rel="stylesheet" href="asserts/plugins/layui/css/layui.css">
<link rel="stylesheet" href="asserts/css/index.css">
</head>

<body class="hold-transition skin-green sidebar-mini">

	<div class="wrapper">

		<!--头部 header-->
		<header class="main-header"> <a href="user-adminLogin"
			class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span
			class="logo-mini"><i class="fa fa-gear"></i></span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>图书后台</b>管理系统</span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav
			class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">

			<ul class="nav navbar-nav">

				<!-- Messages: style can be found in dropdown.less-->
				<li class="dropdown messages-menu"><a href="javascript:;"
					id="scan"> <i class="fa fa-qrcode"></i>

				</a></li>

				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="dist/img/admin.png" class="user-image" alt="User Image">
						<span class="hidden-xs">管理员</span>
				</a>

					<ul class="dropdown-menu">

						<li class="user-header"><img src="dist/img/admin.png"
							class="img-circle" alt="User Image">
							<p>
								您的身份是: <small>管理员</small>
							</p></li>

						<li class="user-body">
							<div class="row">
								<div class="text-center">无微不至图书管理系统</div>
							</div> <!-- /.row -->
						</li>

						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat"><i
									class="fa fa-qrcode"></i></a>
							</div>
							<div class="pull-right">
								<a id="sign-out" class="btn btn-default btn-flat"><i
									class="fa fa-sign-out"></i></a>
							</div>
						</li>
					</ul></li>
				<!-- Control Sidebar Toggle Button -->

				<li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-info-circle"></i> <span class="label label-success">15</span></a>
				</li>
			</ul>

		</div>
		</nav> </header>

		<!--左边菜单栏-->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar" style="height: auto;"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="dist/img/admin.png" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>管理员</p>
				<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input name="q" class="form-control" placeholder="Search..."
					type="text"> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">管理导航</li>


			<li class="active"><a href="user-adminLogin"> <i class="fa fa-gear"></i> <span>管理员主页</span>
			</a></li>


			<li class="treeview"><a href="#"> <i
					class="fa fa-book"></i> <span>图书管理</span> <span
					class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
				
<!-- 				TODO -->
					<li><a href="user-adminBooks"><i
							class="fa fa-circle-o"></i>录入与查看</a></li>
					<li><a href="user-adminListRecords"><i
							class="fa fa-circle-o"></i>借阅详情</a></li>
					<li><a href="user-adminListReservations"><i
							class="fa fa-circle-o"></i>预定详情</a></li>
				</ul></li>
				
			<li><a href="user-adminUsers"> <i class="fa fa-user"></i> <span>用户管理</span>
					<span class="pull-right-container"> <small
						class="label pull-right bg-green">users</small>
				</span>
			</a></li>


			<li><a href="user-adminListComments"> <i class="fa fa-info"></i>
					<span>评论管理</span> <span class="pull-right-container"> <small
						class="label pull-right bg-green">news</small>
				</span>
			</a></li>


			<li><a href="javascript:;"> <i class="fa fa-info"></i> <span>消息管理</span>

					<span class="pull-right-container"> <small
						class="label pull-right bg-green">news</small>
				</span>
			</a></li>


			<li class="treeview"><a href="#"> <i
					class="fa fa-area-chart"></i> <span>统计</span> <span
					class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="user-userChart"><i class="fa fa-circle-o"></i>用户统计</a></li>
					<li><a href="user-bookChart"><i class="fa fa-circle-o"></i>图书统计</a></li>
					<li><a href="user-commentChart"><i class="fa fa-circle-o"></i>评论统计</a></li>
				</ul></li>


			<li class="header">其他操作(预留)</li>
			<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>操作一</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>操作二</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>操作三</span></a></li>
		</ul>

		</section> <!-- /.sidebar --> </aside>


		<!--主内容-->
		<div class="content-wrapper" style="min-height: 100px;">
			<!-- Content Header (Page header) -->


			<!-- Main content -->

		</div>


		<!--footer-->
		<footer class="main-footer">
		<p class="copyright text-muted small">
			权限声明 © SHC 2017. 所有权限保留 <img src="dist/img/icon.png"> <a
				href="http://www.beianbaba.com/icp/pxyzmy.com">京ICP备17020278号-1</a>
		</p>
		</footer>

		<!--右边边菜单栏-->
		<aside
			class="control-sidebar control-sidebar-dark control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">

			<li><a href="#control-sidebar-news-tab" data-toggle="tab"><i
					class="fa fa-newspaper-o"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane active" id="control-sidebar-news-tab">
				<h4 class="control-sidebar-heading">消息通知</h4>
				<div class="form-group">
					<label class="control-sidebar-subheading"> 删除选中消息 <a
						href="javascript:void(0)" class="text-red pull-right"><i
							class="fa fa-trash-o"></i></a>
					</label>
				</div>
				<div class="form-group">
					<label class="control-sidebar-subheading"> 清空 <a
						href="javascript:void(0)" class="text-danger pull-right"><i
							class="fa fa-trash-o"></i></a>
					</label>
				</div>
				<!--<div style="overflow-x: auto; overflow-y: auto; height: 1000px; width: 100%; padding: 20px">-->
				<div>

					<div class="form-group">
						<label class="control-sidebar-subheading"><input
							data-layout="fixed" class="pull-right" type="checkbox">借书通知-共支付4元</label>
						<p>
							用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;
						</p>
					</div>
					<div class="form-group">
						<label class="control-sidebar-subheading"><input
							data-layout="fixed" class="pull-right" type="checkbox">借书通知-共支付4元</label>
						<p>
							用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;
						</p>
					</div>

					<div class="form-group">
						<label class="control-sidebar-subheading"><input
							data-layout="fixed" class="pull-right" type="checkbox">借书通知-共支付4元</label>
						<p>
							用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;
						</p>
					</div>
					<div class="form-group">
						<label class="control-sidebar-subheading"><input
							data-layout="fixed" class="pull-right" type="checkbox">借书通知-共支付4元</label>
						<p>
							用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;
						</p>
					</div>
					<div class="form-group">
						<label class="control-sidebar-subheading"><input
							data-layout="fixed" class="pull-right" type="checkbox">借书通知-共支付4元</label>
						<p>
							用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;
						</p>
					</div>
					<div class="form-group">
						<label class="control-sidebar-subheading"><input
							data-layout="fixed" class="pull-right" type="checkbox">借书通知-共支付4元</label>
						<p>
							用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;
						</p>
					</div>
					<div class="form-group">
						<label class="control-sidebar-subheading"><input
							data-layout="fixed" class="pull-right" type="checkbox">借书通知-共支付4元</label>
						<p>
							用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;
						</p>
					</div>

				</div>

			</div>
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">一般设置</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Report panel
							usage <input class="pull-right" checked="" type="checkbox">
						</label>

						<p>Some information about this general settings option</p>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Allow mail
							redirect <input class="pull-right" checked="" type="checkbox">
						</label>

						<p>Other sets of options are available</p>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Expose author
							name in posts <input class="pull-right" checked=""
							type="checkbox">
						</label>

						<p>Allow the user to show his name in blog posts</p>
					</div>
					<!-- /.form-group -->

					<h3 class="control-sidebar-heading">Chat Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Show me as
							online <input class="pull-right" checked="" type="checkbox">
						</label>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Turn off
							notifications <input class="pull-right" type="checkbox">
						</label>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Delete chat
							history <a href="javascript:void(0)" class="text-red pull-right"><i
								class="fa fa-trash-o"></i></a>
						</label>
					</div>
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
		</aside>
		<div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>


	</div>
	<!--<div data-src="https://api.douban.com/v2/book/user/119280372/collections">dd</div>-->
	<div id="blist-box" style="display: none;">

		<!--<h1>hello, world! orrow book</h1>-->

		<!--<a class="list-group-item item-div">-->
		<!--<h4 class="list-group-item-heading">-->

		<!--9787300213194 <span class="pull-right">12</span>-->
		<!--</h4>-->

		<!--<p class="list-group-item-text">麦田里的守望者<input type="checkbox" class="pull-right"></p>-->
		<!--</a>-->

	</div>

	<div id="rlist-box" style="display: none;"></div>
	<script src="asserts/jquery.min.js"></script>
	<script src="asserts/bootstrap.min.js"></script>
	<script src="asserts/plugins/bootstrap-typeahead.js"></script>
	<script src="asserts/app.min.js"></script>
	<script src="asserts/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="asserts/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="asserts/plugins/layui/layui.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

	<script>
		layui
				.use(
						'layer',
						function() {
							$.ajax({
					    		type:'POST',
					            url:'user-initialAPI',
					            dataType : 'json',
					            data: {"url":"http://pxyzmy.com.cn/BBS/views/admin/user-adminLogin"},
					            success: function (data){
					                wx.config({
					                    debug: false,
					                    appId: data.appId,
					                    timestamp: data.timeStamp,
					                    nonceStr: data.nonceStr,
					                    signature: data.signature,
					                    jsApiList: [
					                        'checkJsApi',
					                        'onMenuShareTimeline',
					                        'onMenuShareAppMessage',
					                        'onMenuShareQQ',
					                        'onMenuShareWeibo',
					                        'hideMenuItems',
					                        'showMenuItems',
					                        'hideAllNonBaseMenuItem',
					                        'showAllNonBaseMenuItem',
					                        'translateVoice',
					                        'startRecord',
					                        'stopRecord',
					                        'onRecordEnd',
					                        'playVoice',
					                        'pauseVoice',
					                        'stopVoice',
					                        'uploadVoice',
					                        'downloadVoice',
					                        'chooseImage',
					                        'previewImage',
					                        'uploadImage',
					                        'downloadImage',
					                        'getNetworkType',
					                        'openLocation',
					                        'getLocation',
					                        'hideOptionMenu',
					                        'showOptionMenu',
					                        'closeWindow',
					                        'scanQRCode',
					                        'chooseWXPay',
					                        'openProductSpecificView',
					                        'addCard',
					                        'chooseCard',
					                        'openCard'
					                    ]
					                });
					                
					                wx.error(function (res) {
					                    alert(res.errMsg);
					                });
					    },
					    error: function(){
					        layer.msg('初始化微信JS接口失败',{icon:2,anim:2,time:1000});
					    }
					});
					         document.querySelector('#scan').onclick = function () {
					             wx.scanQRCode({
					                needResult: 1,
					                desc: 'scanQRCode desc',
					                success: function (res) { 

					                	var dat = res.resultStr;
					            	
					                	$.ajax({
					                        type:'POST',
					                        url:'user-adminScanUser',
					                        data:{"userInfo":dat},
					                        dataType : 'json',
					                        success: function (data){
					                            if(data.state==1){
													var userinfo = data.user;
					                            	layer.open({
					                                    title: "选择操作",
					                                    btnAlign: 'c',
					                                    content: "已扫描" + userinfo.name + "的二维码，请选择操作",
					                                    btn: ['借书', '还书', '取消'],
					                                    yes: function () {
					                                        
					                                        //借书
					                                        //TODO,当点击借书按钮时,这里需要向后台发一个ajax请求,获取该用户的借书列表,再在前段按以下方式呈现,ajax由star处理,前端这里由静态值作展示
					                                        //replacement START
					                                        $.ajax({
					                                                   type: 'POST',
					                                                   url: 'user-adminBorrow',
					                                                   data: {'userId': userinfo.userId},
					                                                   dataType: 'json',
					                                                   success: function (data) {
																	   if(data.state==1){
																			var itemslist = "";
																			var records = data.records;
									                                        for (var i = 0; i < records.length; i += 1) {
									                                            itemslist += '<a class="list-group-item item-div"><h4 class="list-group-item-heading">'+records[i].bookItem.book.isbn+'<span class="pull-right">' + records[i].borrowedId + '</span></h4>';
									                                            itemslist += '<p class="list-group-item-text">'+records[i].bookItem.book.bookTitle+'<input type="checkbox" class="pull-right"></p></a> ';
									                                        }

									                                        $("#blist-box").html(itemslist);
									                                        //END

									                                        $(".list-group-item").click(function () {
									                                            if ($(this).children("p").children('input').is(":checked")) {
									                                                $(this).children("p").children('input').removeAttr("checked");
									                                            } else {
									                                                $(this).children("p").children('input').attr("checked", "true");
									                                            }
									                                        });


									                                        layer.open({
									                                            type: 1,
									                                            title: "借书列表",
									                                            content: $("#blist-box"),
									                                            btn: ['确认借书'],
									                                            area: ['300px', '400px'],
									                                            yes: function (index) {

									                                                var selecteditems = new Array();
									                                                $("#blist-box .list-group-item input").each(function () {
									                                                    if ($(this).is(':checked')) {
									                                                        selecteditems.push($(this).parent().siblings("h4").children('span').text());
									                                                    }

									                                                });
									                                                //TEST
									                                                //TODO结束操作: 下面将selecteditems,即选中的book items数组传递到服务起
									                                                //下面的ajax由star处理
									                                                $.ajax({
									                                                    type: 'POST',
									                                                    url: 'user-adminConfirmBorrow',
									                                                    data: {'selecteditems': JSON.stringify(selecteditems)},
									                                                    dataType: 'json',
									                                                    success: function (data) {
									                                                        //TODO 2
									                                                        layer.msg("图书确认成功！",{anim:1,icon:1,time:1000});
									                                                    },
									                                                    error: function (xhr, type) {
									                                                        layer.msg("确认失败",{anim:6,icon:2,time:1000});
									                                                    }
									                                                });
									                                                layer.close(index);
									                                            }
									                                        });
																		}
																		else{
																			layer.msg("该用户没有待确认书籍！",{anim:6,icon:2,time:2000});
																		}
					                                                   },
					                                                   error: function (xhr, type) {
					                                                       layer.msg("error",{anim:6,icon:2,time:1000});
					                                                   }
					                                        });
					                                        
					                                    },
					                                    btn2: function () {
					                                        
					                                        //还书

					                                        //TODO,当点击还书按钮时,这里需要向后台发一个ajax请求,获取该用户的还书列表,再在前端按以下方式呈现,ajax由star处理,前端这里由静态值作展示
					                                        //replacement START
					                                        $.ajax({
										                        type: 'POST',
										                        url: 'user-adminReturn',
										                        dataType: 'json',
										                        data: {'userId': userinfo.userId},
										                        success: function (data) {
																	if(data.state==1){
																		var itemslist = "";
																		var records = data.records;
								                                        for (var i = 0; i < records.length; i += 1) {
								                                            itemslist += '<a class="list-group-item item-div"><h4 class="list-group-item-heading">'+records[i].bookItem.book.isbn+' <span class="pull-right">' + records[i].borrowedId + '</span></h4>';
								                                            itemslist += '<p class="list-group-item-text">'+records[i].bookItem.book.bookTitle+'<input type="checkbox" class="pull-right"></p></a> ';
								                                        }

								                                        $("#rlist-box").html(itemslist);
								                                        //END

								                                        $(".list-group-item").click(function () {
								                                            if ($(this).children("p").children('input').is(":checked")) {
								                                                $(this).children("p").children('input').removeAttr("checked");
								                                            } else {
								                                                $(this).children("p").children('input').attr("checked", "true");
								                                            }
								                                        });


								                                        layer.open({
								                                            type: 1,
								                                            title: "还书列表",
								                                            content: $("#rlist-box"),
								                                            btn: ['确认'],
								                                            area: ['300px', '400px'],
								                                            yes: function (index) {

								                                                var selecteditems = new Array();
								                                                $("#rlist-box .list-group-item input").each(function () {
								                                                    if ($(this).is(':checked')) {
								                                                        selecteditems.push($(this).parent().siblings("h4").children('span').text());
								                                                    }

								                                                });
								                                                //TEST
								                                                //TODO结束操作: 下面将selecteditems,即选中的book items数组传递到服务起
								                                                //下面的ajax由star处理
								                                                $.ajax({
								                                                    type: 'POST',
								                                                    url: 'user-adminConfirmReturn',
								                                                    data: {'selecteditems': JSON.stringify(selecteditems)},
								                                                    dataType: 'json',
								                                                    success: function (data) {
								                                                        //TODO 2
								                                                        layer.msg("图书确认成功！",{anim:1,icon:1,time:2000});
								                                                    },
								                                                    error: function (xhr, type) {
								                                                        layer.msg("还书失败！",{anim:6,icon:2,time:1000});
								                                                    }
								                                                });

								                                                layer.close(index);
								                                            }
								                                        });
								                                    }
																	else{
																		layer.msg("该用户没有未还书籍！",{anim:6,icon:2,time:2000});
																	}
										                        },
										                        error: function (xhr, type) {
										                        }
										                    });
					                                        return false;
					                                    }
					                            	});
					                            }
					                            else if(data.state==2){
					                            	layer.msg("查无此用户！",{anim:6,icon:2,time:2000});
					                            }
					                            else if(data.state==3){
					                            	layer.msg("二维码解析错误：时间戳异常或伪造的二维码",{anim:6,icon:2,time:2000});
					                            }
					                        },
					                        error: function(){
					                            alert('服务器错误');
					                        }
					                    });
								 	}
					            }); 
					   }; 
							var layer = layui.layer;
							var isbns = new Array();
							$(".book-isbn").each(function(value) {
								isbns.push('"' + $(this).text() + '"');
							});

							$("#isbn-autocomplete").attr('data-source',
									"[" + isbns + "]");

							$("#booktable").dataTable({

								"paging" : false,
								"lengthChange" : false,
								"searching" : true,
								"ordering" : true,
								"info" : true,
								"autoWidth" : false,
								"order" : [ [ 8, "desc" ] ]
							});

							$("#sign-out")
									.click(
											function() {
												layer
														.open({
															title : "注销",
															content : "你确认退出?",
															yes : function() {
																$
																		.ajax({
																			type : 'POST',
																			url : 'user-adminLogout',
																			dataType : 'json',
																			success : function(
																					data) {
																				if (data.state == 1) {
																					window.location.href = 'user-adminLogin';
																				} else {

																				}
																			},
																			error : function(
																					xhr,
																					type) {
																			}
																		});
															}
														});
											});

							
						});
	</script>

</body>

</html>