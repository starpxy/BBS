<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">

    <title>管理员系统</title>
    <link rel="stylesheet" href="asserts/bootstrap.min.css">
    <link rel="stylesheet" href="asserts/css/AdminLTE.min.css">
    <link rel="stylesheet" href="asserts/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet" href="asserts/css/_all-skins.min.css">
    <link rel="stylesheet" href="asserts/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="asserts/css/index.css">

    <style>

        .toggle:active {
            background-color: #1c2429;
        }

        .toggle:hover:not(.toggle--moving):after {
            background-color: #455A64;
        }

        .toggle {
            position: relative;
            display: block;
            margin-bottom: 10px;
            width: 100px;
            height: 40px;
            color: white;
            outline: 0;
            text-decoration: none;
            border-radius: 100px;
            border: 2px solid #546E7A;
            background-color: #263238;
            transition: all 500ms;
        }



        .toggle::after {
            display: block;
            position: absolute;
            top: 4px;
            bottom: 4px;
            left: 4px;
            width: calc(50% - 4px);
            line-height: 25px;
            text-align: center;
            text-transform: uppercase;
            font-size: 15px;
            color: white;
            background-color: #37474F;
            border: 2px solid;
            transition: all 500ms;
        }
        .toggle--on::after {
            content: 'Off';
            border-radius: 50px 5px 5px 50px;
            color: #f44336;
        }

        .toggle--off::after {
            content: 'On';
            border-radius: 5px 50px 50px 5px;
            transform: translate(100%, 0);
            color: #66BB6A;
        }

        .toggle--moving {
            background-color: #1c2429;
        }

        .toggle--moving:after {
            color: transparent;
            border-color: #435862;
            background-color: #222c31;
            transition: color 0s, transform 500ms, border-radius 500ms, background-color 500ms;
        }

        input[type="number"] {
            margin: 10px;
        }



    </style>

</head>

<body class="hold-transition skin-green sidebar-mini">


<div class="wrapper">

    <!--头部 header-->
    <header class="main-header">
        <a href="admin.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><i class="fa fa-gear"></i></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>图书后台</b>管理系统</span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">

                <ul class="nav navbar-nav">


                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">

                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="dist/img/admin.png" class="user-image" alt="User Image">
                            <span class="hidden-xs">管理员</span>
                        </a>

                        <ul class="dropdown-menu">

                            <li class="user-header">
                                <img src="dist/img/admin.png" class="img-circle" alt="User Image">
                                <p>
                                    您的身份是:
                                    <small>管理员</small>
                                </p>
                            </li>

                            <li class="user-body">
                                <div class="row">
                                    <div class="text-center">无微不至图书管理系统</div>
                                </div>
                                <!-- /.row -->
                            </li>

                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-right">
                                    <a id="sign-out" class="btn btn-default btn-flat"><i
                                            class="fa fa-sign-out"></i></a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->

                    <li>
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-info-circle"></i> <span
                                class="label label-success">15</span></a>
                    </li>


                </ul>

            </div>
        </nav>
    </header>

    <!--左边菜单栏-->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar" style="height: auto;">
            <!-- Sidebar user panel -->
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
                    <input name="q" class="form-control" placeholder="Search..." type="text">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">


                <li class="header">管理导航</li>

                <li><a href="user-adminLogin"> <i
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
                    </ul>
                </li>

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

                <li><a href="admin-news.jsp"> <i class="fa fa-info"></i> <span>消息管理</span>

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
                <li class="active"><a href="setting-settings"><i class="fa fa-gear"></i> <span>基本设置</span></a></li>
                <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>操作二</span></a></li>
                <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>操作三</span></a></li>
            </ul>

        </section>
        <!-- /.sidebar -->
    </aside>


    <!--主内容-->
    <div class="content-wrapper" style="min-height: 916px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                其他操作
                <small>基本设置</small>
            </h1>
            <ol class="breadcrumb">

                <li><a href="#"><i class="fa fa-book"></i> 基本设置</a></li>

            </ol>

        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h2 class="box-title" style="margin-top: 15px">预约过时计算设置</h2>
                            <!--提醒还书设置,推荐系统设置-->
                            <div class="pull-right">
                                <a href="#"  id="toggle1" class="toggle toggle--on"></a>
                            </div>
                        </div>

                        <div class="box-body" style="display: none">


                            <div class="row">

                                <div class="col-md-6">
                                    <input class="form-control" placeholder="请输入定时任务刷新间距(单位:秒)" name="runInterval1"
                                           type="number">
                                </div>


                                <div class="col-md-6">
                                    <input class="form-control" placeholder="请输入提醒时段间距(单位:秒)" name="checkInterval1"
                                           type="number">
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="button" id="confirm1" class="btn btn-success pull-right"><i
                                            class="fa fa-sign-in"></i> 确认更新
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h2 class="box-title" style="margin-top: 15px">推荐书籍计算设置</h2>
                            <!--提醒还书设置,-->
                            <div class="pull-right">
                                <a href="#" id="toggle2" class="toggle toggle--on"></a>
                            </div>
                        </div>

                        <div class="box-body" style="display: none">

                            <div class="row">

                                <div class="col-md-6">
                                    <input class="form-control" placeholder="请输入定时任务刷新间距(单位:秒)" name="runInterval2"
                                           type="number">
                                </div>


                                <div class="col-md-6">
                                    <input class="form-control" placeholder="请输入提醒时段间距(单位:秒)" name="checkInterval2"
                                           type="number">
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="button" id="confirm2" class="btn btn-success pull-right"><i
                                            class="fa fa-sign-in"></i> 确认更新
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->

                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-12">

                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h2 class="box-title" style="margin-top: 15px">提醒还书设置</h2>
                            <!--提醒还书设置,推荐系统设置-->
                            <div class="pull-right">
                                <a href="#"  id="toggle3" class="toggle toggle--on"></a>
                            </div>
                        </div>

                        <div class="box-body" style="display: none">


                            <div class="row">

                                <div class="col-md-6">
                                    <input class="form-control" placeholder="请输入定时任务刷新间距(单位:秒)" name="runInterval3"
                                           type="number">
                                </div>


                                <div class="col-md-6">
                                    <input class="form-control" placeholder="请输入提醒时段间距(单位:秒)" name="checkInterval3"
                                           type="number">
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="button" id="confirm3" class="btn btn-success pull-right"><i
                                            class="fa fa-sign-in"></i> 确认更新
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-warning">
                        <div class="box-header with-border">
                            <h2 class="box-title" style="margin-top: 15px">预约书到库提醒设置</h2>
                            <!--提醒还书设置,推荐系统设置-->
                            <div class="pull-right">
                                <a href="#"  id="toggle4" class="toggle toggle--on"></a>
                            </div>
                        </div>

                        <div class="box-body" style="display: none">


                            <div class="row">

                                <div class="col-md-6">
                                    <input class="form-control" placeholder="请输入定时任务刷新间距(单位:秒)" name="runInterval4"
                                           type="number">
                                </div>


                                <div class="col-md-6">
                                    <input class="form-control" placeholder="请输入提醒时段间距(单位:秒)" name="checkInterval4"
                                           type="number">
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="button" id="confirm4" class="btn btn-success pull-right"><i
                                            class="fa fa-sign-in"></i> 确认更新
                                    </button>
                                </div>
                            </div>
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
        <p class="copyright text-muted small">权限声明 © SHC 2017. 所有权限保留 <img src="dist/img/icon.png"> <a
                href="http://www.beianbaba.com/icp/pxyzmy.com">京ICP备17020278号-1</a></p>
    </footer>

    <!--右边边菜单栏-->
    <aside class="control-sidebar control-sidebar-dark control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">

            <li><a href="#control-sidebar-news-tab" data-toggle="tab"><i class="fa fa-newspaper-o"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane active" id="control-sidebar-news-tab">
                <h4 class="control-sidebar-heading">消息通知</h4>
                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        删除选中消息
                        <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                    </label>
                </div>
                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        清空
                        <a href="javascript:void(0)" class="text-danger pull-right"><i class="fa fa-trash-o"></i></a>
                    </label>
                </div>
                <!--<div style="overflow-x: auto; overflow-y: auto; height: 1000px; width: 100%; padding: 20px">-->

            </div>
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">一般设置</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input class="pull-right" checked="" type="checkbox">
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Allow mail redirect
                            <input class="pull-right" checked="" type="checkbox">
                        </label>

                        <p>
                            Other sets of options are available
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Expose author name in posts
                            <input class="pull-right" checked="" type="checkbox">
                        </label>

                        <p>
                            Allow the user to show his name in blog posts
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <h3 class="control-sidebar-heading">Chat Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Show me as online
                            <input class="pull-right" checked="" type="checkbox">
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Turn off notifications
                            <input class="pull-right" type="checkbox">
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Delete chat history
                            <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
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
<script src="asserts/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="asserts/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="asserts/plugins/layui/layui.js"></script>


<script>


    layui.use('layer', function () {
        var layer = layui.layer;


        //TODO
        //the following vlaues will be gained vai ajax request
        var a = true ;
        var b = true;
        var c = true;
        var d = true;
        
        if('${request.setting.reserveOverdue}'==0){
			a = false;
        }
        if('${request.setting.recommend}'==0){
			b = false;
        }
        if('${request.setting.remind}'==0){
			c = false;
        }
        if('${request.setting.waitList}'==0){
			d = false;
        }
      
        var initialValues = {
            resevExpiry: {isOn: a, runInterval: '${request.setting.reservePeriod}', checkInterval: '${request.setting.reserveInterval}'},
            recom: {isOn: b, runInterval: '${request.setting.recPeriod}', checkInterval: '${request.setting.recInterval}'},
            bookAlram: {isOn: c, runInterval: '${request.setting.remindPeriod}', checkInterval: '${request.setting.remindInterval}'},
            avaiforReserv: {isOn: d, runInterval: '${request.setting.waitPeriod}', checkInterval: '${request.setting.waitInterval}'}
        };

        //initialzie the first setting
        $('input[name="runInterval1"]').val(initialValues.resevExpiry.runInterval);
        $('input[name="checkInterval1"]').val(initialValues.resevExpiry.checkInterval);
        if (initialValues.resevExpiry.isOn){
            $('#toggle1').removeClass('toggle--on').addClass('toggle--off');
            $('#toggle1').parent().parent().siblings('.box-body').show();
        }


        $('input[name="runInterval2"]').val(initialValues.recom.runInterval);
        $('input[name="checkInterval2"]').val(initialValues.recom.checkInterval);
        if (initialValues.recom.isOn){
            $('#toggle2').removeClass('toggle--on').addClass('toggle--off');
            $('#toggle2').parent().parent().siblings('.box-body').show();
        }


        $('input[name="runInterval3"]').val(initialValues.bookAlram.runInterval);
        $('input[name="checkInterval3"]').val(initialValues.bookAlram.checkInterval);
        if (initialValues.bookAlram.isOn){
            $('#toggle3').removeClass('toggle--on').addClass('toggle--off');
            $('#toggle3').parent().parent().siblings('.box-body').show();
        }


        $('input[name="runInterval4"]').val(initialValues.avaiforReserv.runInterval);
        $('input[name="checkInterval4"]').val(initialValues.avaiforReserv.checkInterval);
        if (initialValues.avaiforReserv.isOn){
            $('#toggle4').removeClass('toggle--on').addClass('toggle--off');
            $('#toggle4').parent().parent().siblings('.box-body').show();
        }




        function isNumber(value) {
            var patrn = /^(-)?\d+(\.\d+)?$/;
            if (patrn.exec(value) == null || value == "") {
                return false
            } else {
                return true
            }
        }

        function sendAjax(setting, runInterval, checkInterval){
     	   $
			.ajax({
				type : 'POST',
				url : 'setting-turnOn',
				dataType : 'json',
				data:{'settingNo':setting,'runInterval':runInterval,'checkInterval':checkInterval},
				success : function(data) {
					if(data.state==1){
						layer.msg("开启成功",{icon:1,anim:2,time:1000});
					}else if(data.state==2){
						layer.msg("登录状态有误",{icon:2,anim:6,time:1000});
					}else{
						layer.msg("参数错误",{icon:2,anim:6,time:1000});
					}
				},
				error : function(xhr,type) {
					layer.msg("error",{icon:2,anim:6,time:1000});
				}
			});
          }

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
        $('#confirm1').click(function (e) {
        	var resevExpiry= {isOn: true, runInterval: 0, checkInterval: 0};

            if(isNumber($('input[name="runInterval1"]').val())&&isNumber($('input[name="checkInterval1"]').val())){
                resevExpiry.runInterval=$('input[name="runInterval1"]').val();
                resevExpiry.checkInterval=$('input[name="checkInterval1"]').val();
            }else{
                layer.msg("要输入数字才行",{icon:2,anim:6,time:1000});
                return false;
            }
//            //有toggle--on 其实开关是关着的
            if( $('#toggle1').hasClass('toggle--on')){
            	 resevExpiry.isOn=false;
            }

            sendAjax(1,resevExpiry.runInterval,resevExpiry.checkInterval);

        });

        $('#confirm2').click(function (e) {
            var recom= {isOn: true, runInterval: 0, checkInterval: 0};

            if(isNumber($('input[name="runInterval2"]').val())&&isNumber($('input[name="checkInterval2"]').val())){

                recom.runInterval=$('input[name="runInterval2"]').val();
                recom.checkInterval=$('input[name="checkInterval2"]').val();

            }else{
                layer.msg("要输入数字才行",{icon:2,anim:6,time:1000});
                return false;
            }
//            //有toggle--on 其实开关是关着的
            if( $('#toggle2').hasClass('toggle--on')){
                recom.isOn=false;
            }

            sendAjax(2,recom.runInterval,recom.checkInterval);
        });

        $('#confirm3').click(function (e) {
            var bookAlarm= {isOn: true, runInterval: 0, checkInterval: 0};

            if(isNumber($('input[name="runInterval3"]').val())&&isNumber($('input[name="checkInterval3"]').val())){
                bookAlarm.runInterval=$('input[name="runInterval3"]').val();
                bookAlarm.checkInterval=$('input[name="checkInterval3"]').val();

            }else{
                layer.msg("要输入数字才行",{icon:2,anim:6,time:1000});
                return false;
            }
//            //有toggle--on 其实开关是关着的
            if( $('#toggle3').hasClass('toggle--on')){
                bookAlarm.isOn=false;
            }
            sendAjax(3,bookAlarm.runInterval,bookAlarm.checkInterval);

        });

        $('#confirm4').click(function (e) {
            var avaiforReserv= {isOn: true, runInterval: 0, checkInterval: 0};

            if(isNumber($('input[name="runInterval4"]').val())&&isNumber($('input[name="checkInterval4"]').val())){
                avaiforReserv.runInterval=$('input[name="runInterval4"]').val();
                avaiforReserv.checkInterval=$('input[name="checkInterval4"]').val();

            }else{
                layer.msg("要输入数字才行",{icon:2,anim:6,time:1000});
                return false;
            }
//            //有toggle--on 其实开关是关着的
            if( $('#toggle4').hasClass('toggle--on')){
                avaiforReserv.isOn=false;
            }
            sendAjax(4,avaiforReserv.runInterval,avaiforReserv.checkInterval);

        });



        $('.toggle').click(function (e) {
            var toggle = this;

            e.preventDefault();

            $(toggle).parent().parent().siblings('.box-body').toggle(1000);
         
            $(toggle).toggleClass('toggle--on')
                    .toggleClass('toggle--off')
                    .addClass('toggle--moving');
            if($(toggle).hasClass("toggle--on")){
         	var settings={"toggle1":1,"toggle2":2,"toggle3":3,"toggle4":4}
         	 var settingNo=settings[$(toggle).attr('id')];
         	   $
   			.ajax({
   				type : 'POST',
   				url : 'setting-turnOff',
   				dataType : 'json',
   				data:{'settingNo':settingNo},
   				success : function(data) {
   					if(data.state==1){
   						layer.msg("关闭成功",{icon:1,anim:2,time:1000});
   					}else if(data.state==2){
   						layer.msg("登录状态错误",{icon:2,anim:6,time:1000});
   					}else{
   						layer.msg("参数错误",{icon:2,anim:6,time:1000});
   	   				}
   				},
   				error : function(xhr,type) {
   					layer.msg("error",{icon:2,anim:6,time:1000});
   				}
   			});
             }
 
            
            setTimeout(function () {
                $(toggle).removeClass('toggle--moving');
            }, 200);
        });

		
    });
</script>

</body>
</html>