<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.bbs.entities.Favorite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title></title>

	<link rel="stylesheet" href="asserts/layui/css/layui.css" />
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <style>
        .weui-flex-item {
            text-align: center;
            margin-top: 10px;
            float: left;     
        }
         .flex-container{
            margin-left: 10px;
        }

        img {
            width: 80px;
            height: 120px;
            border-radius: 4px;
            -webkit-box-shadow: 2px 2px 2px #aeaeae;
            -moz-box-shadow: 2px 2px 2px #aeaeae;
        }

        .book-title {
            color: #0C0C0C;
            margin: 2px auto;
            width: 80px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .book-author {
            color: #666;
            margin: 0 auto;
            width: 120px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

    </style>
</head>

<body ontouchstart style="background-color: #f8f8f8;">

<div class="weui-header bg-green">
    <div class="weui-header-left"><a href="userinfo.jsp" class="icon icon-109 f-white">返回</a></div>
    <h1 class="weui-header-title">我的收藏</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>

<%
	if(request.getAttribute("favorites")!=null){
		List<Favorite> favorites = (List<Favorite>)request.getAttribute("favorites");
		Iterator<Favorite> iterator = favorites.iterator();
		for(int i = favorites.size();i>0;i-=3){
			int count = 0;
%>
<div class="flex-container">
	<%while(iterator.hasNext()&&count<3){ 
		Favorite favorite = iterator.next();
		count++;%>
    <div class="weui-flex-item">
	
        <a class="toDelete">
            <div class="book-link" hidden>book-bookDetails?bookId=<%=favorite.getBook().getBookId() %></div>
            <div class="book-image">
                <img class="act" src="<%=favorite.getBook().getSimpleChart() %>" alt="not found">
            </div>
            <p class="book-title"><%=favorite.getBook().getBookTitle() %></p>
            <p class="book-author"><%=favorite.getBook().getAuthor() %></p>
        </a>

    </div>
	<%} 
		while(count<3){
	%>
		<div class="weui-flex-item">
    	</div>
	<%count++;
	} %>
</div>
<%	}
}%>

<div style="clear: both;height: 80px">&nbsp;</div>

<div style="position:fixed;bottom: 0px;width: 100%">

    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <p class="weui_media_desc"><a href="javascript:;" class="weui_btn bg-red" id="clear"><i class="icon icon-23"></i> 清空</a></p>
            </div>
        </div>
    </div>

</div>


<script src="asserts/layui/layui.js"></script>
<script src="asserts/weui/js/zepto.min.js"></script>

<script>
    $(function () {

    	layui
		.use(
				'layer',
				function() {
			$('.flex-container').on('click','.act',function() {
            var booklink=$(this).parent().siblings('.book-link').html();
			var thisel = $(this).parent().parent();

            $.actions({
                title: "选择操作",
                onClose: function() {
                    console.log("close");
                },
                actions: [
                    {
                        text: "查看",
                        className: "color-primary",
                        onClick: function() {
//                            var booklink=$('.book-link').html();
                            window.location.href=booklink;
                        }
                    },
                    {
                        text: "删除",
                        className: 'color-danger',
                        onClick: function() {
                            var bookid=booklink.split('=')[1];
                            $.ajax({
								type : 'POST',
								url : 'user-deleteFavorite',
								data:{'bookId':bookid},
								dataType : 'json',
								success : function(data){
									if(data.state==1){
										layer.msg('移出收藏成功',
												{
											icon : 1,
											anim : 2,
											time : 2000
										});
										thisel.hide(1000);
									}
									else if(data.state==2){
										layer.msg('书籍状态有误',
												{
											icon : 2,
											anim : 2,
											time : 2000
										});
									}
								},
								error:function(){
									alert('err');
								}
							});
                        }
                    }
                ]
            });
        });

        $("#clear").click(function () {
            $.confirm("你确认清空吗?", "确认", function (text) {

                var booklinks=$('.book-link');

                var arr_bookids=new Array();

                booklinks.each(function () {
                    arr_bookids.push($(this).html().split('=')[1]);
                });
                $.ajax({
					type : 'POST',
					url : 'user-deleteAllFavorites',
					dataType : 'json',
					success : function(data){
						if(data.state==1){
							layer.msg('清空成功',
									{
								icon : 1,
								anim : 2,
								time : 2000
							});
							$('.toDelete').hide(1000);
						}
						else if(data.state==2){
							layer.msg('列表中没有书籍！',
									{
								icon : 2,
								anim : 2,
								time : 2000
							});
						}
					},
					error:function(){
					}
				});
               
            }, function () {

            });
        });
	});
  });
</script>

</body>
</html>