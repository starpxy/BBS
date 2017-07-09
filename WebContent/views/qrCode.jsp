<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>我的二维码</title>
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <link rel="stylesheet" href="asserts/layui/css/layui.css"/>
</head>

<body ontouchstart style="background-color: #439057;">

<div class="weui-header" style="background-color: #439057">
    <div class="weui-header-left"><a href="user-login" class="icon icon-109 f-white">返回</a></div>
    <h1 class="weui-header-title">我的二维码</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>


<div class="weui_panel weui_panel_access page-hd" style="margin:10px;margin-top: 50px;height: 60%">
    <div class="weui_panel_hd"><a class="icon icon-83 tright f-gray" style="color: #a2beab;float: right;"></a><a
            class="icon icon-33" style="color: #a2beab"> 付款</a></div>

    <div class="weui_panel_bd tcenter">

        <a id="qrcode"><img src="" style="margin-top: 20px; width:80%"></a>

    </div>
    <!--<a class="weui_panel_ft" href="javascript:void(0);">查看更多</a>-->
</div>


<div style="background-color: #439057" class="weui_panel weui_panel_access">
    <!--<p class="f-white" style="margin:0 auto">智能借阅系统</p>-->


    <a id="return-book" class="weui_panel_ft f-white" id="check-preface"><i class="icon icon-86"></i> 还书</a>
    <a id="borrow-detail" class="weui_panel_ft f-white" id="check-catelog"><i class="icon icon-67"> 借书详情</i></a>
    <a id="return-detail" class="weui_panel_ft f-white" id="check-introduction"><i class="icon icon-67"></i>
        还书详情
    </a>
</div>

<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/layui/layui.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>
<script>
    $(function () {

        layui.use('layer', function () {
            
            $.ajax({
        		type:'POST',
                url:'user-initialAPI',
                dataType : 'json',
                data: {"url":"http://pxyzmy.com.cn/BBS/views/user-qrCode"},
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
        	layer.msg("发送ajax异常", {anim: 1, icon: 2, time: 2000});
        }
    });
           
            //初始化qrcode
            $.ajax({
                type: 'POST',
                url: 'user-showQrCode?userId=${session.user.userId}',//由star填写
                dataType: 'json',
                success: function (data) {
                    //为qrcode img赋值
                    var qrcode = data.QrCode;
                    $("#qrcode img").attr("src", qrcode);
                },
                error: function (xhr, type) {
                    layer.close(index);
                }

            });


            //每1000毫秒刷新二维码
            setInterval(function () {


                $.ajax({
                    type: 'POST',
                    url: 'user-showQrCode?userId=${session.user.userId}',//由star填写
                    dataType: 'json',
                    success: function (data) {
                        //为qrcode img赋值
                        var qrcode = data.QrCode;
                        $("#qrcode img").attr("src", qrcode);
                    },
                    error: function (xhr, type) {
                        layer.close(index);
                    }

                });

            }, 1000);

          //每1000毫秒刷新paystate
            var intervalId = setInterval(function () {


                $.ajax({
                    type: 'POST',
                    url: 'user-payState',//由star填写
                    dataType: 'json',
                    success: function (data) {
                        if (data.pay == 1) {
                            var params = $.parseJSON(data.params);
                            var recordIds=[];
                            var i = 0;
                            for (i=0;i<data.payState.length;i++){
                                recordIds[i] = data.payState[i].borrowedId;
                             }
                            //调起微信支付
                            clearInterval(intervalId);
                            function onBridgeReady() {
                                WeixinJSBridge.invoke(
                                        'getBrandWCPayRequest', {
                                            "appId": "" + params.appId + "",     //公众号名称，由商户传入
                                            "timeStamp": "" + params.timeStamp + "",         //时间戳，自1970年以来的秒数
                                            "nonceStr": "" + params.nonceStr + "", //随机串
                                            "package":  ""+params.pac+ "",
                                            "signType": "MD5",         //微信签名方式：
                                            "paySign": "" + params.paySign + "" //微信签名
                                        },
                                        function (res) {
                                            if (res.err_msg == "get_brand_wcpay_request:ok") {
                                            	 $.ajax({
                                                     type: 'POST',
                                                     data:{"outTradeNumber":data.payState.outTradeNumber,"ids":JSON.stringify(recordIds)},
                                                     url: 'user-paySucceed',//由star填写
                                                     dataType: 'json',
                                                     success: function (data) {
                                                    	 layer.msg("支付成功",{anim:1,icon:1,time:1000});
                                                     },
                                                     error: function (xhr, type) {
                                                     }

                                                 });                                                                                
                                            }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                                            else if (res.err_msg == "get_brand_wcpay_request:fail") {
                                            	alert(JSON.stringify(res));
                                            	layer.msg("微信服务器异常",{anim:6,icon:2,time:1000});
                                            }
                                        }
                                );
                            }
							
                            if (typeof WeixinJSBridge == "undefined") {
                                if (document.addEventListener) {
                                    document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                                } else if (document.attachEvent) {
                                    document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                                    document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                                }
                            } else {
                                onBridgeReady();
                            }
                            wx.error(function (res) {
                                alert(res.errMsg);
                            });
                         } else {
                            
                        }
                    },
                    error: function (xhr, type) {
                        layer.close(index);
                    }

                });

            }, 1000);

            //点击刷新
            $("#qrcode").click(function () {

                var index = layer.load(2);
                $.ajax({
                    type: 'POST',
                    url: 'user-showQrCode?userId=${session.user.userId}',//由star填写-请求二维码地址链接
                    dataType: 'json',
                    success: function (data) {

                        //为qrcode img赋值
                        var qrcode = data.QrCode;
                        $("#qrcode img").attr("src", qrcode);
                        layer.close(index);
                    },
                    error: function (xhr, type) {
                        layer.close(index);
                    }

                });

            });
        });
    });
</script>

</body>
</html>