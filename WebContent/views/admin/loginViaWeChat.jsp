<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>微信登录</title>
</head>

<style>
    body {
        color: #fff;
        background-color: rgb(51, 51, 51);
        padding: 50px;
    }

    .container_box {
        text-align: center;
        line-height: 1.6;
        position: relative;
        width: 100%;
        z-index: 1;
    }

    .qrcode {
        width: 280px;
        margin-top: 15px;
        border-radius:15px;
        border: 1px solid #E2E2E2; 
        box-shadow:10px 10px 5px #222222;
    }

    .info {
        width: 280px;
        margin: 0 auto;
    }

    .status {
        margin-top: 15px;
        background-color: #232323;
        border-radius: 100px;
        -moz-border-radius: 100px;
        -webkit-border-radius: 100px;
        box-shadow: inset 0 5px 10px -5px #191919, 0 1px 0 0 #444;
        -moz-box-shadow: inset 0 5px 10px -5px #191919, 0 1px 0 0 #444;
        -webkit-box-shadow: inset 0 5px 10px -5px #191919, 0 1px 0 0 #444;
        padding: 7px 14px;

    }

    p{
        font-size: 13px;
        margin: 0;
        font-weight: 400;
    }

    .status_succ p{
        color: #488d57;
    }
    .status_fail p{
        color: #b2202a;
    }


</style>
<body>


<div class="container_box">


    <div class="title">
        微信登录
    </div>


    <div>

        
        
        <div><img class="qrcode" src="scan.jpg"></div>

        <div class="info">

            <div class="status status_browser normal" id="wx_default_tip">
                <p>请使用微信扫描二维码登录</p>
                <p>“图书系统管理员端web”</p>
            </div>


            <div class="status status_succ normal" style="display:none" id="wx_after_scan">
                    <p>扫描成功</p>
                    <p>请在微信中点击确认即可登录</p>
            </div>


            <div class="status status_fail normal" style="display:none" id="wx_after_cancel">
                    <p>您已取消此次登录</p>
                    <p>您可再次扫描登录，或关闭窗口</p>
            </div>

        </div>
    </div>
</div>
<script src="asserts/jquery.min.js"></script>

<script>


    $(function () {
        
        
        //初始化qrcode img在这里
        //需要分返回后台二维码图片的src
        $.ajax({
            type: 'POST',
            url: 'xxx',
            data: {
                'xxx': xxx
            },
            dataType: 'json',
            success: function (data) {
                if (data.state==1){
                    //如果成功
                    $("#qrcode").attr("src",data.src);
                }
                
            },
            error: function (xhr, type) {
                //
            }
        });


        
        //通过定时任务不断发送ajax请求到后台,判读是否有管理员用微信扫码成功
        var id,count = 0;
        var timer;
        id = setInterval(function () {
            console.log("timer is running..."+id++);
            //send ajax here
            sendAjax();

        }, 1000);


        function sendAjax() {

//            var state=1;
//
//            if (state==0){
//                $(".status_browser").show();
//                $(".status_succ").hide();
//                $(".status_fail").hide();
//
//            } else if (state==1){
//                $(".status_browser").hide();
//                $(".status_succ").show();
//                $(".status_fail").hide();
//
//            }else if (state==2){
//                $(".status_browser").hide();
//                $(".status_succ").hide();
//                $(".status_fail").show();
//            }

            $.ajax({
                type: 'POST',
                url: 'xxx',
                data: {
                    'xxx': xxx
                },
                dataType: 'json',
                success: function (data) {

                    //针对后台返回的数据做出不同的界面显示
                    //0为默认状态[页面进入时的状态]
                    //1为扫码成功状态[页面进入时的状态]

                    if (data.state==0){
                        $(".status_browser").show();
                        $(".status_succ").hide();
                        $(".status_fail").hide();

                    } else if (data.state==1){
                        $(".status_browser").hide();
                        $(".status_succ").show();
                        $(".status_fail").hide();

                        setTimeout(function () {
                            //扫码认证成功后
                            //可以延时500ms 跳转到管理员主页面
                            window.location.href="mxxxx.jsp";
                        },500);
                    }else if (data.state==2){
                        $(".status_browser").hide();
                        $(".status_succ").hide();
                        $(".status_fail").show();
                    }


                },
                error: function (xhr, type) {
                    //
                }
            });

        }




    });


</script>


</body>

</html>