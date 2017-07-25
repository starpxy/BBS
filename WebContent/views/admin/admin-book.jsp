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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">

    <title>管理员系统</title>
    <link rel="stylesheet" href="asserts/bootstrap.min.css">
    <link rel="stylesheet" href="asserts/css/AdminLTE.min.css">
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
        <a href="user-adminLogin" class="logo">
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
                        <li class="active"><a href="user-adminBooks"><i class="fa fa-circle-o"></i>录入与查看</a></li>
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
                   <a href="javascript:;">
                        <i class="fa fa-info"></i> <span>消息管理</span>

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
                <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>操作一</span></a></li>
                <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>操作二</span></a></li>
                <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>操作三</span></a></li>
            </ul>

        </section>
        <!-- /.sidebar -->
    </aside>


    <!--主内容-->
    <div class="content-wrapper" style="min-height: 100px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                录入与查看
                <small>录入与管理图书</small>
                &nbsp;
                <a data-toggle="tooltip" data-placement="left" title="扫一扫录入书籍" id="scan-import"><i
                        class="fa fa-qrcode"></i></a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a data-toggle="tooltip" data-placement="right" title="手动录入书籍" id="manual-import"><i
                        class="fa fa-sign-in"></i></a>

            </h1>
            <ol class="breadcrumb">

                <li><a href="#"><i class="fa fa-book"></i> 图书管理</a></li>
                <li class="active">录入与查看</li>

            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row" id="import-block" style="display: none;">
                <div class="col-md-12">
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">填写你要录入的书籍</h3>
                            <div class="pull-right">
                                <button type="button" id="confirm-import" class="btn btn-success"><i
                                        class="fa fa-sign-in"></i> 确认录入
                                </button>
                                &nbsp;&nbsp;<a id="cancel-import"><span
                                    class="glyphicon glyphicon-remove-circle"></span></a></div>

                        </div>
                        <div class="box-body">
                            <div class="row">

                                <div class="col-xs-4">
                                    <input class="form-control" placeholder="ISBN" name="isbn" type="text"
                                           id="isbn-autocomplete"
                                           data-provide="typeahead" data-items="4">
                                </div>


                                <div class="col-xs-4">
                                    <input class="form-control" placeholder="书名" name="title" type="text">
                                </div>


                                <div class="col-xs-4">

                                    <!--<input class="form-control" placeholder="类型" name="type" type="text"-->
                                    <!--id="type-autocomplete"-->
                                    <!--data-provide="typeahead" data-items="4">-->

                                   <select id="book-type" class="form-control" name="type" placeholder="类型">
                                        <option value="经典名著">经典名著</option>
                                        <option value="侦探推理">侦探推理</option>
                                        <option value="绘本漫画">绘本漫画</option>
                                        <option value="流行青春">流行青春</option>
                                        <option value="经济理财">经济理财</option>
                                        <option value="商业管理">商业管理</option>
                                        <option value="人物传记">人物传记</option>
                                        <option value="心理学">心理学</option>
                                        <option value="计算机科学">计算机科学</option>
                                        <option value="历史哲学">历史哲学</option>
                                        <option value="科学科普">科学科普</option>
                                        <option value="励志成长">励志成长</option>
                                        <option value="交互设计">交互设计</option>
                                        <option value="生活旅行">生活旅行</option>
                                        <option value="更多">更多</option>
                                    </select>
                                </div>
                            </div>

                            <br>
                            <div class="row">
                                <div class="col-xs-4">
                                    <input class="form-control" placeholder="作者" name="author" type="text">
                                </div>

                                <div class="col-xs-4">
                                    <input class="form-control" placeholder="前言" name="preface" type="text">
                                </div>

                                <div class="col-xs-4">
                                    <input class="form-control" placeholder="介绍" name="introduction" type="text"
                                           data-provide="typeahead" data-items="4">
                                </div>
                            </div>

                            <br>

                            <div class="row">

                                <div class="col-xs-3">

                                    <input class="form-control" placeholder="目录" name="catalog" type="text"
                                           data-provide="typeahead" data-items="4">
                                </div>
                                <div class="col-xs-3">
                                    <input class="form-control" placeholder="出版社" name="publisher" type="text">
                                </div>

                                <div class="col-xs-3">
                                    <input class="form-control" placeholder="出版号" name="version" type="text">
                                </div>

                                <div class="col-xs-3">
                                    <input class="form-control" placeholder="缩略图URL" name="image" type="text">
                                </div>

                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>

                </div>

            </div>

            <div id="toReplace" class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                        </div>
                        <div class="box-body">
                            <div class="table-responsive"
                                 style="overflow-x: auto; overflow-y: auto; height: 750px; width: 100%;">

                                <table id='booktable' class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>ISBN</th>
                                        <th>书名</th>
                                        <th>作者</th>
                                        <th>库存</th>
                                        <th>已借</th>
                                        <th>价格</th>
                                        <th>种类</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="bookbody">
                                    <%  
                                   		int i = 0;
                                   		int j = 0;
                                   		int ct = 0;
                                    	if(request.getAttribute("books")!=null){ 
                                    		List<BookItem> bookItems = (List<BookItem>)request.getAttribute("books");
                                    		BookItem bookItem = null;
                                    		while(i<bookItems.size()){
                                    			bookItem = bookItems.get(i);
                                    %>
                                    <tr>
                                        <td class="book-id"><%=bookItem.getBook().getBookId() %></td>
                                        <td class="book-isbn"><%=bookItem.getBook().getIsbn() %></td>
                                        <td class="book-title">
                                            <div style="width: 140px; overflow: hidden; text-overflow:ellipsis; white-space: nowrap;">
                                                <%=bookItem.getBook().getBookTitle() %>
                                            </div>
                                        </td>
                                        <td class="book-author"><div style="width: 110px; overflow: hidden; text-overflow:ellipsis; white-space: nowrap;"><%=bookItem.getBook().getAuthor() %></div></td>
                                        <td class="book-volum"><a class="check-volum"><i
                                                class="label label-info"><%=bookItem.getBook().getBookVolume()%></i><span>

                                            <div class="box box-success">
            <!--<div class="box-header">-->
                                                <!--<h3 class="box-title">Striped Full Width Table</h3>-->
                                                <!--</div>-->

            <div class="box-body no-padding" style="border: 1px solid green;width: 300px">
		
              <table class="table table-striped">

                  <thead>
                <tr>

                  <th>ID</th>
                  <th>二维码</th>
                  <th>状态</th>
                  <th>操作</th>

                </tr>

                </thead>

                <tbody>
				<% int count=0;
				while(j+1<bookItems.size()&&bookItems.get(j+1).getBook().getBookId()==bookItem.getBook().getBookId()) {
						j++;
						bookItem = bookItems.get(j);
				%>
                <tr>
                  <td class="item-id"><%=bookItem.getItemId() %></td>
                  <td class="item-qrcode"><a><img alt="点击查看二维码详情" src='http://qr.liantu.com/api.php?text={"bookId":<%=bookItem.getBook().getBookId() %>,"itemId":<%=bookItem.getItemId() %>}' width="50px" height="50px"></a></td>
                  <input type="hidden" value='http://qr.liantu.com/api.php?text={"bookId":<%=bookItem.getBook().getBookId() %>,"itemId":<%=bookItem.getItemId() %>}'/>
                  <td class="item-status"><%=BookItemRule.getStatus(bookItem.getStatus()) %></td>
                  <% if(bookItem.getStatus()==2) count++;%>
                    <td class="item-operations">
                        <a data-toggle="tooltip" data-placement="left"
                           title="打印二维码" class="print-qrcode"><i
                                class="fa fa-print"></i>
                          </a>
                    <a data-toggle="tooltip" data-placement="right"
                       title="删除这个条目" class="delete-item"><i
                            class="fa fa-trash"></i></a>
                  </td>

                </tr>

              <%} %>
              </tbody>
              </table>
            </div>
                                                <!-- /.box-body -->
          </div>
          			<%	bookItem = bookItems.get(i); %>
                                        </span></a></td>
                                        <td class="book-borrowed"><span class="label label-success"><%=count %></span></td>
                                        <td class="book-price">0.01元/月</td>
                                        <td class="book-type"><%=bookItem.getBook().getType() %></td>
                                        <td class="options">
                                            <a data-toggle="tooltip" data-placement="left"
                                               title="查看书籍详情" class="view-book"><span
                                                    class="glyphicon glyphicon-eye-open"></span></a>
                                            <a data-toggle="tooltip" data-placement="left"
                                               title="编辑图书详情" class="edit-book"><span
                                                    class="glyphicon glyphicon-pencil"></span></a>
                                            <a data-toggle="tooltip" data-placement="left"
                                               title="删除这本书及其库存" class="delete-book"><span
                                                    class="glyphicon glyphicon-remove"></span></a>
                                        </td>
                                    </tr>
                                    <% i=j;
                                       i++;%>
								<% }} %>
                                    </tbody>
                                </table><br>
                                <ul class="pagination pagination-sm pull-right" style="margin-right: 50px">
                                    <li><a id="first" href="javascript:;">«</a ></li>
                                	<%
                                	if(request.getAttribute("pages")!=null){
                                		int pages = (int)request.getAttribute("pages"); 
                                		for(int m = 1;m<=pages;m++){
                                			if(request.getAttribute("page")!=null&&m==(int)request.getAttribute("page")){
                                	%>
                                		<li class="active temp-page"><a href="user-adminBooks?page=<%=m %>"><%=m %></a ></li>
                                	<%}else{ %>
                                    	<li class="temp-page"><a href="user-adminBooks?page=<%=m %>"><%=m %></a ></li>
                                    <%}
                                    } 
                                  }%>
                                    <li><a id="last" href="javascript:;">»</a ></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		<div id="pager"></div>
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

<div id="rlist-box" style="display: none;">

</div>
<script src="asserts/jquery.min.js"></script>
<script src="asserts/bootstrap.min.js"></script>
<script src="asserts/plugins/bootstrap-typeahead.js"></script>
<script src="asserts/app.min.js"></script>
<script src="asserts/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="asserts/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="asserts/plugins/layui/layui.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script>
    layui.use('layer', function () {
    	
        var layer = layui.layer;
        var isbns = new Array();
        $(".book-isbn").each(function (value) {
            isbns.push('"' + $(this).text() + '"');
        });

        $("#isbn-autocomplete").attr('data-source', "[" + isbns + "]");


        $("#booktable").dataTable({

            "paging": false,
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "order": [[8, "desc"]]
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

        $("#manual-import").click(function () {
            $("#import-block").toggle(1000);
        });
        
        $("#cancel-import").click(function () {
            $("#import-block").hide(1000);
        });


        $("input[name='title']").focus(function () {

            var isbn = $("#isbn-autocomplete").val().trim();

            if (isbn === "" || !$.isNumeric(isbn) || isbn.length != 13) {
                layer.msg("请完成正确的13位ISBN", {anim: 6, icon: 2, time: 1000});
                $("#isbn-autocomplete").css('border', '1px solid red');
                $("input[name='title']").val("");
                $("input[name='author']").val("");
                $("input[name='preface']").val("");
                $("input[name='introduction']").val("");
                $("input[name='catalog']").val("");
                $("input[name='publisher']").val("");
                $("input[name='version']").val("");
                $("input[name='image']").val("");
            } else {
                $("#isbn-autocomplete").css('border', '1px solid green');

                $.getJSON("https://api.douban.com/v2/book/search?q=" + isbn + "&count=1&callback=?", function (data) {

                    if (data.books.length != 0) {
                        $("input[name='title']").val(data.books[0].title);
                        $("input[name='author']").val(data.books[0].author[0]);
                        $("input[name='preface']").val(data.books[0].summary);
                        $("input[name='introduction']").val(data.books[0].author_intro);
                        $("input[name='catalog']").val(data.books[0].catalog);
                        $("input[name='publisher']").val(data.books[0].publisher);
                        $("input[name='version']").val(data.books[0].pubdate);
                        $("input[name='image']").val(data.books[0].image);
                    } else {
                        $("#isbn-autocomplete").css('border', '1px solid red');
                        layer.msg("未找到该书籍", {anim: 6, icon: 2, time: 1000});
                        $("input[name='title']").val("");
                        $("input[name='author']").val("");
                        $("input[name='preface']").val("");
                        $("input[name='introduction']").val("");
                        $("input[name='catalog']").val("");
                        $("input[name='publisher']").val("");
                        $("input[name='version']").val("");
                        $("input[name='image']").val("");
                    }

                });
            }


        });
		
        $("#confirm-import").click(function () {

            if (($("input[name='isbn']").val().trim() != "") && ($("input[name='title']").val().trim() != "") && ($("input[name='author']").val().trim() != "")) {

                layer.open({
                    title: "确认录入",
                    content: "你确认录入该书吗?",
                    yes: function () {
                        //TODO
                        var isbn = $("input[name='isbn']").val().trim();

                        if (isbns.toString().indexOf(isbn) > -1) {

                            ////TODO ajax goes here
                      	 $.ajax({
                                type: 'POST',
                               url: 'book-addBookOld',
                               data: {'isbn': isbn},
                               dataType: 'json',
                                success: function (data) {
                                    if(data.state==1){
                               		 	layer.msg("成功为已有书目《"+ $("input[name='title']").val().trim()+"》添加了库存", {anim: 1, icon: 1, time: 2000});
                                     }
                                    else{
                               		 	layer.msg("对不起，该书目不存在", {anim: 1, icon: 2, time: 2000});
                                    }
                                },
                                error: function (xhr, type) {
                                	layer.msg("书籍录入错误", {anim: 1, icon: 2, time: 2000});
                               }
                            });


                       

                        } else {
                            $.ajax({
                                type: 'POST',
                                url: 'book-addBookNew',
                                data: {'isbn': isbn,"bookTitle":$("input[name='title']").val().trim(),"author":$("input[name='author']").val().trim(),"preface":$("input[name='preface']").val().trim(),"introduction":$("input[name='introduction']").val().trim(),"directory":$("input[name='catalog']").val().trim(),"publisher":$("input[name='publisher']").val().trim(),"versionNumber":$("input[name='version']").val().trim(),"simpleChart":$("input[name='image']").val().trim(),"type":$("#book-type").val().trim(),"starClass":1},
                                dataType: 'json',
                               success: function (data) {
                                    //TODO 2
                            	   if(data.state==1){
                              		 	layer.msg("成功添加新书目《"+ $("input[name='title']").val().trim()+"》", {anim: 1, icon: 1, time: 2000});
                                    }
                                },
                                error: function (xhr, type) {
                                	layer.msg("书籍录入错误", {anim: 1, icon: 1, time: 2000});
                                }
                            });


                            layer.msg("成功录入该书", {anim: 1, icon: 1, time: 2000});
                            var tr = '<tr>';
                            tr += '    <td class="book-id">待刷新</td>';
                            tr += '     <td class="book-isbn">' + isbn + '</td>';
                            tr += '    <td class="book-title">';
                            tr += '       <div style="width: 100px; overflow: hidden; text-overflow:ellipsis; white-space: nowrap;">';
                            tr += '        ' + $("input[name='title']").val() + '';
                            tr += '   </div>';
                            tr += '   </td>';
                            tr += '   <td class="book-author"> ' + $("input[name='author']").val() + '</td>';
                            tr += '   <td class="book-volum"><a class="check-volum"><i';
                            tr += '   class="label label-info">1</span></a></td>';
                            tr += '          <td class="book-borrowed"><span class="label label-success">0</span></td>';
                            tr += '         <td class="book-price">2元/月</td>';
                            tr += '  <td class="book-type">' + $("select[name='type']").val() + '</td>';
                            tr += '          <td class="updated-at">';
                            tr += '         ' + getNowFormatDate() + '';
                            tr += '   </td>';
                            tr += '    <td class="options">';
                            tr += '   <a data-toggle="tooltip" data-placement="left"';
                            tr += '     title="删除这本书及其库存" class="delete-book"><i ';
                            tr += '         class="fa fa-trash"></i></a>  ';
                            tr += '   </td>  ';
                            tr += '   </tr>  ';
                            $('#bookbody').prepend(tr);

                        }

                        $("#import-block").hide(1000);


                    }
                });

            } else {
                layer.msg("请完成ISBN,标题,作者的填写", {anim: 6, icon: 2, time: 1000});
            }


        });


        $('#bookbody').on('click', '.delete-book', function () {
            var thisele = $(this);
//            $(this).parent().parent().hide();

            //TODO delete book
            layer.open({
                title: "确认删除",
                content: "你确认删除该书吗?",
                yes: function () {
                    thisele.parent().parent().hide(1000);
                    layer.msg("成功删除", {anim: 1, icon: 1, time: 1000});

                }
            });
        });

        function getNowFormatDate() {
            var date = new Date();
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
            var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                    + " " + date.getHours() + seperator2 + date.getMinutes()
                    + seperator2 + date.getSeconds();
            return currentdate;
        }

		$('.item-qrcode').click(function(){
			window.location.href = $(this).next().val();
			});
        $(".print-qrcode").click(function () {

            var printdiv = $(this).parent().parent().siblings('.item-qrcode').children("div");
            printdiv.show();
            var html = printdiv.html();
            $("body").html(html);
            window.print();
            //TODO
            window.location.href = "user-adminLogin";

        });


        $(".delete-item").click(function () {

            //TODO
            layer.msg('delete item is clicked!!!!');
        });


        $(".generate-item-qrcode").click(function () {
            //TODO
            layer.msg('generate-item-qrcode is clicked!!!!');
        });
    });
</script>

</body>

</html>