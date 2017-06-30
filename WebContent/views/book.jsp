<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>book</title>
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <link rel="stylesheet" href="asserts/layui/css/layui.css"/>
    <!--<link rel="stylesheet" href="asserts/mycss/index.css">-->


</head>
<body ontouchstart style="background-color: #f8f8f8;">

<div class="weui-header bg-green">
    <div class="weui-header-left"><a class="icon icon-109 f-white" id="back" href="">返回</a></div>
    <h1 class="weui-header-title">${request.book.bookTitle }</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>

<div class="page-hd-desc">


    <div class="weui_panel weui_panel_access" id="bookdesc">
        <div class="weui_panel_hd">图书概述</div>

        <div class="weui_panel_bd">
            <img src="${request.book.simpleChart }" width="100%" height="400px">

            <div class="weui_media_box weui_media_text">

                <h4 class="weui_media_title" style="float: right">
                    <div class="weui-border-l"> &nbsp;&nbsp;<a class="addtowishlist f-black"><span
                            class="icon icon-49"></span>收藏</a></div>
                </h4>

                <h1 class="weui_media_title f-black">${request.book.bookTitle }</h1>

            </div>

            <div class="weui_media_box weui_media_text f-black">
                <h4 class="weui_media_desc" style="float: right">库存${request.book.bookVolume }本</h4>
                <h4 class="weui_media_title f-red">1元/月</h4>

                <h4 class="weui_media_desc" style="float: right">上书时间 ${request.book.updateAt }</h4>
                <h4 class="weui_media_desc">种类:${request.book.type }</h4>

            </div>

        </div>
        <a class="weui_panel_ft" id="check-qrcode">查看二维码</a>
    </div>


    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_hd">图书详情</div>

        <div class="weui_panel_bd">

            <div class="weui_media_box weui_media_text">

                <h4 class="weui_media_desc" style="float: right">${request.book.author }</h4>

                <h4 class="weui_media_desc f-black">作者</h4>

            </div>

            <div class="weui_media_box weui_media_text">

                <h4 class="weui_media_desc" style="float: right">${request.book.isbn }</h4>

                <h4 class="weui_media_desc f-black">ISBN码</h4>

            </div>


            <div class="weui_media_box weui_media_text">

                <h4 class="weui_media_desc" style="float: right">${request.book.publisher }</h4>

                <h4 class="weui_media_desc f-black">出版商</h4>

            </div>

            <div class="weui_media_box weui_media_text">

                <h4 class="weui_media_desc" style="float: right">${request.book.versionNumber }</h4>

                <h4 class="weui_media_desc f-black">版本</h4>

            </div>


        </div>

        <a href="javascript:void(0);" class="weui_panel_ft f-black" id="check-preface">前言</a>
        <a href="javascript:void(0);" class="weui_panel_ft f-black" id="check-catelog">目录</a>
        <a href="javascript:void(0);" class="weui_panel_ft f-black" id="check-introduction">介绍</a>
        <a href="javascript:void(0);" class="weui_panel_ft">更多</a>

    </div>


    <div class="page-hd-desc">
        <div class="weui_panel weui_panel_access">
            <div class="weui_panel_bd">
                <div class="weui_media_box weui_media_text f-black">

                    <h4 class="weui_media_title">图书评价&nbsp;&nbsp;&nbsp;&nbsp;<span class="icon icon-48"></span><span
                            class="icon icon-48"></span><span class="icon icon-48"></span><span
                            class="icon icon-48"></span><span class="icon icon-49"></span></h4>


                    <p class="weui_media_desc">
                    <div class="weui_btn_area weui_btn_area_inline">
                        <a href="javascript:;" class="weui_btn weui_btn_plain_default" id="checkcomment">查看评论</a><a
                            href="javascript:;"
                            class="weui_btn weui_btn_plain_primary" id="addcomment">发表评论</a>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>

<div style="margin-top: 100px">&nbsp;</div>

<div style="position:fixed;bottom: 0px;width: 100%">
    <div class="weui_panel weui_panel_access">
        <!--<div class="weui_panel_hd">文字组合列表</div>-->
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <!--<h4 class="weui_media_title">标题一</h4>-->
                <p class="weui_media_desc"><a href="javascript:;" class="weui_btn bg-green" id="book">预订</a ></p >
            </div>
        </div>
    </div>
</div>

<div class="page-bd-15" style="display: none" id="commentcheck">
    <div class="weui_cells_title">用户评论</div>
    <ul id="usercomments" class="weui-comment">
    </ul>
</div>


<div class="page-bd-15" style="display: none" id="commentadd">

    <!--<div class="weui_cells_title">输入评论</div>-->

    <div class="weui_cells weui_cells_form">


        <div class="weui_cell">


            <div class="weui_cell_bd weui_cell_primary">
                <form action="comment-createComment" method="post" id="commentform">
                    <textarea id="textarea" name="content" class="weui_textarea" placeholder="请输入评论" rows="8"></textarea>
                </form>
                <div class="weui_textarea_counter"><span id='count'>0</span>/<span id='count_max'>120</span></div>
            </div>
        </div>

        <div class="weui_cell">

            <span class="icon icon-49 rate-book"></span><span
                class="icon icon-49 rate-book"></span><span class="icon icon-49 rate-book"></span><span
                class="icon icon-49 rate-book"></span><span class="icon icon-49 rate-book"></span>
        </div>

    </div>


</div>



<div class="page-bd-15" style="display: none" id="qrcode">
    <!--http://qr.liantu.com/api.php?text=http://congcongxyz.cn/booksubmit?bookid=12&bg=f3f3f3&fg=ff2200&gc=22ff22&w=300&el=l-->
    <img src="asserts/images/qrcode/api.png">
</div>


<div class="page-bd-15" style="display: none" id="preface">
    <div>${request.book.preface }</div>
</div>

<div class="page-bd-15" style="display: none" id="catelog">
    <div>
        ${request.book.directory }
    </div>
</div>

<div class="page-bd-15" style="display: none" id="introduction">
    <div>${request.book.introduction }</div>
</div>


<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/weui/js/app-wechat.js.js"></script>
<script src="asserts/layui/layui.js"></script>
<!--TODO-->

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>

<script type="text/javascript">

    $(function () {
        	$('#book').click(function(){
        		 $.ajax({
                     type:'POST',
                     data:{"bookId":'${request.book.bookId}'},
                     url:'reservation-reserve',
                     dataType : 'json',
                     success: function (data){
                    	 if(data.state==1){
                    		 layer.msg('预定成功！',{icon:1,anim:2,time:2000});
                    		 $.ajax({
                                 type:'POST',
                                 data:{"bookTitle":'${request.book.bookTitle}'},
                                 url:'reservation-templatePushing',
                                 dataType : 'json',
                                 success: function (data){
            					 },
                                 error: function(){
                                 }
                             });
                       	 }
                    	 else if (data.state==2){
                    		 layer.msg('对不起，这本书已经被订光了，晚点来试试吧！',{icon:2,anim:2,time:2000});
                       	 }
                    	 else{
                    		 layer.msg('您最多可同时预定两本书！',{icon:2,anim:2,time:2000});
                         }
					 },
                     error: function(){
                         layer.msg('服务器错误',{icon:2,anim:6,time:1000});
                     }
                 });
           	});
            layui.use('layer', function () {
                $(".addtowishlist").click(function () {
                    $.toast("clicked add to wish list");
                });



                layer = layui.layer;


                $('#checkcomment').click(function () {

                    layer.open({
                        type: 1,
                        title: '查看评论',
                        content: $('#commentcheck'),
                        btn: ['yes'],
                        area: ['300px', '400px']
                    });
                    $.ajax({
                        type:'POST',
                        url:'book-showComments?bookId=${request.book.bookId}',
                        dataType : 'json',
                        success: function (data){
                            var result='<ul id="usercomments" class="weui-comment">';
                            var lists = $.parseJSON(data.lists);
							for (var i = 0; i < lists.length; i++) {
	                        	result+='<li class="weui-comment-item">'
						        	+'<div class="weui-comment-li"><span class="check checked"> <i'
				                    +'class="weui-comment-icon"></i> <span class="weui-comment-num"></span>'+lists[i].starClass+'</span></div>'
				            		+'<div class="userinfo"><strong class="nickname">'+lists[i].user.name+'</strong> <img class="avatar" src="asserts/images/faces/wechat.gif"></div>'
				            		+'<div class="weui-comment-msg"><span class="status"></span>'+lists[i].content+'</div>'
				            		+'<p class="time">'+(lists[i].updateAt.month+1)+'月'+lists[i].updateAt.date+'日</p></li>';
							}
							result+='</ul>';
							$('#usercomments').replaceWith(result);
                        },
                        error: function(){
                            layui.use('layer', function(){
                                layer.msg('服务器错误',{icon:2,anim:2,time:2000});
                            });
                        }
                    });
                });

                $('#back').click(function(){
                    history.back();
                });

                $('#addcomment').click(function () {

                    layer.open({
                        type: 1,
                        title: '输入评论',
                        content: $('#commentadd'),
                        shadeClose: true,
                        shade: false,
                        maxmin: true,
                        btn: ['确定'],
                        yes:function(){
                            $.ajax({
                                type:'POST',
                                data:{"content":$('#textarea').val(),"starClass":$('.rate-book.icon-48').size()},
                                url:'comment-makeComment',
                                dataType : 'json',
                                success: function (data){
                                    if(data.state==1){
                                        layer.closeAll();
                                        layer.msg('评论成功',{icon:1,anim:2,time:1000});
                                        $('#textarea').val('');
                                    }
                                    else{
                                        layer.closeAll();
                                        $('#textarea').val('');
                                        layer.msg('您已经评论过此书',{icon:3,anim:2,time:1000});
                                    }
                                },
                                error: function(){
                                    layer.msg('服务器错误',{icon:2,anim:2,time:1000});
                                }
                            });
                        },
                        area: ['300px', '400px']
                    });

                });



                $('.rate-book').click(function () {

                    $(this).removeClass('icon-49').addClass('icon-48');
                    var prevele = $(this).prev();

                    while (prevele.attr('class')!=null){
                        prevele.removeClass('icon-49').addClass('icon-48');
                        prevele=prevele.prev();
                    }

                    var nextele = $(this).next();
                    while (nextele.attr('class')!=null){
                        if (nextele.attr('class')==="icon rate-book icon-48"){
                            nextele.removeClass('icon-48').addClass('icon-49');
                        }
                        nextele=nextele.next();
                    }

                });
                $('#check-qrcode').click(function () {


                    layer.open({
                        type: 1,
                        title: '查看前言',
                        content: $('#qrcode'),
                        btn: ['确定'],
                        area: ['350px', '400px']
                    });

                });


                $('#check-preface').click(function () {
                    layer.open({
                        type: 1,
                        title: '查看前言',
                        content: $('#preface'),
                        btn: ['确定'],
                        area: ['300px', '400px']
                    });
                });


                $('#check-catelog').click(function () {


                    layer.open({
                        type: 1,
                        title: '查看目录',
                        content: $('#catelog'),
                        btn: ['确定'],
                        area: ['300px', '400px']
                    });


                });


                $('#check-introduction').click(function () {

                    layer.open({
                        type: 1,
                        title: '查看介绍',
                        content: $('#introduction'),
                        btn: ['确定'],
                        area: ['300px', '400px']
                    });


                });


                var max = $('#count_max').text();
                $('#textarea').on('input', function () {
                    var text = $(this).val();
                    var len = text.length;
                    $('#count').text(len);
                    if (len > max) {
                        $(this).closest('.weui_cell').addClass('weui_cell_warn');
                    }
                    else {
                        $(this).closest('.weui_cell').removeClass('weui_cell_warn');
                    }
                });

//layer.msg('hello',{icon:1,anim:6,time:1000});


            });
  });




</script>


</body>
</html>