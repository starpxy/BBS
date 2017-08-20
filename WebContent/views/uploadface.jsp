<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>更改头像</title>

    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <link rel="stylesheet" href="asserts/Jcrop/jquery.Jcrop.css" type="text/css"/>

    <style type="text/css">

        #outer {
            display: none;
            margin: 50px auto;
            background: white;
            padding: 0 auto;
        }

        #aa {
            width: 100px;
            height: 100px;
            overflow: hidden;
            border-radius: 100px;
        }

        .footer{
            display: none;
        }
    </style>


</head>

<body ontouchstart style="background-color: #f8f8f8;">

<div class="weui-header bg-green">
    <div class="weui-header-left"><a href="userinfo.jsp" class="icon icon-109 f-white">返回</a></div>
    <h1 class="weui-header-title">更改头像</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>

<form id="myupload" enctype="multipart/form-data" method="post">
<div class="weui_cell">
    <div class="weui_cell_bd weui_cell_primary">

        <div class="weui_uploader">

            <a class="weui_uploader_hd weui_cell tcenter" href="javascript:;">
                <!--<div class="weui_cell_bd weui_cell_primary">选择头像</div>-->
            </a>

            <div class="weui_uploader_bd">

                <a class="weui_uploader_input_wrp" href="javascript:;">


                    <input class="weui_uploader_input" type="file" accept="image/*" id="file0">


                </a>

            </div>

        </div>
    </div>
</div>
</form>

<div id="outer">
    <div class="jcExample">
        <div class="article">

            <table width="100%" align="center" style="padding: 10px">

                <tr>
                    <td>
                        <img id="target" alt="images"/>
                    </td>

                    <td>
                        <div style="width:100px;height:100px;overflow:hidden;border-radius: 100px;" id="aa">
                            <img id="preview" alt="Preview" class="jcrop-preview"/>
                        </div>
                    </td>
                </tr>

            </table>
        </div>
    </div>
</div>

<div style="margin-top: 50px">&nbsp;</div>

<div style="position:fixed;bottom: 0px;width: 100%" class="footer">
    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">

                <input type="file" name="face" id="real-img" hidden>

                <p class="weui_media_desc"><a href="javascript:;" class="weui_btn bg-green" id="upload">上传 <i
                        class="icon icon-20 f-white"></i></a></p>
            </div>
        </div>
    </div>
</div>


<script src="asserts/jquery.min.js"></script>
<script src="asserts/Jcrop/jquery.Jcrop.min.js"></script>
<script src="asserts/layui/layui.js"></script>
<script src="asserts/jquery.form.js"></script>
<script type="text/javascript">
    $(function () {

        var global_api;
        var face;
        var bs;


        var center = (parseInt($(window).width())/2) - (parseInt($('.weui_uploader_input_wrp').css("width"))/2);
        $('.weui_uploader_input_wrp').css("margin-left", center + "px");

        $(window).resize(function () {
            var center = (parseInt($(window).width())/2) - (parseInt($('.weui_uploader_input_wrp').css("width"))/2);
            $('.weui_uploader_input_wrp').css("margin-left", center + "px");
        });


//
        $("#upload").click(function () {
 
        	//          var formData = new FormData();
//          var name = $("input").val();
//          formData.append("file",$("#upload")[0].files[0]);
//          formData.append("name",name);
            //TODO 经测试,这里获得的face (input file类型) 和 global_api 数据可靠
            //下面ajax 传递的参数是后台截图上传必要的参数,face:图片源文件
            //x:截图位置x坐标  y:截图位置y坐标  w:截图的宽度  h:截图的高度  tw: id 为 target的img标签的宽度  th:id 为 target的img标签的高度
            //后台须知:上传给后台是图片原文件, 但是我们要保存的是截图. 所以需要后台做的是, 根据前端提供的这些关键参数,从原图中获取截图,之后再保存截图
            //大概算法是: 代码得到原图的宽度 rw,和高度rh. 所以在target中的截图x点实际上相当于原图的x*rw/tw, 截图y点实际上相当于原图的y*rh/th,  w, h 类似方式对应就可以了
			//可以参考package com.bbs.api.ImageCut中的代码
			// TODO
			layui.use(
        					'layer',
        					function() {
			 $("#myupload").ajaxForm({
                dataType: 'json',
                data:{"x":1},
                beforeSend: function () {
                	layer.msg('上传中...请稍候', {
						icon : 16,
						shade : 0.01
					});
                },
                success: function (data) {


                    if (data.msg == 'success') {

                        layer.msg("uploaded successfully", {icon: 1, anim: 1, time: 1000});


                    } else if(data.msg==="exist"){
                        layer.msg("the file was already in your file list!", {icon: 2, anim: 6, time: 1000});
                    } else {
                        layer.msg("wrong!", {icon: 2, anim: 6, time: 1000});
                    }

                },
                error: function () {
                    alert();
                    layer.msg("maybe you have already had this file in your file list!", {
                        icon: 2,
                        anim: 6,
                        time: 1000
                    });
                
                }
            });
		});
            
            $.ajax({
                type: 'POST',
                url: 'user-uploadAvatar',
                data: {
                    'face': face,
                    "x": global_api.x,
                    "y": global_api.y,
                    "w": global_api.w,
                    "h": global_api.h,
                    "tw": bs[0],	//左图宽度
                    "th": bs[1]		//左图高度
                },
                dataType: 'json',
                success: function (data) {
                    //TODO 2
                    // if success,  jump to userinfo page
                    window.location.href="userinfo.jsp";
                },
                error: function (xhr, type) {
                    //
                   	alert('error');
                }
            });

        });

        $("#file0").change(function () {
            // getObjectURL是自定义的函数，见下面
            // this.files[0]代表的是选择的文件资源的第一个，因为上面写了 multiple="multiple" 就表示上传文件可能不止一个
            // ，但是这里只读取第一个
            var firstfile = this.files[0];

            if (!firstfile.name.match(/.jpg|.gif|.png|.jpeg|.bmp/i)) {
                return alert("您上传的图片格式不正确，请重新选择！");
            }

            var size = 3 * 1024 * 1024;
            if (firstfile.size > size) {
                alert("上传失败，请上传3MB以内的图片。");
                return;
            }

            var objUrl = getObjectURL(firstfile);

            if (objUrl) {

                $(".weui_cell").hide();
                $("#target").attr("width", "100%");
                $("#target").attr("src", objUrl);
                $("#preview").attr("src", objUrl);
                $("#outer").show();
                $(".footer").show();
                cutInit();
                face = firstfile;
            }
        });


        function getObjectURL(file) {
            var url = null;
            // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
            if (window.createObjectURL != undefined) { // basic
                url = window.createObjectURL(file);
            } else if (window.URL != undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file);
            } else if (window.webkitURL != undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file);
            }
            return url;
        }


        function cutInit() {
            new cutImage().init();

            function cutImage() {
                var oop = this;
                this.option = {
                    x: 10,
                    y: 10,
                    w: 100,
                    h: 100,
                    t: 'target',
                    p: 'preview',
                    o: 'aa'
                };
                this.init = function () {
                    oop.target();
                };

                this.target = function () {

                    $('#' + oop.option['t']).Jcrop({
                        onChange: oop.updatePreview,
                        onSelect: oop.updatePreview,
                        aspectRatio: 1,
                        setSelect: [oop.option['x'], oop.option['y'], oop.option['w'], oop.option['h']],
                        bgFade: true,
                        bgOpacity: .5
                    }, function () {
                        bs = this.getBounds();

                    });

                };
                this.updatePreview = function (obj) {
                    if (parseInt(obj.w) > 0) {

                        var rx = $('#' + oop.option['o']).width() / obj.w;
                        var ry = $('#' + oop.option['o']).height() / obj.h;

                        $('#' + oop.option['p']).css({
                            width: Math.round(rx * $('#' + oop.option['t']).width()) + 'px',
                            height: Math.round(ry * $('#' + oop.option['t']).height()) + 'px',
                            marginLeft: '-' + Math.round(rx * obj.x) + 'px',
                            marginTop: '-' + Math.round(ry * obj.y) + 'px'
                        });
                        global_api = obj;
                    }
                }
            }
        }

    });
</script>

</body>
</html>