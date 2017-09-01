<%@page import="com.bbs.converters.TimeUtils"%>
<%@page import="com.bbs.entities.rules.LogRules"%>
<%@page import="com.bbs.entities.AccessLog"%>
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
<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="asserts/mycss/sco.message.css">
<style>
div.search {
	padding: 10px 0;
}

form {
	position: relative;
	width: 90%;
	margin: 0 auto;
}

input, button {
	border: none;
	outline: none;
}

.weui-flex-item a:hover {
	background: #d1d1d1;
}

input {
	width: 100%;
	height: 42px;
	padding-left: 5px;
}

button {
	height: 42px;
	width: 42px;
	cursor: pointer;
	position: absolute;
}

.bar1 button:hover {
	background: #5e835d;
}

/*搜索框1*/
.bar1 input {
	height: 30px;
	border: 2px solid #7BA7AB;
	border-radius: 5px;
	background: #f9f2eb;
	color: #9E9C9C;
}

.bar1 button {
	height: 30px;
	top: 2px;
	right: -10px;
	background: #7aab7a;
	border-radius: 0 5px 5px 0;
}

.bar1 button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
}
  input[name='keyword']{
            position: relative;
        }
   #record_audio{
            position: absolute;
            top: 13px;
            right: 33px;
            color: #6da26b;
            cursor: pointer;
        }

        #audio_link:hover  #record_audio{
            color: #4e744c;
        }
        
         .audio_prompt{

            width: 100px;
            height: 100px;
            position: fixed;
            z-index: 1000;
            left: 50%;
            top:50%;
            text-align: center;
            border-radius: 10px;
            -moz-box-shadow: 3px 3px 4px #666;
            -webkit-box-shadow: 3px 3px 4px #666;
            box-shadow: 3px 3px 4px #666;
            background: #fff;
            color: #0bb20c;
            filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135,
            Color='#666');

        }

        .audio_prompt div{
            margin-top: 20px;
        }
        
        
        
</style>


</head>
<body ontouchstart style="background-color: #f8f8f8;">

	<div class="search-box">
		<div class="search bar1">
			<form action="searchHistory-searchBooks" method="get"
				onsubmit="return check()">
				<input id="keyword" type="text" name="keyword"
					placeholder="搜索书名／作者／ISBN..." x-webkit-speech />
					    <a id="audio_link"><i class="icon icon-45 f23" id="record_audio"></i></a>
				<button type="submit"></button>
			</form>
		</div>
		
    <div class="audio_prompt hide"><div><i class="icon icon-44 f32"></i><p>录音中....</p></div></div>


		<span class="search-span">
			<div class="weui_panel weui_panel_access search-div">

				<div class="weui_panel_hd">
					<span class="icon icon-96 f-green"></span> 猜你喜欢<a
						href="javascript:;" id="change-recom" style="float: right"
						class="f-green"><span class="icon icon-21"></span> 换一批</a>
				</div>

				<div class="weui_panel_bd recom-div"></div>

				<div class="weui_media_box weui_media_text">
					<p class="weui_media_desc">
						<a href="javascript:;" class="weui_btn bg-green" id="cancel-recom"><span
							class="icon icon-95"></span> 取消</a>
					</p>
				</div>


			</div>
		</span>
	</div>


	<div class="slide" id="slide1">

		<ul>
			<li><img src="asserts/images/swipe/swipe1.jpeg">
				<div class="slide-desc">前端开发：王聪聪</div></li>
			<li><img src="asserts/images/swipe/swipe2.jpeg">
				<div class="slide-desc">后台开发：郑萌芽</div></li>
			<li><img src="asserts/images/swipe/swipe3.jpeg">
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
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_article.png" alt="">
				</div>
				<p class="weui_grid_label">经典名著</p>
			</a> <a href="book-bookList?type=侦探推理" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_button.png" alt="">
				</div>
				<p class="weui_grid_label">侦探推理</p>
			</a> <a href="book-bookList?type=绘本漫画" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_cell.png" alt="">
				</div>
				<p class="weui_grid_label">绘本漫画</p>
			</a> <a href="book-bookList?type=流行青春" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_tab.png" alt="">
				</div>
				<p class="weui_grid_label">流行青春</p>
			</a> <a href="book-bookList?type=经济理财" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_article.png" alt="">
				</div>
				<p class="weui_grid_label">经济理财</p>
			</a> <a href="book-bookList?type=商业管理" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_button.png" alt="">
				</div>
				<p class="weui_grid_label">商业管理</p>
			</a> <a href="book-bookList?type=人物传记" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_cell.png" alt="">
				</div>
				<p class="weui_grid_label">人物传记</p>
			</a> <a href="book-bookList?type=心理学" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_tab.png" alt="">
				</div>
				<p class="weui_grid_label">心理学</p>
			</a> <a href="book-bookList?type=计算机科学" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_article.png" alt="">
				</div>
				<p class="weui_grid_label">计算机科学</p>
			</a> <a href="book-bookList?type=历史哲学" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_button.png" alt="">
				</div>
				<p class="weui_grid_label">历史哲学</p>
			</a> <a href="book-bookList?type=科学科普" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_cell.png" alt="">
				</div>
				<p class="weui_grid_label">科学科普</p>
			</a> <a href="book-bookList?type=励志成长" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_tab.png" alt="">
				</div>
				<p class="weui_grid_label">励志成长</p>
			</a> <a href="book-bookList?type=交互设计" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_article.png" alt="">
				</div>
				<p class="weui_grid_label">交互设计</p>
			</a> <a href="book-bookList?type=生活旅行" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_button.png" alt="">
				</div>
				<p class="weui_grid_label">生活旅行</p>
			</a> <a href="book-bookList?type=更多" class="weui_grid js_grid">
				<div class="weui_grid_icon">
					<img src="asserts/icons/icon_nav_cell.png" alt="">
				</div>
				<p class="weui_grid_label">更多</p>
			</a>
		</div>
	</div>


	<div class="weui_cells_title" style="height: 60px;">&nbsp;</div>
	<div style="position: fixed; bottom: 0px; width: 100%">
		<div class="weui_panel weui_panel_access">
			<!--<div class="weui_panel_hd">文字组合列表</div>-->
			<div class="weui_panel_bd">
				<div class="weui-flex">
					<div class="weui-flex-item">

						<a id="scan" href="javascript:;"
							class="weui_tabbar_item weui_bar_item_on">
							<div class="weui_tabbar_icon">
								<img src="asserts/icons/icon_nav_search_bar.png" alt="">
							</div>
							<p class="weui_tabbar_label">借书</p>
						</a>
					</div>
					<div class="weui-flex-item">

						<a href="reservation-reservelist"
							class="weui_tabbar_item weui_bar_item_on">
							<div class="weui_tabbar_icon">
								<img src="asserts/icons/icon_nav_msg.png" alt="">
							</div>
							<p class="weui_tabbar_label">预约单</p>
						</a>
					</div>
					<div class="weui-flex-item">

						<a href="borrowedRecord-borrowlist"
							class="weui_tabbar_item weui_bar_item_on">

							<div class="weui_tabbar_icon">
								<img src="asserts/icons/icon_nav_panel.png" alt="">
							</div>

							<p class="weui_tabbar_label">借书单</p>
						</a>

					</div>
					<div class="weui-flex-item">
						<a href="borrowedRecord-borrowHistory"
							class="weui_tabbar_item weui_bar_item_on">
							<div class="weui_tabbar_icon">
								<img src="asserts/icons/icon_nav_icons.png" alt="">
							</div>
							<p class="weui_tabbar_label">借阅历史</p>
						</a>
					</div>
					<div class="weui-flex-item">
						<a href="userinfo.jsp" class="weui_tabbar_item weui_bar_item_on">
							<div class="weui_tabbar_icon">
								<img src="asserts/icons/icon_nav_actionSheet.png" alt="">
							</div>
							<p class="weui_tabbar_label">个人信息</p>
						</a>
					</div>
				</div>

			</div>
		</div>
	</div>


	<script src="asserts/weui/js/zepto.min.js"></script>
	<script src="asserts/weui/js/swipe.js"></script>
	<script type="text/javascript">
	$('#slide1').swipeSlide({
        autoSwipe: true,//自动切换默认是
        speed: 3000,//速度默认4000
        continuousScroll: true,//默认否
        transitionType: 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',//过渡动画linear/ease/ease-in/ease-out/ease-in-out/cubic-bezier
        lazyLoad: true,//懒加载默认否
        firstCallback: function (i, sum, me) {
            me.find('.dot').children().first().addClass('cur');
        },
        callback: function (i, sum, me) {
            me.find('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
        }
    });
	</script>
	<script src="asserts/jquery.min.js"></script>
	<script src="asserts/layui/layui.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script src="asserts/sco.message.js"></script>
	<script type="text/javascript">
		$(function() {
			<%if (request.getAttribute("logInfo") != null) {
				AccessLog accessLog = (AccessLog) request.getAttribute("logInfo");%>
				$.scojs_message("<div style='text-align:left;padding:6%;'>欢迎回来,<%=accessLog.getUser().getName()%><br>登陆时间: <%=TimeUtils.getChineseTime(accessLog.getLogAt())%><br>登录地点: ${request.logInfo.area}<br>登录位置: ${request.logInfo.location}<br>登录方式: <%=LogRules.getStatus(accessLog.getMethod())%></div>",$.scojs_message.TYPE_OK);
	<%}%>
		$(".search-span").hide();
			var itemslist = '';
			var books;
			var i = 0;
			$
					.ajax({
						type : 'POST',
						url : 'searchHistory-recommendBook',
						dataType : 'json',
						success : function(data) {
							if (data.state == 1) {
								books = data.books;
							} else {
							}
							itemslist = '';
							var count = 0;
							while (books != null && count < 5
									&& count < books.length) {
								itemslist += '<a href="book-bookDetails?bookId='
										+ books[i].bookId
										+ '" class="weui_media_box weui_media_appmsg">';
								itemslist += '    <div class="weui_media_hd">';
								itemslist += '      <img class="weui_media_appmsg_thumb"';
                           itemslist += '             src=' + books[i].simpleChart + '';
                           itemslist += '         alt="not found">';
								itemslist += '  </div>';
								itemslist += '  <div class="weui_media_bd">';
								itemslist += '      <h4 class="weui_media_title">'
										+ books[i].bookTitle + '</h4>';
								itemslist += '      <p class="weui_media_desc">ISBN:'
										+ books[i].isbn
										+ ' 作者:'
										+ books[i].author + '</p>';
								itemslist += '   </div>';
								itemslist += '  </a>';
								count++;
								i++;
							}
							$(".recom-div").html(itemslist);
						},
						error : function(xhr, type) {
						}
					});

			$.ajax({
				type : 'POST',
				url : 'user-initialAPI',
				dataType : 'json',
				data : {
					"url" : "http://pxyzmy.com.cn/BBS/views/user-login"
				},
				success : function(data) {
					wx.config({
						debug : false,
						appId : data.appId,
						timestamp : data.timeStamp,
						nonceStr : data.nonceStr,
						signature : data.signature,
						jsApiList : [ 'checkJsApi', 'onMenuShareTimeline',
								'onMenuShareAppMessage', 'onMenuShareQQ',
								'onMenuShareWeibo', 'hideMenuItems',
								'showMenuItems', 'hideAllNonBaseMenuItem',
								'showAllNonBaseMenuItem', 'translateVoice',
								'startRecord', 'stopRecord', 'onRecordEnd',
								'playVoice', 'pauseVoice', 'stopVoice',
								'uploadVoice', 'downloadVoice', 'chooseImage',
								'previewImage', 'uploadImage', 'downloadImage',
								'getNetworkType', 'openLocation',
								'getLocation', 'hideOptionMenu',
								'showOptionMenu', 'closeWindow', 'scanQRCode',
								'chooseWXPay', 'openProductSpecificView',
								'addCard', 'chooseCard', 'openCard' ]
					});

					wx.error(function(res) {
						alert(res.errMsg);
					});
				},
				error : function() {
					layer.msg('服务器错误', {
						icon : 2,
						anim : 2,
						time : 1000
					});
				}
			});



	        $("#audio_link").mousedown(function() {
	            $(".audio_prompt").show();
	            wx.startRecord({
	                cancel: function () {
	                  alert('用户拒绝授权录音');
	                }
	              });

	        });

	     // 3 智能接口
	        var voice = {
	          localId: '',
	          serverId: ''
	        };
	        $("#audio_link").mouseup(function() {
	            wx.stopRecord({
	                success: function (res) {
	                  voice.localId = res.localId;
	                },
	                fail: function (res) {
	                  alert(JSON.stringify(res));
	                }
	              });

	            if (voice.localId == '') {
	                alert('请先使用 startRecord 接口录制一段声音');
	                return;
	              }
	              wx.translateVoice({
	                localId: voice.localId,
	                complete: function (res) {
	                  if (res.hasOwnProperty('translateResult')) {
	    	            $(".audio_prompt").hide(); 
	    	            $("input[name='keyword']").val(res.translateResult);
	    	            $("button[type='submit']").trigger("click");
	                  } else {
	                    alert('无法识别');
	                  }
	                }
	              });
	        });

	        $("#audio_link").mouseout(function() {
	            console.log("mouse out..");
	        });

			document.querySelector('#scan').onclick = function() {
				wx
						.scanQRCode({
							needResult : 1,
							desc : 'scanQRCode desc',
							success : function(res) {

								var data = res.resultStr;
								if (data.indexOf("EAN_13") > -1) {
									//扫除的结果是isbn，直接跳转到book页面
									var isbn = data.split(',')[1];
									$
									.ajax({
										type : 'POST',
										url : 'book-isExist',
										data:{'isbn':isbn},
										dataType : 'json',
										success : function(data) {
											if (data.state == 1) {
												window.location.href = "book-bookDetails?bookId="+data.bookId;
											} else {
												alert('对不起！此书不存在书库中！');
											}
										},
										error : function() {
											alert('服务器错误');
										}
									});
								} else {
									var ids = $.parseJSON(data);
									$
											.ajax({
												type : 'POST',
												url : 'item-ava?itemId='
														+ ids.itemId,
												dataType : 'json',
												success : function(data) {
													if (data.state == 1) {
														window.location.href = "book-bookSubmit?bookId="
																+ ids.bookId
																+ "&itemId="
																+ ids.itemId;
													} else if (data.state == 2) {
														alert('对不起，此书已被其他人预定！');
													} else if (data.state == 3) {
														alert('啊哦！你预定的书不是我哦！');
													} else {
														alert('此书处于被借出状态！有疑问请联系管理员');
													}
												},
												error : function() {
													alert('服务器错误');
												}
											});
								}
							}
						});
			};

			$("#change-recom")
					.click(
							function() {
								itemslist = '';
								var count = 0;
								while (books != null && count < 5
										&& count < books.length) {
									if (i == books.length) {
										i = 0;
									}
									itemslist += '<a href="book-bookDetails?bookId='
											+ books[i].bookId
											+ '" class="weui_media_box weui_media_appmsg">';
									itemslist += '    <div class="weui_media_hd">';
									itemslist += '      <img class="weui_media_appmsg_thumb"';
	                        itemslist += '             src=' + books[i].simpleChart + '';
	                        itemslist += '         alt="not found">';
									itemslist += '  </div>';
									itemslist += '  <div class="weui_media_bd">';
									itemslist += '      <h4 class="weui_media_title">'
											+ books[i].bookTitle + '</h4>';
									itemslist += '      <p class="weui_media_desc">ISBN:'
											+ books[i].isbn
											+ ' 作者:'
											+ books[i].author + '</p>';
									itemslist += '   </div>';
									itemslist += '  </a>';
									count++;
									i++;
								}
								$(".recom-div").html(itemslist);
							});

			$("#cancel-recom").click(function() {
				$(".search-span").hide();
			});

			// 将原来的   $('.searchbar_wrap').searchBar({...}) 中onfoucus 的内容copy到这个focus方法中;TODO
			//再把原来的 $(".weui_panel_bd").html(itemslist); 更改成 $(".search-div .weui_panel_bd").html(itemslist); 

			$("input[name='keyword']").focus(function() {
				$(".search-span").show();
				//$(".search-div .weui_panel_bd").html(itemslist);

			});
			 
		});
		function check() {
			var keyword = $('#keyword').val();
			if (keyword == '') {
				return false;
			} else {
				return true;
			}
		}
	</script>


</body>
</html>