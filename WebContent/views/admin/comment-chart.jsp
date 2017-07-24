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
    <link rel="stylesheet" href="asserts/plugins/morris/morris.css">
    <link rel="stylesheet" href="asserts/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet" href="asserts/css/_all-skins.min.css">
    <link rel="stylesheet" href="asserts/plugins/layui/css/layui.css">


    <link rel="stylesheet" href="asserts/css/index.css">



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

                    <!-- Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <a href="#">
                            <i class="fa fa-qrcode"></i>

                        </a>
                    </li>

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
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat"><i class="fa fa-qrcode"></i></a>
                                </div>
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
       		<li><a href="user-adminLogin"> <i class="fa fa-gear"></i> <span>管理员主页</span>
			</a></li>
                <li class="active treeview">
                    <a href="#">
                        <i class="fa fa-book"></i> <span>图书管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="admin-book.jsp"><i class="fa fa-circle-o"></i>录入与查看</a></li>
                        <li><a href="user-adminListRecords"><i class="fa fa-circle-o"></i>借阅详情</a></li>
                        <li><a href="user-adminListReservations"><i class="fa fa-circle-o"></i>预定详情</a></li>
                    </ul>
                </li>


                <li>
                    <a href="user-adminUsers">
                        <i class="fa fa-user"></i> <span>用户管理</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">users</small>
            </span>
                    </a>
                </li>


                <li>
                    <a href="user-adminListComments">
                        <i class="fa fa-info"></i> <span>评论管理</span>

            <span class="pull-right-container">
              <small class="label pull-right bg-green">news</small>
            </span>
                    </a>
                </li>


                <li>
                    <a href="admin-news.html">
                        <i class="fa fa-info"></i> <span>消息管理</span>

            <span class="pull-right-container">
              <small class="label pull-right bg-green">news</small>
            </span>
                    </a>
                </li>


                <li class="active treeview">
                    <a href="#">
                        <i class="fa fa-area-chart"></i>
                        <span>统计</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="user-chart.html"><i class="fa fa-circle-o"></i>用户统计</a></li>
                        <li><a href="book-chart.html"><i class="fa fa-circle-o"></i>图书统计</a></li>
                        <li class="active"><a href="comment-chart.html"><i class="fa fa-circle-o"></i>评论统计</a></li>
                    </ul>
                </li>


                <li class="header">其他操作(预留)</li>
                <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>操作一</span></a></li>
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
                统计
                <small>数据统计分析</small>
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-book"></i> 统计</a></li>
                <li class="active">评论统计</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!--codes goes here-->


            <div class="row">

                    <div class="col-md-12">
                        <!-- AREA CHART -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">评论增长</h3>

                                <div class="box-tools pull-right">

                                    <button type="button" class="btn btn-box-tool" id="daterange-btn"><i
                                            class="fa fa-calendar"></i></button>
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body chart-responsive">
                                <div class="chart" id="comment-chart" style="height: 300px;"></div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->

                        <!-- DONUT CHART -->
                        <div class="box box-success">
                            <div class="box-header with-border">

                                <h3 class="box-title">评论状态统计</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body chart-responsive">
                                <div class="chart" id="status-chart" style="height: 300px; position: relative;"></div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
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
                <div>

                    <div class="form-group"><label class="control-sidebar-subheading"><input data-layout="fixed"
                                                                                             class="pull-right"
                                                                                             type="checkbox">借书通知-共支付4元</label>
                        <p>用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;</p></div>
                    <div class="form-group"><label class="control-sidebar-subheading"><input data-layout="fixed"
                                                                                             class="pull-right"
                                                                                             type="checkbox">借书通知-共支付4元</label>
                        <p>用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;</p></div>

                    <div class="form-group"><label class="control-sidebar-subheading"><input data-layout="fixed"
                                                                                             class="pull-right"
                                                                                             type="checkbox">借书通知-共支付4元</label>
                        <p>用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;</p></div>
                    <div class="form-group"><label class="control-sidebar-subheading"><input data-layout="fixed"
                                                                                             class="pull-right"
                                                                                             type="checkbox">借书通知-共支付4元</label>
                        <p>用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;</p></div>
                    <div class="form-group"><label class="control-sidebar-subheading"><input data-layout="fixed"
                                                                                             class="pull-right"
                                                                                             type="checkbox">借书通知-共支付4元</label>
                        <p>用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;</p></div>
                    <div class="form-group"><label class="control-sidebar-subheading"><input data-layout="fixed"
                                                                                             class="pull-right"
                                                                                             type="checkbox">借书通知-共支付4元</label>
                        <p>用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;</p></div>
                    <div class="form-group"><label class="control-sidebar-subheading"><input data-layout="fixed"
                                                                                             class="pull-right"
                                                                                             type="checkbox">借书通知-共支付4元</label>
                        <p>用户:王聪聪 2017-06-09 12:30:00 <br>&lt;&lt;月亮与六便士&gt;&gt;<br>&lt;&lt;麦田里的守望者&gt;&gt;</p></div>

                </div>

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
<script src="asserts/plugins/morris/morris.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="asserts/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="asserts/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="asserts/plugins/layui/layui.js"></script>


<script>


    layui.use('layer', function () {
        var layer = layui.layer;


        // LINE CHART
        var line = new Morris.Line({
            element: 'comment-chart',
            resize: true,
            data: [
                {y: '2017-06-16', item1: 12},
                {y: '2017-06-17', item1: 2},
                {y: '2017-06-18', item1: 3},
                {y: '2017-06-19', item1: 1},
                {y: '2017-06-20', item1: 0},
                {y: '2017-06-21', item1: 3},
                {y: '2017-06-22', item1: 2},
                {y: '2017-06-23', item1: 6},
                {y: '2017-06-24', item1: 15},
                {y: '2017-06-25', item1: 2}
            ],
            xkey: 'y',
            ykeys: ['item1'],
            labels: ['评论数量'],
            lineColors: ['#00a65a'],
            hideHover: 'auto'
        });


        //DONUT CHART
        var donut = new Morris.Donut({
            element: 'status-chart',
            resize: true,
            colors: ["#3c8dbc", "#00a65a"],
            data: [
                {label: "被精选", value: 30},
                {label: "未被精选", value: 100}
            ],
            hideHover: 'auto'
        });




//        $("xxxx").click(function () {
//
//        });


//        layer.open({
//            title: "确认删除",
//            content: "你确认删除该书吗?",
//            yes: function () {
//                thisele.parent().parent().hide();
//                layer.msg("成功删除", {anim: 1, icon: 1, time: 1000});
//
//            }
//        });

        ////TODO ajax goes here
//                            $.ajax({
//                                type: 'POST',
//                                url: 'xxx',
//                                data: {'isbn': isbn},
//                                dataType: 'json',
//                                success: function (data) {
//
//                                    //TODO 2
        //刷新页面
//
//                                },
//                                error: function (xhr, type) {
//                                }
//                            });




    });
</script>

</body>
</html>