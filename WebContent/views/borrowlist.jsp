<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>

</head>

<body ontouchstart class="page-bg">
    <div class="weui-header bg-green">
	    <div class="weui-header-left"><a class="icon icon-109 f-white" href="user-login">返回</a></div>
	    <h1 class="weui-header-title">我的待确认书单</h1>
	    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
	</div>
	<div class="page-hd">

    <span style="float: right;color: grey">共${request.records.size() }本</span>
    <span style="color: red">总计:${request.records.size()*0.01 }元</span>


</div>

<s:if test="#request.records.size()!=0">
<s:iterator value="#request.records">
<div class="weui-form-preview">
    <div>
        <div class="weui-form-preview-hd">
            <label class="weui-form-preview-label">付款金额</label>
            <em class="weui-form-preview-value">¥0.01</em>
        </div>

        <div class="weui-form-preview-bd">
            <p>
                <a href="book.html" style="color:orange">
                    <label class="weui-form-preview-label">书名</label>
                    <span class="weui-form-preview-value">${bookItem.book.bookTitle }</span>
                </a>
            </p>
            <p>
                <label class="weui-form-preview-label">添加日期</label>
                <span class="weui-form-preview-value">${updateAt }</span>
            </p>
        </div>

        <div class="weui-form-preview-ft">
            <a class="weui-form-preview-btn weui-form-preview-btn-primary cancel">取消</a>
            <input type="hidden" value="${borrowedId }" />
        </div>
    </div>

</div>

<h2>&nbsp;</h2>
</s:iterator>
</s:if>
<s:else>
	<br><br>
	<h2 align="center">暂无待确认书籍</h2>
</s:else>
<div style="margin-top: 100px">&nbsp;</div>

<div class="weui-footer-fixed-bottom page-bd">
    <div class="weui_panel weui_panel_access">
        <!--<div class="weui_panel_hd">文字组合列表</div>-->
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">

                <!--<h4 class="weui_media_title">标题一</h4>-->
                <p class="weui_media_desc"><a class="weui_btn bg-green" id="show-qrcode">显示借书二维码</a></p>

            </div>
        </div>
    </div>

</div>

<script src="asserts/weui/js/zepto.min.js"></script>


<script>
    $(function () {
    	 $('#back').click(function(){
             history.back();
         });
        $(".cancel").click(function () {
            var thisele = $(this);
            $.confirm("您确认取消吗?", "是的", function () {
                $.ajax({
                    type:'POST',
                    data:{"recordId":thisele.next().val()},
                    url:'borrowedRecord-cancel',
                    dataType : 'json',
                    success: function (data){
						if(data.state==1){
							$.toast('取消成功');
							window.location.href = 'borrowedRecord-borrowlist';
						}
						else if(data.state==2){
							$.toast('取消失败！下单用户与当前用户不符','wrong');
						}
						else if(data.state==3){
							$.toast('取消失败！订单状态有误','wrong');
						}
						else{
							$.toast('取消失败！未查询到订单','wrong');
						}
                     },
                    error: function(){
                    }
                });
            });
        });

        $("#show-qrcode").click(function () {
        	window.location.href = 'user-qrCode';
        });

    });

</script>

</body>
</html>
