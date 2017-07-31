<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=0">

<title>管理员系统</title>
<link rel="stylesheet" href="asserts/bootstrap.min.css">
<link rel="stylesheet"
	href="asserts/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="asserts/css/AdminLTE.min.css">

<link rel="stylesheet" href="asserts/plugins/morris/morris.css">
<link rel="stylesheet"
	href="asserts/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" href="asserts/fbicons/css/font-awesome.min.css">
<link rel="stylesheet" href="asserts/css/_all-skins.min.css">
<link rel="stylesheet" href="asserts/plugins/layui/css/layui.css">
<link rel="stylesheet" href="asserts/css/index.css">
<style>
.stateTip, #StateTip {
	display: none;
	position: absolute;
	padding: 8px;
	background: #fff;
	border: 2px solid #2385B1;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	font-size: 12px;
	font-family: Tahoma;
	color: #333;
}

.mapInfo i {
	display: inline-block;
	width: 15px;
	height: 15px;
	margin-top: 5px;
	line-height: 15px;
	font-style: normal;
	background: #aeaeae;
	color: #fff;
	font-size: 11px;
	font-family: Tahoma;
	-webkit-border-radius: 15px;
	border-radius: 15px;
	text-align: center
}

.mapInfo i.active {
	background: #E27F21;
}

.mapInfo span {
	padding: 0 5px 0 3px;
}

.mapInfo b {
	font-weight: normal;
	color: #2770B5
}

.regionMap {
	float: left;
	margin-left: 10px;
	display: inline;
}
</style>


</head>

<body class="hold-transition skin-green sidebar-mini">


	<div class="wrapper">

		<!--头部 header-->
		<header class="main-header"> <a href="admin.html"
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
				<!-- 	<li class="dropdown messages-menu"><a href="#"> <i
						class="fa fa-qrcode"></i>

				</a></li> -->

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
			<li><a href="user-adminLogin"> <i class="fa fa-gear"></i> <span>管理员主页</span>
			</a></li>
			<li class="treeview"><a href="#"> <i class="fa fa-book"></i>
					<span>图书管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="user-adminBooks"><i class="fa fa-circle-o"></i>录入与查看</a></li>
					<li><a href="user-adminListRecords"><i
							class="fa fa-circle-o"></i>借阅详情</a></li>
					<li><a href="user-adminListReservations"><i
							class="fa fa-circle-o"></i>预定详情</a></li>
				</ul></li>


			<li><a href="user-adminUsers"><i class="fa fa-user"></i> <span>用户管理</span>
					<span class="pull-right-container"> <small
						class="label pull-right bg-green">users</small>
				</span> </a></li>


			<li><a href="user-adminListComments"><i class="fa fa-info"></i>
					<span>评论管理</span> <span class="pull-right-container"> <small
						class="label pull-right bg-green">news</small>
				</span> </a></li>


			<li><a href="javascript:;"><i class="fa fa-info"></i> <span>消息管理</span>

					<span class="pull-right-container"> <small
						class="label pull-right bg-green">news</small>
				</span> </a></li>


			<li class="active treeview"><a href="#"> <i
					class="fa fa-area-chart"></i> <span>统计</span> <span
					class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="user-userChart"><i
							class="fa fa-circle-o"></i>用户统计</a></li>
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
		<div class="content-wrapper" style="min-height: 916px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				统计 <small>数据统计分析</small>

			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-book"></i> 统计</a></li>
				<li class="active">用户统计</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content"> <!--codes goes here-->

			<div class="row">
				<div class="col-md-12">

					<div class="box box-primary">
						<div class="box-header with-border">
							<div class="row">
								<div class="col-md-2">
									<h3 class="box-title">用户增长</h3>
								</div>
								<div class="col-md-3">
									<input id="daterange" type="text" class="form-control"
										style="height: 30px; width: 200px; margin-top: 10px">
								</div>
							</div>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									id="daterange-btn" data-toggle="tooltip" data-placement="left"
									title="选择时间范围">
									<i class="fa fa-calendar"></i>
								</button>

								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>

						</div>


						<div class="box-body chart-responsive">
							<div class="chart" id="user-increase" style="height: 400px;"></div>
						</div>
						<!-- /.box-body -->
					</div>


				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">

						<div class="box-header with-border">
							<h3>
								地域分析 <small class="label area-label bg-green"></small>
							</h3>
						</div>
						<div class="box-body">

							<div style="width: 100%;">
								<div class="col-md-1"></div>
								<div class="col-md-11">
									<div class="itemCon">


										<div id="Region" style="overflow: hidden; clear: both;">
											<div class="regionMap" id="RegionMap"></div>
											<div id="MapColor"
												style="width: 180px; height: 30px; margin: 500px 60% 0 40%; background: url(asserts/plugins/cmap/map_color.gif) center 0;"></div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">


				<div class="col-md-4">
					<!-- DONUT CHART -->
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">性别统计</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body chart-responsive">
							<div class="chart" id="gender-chart"
								style="height: 300px; position: relative;"></div>
						</div>
						<!-- /.box-body -->
					</div>

				</div>


				<div class="col-md-4">


					<!-- DONUT CHART -->
					<div class="box box-success">
						<div class="box-header with-border">

							<h3 class="box-title">还书提醒统计</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body chart-responsive">
							<div class="chart" id="recomfre-chart"
								style="height: 300px; position: relative;"></div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>

				<div class="col-md-4">

					<!-- DONUT CHART -->
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">身份统计</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body chart-responsive">
							<div class="chart" id="role-chart"
								style="height: 300px; position: relative;"></div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>


			</div>


			</section>
			<!-- /.content -->
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
					<!-- /.form-group -->
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
		</aside>
		<div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>

	</div>


	<script src="asserts/jquery.min.js"></script>
	<script src="asserts/bootstrap.min.js"></script>
	<script src="asserts/plugins/bootstrap-typeahead.js"></script>
	<script src="asserts/app.min.js"></script>
	<script src="asserts/plugins/morris/morris.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="asserts/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="asserts/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="asserts/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="asserts/plugins/layui/layui.js"></script>

	<script type="text/javascript"
		src="asserts/plugins/cmap/lib/raphael-min.js"></script>
	<script type="text/javascript"
		src="asserts/plugins/cmap/res/chinaMapConfigHigh.js"></script>
	<script type="text/javascript" src="asserts/plugins/cmap/map.js"></script>

	<script>
		var pinToChar = {
			heilongjiang : '黑龙江',
			jilin : '吉林',
			liaoning : '辽宁',
			hebei : '河北',
			shandong : '山东',
			jiangsu : '江苏',
			zhejiang : '浙江',
			anhui : '安徽',
			henan : '河南',
			shanxi : '山西',
			shaanxi : '陕西',
			gansu : '甘肃',
			hubei : '湖北',
			jiangxi : '江西',
			fujian : '福建',
			hunan : '湖南',
			guizhou : '贵州',
			sichuan : '四川',
			yunnan : '云南',
			qinghai : '青海',
			hainan : '海南',
			shanghai : '上海',
			chongqing : '重庆',
			tianjin : '天津',
			beijing : '北京',
			ningxia : '宁夏',
			neimongol : '内蒙古',
			guangxi : '广西',
			xinjiang : '新疆',
			xizang : '西藏',
			guangdong : '广东',
			hongkong : '香港',
			taiwan : '台湾',
			macau : '澳门'
		};
		function initializeAreaChart(cities) {
			var areaData = {};
			/* 		console.log(cities);
			 */

			var total = cities.length;
			$('.area-label').html(total);
			for (each in pinToChar) {
				var value = 0;
				var stateInitColor = 7;
				var index = "";
				for (city in cities) {
					if (cities[city].indexOf(pinToChar[each]) > -1) {
						value += 1;
					}
				}
				var value = parseFloat(value / total).toFixed(4) * 100;
				if (value >= 50) {
					stateInitColor = 0;
					index = "*";
				} else if (value >= 25) {
					stateInitColor = 1;
				} else if (value >= 15) {
					stateInitColor = 2;
				} else if (value >= 10) {
					stateInitColor = 3;
				} else if (value >= 6) {
					stateInitColor = 4;
				} else if (value >= 3) {
					stateInitColor = 5;
				} else if (value >= 1) {
					stateInitColor = 6;
				} else {
					stateInitColor = 7;
				}
				areaData[each] = {
					"value" : "" + value + "%",
					"index" : "" + index + "",
					"stateInitColor" : "" + stateInitColor + ""
				};
			}
	

			var stateColorList = [ '003399', '0058B0', '0071E1', '1C8DFF',
					'51A8FF', '82C0FF', 'AAD5ee', 'AAD5FF' ];
			$('#RegionMap')
					.SVGMap(
							{
								mapName : 'china',
								mapWidth : 600,
								mapHeight : 500,
								stateData : areaData,
								stateTipHtml : function(mapData, obj) {
									var _value = mapData[obj.id].value;
									var _idx = mapData[obj.id].index;
									var active = '';
									_idx == "*" ? active = 'active'
											: active = '';
									var tipStr = '<div class="mapInfo"><i class="' + active + '">'
											+ _idx
											+ '</i><span>'
											+ obj.name
											+ '</span><b>'
											+ _value
											+ '</b></div>';
									return tipStr;
								}
							});

		}

		$('#daterange-btn').click(function() {
			$('#daterange').trigger('focus');
		});

		$('#daterange')
				.daterangepicker(
						{
							dateLimit : {
								days : 9
							},
							startDate : moment().subtract(9, 'days'),
							endDate : moment(),
							maxDate : moment()
						},
						function(start, end) {
							var days = (new Date(end.format('YYYY-MM-DD'))
									.getTime() - new Date(start
									.format('YYYY-MM-DD')).getTime())
									/ (3600 * 24 * 1000) + 1;
							refreshLineChart(days, new Date(end
									.format('YYYY-MM-DD')).getTime());
						});

		var lineDataFromBack;
		function refreshLineChart(days, endTime) {
			var linedata = new Array();
			for (i = 0; i < days; i += 1) {
				temp = {};
				temp.y = getNowFormatDate(endTime - (days - 1 - i) * 1000
						* 3600 * 24);
				temp.item1 = countIncrease(lineDataFromBack, temp.y);
				linedata.push(temp);
			}

			$("#user-increase").empty();
			var line = new Morris.Line({
				element : 'user-increase',
				resize : true,
				data : linedata,
				xkey : 'y',
				ykeys : [ 'item1' ],
				labels : [ '人数' ],
				lineColors : [ '#3c8dbc' ],
				hideHover : 'auto'
			});
		}

		function sendNextAjax() {
			$.ajax({
				type : 'POST',
				url : 'user-adminUsersAreaAjax',
				dataType : 'json',
				success : function(data) {
					if (data.state == 1) {
						var areas = data.areas;
						var cities = new Array();
						for (x in areas) {
							cities.push(areas[x][1]);
						}
						initializeAreaChart(cities);

					} else {
						alert('wrong');
					}
				},
				error : function(xhr, type) {
					alert('error');
				}
			});
		}

		$.ajax({
			type : 'POST',
			url : 'user-adminUsersAjax',
			dataType : 'json',
			success : function(data1) {
				if (data1.state == 1) {
					lineDataFromBack = data1;
					refreshLineChart(10, new Date().getTime());
					initializePieChart();
					sendNextAjax();
				} else {
				}
			},
			error : function(xhr, type) {

			}
		});

		function countIncrease(data, date) {
			var count = 0;
			for (j = 0; j < data.users.length; j += 1) {
				if (date === getNowFormatDate(data.users[j].updateAt.time)) {
					count += 1;
				}
			}
			return count;
		}

		function getNowFormatDate(ns) {
			var date = new Date(parseInt(ns));
			var seperator1 = "-";
			var seperator2 = ":";
			var month = date.getMonth() + 1;
			var strDate = date.getDate();

			if (month >= 1 && month <= 9) {
				month = "0" + month;
			}
			if (strDate >= 0 && strDate <= 9) {
				strDate = "0" + strDate;
			}
			var currentdate = date.getFullYear() + seperator1 + month
					+ seperator1 + strDate;
			return currentdate;
		}

		function initializePieChart() {
			var users=lineDataFromBack.users
			var malevalue=0;
			var femalevalue=0;

			var reminders={zero:[0,"不提醒"],one:[0,"一天"],three:[0,"三天"],seven:[0,"一周"]};

			var uservalue=0;
			var adminvalue=0;
			for (user in users){
				if(users[user].gender=='male'){
					malevalue+=1;
				}else if(users[user].gender=='female'){
					femalevalue+=1;
				}
				
				if(users[user].recommendFre==0){
					reminders.zero[0]+=1;
				}else if(users[user].recommendFre==1){
					reminders.one[0]+=1;
				}else if(users[user].recommendFre==3){
					reminders.three[0]+=1;
				}else if(users[user].recommendFre==7){
					reminders.seven[0]+=1;
				}

				if(users[user].role=='user'){
					uservalue+=1;
				}else if(users[user].role=='admin'){
					adminvalue+=1;
				}
				
			}
			var genderData=[];
			genderData.push({label:"男",value:""+malevalue+""});
			genderData.push({label:"女",value:""+femalevalue+""});

			var recomData=[];
			for (each in reminders){
				recomData.push({label:""+reminders[each][1]+"",value:""+reminders[each][0]+""});
			}
			
			var roleData=[];
			roleData.push({label:"用户",value:""+uservalue+""});
			roleData.push({label:"管理员",value:""+adminvalue+""});
			console.log(genderData);

			var donut = new Morris.Donut({
				element : 'gender-chart',
				resize : true,
				colors : [ "#3c8dbc", "#f56954" ],
				data :genderData,
				hideHover : 'auto'
			});
			
			//DONUT CHART
			var donut = new Morris.Donut({
				element : 'recomfre-chart',
				resize : true,
				colors : [ "#3c8dbc", "#f56954", "#00a65a", "#00ff5a" ],
				data : recomData,
				hideHover : 'auto'
			});

			//DONUT CHART
			var donut = new Morris.Donut({
				element : 'role-chart',
				resize : true,
				colors : [ "#3c8dbc", "#f56954" ],
				data : roleData,
				hideHover : 'auto'
			});
		}
	</script>

</body>
</html>