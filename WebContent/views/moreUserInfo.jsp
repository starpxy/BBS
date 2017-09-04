<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">

    <title>更多个人资料</title>

    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
</head>

<body ontouchstart style="background-color: #f8f8f8;">

<div class="weui-header bg-green">
    <div class="weui-header-left"><a class="icon icon-109 f-white" id="get-back">返回</a></div>
    <h1 class="weui-header-title">补充资料</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>
<form method="post" action="user-extraInfo" id="form" onsubmit="return check()">
<div class="weui_panel weui_panel_access">
    <div class="weui_panel_hd">学历信息</div>
    <div class="weui_panel_bd">


            <div class="weui_cell weui_cell_select weui_select_after">


                <div class="weui_cell_hd">
                    <label for="" class="weui_label f14">学历</label>
                </div>

                <div class="weui_cell_bd weui_cell_primary">
                    <select class="weui_select select2 f13" name="type">
                        <option value="1">本科以上</option>
                        <option value="0">本科以下</option>
                    </select>

                </div>


            </div>


            <div class="weui_cell" id="school_box">
                <div class="weui_cell_hd"><label for="" class="weui_label f14">选择学校:</label></div>

                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" type="text" value="北京 清华大学" name="school" id='school'/>
                </div>


            </div>

    </div>
</div>




<div class="page-hd-desc">

    <div class="weui_cells_title f14">企业邮箱</div>

    <div class="weui_cells weui_cells_form">

        <div class="weui_cell f14">
            <div class="weui_cell_hd"><label class="weui_label">邮箱</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" name="companyEmail" placeholder="请输入邮件">
            </div>

        </div>



    </div>

</div>
	<div class="weui_media_box weui_media_text">
					<!--<h4 class="weui_media_title">标题一</h4>-->
					<p class="weui_media_desc">
						<input id="submit" value="保存" class="weui_btn bg-green" type="submit">
					</p>
	</div>
</form>

<!--<div style="margin-top: 2px">&nbsp;</div>-->


<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/layui/layui.js"></script>

<script src="asserts/picker.js"></script>
<script src="asserts/chinaUniversityList.js"></script>
<script src="asserts/picker-city.js"></script>

<script>
   function check(){
	   var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
       if (reg.test($("input[name='companyEmail']").val())){
    	   layer.msg("修改成功",{icon:1,time:1000,anim:1});
           return true;
       }else{
           layer.msg("请输入正确的邮箱格式",{icon:2,time:1000,anim:6});
	       return false;
       }
    }
    $(function () {
        layui.use('layer', function () {
            layer = layui.layer;
            $("#get-back").click(function () {
                history.back();
            });


            //city Picker is actually school picker because some changes were made into the picker-city.js
            $("#school").cityPicker({
                title: "请选择您的学校",
                showDistrict: false
            });

			
            $("select[name='type']").change(function () {

                $("#low_edu_box").toggle();

                if ($("#low_edu_box").css('display')=="none"){
                    $("#school").trigger('click');
                }

                $("#school_box").toggle();

            });
        });

    });
</script>

</body>
</html>