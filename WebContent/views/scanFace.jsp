<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>人脸识别</title>
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <style>
        button[type="submit"]:hover{
            background-color: #11a000;
        }
    </style>
</head>

<body ontouchstart style="background-color: #f8f8f8;">


<input type="file" hidden name="face">



<div class="msg_container">

    <form action="verifySuccess.jsp" method="post" enctype="multipart/form-data" id="upload_form">

    <img style="width: 100%;height:100%;"
         src="" id="face_img" hidden>

    <button class="weui_btn bg-green hide" type="submit">确认验证</button>

    </form>


</div>









<div style="margin-top: 50px">&nbsp;</div>

<div style="position:fixed;bottom: 0px;width: 100%" id="bottom_box">
    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <p class="weui_media_desc"><a href="javascript:;" class="weui_btn bg-green" id="get_face">点击验证</a></p>
            </div>
        </div>
    </div>
</div>


<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/layui/layui.js"></script>

<script>
    $(function () {

        layui.use('layer', function () {
            var layer = layui.layer;

            $("#get_face").click(function () {
                $("input[name='face']").trigger('click');

            });


            $("input[name='face']").change(function () {
                var firstfile = this.files[0];

                if (!firstfile.name.match(/.jpg|.gif|.png|.jpeg|.bmp/i)) {
                    return layer.msg("您选择的头像格式不正确，请重新选择！",{icon:2,anim:6,time:1000});

                }
                var size = 2 * 1024 * 1024;

                if (firstfile.size > size) {
                    layer.msg("请使用2MB以内的头像。",{icon:2,anim:6,time:1000});
                    return;
                }

                var faceUrl = getObjectURL(firstfile);
                $("#face_img").attr("src", faceUrl);
                $("#face_img").show(1000);

                $("button[type='submit']").show(1000);
                $("#bottom_box").hide();



//                var index=layer.load(2);

//
//                //这是前端为了测试而引出的timeout,与后台对接时需要添加一个ajax请求.
//
//                setTimeout(function () {
//
//                },2000);




            });



            function getObjectURL(file) {
                var url = null;
                if (window.createObjectURL != undefined) {
                    url = window.createObjectURL(file);
                } else if (window.URL != undefined) {
                    url = window.URL.createObjectURL(file);
                } else if (window.webkitURL != undefined) {
                    url = window.webkitURL.createObjectURL(file);
                }
                return url;
            }


        });


    });
</script>

</body>
</html>