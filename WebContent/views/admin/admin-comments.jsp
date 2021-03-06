<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">

    <title>管理员系统</title>
    <link rel="stylesheet" href="asserts/bootstrap.min.css">
    <link rel="stylesheet" href="asserts/css/AdminLTE.min.css">
    <!--<link rel="stylesheet" href="asserts/plugins/datatables/dataTables.bootstrap.css">-->
    <link rel="stylesheet" href="asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet" href="asserts/css/_all-skins.min.css">
    <link rel="stylesheet" href="asserts/plugins/layui/css/layui.css">

    <link rel="stylesheet" href="asserts/css/index.css">
</head>
<style>
.comment-content{
			white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
}

</style>
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
            <!--         <li class="dropdown messages-menu">
                        <a href="#">
                            <i class="fa fa-qrcode"></i>
                        </a>
                    </li> -->

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

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-book"></i> <span>图书管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="user-adminBooks"><i class="fa fa-circle-o"></i>录入与查看</a></li>
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


                <li class="active">
                    <a href="user-adminListComments">
                        <i class="fa fa-info"></i> <span>评论管理</span>

            <span class="pull-right-container">
              <small class="label pull-right bg-green">news</small>
            </span>
                    </a>
                </li>


                <li><a href="user-adminInfo"> <i class="fa fa-info"></i> <span>消息管理</span>

            <span class="pull-right-container">
              <small class="label pull-right bg-green">news</small>
            </span>
                    </a>
                </li>


                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-area-chart"></i>
                        <span>统计</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
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

        </section>
        <!-- /.sidebar -->
    </aside>


    <!--主内容-->
    <div class="content-wrapper" style="min-height: 916px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                评论管理
                <small>图书评论管理</small>

            </h1>

            <ol class="breadcrumb">

                <li><a href="#"><i class="fa fa-book"></i>评论管理</a></li>

            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!--codes goes here-->
            <div class="row">
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-10">
                    <div class="input-group input-group-sm">
                        <input class="form-control" placeholder="输入关键信息" type="text" name="filter-box">
                    <span class="input-group-btn">
                      <button type="button" class="btn btn-info btn-flat" id="filter">过滤</button>
                    </span>
                    </div>
                </div>

                <div class="col-md-1">&nbsp;</div>

            </div>

            <br>


            <div class="row">
                <div class="col-md-12">
                    <!-- The time line -->
                    <ul class="timeline">
						<s:if test="#request.comments.size()!=0">
                        <s:iterator value="#request.comments">
                        <li class="normal-timeline">
                            <i class="fa fa-comment bg-fuchsia"></i>
                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i>${updateAt }</span>

                                <h3 class="timeline-header"><a href="#">${user.name }</a>&nbsp; &lt;&lt;${book.bookTitle }&gt;&gt;</h3>

                                <div class="timeline-body">
                                    <p>评分: ${starClass }</p><br>
                                    <div class="comment-content">${content }</div>
                                </div>


                                <div class="timeline-footer">
                                        <a class="btn btn-danger btn-xs delete-comment">删除</a>
                                        <s:if test="status==0">
	                                        <a id="selectToGood" class="btn btn-success btn-xs pass-comment"><i class="fa fa-reply"></i>加入精选</a>
	                                        <input type="hidden" value="${commentId }"/>
                                        </s:if>
                                        <s:else>
                                        	<a id="selectToGood" class="disabled btn btn-success btn-xs pass-comment"><i class="fa fa-check"></i>已加入精选</a>
                                        </s:else>

                             </div>

                            </div>
                        </li>
						</s:iterator>
						</s:if>

                        <li class="timeline-label">
                            <i class="fa fa-clock-o bg-gray"></i>

                        </li>

                    </ul>
                </div>
                <!-- /.col -->
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
<script src="asserts/app.min.js"></script>
<!--<script src="asserts/plugins/datatables/jquery.dataTables.min.js"></script>-->
<!--<script src="asserts/plugins/datatables/dataTables.bootstrap.min.js"></script>-->
<script src="asserts/plugins/layui/layui.js"></script>


<script>


    layui.use('layer', function () {
        var layer = layui.layer;


        $("input[name='filter-box']").keydown(function (e) {
            if (e.keyCode == 13) {
                $('#filter').trigger('click');
            }
        });


        $("#filter").click(function () {

            var filtertext = $("input[name='filter-box']").val().trim();

            if (filtertext === "") {
                $(".normal-timeline").show();
            } else {
                $(".normal-timeline").hide();
            }

            var isfound = false;

            $('.timeline-header').each(function () {

                var words = $(this).text() + $(this).siblings('.time').text() + $(this).siblings('.timeline-body').text();
                if (words.indexOf(filtertext) > -1) {
                    $(this).parent().parent().show();
                    isfound = true;
                }

            });


            if (!isfound && filtertext != "") {
                $(".timeline-label").html("<i class='fa fa-clock-o bg-gray'></i>  <div class='timeline-item'> <h3 class='timeline-header'>未找到结果</h3> </div>");
            } else {
                $(".timeline-label").html(" <i class='fa fa-clock-o bg-gray'></i>");
            }


        });

        $(".pass-comment").click(function () {
            var thele = $(this);
        	$.ajax({
                type: 'POST',
                url: 'user-addToSelected',
                data:{'commentId':thele.next().val()},
                dataType: 'json',
                success: function (data) {
					if (data.state==1){
						thele.addClass("disabled");
			            thele.html('<i class="fa fa-check"></i>已加入精选');
			            //TODO
			            layer.msg("添加成功", {anim: 1, icon: 1, time: 1000});
					}
					else{
						layer.msg("添加失败", {anim: 2, icon: 6, time: 1000});
					}
                },
                error: function (xhr, type) {
                }
            });

        });
        $("#sign-out").click(function () {
            layer.open({
                title: "注销",
                content: "你确认退出?",
                yes: function () {
                	$.ajax({
                        type: 'POST',
                        url: 'user-adminLogout',
                        dataType: 'json',
                        success: function (data) {
							if (data.state==1){
	                        	window.location.href = 'user-adminLogin';
							}
							else{
								
							}
                        },
                        error: function (xhr, type) {
                        }
                    });
                }
            });
        });
        $(".delete-comment").click(function () {
            //TODO
            var thisele = $(this);
            layer.open({
                title: "确认删除",
                content: "你确认删除该消息吗?",
                yes: function () {
                    $.ajax({
                        type: 'POST',
                        url: 'comment-deleteComment',
                        data:{"commentId":thisele.prev().val()},
                        dataType: 'json',
                        success: function (data) {
							if(data.state==1){
			                    thisele.parent().parent().parent().hide(1000);
			                    layer.msg("成功删除", {anim: 1, icon: 1, time: 1000});
							}
							else{
								layer.msg("删除失败！该评论不存在", {anim: 1, icon: 2, time: 1000});
							}
                        },
                        error: function (xhr, type) {
                        	layer.msg("服务器错误！", {anim: 1, icon: 2, time: 1000});
                        }
                    });
                }
            });


        });
    });
</script>

</body>
</html>