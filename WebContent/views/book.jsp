<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title>book</title>
<link rel="stylesheet" href="asserts/weui/css/weui.css" />
<link rel="stylesheet" href="asserts/weui/css/weui2.css" />
<link rel="stylesheet" href="asserts/weui/css/weui3.css" />
<link rel="stylesheet" href="asserts/layui/css/layui.css" />
<!--<link rel="stylesheet" href="asserts/mycss/index.css">-->


</head>
<body ontouchstart style="background-color: #f8f8f8;">
	<s:if test="#request.book==null">
	</s:if>
	<s:else>
		<div class="weui-header bg-green">
			<div class="weui-header-left">
				<a class="icon icon-109 f-white">返回</a>
			</div>
			<h1 class="weui-header-title">${bookTitle}</h1>
			<div class="weui-header-right">
				<a href="main.html" class="icon icon-27 f-white"></a>
			</div>
		</div>
	</s:else>
	<div class="page-hd-desc">


		<div class="weui_panel weui_panel_access" id="bookdesc">
			<div class="weui_panel_hd">图书概述</div>

			<div class="weui_panel_bd">
				<img src="asserts/images/swipe/swipe2.jpg" width="100%"
					height="400px">

				<div class="weui_media_box weui_media_text">

					<h4 class="weui_media_title" style="float: right">
						<div class="weui-border-l">
							&nbsp;&nbsp;<a class="addtowishlist f-black"><span
								class="icon icon-49"></span>收藏</a>
						</div>
					</h4>

					<h1 class="weui_media_title f-black">${bookTitle}${author }</h1>

				</div>

				<div class="weui_media_box weui_media_text f-black">
					<h4 class="weui_media_desc" style="float: right">馆藏${bookVolume }本</h4>
					<h4 class="weui_media_title f-red">1元/月</h4>

					<h4 class="weui_media_desc" style="float: right">上书时间
						${updateAt }</h4>
					<h4 class="weui_media_desc">种类:${type }</h4>

				</div>

			</div>
			<a class="weui_panel_ft" id="check-qrcode">查看二维码</a>
		</div>


		<div class="weui_panel weui_panel_access">
			<div class="weui_panel_hd">图书详情</div>

			<div class="weui_panel_bd">

				<div class="weui_media_box weui_media_text">

					<h4 class="weui_media_desc" style="float: right">${author}</h4>

					<h4 class="weui_media_desc f-black">作者</h4>

				</div>

				<div class="weui_media_box weui_media_text">

					<h4 class="weui_media_desc" style="float: right">${isbn }</h4>

					<h4 class="weui_media_desc f-black">isbn</h4>

				</div>


				<div class="weui_media_box weui_media_text">

					<h4 class="weui_media_desc" style="float: right">${publisher }</h4>

					<h4 class="weui_media_desc f-black">出版商</h4>

				</div>

				<div class="weui_media_box weui_media_text">

					<h4 class="weui_media_desc" style="float: right">${versionNumber }</h4>

					<h4 class="weui_media_desc f-black">版本</h4>

				</div>


			</div>

			<a href="javascript:void(0);" class="weui_panel_ft f-black"
				id="check-preface">前言</a> <a href="javascript:void(0);"
				class="weui_panel_ft f-black" id="check-catelog">目录</a> <a
				href="javascript:void(0);" class="weui_panel_ft f-black"
				id="check-introduction">介绍</a> <a href="javascript:void(0);"
				class="weui_panel_ft">更多</a>

		</div>


		<div class="page-hd-desc">
			<div class="weui_panel weui_panel_access">
				<div class="weui_panel_bd">
					<div class="weui_media_box weui_media_text f-black">

						<h4 class="weui_media_title">
							图书评价&nbsp;&nbsp;&nbsp;&nbsp;<span class="icon icon-48"></span><span
								class="icon icon-48"></span><span class="icon icon-48"></span><span
								class="icon icon-48"></span><span class="icon icon-49"></span>
						</h4>


						<p class="weui_media_desc">
						<div class="weui_btn_area weui_btn_area_inline">
							<a href="javascript:;" class="weui_btn weui_btn_plain_default"
								id="checkcomment">查看评论</a><a href="javascript:;"
								class="weui_btn weui_btn_plain_primary" id="addcomment">发表评论</a>
						</div>
						</p>


					</div>
				</div>
			</div>

		</div>


	</div>

	<div style="margin-top: 100px">&nbsp;</div>

	<div class="weui-footer-fixed-bottom page-bd">
		<div class="weui_panel weui_panel_access">
			<!--<div class="weui_panel_hd">文字组合列表</div>-->
			<div class="weui_panel_bd">
				<div class="weui_media_box weui_media_text">

					<!--<h4 class="weui_media_title">标题一</h4>-->
					<p class="weui_media_desc">
						<a href="javascript:;" class="weui_btn bg-green" id="book">借书</a>
					</p>

				</div>
			</div>
		</div>

	</div>


	<div class="page-bd-15" style="display: none" id="commentcheck">
		<div class="weui_cells_title">用户评论</div>
		<ul class="weui-comment">

			<li class="weui-comment-item">
				<!--<div class="tright">--> <!--评价:五星--> <!--</div>-->
				<div class="weui-comment-li">
					<span class="check checked"> <i class="weui-comment-icon"></i>
						<span class="weui-comment-num">5</span>
					</span>
				</div>

				<div class="userinfo">
					<strong class="nickname">王聪聪</strong> <img class="avatar"
						src="asserts/images/faces/admin.jpg">
				</div>

				<div class="weui-comment-msg">
					<span class="status"></span> 超级喜欢这本书
				</div>

				<p class="time">今天</p>
			</li>
			<hr>


			<li class="weui-comment-item">
				<div class="weui-comment-li">
					<span class="check checked"> <i class="weui-comment-icon"></i>
						<span class="weui-comment-num">1</span>
					</span>
				</div>
				<div class="userinfo">
					<strong class="nickname">潘欣雨</strong> <img class="avatar" src="">
				</div>
				<div class="weui-comment-msg">
					<span class="status"></span> 我觉得这本书烂透了
				</div>
				<p class="time">昨天</p>
			</li>

			<hr>

			<li class="weui-comment-item">
				<div class="weui-comment-li">
					<span class="check checked"> <i class="weui-comment-icon"></i>
						<span class="weui-comment-num">3</span>
					</span>
				</div>
				<div class="userinfo">
					<strong class="nickname">正萌芽</strong> <img class="avatar" src="">
				</div>
				<div class="weui-comment-msg">
					<span class="status"></span> 还行,还行
				</div>
				<p class="time">前天</p>
			</li>



		</ul>
	</div>


	<div class="page-bd-15" style="display: none" id="commentadd">

		<!--<div class="weui_cells_title">输入评论</div>-->

		<div class="weui_cells weui_cells_form">


			<form action="login.jsp" method="post" id="testform">
				<div class="weui_cell">


					<div class="weui_cell_bd weui_cell_primary">
						<textarea id="textarea" class="weui_textarea" placeholder="请输入评论"
							rows="8"></textarea>
						<div class="weui_textarea_counter">
							<span id='count'>0</span>/<span id='count_max'>120</span>
						</div>
					</div>
				</div>
				<div class="weui_cell">

					<span class="icon icon-49 rate-book"></span><span
						class="icon icon-49 rate-book"></span><span
						class="icon icon-49 rate-book"></span><span
						class="icon icon-49 rate-book"></span><span
						class="icon icon-49 rate-book"></span>
				</div>
			</form>
		</div>


	</div>



	<div class="page-bd-15" style="display: none" id="qrcode">
		<!--http://qr.liantu.com/api.php?text=http://congcongxyz.cn/booksubmit?bookid=12&bg=f3f3f3&fg=ff2200&gc=22ff22&w=300&el=l-->
		<img src="asserts/images/qrcode/api.png">
	</div>


	<div class="page-bd-15" style="display: none" id="preface">
		<div>曾仕强，英国莱斯特大学管理哲学博士，中国统一的建设促进会前任理事长，人类自救协会理事长，胡雪岩教育基金会董事。主要著作有《超世纪大易管理》、《总裁魅力学》、《领导与激励》、《人际关系与沟通》。</div>
	</div>

	<div class="page-bd-15" style="display: none" id="catelog">
		<div>
			第一章 中国人一切靠关系 <br> 第二章 成功的人际关系 <br> 第三章 中国人最好称为人伦关系 <br>
			第四章 人际关系的三个阶段 <br> 第五章 人际关系的经和权 <br> 第六章 人际关系的开展 <br>
			第七章 人际关系的艺术 <br> 第八章 人际关系与沟通 <br> 第九章 沟通前的心理准备 <br>
			第十章 沟通的三种层次 <br> 第十一章 沟通的基本架构 <br> 第十二章 沟通的三大守则 <br>
			第十三章 沟通的四大目的 <br> 第十四章 沟通的三种方式 <br> 第十五章 沟通的流动方向 <br>
			…… 结语
		</div>
	</div>

	<div class="page-bd-15" style="display: none" id="introduction">
		<div>《西方人文社科前沿述评：语言学》的内容，是一组关于学科前沿发展的综述文章，并不以普及语言学基础为宗旨，也不以没有语言学知识的初学者为目标读者。全书共分五大部分，我们称作“篇”，其顺序遵照一般由核心语言学延至边缘或相关分支的惯例。所包括的分支大体能代表当代语言学作为一个完整学科所应有的内容，但未见穷尽，各分支的内容也未求绝对的完善与均衡。</div>
	</div>


	<script src="asserts/weui/js/zepto.min.js"></script>


	<script src="asserts/weui/js/app-wechat.js.js"></script>

	<script src="asserts/layui/layui.js"></script>


	<script type="text/javascript">
		$(function() {

			 /*  wx.config({
			     debug: false,
			     appId: 'wxf8b4f85f3a794e77',
			     timestamp: 1420774989,
			     nonceStr: '2nDgiWM7gCxhL8v0',
			     signature: '1f8a6552c1c99991fc8bb4e2a818fe54b2ce7687',
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
			 });  */

			layui
					.use(
							'layer',
							function() {

								$(".addtowishlist").click(function() {
									$.toast("clicked add to wish list");
								});

								$("#book").click(
										function() {

											$.confirm("不好意思,你想借的书已经被借,你可以去预约",
													"去预约", function() {
														$.toast("预约被点击");
													}, function() {

													});

											//                $.toast("clicked add to wish list");

										});

								layer = layui.layer;

								$('#checkcomment').click(function() {

									layer.open({
										type : 1,
										title : '查看评论',
										content : $('#commentcheck'),
										btn : [ 'OK' ],
										area : [ '300px', '400px' ]
									});
								});

								$('#addcomment').click(function() {

									layer.open({
										type : 1,
										title : '输入评论',
										content : $('#commentadd'),
										btn : [ '确定' ],
										area : [ '300px', '400px' ]
									});

								});

								$('.rate-book')
										.click(
												function() {

													$(this)
															.removeClass(
																	'icon-49')
															.addClass('icon-48');
													var prevele = $(this)
															.prev();

													while (prevele
															.attr('class') != null) {
														prevele
																.removeClass(
																		'icon-49')
																.addClass(
																		'icon-48');
														prevele = prevele
																.prev();
													}

													var nextele = $(this)
															.next();
													while (nextele
															.attr('class') != null) {
														if (nextele
																.attr('class') === "icon rate-book icon-48") {
															nextele
																	.removeClass(
																			'icon-48')
																	.addClass(
																			'icon-49');
														}
														nextele = nextele
																.next();
													}

													//the following code will be moved to where comment form is submitted
													//to get the num of rating stars
													//                var allspans = $('.rate-book');
													//                var ratenum=0;
													//
													//                allspans.each(function () {
													//                    if ($(this).attr('class')==="icon rate-book icon-48"){
													//                        ratenum++;
													//                    }
													//
													//                });
													//
													//                alert(ratenum);

												});
								$('#check-qrcode').click(function() {

									layer.open({
										type : 1,
										title : '查看前言',
										content : $('#qrcode'),
										btn : [ '确定' ],
										area : [ '350px', '400px' ]
									});

								});

								$('#check-preface').click(function() {

									layer.open({
										type : 1,
										title : '查看前言',
										content : $('#preface'),
										btn : [ '确定' ],
										area : [ '300px', '400px' ]
									});

								});

								$('#check-catelog').click(function() {

									layer.open({
										type : 1,
										title : '查看目录',
										content : $('#catelog'),
										btn : [ '确定' ],
										area : [ '300px', '400px' ]
									});

								});

								$('#check-introduction').click(function() {

									layer.open({
										type : 1,
										title : '查看介绍',
										content : $('#introduction'),
										btn : [ '确定' ],
										area : [ '300px', '400px' ]
									});

								});

								var max = $('#count_max').text();
								$('#textarea')
										.on(
												'input',
												function() {
													var text = $(this).val();
													var len = text.length;
													$('#count').text(len);
													if (len > max) {
														$(this)
																.closest(
																		'.weui_cell')
																.addClass(
																		'weui_cell_warn');
													} else {
														$(this)
																.closest(
																		'.weui_cell')
																.removeClass(
																		'weui_cell_warn');
													}
												});

								//            layer.msg('hello',{icon:1,anim:6,time:1000});

							});

		});
	</script>


</body>
</html>