<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    <div class="weui-header-left"><a class="icon icon-109 f-white" id="back" href="user-login">返回</a></div>
	    <h1 class="weui-header-title">待确认书单</h1>
	    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
	</div>
	<div class="page-hd">

    <span style="float: right;color: grey">共2本</span>
    <span style="color: red">总计:4元</span>


</div>


<div class="weui-form-preview">
    <div>
        <div class="weui-form-preview-hd">
            <label class="weui-form-preview-label">付款金额</label>
            <em class="weui-form-preview-value">¥2.00</em>
        </div>

        <div class="weui-form-preview-bd">
            <p>
                <a href="book.html" style="color:orange">
                    <label class="weui-form-preview-label">书名</label>
                    <span class="weui-form-preview-value">麦田里的守望者</span>
                </a>
            </p>
            <p>
                <label class="weui-form-preview-label">借书日期</label>
                <span class="weui-form-preview-value">2017-05-16</span>
            </p>
            <p>
                <label class="weui-form-preview-label">应还日期</label>
                <span class="weui-form-preview-value">2017-06-16</span>
            </p>
        </div>

        <div class="weui-form-preview-ft">
            <a class="weui-form-preview-btn weui-form-preview-btn-primary cancel">取消</a>
        </div>
    </div>

</div>

<h2>&nbsp;</h2>
<div class="weui-form-preview">
    <div>
        <div class="weui-form-preview-hd">
            <label class="weui-form-preview-label">付款金额</label>
            <em class="weui-form-preview-value">¥2.00</em>
        </div>
        <div class="weui-form-preview-bd">
            <p>
                <a href="book.html" style="color:orange">
                    <label class="weui-form-preview-label">书名</label>
                    <span class="weui-form-preview-value">月亮和六便士</span>
                </a>
            </p>
            <p>
                <label class="weui-form-preview-label">借书日期</label>
                <span class="weui-form-preview-value">2017-05-16</span>
            </p>
            <p>
                <label class="weui-form-preview-label">应还日期</label>
                <span class="weui-form-preview-value">2017-06-16</span>
            </p>
        </div>

        <div class="weui-form-preview-ft">
            <a class="weui-form-preview-btn weui-form-preview-btn-primary cancel">取消</a>
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
                <p class="weui_media_desc"><a class="weui_btn bg-green" id="show-qrcode">显示借书二维码</a></p>

            </div>
        </div>
    </div>

</div>

<script src="asserts/weui/js/zepto.min.js"></script>


<script>
    $(function () {

        $(".cancel").click(function () {
            var thisele = $(this);
            $.confirm("您确认取消吗?", "是的", function () {
                $.toast('已取消');
                thisele.parent().parent().hide();
            });
        });

        $("#show-qrcode").click(function () {
            $.toast('clicked');
        });

    });

</script>

</body>
</html>
