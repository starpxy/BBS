<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Register Page</title>

    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <link rel="stylesheet" href="asserts/mycss/index.css">
</head>


<div class="page-hd">
    <div class="tcenter">用户注册</div>

    <form id="form" method="post" action="login.html">

        <div class="weui_cells_title">帐号</div>

        <div class="weui_cells">
            <div class="weui_cell weui_cell_select weui_select_before">

                <div class="weui_cell_hd">
                    <select class="weui_select" name="select2">
                        <option value="1">微信号</option>
                        <option value="2">手机号</option>
                    </select>
                </div>

                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" type="text" maxlength="21" placeholder="请输入帐号" pattern="[0-9a-zA-Z]{6,21}"
                           notMatchTips="请输入正确的帐号" required emptyTips="请输入帐号"/>
                </div>

            </div>


        </div>


        <div class="weui_cells_title">其他信息</div>
        <div class="weui_cells weui_cells_form">

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">身份证号</label></div>

                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" type="number" required pattern="[0-9]{18}" placeholder="请输入身份证号"
                           emptyTips="请输入身份证号" maxlength="18" notMatchTips="请输入正确的身份证号"/>
                </div>

                <div class="weui_cell_ft">
                    <i class="weui_icon_warn"></i>
                </div>

            </div>


            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">密码</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" type="password" required placeholder="输入你的密码" emptyTips="请输入密码">
                </div>
                <div class="weui_cell_ft">
                    <i class="weui_icon_warn"></i>
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">确认密码</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" type="password" required placeholder="请再次输入你的密码" emptyTips="请再次输入密码">
                </div>
                <div class="weui_cell_ft">
                    <i class="weui_icon_warn"></i>
                </div>
            </div>


            <div class="weui_cell">

                <div class="weui_cell_hd"><label for="" class="weui_label">性别</label></div>

                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" type="text" required placeholder="点击选择性别" emptyTips="请选择性别" id='d2'/>
                </div>

                <div class="weui_cell_ft">
                    <i class="weui_icon_warn"></i>
                </div>

            </div>


        </div>

        <label for="weuiAgree" class="weui-agree">
            <input id="weuiAgree" class="weui-agree-checkbox" checked value="on" type="checkbox">
            <span class="weui-agree-text">
                阅读并同意<a href="javascript:void(0);">《相关条款》</a>
            </span>
        </label>


        <div class="weui_btn_area">
            <a class="weui_btn weui_btn_primary bg-blue" id="registersubmit">注册</a>
        </div>


    </form>


</div>

<div class="weui_cells_title" style="height:60px;">&nbsp;</div>
<div class="weui-footer weui-footer-fixed-bottom">

    <p class="weui-footer-links">
        <a href="javascript:void(0);" class="weui-footer-link">About Us</a>
        <a href="javascript:void(0);" class="weui-footer-link">Learn More</a>
    </p>
    <p class="weui-footer__text">Copyright &copy; 2017-Book Lending System </p>

</div>


<body>

<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/weui/js/picker.js"></script>
<script src="asserts/weui/js/select.js"></script>
<script type="text/javascript">
    $(function () {

        $("#d2").select({
            title: "选择性别",
            autoClose: true,
            items: ['男', '女']
        });

    });

    //888888888888888888
    var $form = $("#form");
    $form.form();
    $("#registersubmit").on("click", function () {


        if (!$("#weuiAgree").get(0).checked){
            $.toptips("你需要赞同相关协议");
            return false;
        }
            $form.validate(function (error) {
                if (error) {

                } else {

                    $.showLoading("注册中");
                    setTimeout(function () {
                        $.hideLoading();
                        $.alert('注册成功', '成功', function () {
                            $form.submit();
                        });
                    }, 2000);

//
//                setTimeout(function() {
//                  //do something
//                }, 3000);


//                setTimeout( $form.submit(),2000);
//                $form.submit();

//                if (!$("#checkbox").is(":checked")) {
//                    $.toptips('you need to agree');
//                } else {
//
//                    //$form.submit();
//                }

                }
            });

    });


</script>
</body>
</html>