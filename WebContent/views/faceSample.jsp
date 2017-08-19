<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>头像样本</title>


    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <style type="text/css">

        .delete-face, .weui_uploader_input,.weui_media_appmsg_thumb{
            cursor: pointer;
        }


    </style>
</head>

<body ontouchstart style="background-color: #f8f8f8;">

<div class="weui-header bg-green">
    <div class="weui-header-left"><a class="icon icon-109 f-white" id="get-back">返回</a></div>
    <h1 class="weui-header-title">头像样本</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>


<div class="weui_panel weui_panel_access">

    <div class="weui_panel_hd">头像样本上传 <span id="count-span">0</span>/2</div>

    <div class="weui_panel_bd">

        <a class="weui_media_box weui_media_appmsg">


            <div class="weui_media_hd">
                <img class="weui_media_appmsg_thumb" alt="样本一" >
            </div>


            <div class="weui_media_bd">

                <div class="weui_media_bd">
                    <div style="float: right;">
                        <img src="minus.png" class="delete-face">
                    </div>
                </div>

                <div class="weui_media_bd">
                    <div class="weui_uploader_input_wrp" style="float: right;margin-top: 10px">
                        <input class="weui_uploader_input" type="file" accept="image/*"/>
                    </div>
                </div>

            </div>
        </a>


        <a class="weui_media_box weui_media_appmsg">


            <div class="weui_media_hd">
                <img class="weui_media_appmsg_thumb" alt="样本二">
            </div>


            <div class="weui_media_bd">
                <div class="weui_media_bd">
                    <div style="float: right;">
                        <img src="minus.png" class="delete-face">
                    </div>
                </div>

                <div class="weui_media_bd">
                    <div class="weui_uploader_input_wrp" style="float: right;margin-top: 10px">
                        <input class="weui_uploader_input" type="file" accept="image/*"/>
                    </div>
                </div>

            </div>
        </a>
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

<div id="face-div" style="display: none;text-align: center">
    <img id="face-img">
</div>


<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/layui/layui.js"></script>
<script>
    $(function () {
        layui.use('layer', function () {
            layer = layui.layer;

            $("#get-back").click(function () {
                history.back();
            });

            $(".weui_media_appmsg_thumb").click(function () {
                var imgUrl = $(this).attr('src');
                $('#face-img').attr("src", imgUrl);
                $('#face-img').attr("width", '70%');

                layer.open({
                    type: 1,
                    title: '头像样本',
                    shadeClose: true,
                    content: $('#face-div'),
                    shade: 0.6,
                    btn: ['确定'],
                    area: ['300px', '400px']
                });
            });

            $(".delete-face").click(function () {

                var thisele=$(this);


                var src=thisele.parent().parent().parent().prev().children('img').attr('src');

                if(src==null ||src ==""){
                    return layer.msg('不存在',{icon:2,anim:6,time:1000});
                }


                $.confirm("你确认删除?", "确认删除", function (text) {

                    var index=layer.load(2);

                    var tag=thisele.parent().parent().parent().prev().children('img').attr('alt');

                    //setTimeout 方法为了前端测试而写，和后台整合时，可以删除
                    setTimeout(function () {
                        console.log(tag);
                        thisele.parent().parent().parent().prev().children('img').attr('src',"");
                        layer.close(index);
                        layer.msg("删除成功!",{icon:1,anim:2,time:1000});
                        refreshCount();
                    },1000);


                    $.ajax({
                        type: 'POST',
                        url: 'xxx',
                        data: {
                            'tag': tag
                        },
                        dataType: 'json',
                        success: function (data) {

                            thisele.parent().parent().parent().prev().children('img').attr('src',"");
                            layer.close(index);
                            layer.msg("删除成功!",{icon:1,anim:2,time:1000});

                            refreshCount();


                        },
                        error: function (xhr, type) {
                            //
                        }
                    });



                }, function () {

                });


            });

            $("input[type='file']").change(function () {

                var firstfile = this.files[0];
//                console.log(firstfile);

                if (!firstfile.name.match(/.jpg|.gif|.png|.jpeg|.bmp/i)) {
                    return layer.msg('您上传的图片格式不正确，请重新选择！',{icon:2,anim:6,time:1000});
                }

                var size = 3 * 1024 * 1024;

                if (firstfile.size > size) {
                    return layer.msg('上传失败，请上传3MB以内的图片。',{icon:2,anim:6,time:1000});
                }

                var objUrl = getObjectURL(firstfile);


                if (objUrl) {
                    $(this).parent().parent().parent().prev().children('img').attr('src',objUrl);
                    refreshCount();
                }


            });

            function refreshCount() {

                var count=0;
                $('.weui_media_appmsg_thumb').each(function () {

                    if ($(this).attr('src')!=null&& $(this).attr('src')!=""){
                        count+=1;
                    }
                });
                $("#count-span").text(count);
            }


            $("#upload").click(function () {




                if ($("#count-span").text()=="0"){
                    return layer.msg('请至少上传一张头像样本',{icon:2,anim:6,time:1000});
                }

                $.confirm("你确认上传这张图片?", "确认上传", function (text) {

                    var index=layer.load(2);

                    var faces=new Array();

//                    setTimeout(function () {
//                        layer.close(index);
//                    },2000);


                    $("input[type='file']").each(function () {
                        if ($(this).val()!=""){
                            faces.push(this.files[0]);
                        }
                    });

//                    var formData = new FormData();
//                    var name = $("input").val();
//                    formData.append("file",$("#upload")[0].files[0]);
//                    formData.append("name",name);
                    console.log(faces);


                    $.ajax({
                        type: 'POST',
                        url: 'xxx',
                        data: {
                            'faces': faces
                        },
                        dataType: 'json',
                        success: function (data) {
                            //TODO 2
                            layer.close(index);
                            layer.msg("上传成功!",{icon:1,anim:2,time:1000});
                        },
                        error: function (xhr, type) {
                            //
                        }
                    });


                }, function () {




                });


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


        });


    });
</script>

</body>
</html>