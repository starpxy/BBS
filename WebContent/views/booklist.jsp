<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title>Title</title>

<link rel="stylesheet" href="asserts/weui/css/weui.css" />
<link rel="stylesheet" href="asserts/weui/css/weui2.css" />
<link rel="stylesheet" href="asserts/weui/css/weui3.css" />
<link rel="stylesheet" href="asserts/mycss/index.css">
</head>
<body ontouchstart style="background-color: #f8f8f8;">

	<div class="weui-header bg-green">
		<div class="weui-header-left">
			<a class="icon icon-109 f-white" href="user-login">返回</a>
		</div>
		<h1 class="weui-header-title">
			<s:if test="#request.type!=null">图书类目：${request.type }</s:if>
			<s:else>关键词：${request.keyword }</s:else>
		</h1>
		<div class="weui-header-right">
			<a href="main.jsp" class="icon icon-27 f-white"></a>
		</div>
	</div>


	<div class="page-hd">
		<p class="page-hd-desc">自动加载更多,上拉加载,下拉刷新</p>
	</div>

	<div class="weui_panel weui_panel_access">

		<div class="weui_panel_bd"></div>
	</div>



</body>


<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/weui/js/updown.js"></script>
<script src="asserts/weui/js/lazyimg.js"></script>
<script type="text/javascript">
	$(function() {

		//页数
		var page = 0;
		// 每页展示10个
		var size = 10;
		$('.weui_panel')
				.dropload(
						{
							scrollArea : window,
							autoLoad : true,//自动加载
							domDown : {//上拉
								domClass : 'dropload-down',
								domRefresh : '<div class="dropload-refresh f15 "><i class="icon icon-20"></i>上拉加载更多</div>',
								domLoad : '<div class="dropload-load f15"><span class="weui-loading"></span>正在加载中...</div>',
								domNoData : '<div class="dropload-noData">没有更多数据了</div>'
							},
							domUp : {//下拉
								domClass : 'dropload-up',
								domRefresh : '<div class="dropload-refresh"><i class="icon icon-114"></i>上拉加载更多</div>',
								domUpdate : '<div class="dropload-load f15"><i class="icon icon-20"></i>释放更新...</div>',
								domLoad : '<div class="dropload-load f15"><span class="weui-loading"></span>正在加载中...</div>'
							},
							loadUpFn : function(me) {//刷新
								$
										.ajax({
											type : 'GET',
											url : 'famous.json',
											dataType : 'json',
											success : function() {
												var result = '';
												var i = 0;
												result += '<s:if test="#request.bookList==null||request.bookList.size()==0"></s:if><s:else>'
														+ '<s:iterator value="#request.bookList">  <a href="" class="weui_media_box weui_media_appmsg">'
														+ '<div class="weui_media_hd weui-updown">'
														+ '<img class="weui_media_appmsg_thumb lazyload" src="${simpleChart }" alt="" data-img="${simpleChart }">'
														+ '</div>'
														+ '<div class="weui_media_bd">'
														+ '<h4 class="weui_media_title">&nbsp;${bookTitle}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${author}<span style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;${bookId}</span></h4>'
														+ '<p class="weui_media_desc"><br><span style="color:red">一个月:1元&nbsp;&nbsp;&nbsp;&nbsp;</span>评价: </p>'
														+ '<p class="weui_media_desc"><br>总借量:10&nbsp;&nbsp;&nbsp;&nbsp;总存储量: ${bookVolume}本&nbsp;&nbsp;&nbsp;&nbsp;已借:1/${bookVolume}本</p>'
														+ '</div>'
														+ '</a></s:iterator></s:else>';

												// 为了测试，延迟1秒加载
												setTimeout(
														function() {
															$('.weui_panel_bd')
																	.html(
																			result);
															var lazyloadImg = new LazyloadImg(
																	{
																		el : '.weui-updown [data-img]', //匹配元素
																		top : 50, //元素在顶部伸出长度触发加载机制
																		right : 50, //元素在右边伸出长度触发加载机制
																		bottom : 50, //元素在底部伸出长度触发加载机制
																		left : 50, //元素在左边伸出长度触发加载机制
																		qriginal : false, // true，自动将图片剪切成默认图片的宽高；false显示图片真实宽高
																		load : function(
																				el) {
																			el.style.cssText += '-webkit-animation: fadeIn 01s ease 0.2s 1 both;animation: fadeIn 1s ease 0.2s 1 both;';
																		},
																		error : function(
																				el) {

																		}
																	});
															// 每次数据加载完，必须重置
															me.resetload();
															// 重置索引值，重新拼接more.json数据
															page = 0;
															// 解锁
															me.unlock();
															me.noData(false);
														}, 1000);
											},
											error : function(xhr, type) {
												alert('Ajax error!');
												// 即使加载出错，也得重置
												me.resetload();
											}
										});
							},
							loadDownFn : function(me) {//加载更多
								page++;
								window.history.pushState(null, document.title,
										window.location.href);
								var booklistlen = '${request.bookList.size()}';
								var count = booklistlen;
								$
										.ajax({
											type : 'GET',
											url : 'famous.json',
											dataType : 'json',
											success : function() {
												var result = '';
												var i = 0;
												result += '<s:if test="#request.bookList==null||request.bookList.size()==0"></s:if><s:else>'
														+ '<s:iterator value="#request.bookList">  <a href="book-bookDetails?bookId=${bookId}" class="weui_media_box weui_media_appmsg">'
														+ '<div class="weui_media_hd weui-updown">'
														+ '<img class="weui_media_appmsg_thumb lazyload" src="${simpleChart }" alt="" data-img="${simpleChart }">'
														+ '</div>'
														+ '<div class="weui_media_bd">'
														+ '<h4 class="weui_media_title">&nbsp;${bookTitle}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${author}<span style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;${bookId}</span></h4>'
														+ '<p class="weui_media_desc"><br><span style="color:red">一个月:1元&nbsp;&nbsp;&nbsp;&nbsp;</span>评价: </p>'
														+ '<p class="weui_media_desc"><br>总借量:10&nbsp;&nbsp;&nbsp;&nbsp;总存储量: ${bookVolume}本&nbsp;&nbsp;&nbsp;&nbsp;已借:1/${bookVolume}本</p>'
														+ '</div>'
														+ '</a></s:iterator></s:else>';
												// 如果没有数据
												// 为了测试，延迟1秒加载
												setTimeout(
														function() {
															$('.weui_panel_bd')
																	.append(
																			result);
															var lazyloadImg = new LazyloadImg(
																	{
																		el : '.weui-updown [data-img]', //匹配元素
																		top : 50, //元素在顶部伸出长度触发加载机制
																		right : 50, //元素在右边伸出长度触发加载机制
																		bottom : 50, //元素在底部伸出长度触发加载机制
																		left : 50, //元素在左边伸出长度触发加载机制
																		qriginal : false, // true，自动将图片剪切成默认图片的宽高；false显示图片真实宽高
																		load : function(
																				el) {
																			el.style.cssText += '-webkit-animation: fadeIn 01s ease 0.2s 1 both;animation: fadeIn 1s ease 0.2s 1 both;';
																		},
																		error : function(
																				el) {

																		}
																	});
															//
															// 每次数据加载完，必须重置
															me.resetload();
														}, 1000);
											},
											error : function(xhr, type) {
												alert('Ajax error!');
												// 即使加载出错，也得重置
												me.resetload();
											}
										});
							}
						});

	});
</script>
</html>