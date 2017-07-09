<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title>Ebook主页</title>

<link rel="stylesheet" href="asserts/weui/css/weui.css" />
<link rel="stylesheet" href="asserts/weui/css/weui2.css" />
<link rel="stylesheet" href="asserts/weui/css/weui3.css" />
<link rel="stylesheet" href="asserts/mycss/index.css">


</head>
<body ontouchstart style="background-color: #f8f8f8;">


	<div class="weui-header bg-green">
		<h1 class="weui-header-title">${session.user.name}的Ebook主页</h1>
	</div>
	
	<div class="search-box">

    <div class="searchbar_wrap">


    </div>


<span class="search-span">
    <div class="weui_panel weui_panel_access search-div">

        <div class="weui_panel_hd"><span class="icon icon-96 f-green"></span> 猜你喜欢<a href="javascript:;"
                                                                                     id="change-recom"
                                                                                     style="float: right"
                                                                                     class="f-green"><span
                class="icon icon-21"></span> 换一批</a></div>

        <div class="weui_panel_bd recom-div">


        </div>

        <div class="weui_media_box weui_media_text">
                <p class="weui_media_desc"><a href="javascript:;" class="weui_btn bg-green" id="cancel-recom"><span
                        class="icon icon-95"></span> 取消</a></p>
        </div>


    </div>
</span>
</div>


	<div class="slide" id="slide1">

		<ul>
			<li><img src="asserts/images/faces/cc.jpg">
				<div class="slide-desc">前端开发：王聪聪</div></li>
			<li> <img
					src="asserts/images/faces/mengmeng.jpg">
				<div class="slide-desc">后台开发：郑萌芽</div></li>
			<li><img src="asserts/images/faces/star.jpg">
				<div class="slide-desc">接口调用：潘星宇</div></li>
		</ul>


		<div class="dot">
			<span></span> <span></span> <span></span>
		</div>
	</div>


	<div class="page-hd-desc" style="margin-top: 20px">

		<h3>&nbsp;图书分类</h3>
		<div class="weui_grids">
			<a href="book-bookList?type=经典名著" class="weui_grid js_grid">

				<p class="weui_grid_label">经典名著</p>
			</a> <a href="book-bookList?type=生活保健" class="weui_grid js_grid">

				<p class="weui_grid_label">生活保健</p>
			</a> <a href="book-bookList?type=经管理财" class="weui_grid js_grid">

				<p class="weui_grid_label">经管理财</p>
			</a> <a href="book-bookList?type=成人教育" class="weui_grid js_grid">

				<p class="weui_grid_label">成人教育</p>
			</a> <a href="book-bookList?type=小说传记" class="weui_grid js_grid">

				<p class="weui_grid_label">小说传记</p>
			</a> <a href="book-bookList?type=历史军事" class="weui_grid js_grid">

				<p class="weui_grid_label">历史军事</p>
			</a> <a href="book-bookList?type=文学技术" class="weui_grid js_grid">

				<p class="weui_grid_label">文学技术</p>
			</a> <a href="book-bookList?type=人文社科" class="weui_grid js_grid">

				<p class="weui_grid_label">人文社科</p>
			</a> <a href="book-bookList?type=计算机科学" class="weui_grid js_grid">

				<p class="weui_grid_label">计算机科学</p>
			</a> <a href="book-bookList?type=人际关系" class="weui_grid js_grid">

				<p class="weui_grid_label">人际关系</p>
			</a> <a href="book-bookList?type=语言学习" class="weui_grid js_grid">

				<p class="weui_grid_label">语言学习</p>
			</a> <a href="book-bookList?type=人物传记" class="weui_grid js_grid">

				<p class="weui_grid_label">人物传记</p>
			</a> <a href="book-bookList?type=西方哲学" class="weui_grid js_grid">

				<p class="weui_grid_label">西方哲学</p>
			</a> <a href="book-bookList?type=生物医学" class="weui_grid js_grid">

				<p class="weui_grid_label">生物医学</p>
			</a> <a href="book-bookList?type=更多" class="weui_grid js_grid">

				<p class="weui_grid_label">更多</p>
			</a>

		</div>
	</div>

<div class="weui_cells_title" style="height:60px;">&nbsp;</div>
<section class="weui-menu">
    <div class="weui-menu-inner">
        <em></em>
        <!--<span>图书操作</span>-->
        <span>借书</span>
        <ul>
                <li id="scan">扫一扫借书</li>
        </ul>
    </div>
    <div class="weui-menu-inner">
        <em></em>
        <!--<span>图书管理</span>-->
        <span>借书单</span>
        <ul>
			<li>敬请期待</li>
            <li><a href="borrowedRecord-borrowlist">我的借书单</a></li>

            <li><a href="reservation-reservelist">我的预约单</a></li>

            <li><a href="borrowedRecord-borrowHistory">我的借阅历史</a></li>


        </ul>
    </div>
    <div class="weui-menu-inner">
        <em></em>
        <!--<span>我的</span>-->
        <span>个人信息</span>
        <ul>
        	<li>敬请期待</li>
            <li id="user-info">个人信息</li>
            <li id="user-qrCode">我的借书二维码</li>
            <li id="log-out">注销</li>
        </ul>
    </div>


</section>


	<script src="asserts/weui/js/zepto.min.js"></script>
	<script src="asserts/weui/js/swipe.js"></script>
	<script src="layui/layui.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>
	<script type="text/javascript">
		$(function() {
			$(".search-span").hide();
			var itemslist = '';
	         var books ;
	         var i = 0;
	         $.ajax({
                   type: 'POST',
                   url: 'searchHistory-recommendBook',
                   dataType: 'json',
                   success: function (data) {
                       if(data.state==1){
                       	books = data.books;
	                    }
                       else{
	                    }
                       itemslist = '';
                       var count = 0;
                  	 while (books!=null&&count<5&&count<books.length) {
                           itemslist += '<a href="book-bookDetails?bookId=' + books[i].bookId + '" class="weui_media_box weui_media_appmsg">';
                           itemslist += '    <div class="weui_media_hd">';
                           itemslist += '      <img class="weui_media_appmsg_thumb"';
                           itemslist += '             src=' + books[i].simpleChart + '';
                           itemslist += '         alt="not found">';
                           itemslist += '  </div>';
                           itemslist += '  <div class="weui_media_bd">';
                           itemslist += '      <h4 class="weui_media_title">' + books[i].bookTitle + '</h4>';
                           itemslist += '      <p class="weui_media_desc">ISBN:' + books[i].isbn + ' 作者:' + books[i].author + '</p>';
                           itemslist += '   </div>';
                           itemslist += '  </a>';
                           count++;
                           i++;
                       }
                  	 $(".recom-div").html(itemslist);
                   },
                   error: function (xhr, type) {
                   }
                   });
		
			$.ajax({
        		type:'POST',
                url:'user-initialAPI',
                dataType : 'json',
                data: {"url":"http://pxyzmy.com.cn/BBS/views/user-login"},
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
            layer.msg('服务器错误',{icon:2,anim:2,time:1000});
        }
    });
			
            document.querySelector('#scan').onclick = function () {
                wx.scanQRCode({
                    needResult: 1,
                    desc: 'scanQRCode desc',
                    success: function (res) {
                    	
                    	var data = res.resultStr;
                    	var ids = $.parseJSON(data);
                    	$.ajax({
                            type:'POST',
                            url:'item-ava?itemId='+ids.itemId,
                            dataType : 'json',
                            success: function (data){
                                if(data.state==1){
                                	window.location.href = "book-bookSubmit?bookId="+ids.bookId+"&itemId="+ids.itemId;
                                }
                                else if(data.state==2){
                                    alert('对不起，此书已被其他人预定！');
                                }
                                else if(data.state==3){
                                	alert('啊哦！你预定的书不是我哦！');
                                }
                                else{
                                	alert('此书处于被借出状态！有疑问请联系管理员');
                                }
                            },
                            error: function(){
                                alert('服务器错误');
                            }
                        });
					}
                });
            };
			 $("#user-info").click(function () {
		            window.location.href = 'userinfo.jsp';

		        });
			 $("#user-qrCode").click(function () {
		            window.location.href = 'user-qrCode';

		       });
		        $("#log-out").click(function () {

		            $.confirm("确定要注销当前帐号吗？", '注销确认', function () {
		                window.location.href = 'user-logout';
		            }, function () {

		            });



		        });
		        		        $("#change-recom").click(function () {
		        	itemslist = '';
                    var count = 0;
	               	 while (books!=null&&count<5&&count<books.length) {
		               	 	if(i==books.length){
			               	 	i = 0;
			               	 }
	                        itemslist += '<a href="book-bookDetails?bookId=' + books[i].bookId + '" class="weui_media_box weui_media_appmsg">';
	                        itemslist += '    <div class="weui_media_hd">';
	                        itemslist += '      <img class="weui_media_appmsg_thumb"';
	                        itemslist += '             src=' + books[i].simpleChart + '';
	                        itemslist += '         alt="not found">';
	                        itemslist += '  </div>';
	                        itemslist += '  <div class="weui_media_bd">';
	                        itemslist += '      <h4 class="weui_media_title">' + books[i].bookTitle + '</h4>';
	                        itemslist += '      <p class="weui_media_desc">ISBN:' + books[i].isbn + ' 作者:' + books[i].author + '</p>';
	                        itemslist += '   </div>';
	                        itemslist += '  </a>';
	                        count++;
	                        i++;
	                    }
               	        $(".recom-div").html(itemslist);      
		        });

		        $("#cancel-recom").click(function () {
		            $(".search-span").hide();
		        });
						
		        $('.searchbar_wrap').searchBar({
		            cancelText: "取消",
		            searchText: '书名/作者/ISBN码',
		            onfocus: function () {
		                $(".search-span").show();
		                //TODO,当聚焦搜索框时,这里需要向后台发一个ajax请求,获取根据该用户搜索记录计算出的第一批推荐书籍列表(这里暂定一批有五本,即相似度排名最高的五本书),再在前端按以下方式呈现,ajax由star处理,前端这里由静态值作展示
		            },
		            onblur: function () {
			            
		            },
		            oninput: function () {

		            },
		            onsubmit: function (value) {
		                window.location.href = "searchHistory-searchBooks?keyword=" + value;
		                $(".search-span").hide();
		            },

		            oncancel: function () {
		            	$(".search-span").hide();
		            },

		            onclear: function () {
		            	$(".search-span").hide();
		            }
		        });

			$('.weui-menu-inner').click(
					function() {
						var $menu = $(this).find('ul'), height = $menu
								.find('li').length
								* 40 + 15 + 'px', opacity = $menu
								.css('opacity');

						$('.weui-menu-inner ul').css({
							'top' : '0',
							'opacity' : '0'
						});

						if (opacity == 0) {
							$menu.css({
								'top' : '-' + height,
								'opacity' : 1
							});
						} else {
							$menu.css({
								'top' : 0,
								'opacity' : 0
							});
						}
					});

			$('#slide1')
					.swipeSlide(
							{
								autoSwipe : true,//自动切换默认是
								speed : 3000,//速度默认4000
								continuousScroll : true,//默认否
								transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',//过渡动画linear/ease/ease-in/ease-out/ease-in-out/cubic-bezier
								lazyLoad : true,//懒加载默认否
								firstCallback : function(i, sum, me) {
									me.find('.dot').children().first()
											.addClass('cur');
								},
								callback : function(i, sum, me) {
									me.find('.dot').children().eq(i).addClass(
											'cur').siblings()
											.removeClass('cur');
								}
							});

		});
	</script>


</body>
</html>