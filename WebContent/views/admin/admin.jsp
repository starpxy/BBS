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
<style>

.option-item:hover div .info-box {
	background: #eee;
}

.is-animate.style1 {
	margin: 50px auto;
}

.is-animate.style1>div {
	animation-name: style1;
	display: inline-block;
	padding: 12px;
	border-radius: 26px;
	font-size: 20px;
	color: #178342;
	background-color: #eee;
	box-shadow: 1px 1px 9px -3px #000;
}



.is-animate>div {
	animation-duration: 1s;
	animation-fill-mode: both;
	animation-iteration-count: infinite;
}

.is-animate>div:nth-child(1) {
	animation-delay: 0.0s
}

.is-animate>div:nth-child(2) {
	animation-delay: 0.1s
}

.is-animate>div:nth-child(3) {
	animation-delay: 0.2s
}

.is-animate>div:nth-child(4) {
	animation-delay: 0.3s
}

.is-animate>div:nth-child(5) {
	animation-delay: 0.4s
}

.is-animate>div:nth-child(6) {
	animation-delay: 0.5s
}

.is-animate>div:nth-child(7) {
	animation-delay: 0.6s
}

.is-animate>div:nth-child(8) {
	animation-delay: 0.7s
}

.is-animate>div:nth-child(9) {
	animation-delay: 0.8s
}

.is-animate>div:nth-child(10) {
	animation-delay: 0.9s
}

.is-animate>div:nth-child(11) {
	animation-delay: 1.0s
}

.info-box-icon {
	text-align: center;
}

.info-box-icon>i {
	margin-top: 20px;
}

.info-box-content {
	padding-top: 20px;
}
.box-solid{
margin:10px;
}
.inner>h3{
font-size:20px;
}

.inner>p{
font-size:10px;
}

.icon{
padding:10px;
}
input[type="range"] {
  display: block;
  -webkit-appearance: none;
  background-color: #bdc3c7;
  width: 300px;
  height: 5px;
  border-radius: 5px;
  margin: 0 auto;
  outline: 0;
}
input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none;
  background-color: #0D9E4C;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  border: 2px solid white;
  cursor: pointer;
  transition: 0.3s ease-in-out;
}



 input[type="range"]::-webkit-slider-thumb:hover {
  background-color: white;
  border: 2px solid #e74c3c;
}
input[type="range"]::-webkit-slider-thumb:active {
  transform: scale(1.6);
}


@keyframes style1 {
    from, 20%, 53%, 80%, to {
        animation-timing-function: cubic-bezier(0.215, 0.610, 0.355, 1.000);
        transform: translate3d(0,0.5,0.1);
    }
    40%, 43% {
        animation-timing-function: cubic-bezier(0.755, 0.050, 0.855, 0.060);
        transform: translate3d(0px, -15px, 0);
    }
}



</style>
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
	     <div class="sidebar-form">
                <div class="input-group">
                    <input name="q" class="form-control" placeholder="Search..."
                           type="text"> <span class="input-group-btn">
					<!--<button name="search" id="search-btn"-->
                            <!--class="btn btn-flat">-->
						<i class="fa fa-search btn btn-flat" id="search-btn"></i>
					<!--</button>-->

				</span>
                </div>

            </div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">管理导航</li>


			<li class="active"><a href="user-adminLogin"> <i
					class="fa fa-gear"></i> <span>管理员主页</span>
			</a></li>


			<li class="treeview"><a href="#"> <i class="fa fa-book"></i>
					<span>图书管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<!-- 				TODO -->
					<li><a href="user-adminBooks"><i class="fa fa-circle-o"></i>录入与查看</a></li>
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

			<li><a href="user-adminInfo"> <i class="fa fa-info"></i> <span>消息管理</span>

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
				</ul>
			</li>


			<li class="header">其他操作(预留)</li>
			<li><a href="setting-settings"><i class="fa fa-gear"></i> <span>基本设置</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>操作二</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>操作三</span></a></li>
		</ul>

		</section> <!-- /.sidebar --> </aside>


		<!--主内容-->
		<!-- 		<div class="content-wrapper" style="min-height: 100px;">
 -->
		<!-- Content Header (Page header) -->


		<!--主内容-->
		<div class="content-wrapper" style="min-height: 916px;">
			<!-- Content Header (Page header) -->
			<section class="content-header"
				style="background: url('dist/img/intro-bg.jpeg') no-repeat center center;padding:20px">
			<h1>
				<div class='is-animate style1' style="text-align: center">
					<div>欢</div>
					<div>迎</div>
					<div>来</div>
					<div>到</div>
					<div>图</div>
					<div>书</div>
					<div>管</div>
					<div>理</div>
					<div>员</div>
					<div>系</div>
					<div>统</div>
				</div>
			</h1>
				<div class="value" style="display:none">0</div>
				<input type="range" min="0" max="10" step="0.5" value="5">
			</section>

			<!-- Main content -->


			<section class="content"> <!--        style="background:#888;padding:20px"
 -->
			<div class="row">

				<div class="box box-solid">
					<div class="box-header with-border">
						<i class="fa fa-book"></i>
						<h3 class="box-title">图书管理</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">


						<a href="user-adminBooks" class="option-item">
							<div class="col-md-12">
								<div class="info-box">
									<span class="info-box-icon bg-aqua"><i
										class="fa fa-edit"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">可进行智能录入书籍，删除书籍，查看及更改书籍详情等操作</span>
											<span class="info-box-number">录入与查看</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
						</a>

						<!-- /.col -->
						<a href="user-adminListRecords" class="option-item">
							<div class="col-md-12">
								<div class="info-box">
									<span class="info-box-icon bg-green"><i
										class="fa fa-search"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">查看用户借书详情，可进行查看和发送提醒还书，过滤用户借书信息等操作</span> 
										<span class="info-box-number">借阅详情</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
						</a>
						
						<!-- /.col -->
						<a href="user-adminListReservations" class="option-item">
							<div class="col-md-12">
								<div class="info-box">
									<span class="info-box-icon bg-yellow"><i
										class="fa  fa-bookmark-o"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">查看用户预订书籍详情，可进行查看和取消用户预订，过滤预订信息等操作</span> <span
											class="info-box-number">预定详情</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
						</a>
						<!-- /.col -->
						<!-- /.col -->
					</div>
					<!-- /.box-body -->
				</div>
			</div>
			
			<div class="row">
			<div class="box box-solid">
					<div class="box-header with-border">
						<i class="fa fa-gears"></i>
						<h3 class="box-title">其他管理</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
				
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>用户管理</h3>
              <p>改删查用户基本信息，指派用户身份，查看用户借阅详情等操作</p>
            </div>
            <div class="icon">
              <i class="fa fa-user"></i>
            </div>
            <a href="user-adminUsers" class="small-box-footer">进入用户管理 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>评论管理</h3>
              <p>查看用户评论详情，过滤用户详情，设置评论是否加入精选</p>
            </div>
            <div class="icon">
              <i class="fa  fa-comments"></i>
            </div>
            <a href="user-adminListComments" class="small-box-footer">进入评论管理 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>消息管理</h3>
              <p>查看用户登录历史详情，包括用户IP，登录方式，登录地点等信息</p>
            </div>
            <div class="icon">
              <i class="fa fa-info"></i>
            </div>
            <a href="user-adminInfo" class="small-box-footer">进入消息管理 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>基本设置</h3>
              <p>还书提醒，是否开启推荐书籍功能，是否开启评论星级计算等设置</p>
            </div>
            <div class="icon">
              <i class="fa fa-gear"></i>
            </div>
            <a href="setting-settings" class="small-box-footer">进入基本设置 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        	</div>
	</div>
   </div>


			<div class="row">
				<div class="box box-solid">
					<div class="box-header with-border">
						<i class="fa fa-area-chart"></i>
						<h3 class="box-title">统计</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">

						<a href="user-userChart" class="option-item">
							<div class="col-md-12">
								<div class="info-box">
									<span class="info-box-icon  bg-aqua"><i class="fa fa-bar-chart"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">查看用户数量增长情况，用户性别比例，以及地域分析</span> 
										<span class="info-box-number">用户统计</span>
									</div>
									<!-- /.info-box-content -->
								</div>
							</div>
						</a> <a href="user-bookChart" class="option-item">
							<div class="col-md-12">
								<div class="info-box ">
									<span class="info-box-icon bg-green"><i class="fa fa-line-chart"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">查看图书录入数量增长情况，图书类型分布，书籍状态分析等</span> <span
											class="info-box-number">图书统计</span>
									</div>
									<!-- /.info-box-content -->
								</div>
							</div>
						</a> <a href="user-commentChart" class="option-item">
							<div class="col-md-12">
								<div class="info-box">
									<span class="info-box-icon bg-yellow"><i class="fa fa-pie-chart"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">查看评论数量增长情况，评论状态分析等</span> <span
											class="info-box-number">评论统计</span>
									</div>
									<!-- /.info-box-content -->
								</div>
							</div>
						</a>
					</div>
				</div>
				<!-- /.col -->
			</div>
			</section>
			<!-- /.content -->
		</div>


	</div>

	<!-- Main content -->

	<!-- 		</div> -->


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
						name in posts <input class="pull-right" checked="" type="checkbox">
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
							$("input[name='q']").keydown(function (e) {


							    if(e.keyCode==13){

							        var keyword=$(this).val().trim();
							        var keywordlen=keyword.length;

							        if(keyword !=""){

							            var options=$(".option-item");
							            var inners=$(".inner");

							            options.each(function () {

							                var queryelems=$(this).children("div").children(".info-box" ).children(".info-box-content");
							                var textele=queryelems.children(".info-box-text");
							                var numele=queryelems.children(".info-box-number");

							                if(queryelems.html().indexOf(keyword)>-1){

							                    if (textele.html().indexOf(keyword)>-1){
							                        var pretext=textele.html().substring(0,textele.html().indexOf(keyword));
							                        var middle="<mark>"+keyword+"</mark>";
							                        var nexttext=textele.html().substring(textele.html().indexOf(keyword)+keywordlen,textele.html().length);
							                        textele.html(pretext+middle+nexttext);
							                    }

							                    if (numele.html().indexOf(keyword)>-1){
							                        var pretext=numele.html().substring(0,numele.html().indexOf(keyword));
							                        var middle="<mark>"+keyword+"</mark>";
							                        var nexttext=numele.html().substring(numele.html().indexOf(keyword)+keywordlen,numele.html().length);
							                        numele.html(pretext+middle+nexttext);
							                    }

							                    $(this).show();

							                }else{
							                    $(this).hide();
							                }



							                inners.each(function () {

							                    var queryelems=$(this);
							                    var textele=queryelems.children("h3");
							                    var numele=queryelems.children("p");

							                    if(queryelems.html().indexOf(keyword)>-1){

							                        if (textele.html().indexOf(keyword)>-1){
							                            var pretext=textele.html().substring(0,textele.html().indexOf(keyword));
							                            var middle="<mark>"+keyword+"</mark>";
							                            var nexttext=textele.html().substring(textele.html().indexOf(keyword)+keywordlen,textele.html().length);
							                            textele.html(pretext+middle+nexttext);
							                        }

							                        if (numele.html().indexOf(keyword)>-1){
							                            var pretext=numele.html().substring(0,numele.html().indexOf(keyword));
							                            var middle="<mark>"+keyword+"</mark>";
							                            var nexttext=numele.html().substring(numele.html().indexOf(keyword)+keywordlen,numele.html().length);
							                            numele.html(pretext+middle+nexttext);
							                        }

							                        $(this).show();

							                    }else{
							                        $(this).parent().parent().hide();
							                    }

//							                console.log(queryelems.html());

							                });

//							                console.log(queryelems.html());

							            });


							        }else{

							            var options=$(".option-item");
							            var operations=$(".inner").parent().parent();

							            options.each(function () {
							                $(this).show();

							            });

							            operations.each(function () {
							                $(this).show();

							            });
							        }

							    }

							});
							

							 $("input[type='range']").on('input propertychange',function(){
								 var value=$(this).val()*3;
									var style='@keyframes style1 {from, 20%, 53%, 80%, to {animation-timing-function: cubic-bezier(0.215, 0.610, 0.355, 1.000);transform: translate3d(0,0.5,0.1); }40%, 43% {animation-timing-function: cubic-bezier(0.755, 0.050, 0.855, 0.060); transform: translate3d(0px, -'+value+'px, 0);}}';
									$('style').html($('style').html()+style);
					            });
					            

					
							$
									.ajax({
										type : 'POST',
										url : 'user-initialAPI',
										dataType : 'json',
										data : {
											"url" : "http://pxyzmy.com.cn/BBS/views/admin/user-adminLogin"
										},
										success : function(data) {
											wx
													.config({
														debug : false,
														appId : data.appId,
														timestamp : data.timeStamp,
														nonceStr : data.nonceStr,
														signature : data.signature,
														jsApiList : [
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
																'openCard' ]
													});

											wx.error(function(res) {
												alert(res.errMsg);
											});
										},
										error : function() {
											layer.msg('初始化微信JS接口失败', {
												icon : 2,
												anim : 2,
												time : 1000
											});
										}
									});
							document.querySelector('#scan').onclick = function() {
								wx
										.scanQRCode({
											needResult : 1,
											desc : 'scanQRCode desc',
											success : function(res) {

												var dat = res.resultStr;

												$
														.ajax({
															type : 'POST',
															url : 'user-adminScanUser',
															data : {
																"userInfo" : dat
															},
															dataType : 'json',
															success : function(
																	data) {
																if (data.state == 1) {
																	var userinfo = data.user;
																	layer
																			.open({
																				title : "选择操作",
																				btnAlign : 'c',
																				content : "已扫描"
																						+ userinfo.name
																						+ "的二维码，请选择操作",
																				btn : [
																						'借书',
																						'还书',
																						'取消' ],
																				yes : function() {

																					//借书
																					//TODO,当点击借书按钮时,这里需要向后台发一个ajax请求,获取该用户的借书列表,再在前段按以下方式呈现,ajax由star处理,前端这里由静态值作展示
																					//replacement START
																					$
																							.ajax({
																								type : 'POST',
																								url : 'user-adminBorrow',
																								data : {
																									'userId' : userinfo.userId
																								},
																								dataType : 'json',
																								success : function(
																										data) {
																									if (data.state == 1) {
																										var itemslist = "";
																										var records = data.records;
																										for (var i = 0; i < records.length; i += 1) {
																											itemslist += '<a class="list-group-item item-div"><h4 class="list-group-item-heading">'
																													+ records[i].bookItem.book.isbn
																													+ '<span class="pull-right">'
																													+ records[i].borrowedId
																													+ '</span></h4>';
																											itemslist += '<p class="list-group-item-text">'
																													+ records[i].bookItem.book.bookTitle
																													+ '<input type="checkbox" class="pull-right"></p></a> ';
																										}

																										$(
																												"#blist-box")
																												.html(
																														itemslist);
																										//END

																										$(
																												".list-group-item")
																												.click(
																														function() {
																															if ($(
																																	this)
																																	.children(
																																			"p")
																																	.children(
																																			'input')
																																	.is(
																																			":checked")) {
																																$(
																																		this)
																																		.children(
																																				"p")
																																		.children(
																																				'input')
																																		.removeAttr(
																																				"checked");
																															} else {
																																$(
																																		this)
																																		.children(
																																				"p")
																																		.children(
																																				'input')
																																		.attr(
																																				"checked",
																																				"true");
																															}
																														});

																										layer
																												.open({
																													type : 1,
																													title : "借书列表",
																													content : $("#blist-box"),
																													btn : [ '确认借书' ],
																													area : [
																															'300px',
																															'400px' ],
																													yes : function(
																															index) {

																														var selecteditems = new Array();
																														$(
																																"#blist-box .list-group-item input")
																																.each(
																																		function() {
																																			if ($(
																																					this)
																																					.is(
																																							':checked')) {
																																				selecteditems
																																						.push($(
																																								this)
																																								.parent()
																																								.siblings(
																																										"h4")
																																								.children(
																																										'span')
																																								.text());
																																			}

																																		});
																														//TEST
																														//TODO结束操作: 下面将selecteditems,即选中的book items数组传递到服务起
																														//下面的ajax由star处理
																														$
																																.ajax({
																																	type : 'POST',
																																	url : 'user-adminConfirmBorrow',
																																	data : {
																																		'selecteditems' : JSON
																																				.stringify(selecteditems)
																																	},
																																	dataType : 'json',
																																	success : function(
																																			data) {
																																		//TODO 2
																																		layer
																																				.msg(
																																						"图书确认成功！",
																																						{
																																							anim : 1,
																																							icon : 1,
																																							time : 1000
																																						});
																																	},
																																	error : function(
																																			xhr,
																																			type) {
																																		layer
																																				.msg(
																																						"确认失败",
																																						{
																																							anim : 6,
																																							icon : 2,
																																							time : 1000
																																						});
																																	}
																																});
																														layer
																																.close(index);
																													}
																												});
																									} else {
																										layer
																												.msg(
																														"该用户没有待确认书籍！",
																														{
																															anim : 6,
																															icon : 2,
																															time : 2000
																														});
																									}
																								},
																								error : function(
																										xhr,
																										type) {
																									layer
																											.msg(
																													"error",
																													{
																														anim : 6,
																														icon : 2,
																														time : 1000
																													});
																								}
																							});

																				},
																				btn2 : function() {

																					//还书

																					//TODO,当点击还书按钮时,这里需要向后台发一个ajax请求,获取该用户的还书列表,再在前端按以下方式呈现,ajax由star处理,前端这里由静态值作展示
																					//replacement START
																					$
																							.ajax({
																								type : 'POST',
																								url : 'user-adminReturn',
																								dataType : 'json',
																								data : {
																									'userId' : userinfo.userId
																								},
																								success : function(
																										data) {
																									if (data.state == 1) {
																										var itemslist = "";
																										var records = data.records;
																										for (var i = 0; i < records.length; i += 1) {
																											itemslist += '<a class="list-group-item item-div"><h4 class="list-group-item-heading">'
																													+ records[i].bookItem.book.isbn
																													+ ' <span class="pull-right">'
																													+ records[i].borrowedId
																													+ '</span></h4>';
																											itemslist += '<p class="list-group-item-text">'
																													+ records[i].bookItem.book.bookTitle
																													+ '<input type="checkbox" class="pull-right"></p></a> ';
																										}

																										$(
																												"#rlist-box")
																												.html(
																														itemslist);
																										//END

																										$(
																												".list-group-item")
																												.click(
																														function() {
																															if ($(
																																	this)
																																	.children(
																																			"p")
																																	.children(
																																			'input')
																																	.is(
																																			":checked")) {
																																$(
																																		this)
																																		.children(
																																				"p")
																																		.children(
																																				'input')
																																		.removeAttr(
																																				"checked");
																															} else {
																																$(
																																		this)
																																		.children(
																																				"p")
																																		.children(
																																				'input')
																																		.attr(
																																				"checked",
																																				"true");
																															}
																														});

																										layer
																												.open({
																													type : 1,
																													title : "还书列表",
																													content : $("#rlist-box"),
																													btn : [ '确认' ],
																													area : [
																															'300px',
																															'400px' ],
																													yes : function(
																															index) {

																														var selecteditems = new Array();
																														$(
																																"#rlist-box .list-group-item input")
																																.each(
																																		function() {
																																			if ($(
																																					this)
																																					.is(
																																							':checked')) {
																																				selecteditems
																																						.push($(
																																								this)
																																								.parent()
																																								.siblings(
																																										"h4")
																																								.children(
																																										'span')
																																								.text());
																																			}

																																		});
																														//TEST
																														//TODO结束操作: 下面将selecteditems,即选中的book items数组传递到服务起
																														//下面的ajax由star处理
																														$
																																.ajax({
																																	type : 'POST',
																																	url : 'user-adminConfirmReturn',
																																	data : {
																																		'selecteditems' : JSON
																																				.stringify(selecteditems)
																																	},
																																	dataType : 'json',
																																	success : function(
																																			data) {
																																		//TODO 2
																																		layer
																																				.msg(
																																						"图书确认成功！",
																																						{
																																							anim : 1,
																																							icon : 1,
																																							time : 2000
																																						});
																																	},
																																	error : function(
																																			xhr,
																																			type) {
																																		layer
																																				.msg(
																																						"还书失败！",
																																						{
																																							anim : 6,
																																							icon : 2,
																																							time : 1000
																																						});
																																	}
																																});

																														layer
																																.close(index);
																													}
																												});
																									} else {
																										layer
																												.msg(
																														"该用户没有未还书籍！",
																														{
																															anim : 6,
																															icon : 2,
																															time : 2000
																														});
																									}
																								},
																								error : function(
																										xhr,
																										type) {
																								}
																							});
																					return false;
																				}
																			});
																} else if (data.state == 2) {
																	layer
																			.msg(
																					"查无此用户！",
																					{
																						anim : 6,
																						icon : 2,
																						time : 2000
																					});
																} else if (data.state == 3) {
																	layer
																			.msg(
																					"二维码解析错误：时间戳异常或伪造的二维码",
																					{
																						anim : 6,
																						icon : 2,
																						time : 2000
																					});
																}
															},
															error : function() {
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