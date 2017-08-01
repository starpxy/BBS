<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>图书管理登录</title>

    <meta name="description" content="User login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" href="asserts/css/font/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="asserts/css/ace.min.css"/>
    <link rel="stylesheet" href="asserts/bootstrap.min.css">

</head>


<body class="login-layout light-login" style="font-family: '楷体', '微软雅黑';">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <i class="fa fa-gears green"></i>
                            <span class="white" id="id-text2">图书管理员登录</span>
                        </h1>
                    </div>

                    <div class="space-6"></div>
                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue bigger">
                                        <i class="fa fa-user green"></i>
                                        填写以下信息登录
                                    </h4>

                                    <div class="space-6"></div>


                                    <form action="user-adminLogin" id="loginform" method="post">

                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"
                                                                   name="phoneNumber"
                                                                   placeholder="帐号"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control"
                                                                   name="password"
                                                                   placeholder="密码"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                            </label>

                                            <div class="space"></div>

                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace"/>
                                                    <span class="lbl" name="remember">记住我一周</span>
                                                </label>

                                                <button type="submit" id="submit1"
                                                        class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">登录</span>
                                                </button>
                                            </div>
                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>

                                    <div class="social-or-login center">
                                        <span class="bigger-110">通过社交网站登录</span>
                                    </div>

                                    <div class="space-6"></div>

                                    <div class="social-login center">
                                        <a class="btn btn-primary">
                                            <i class="ace-icon fa fa-wechat"></i>
                                        </a>

                                        <a class="btn btn-info">
                                            <i class="ace-icon fa fa-weibo"></i>
                                        </a>

                                        <a class="btn btn-danger">
                                            <i class="ace-icon fa fa-qq"></i>
                                        </a>
                                    </div>
                                </div><!-- /.widget-main -->

                                <div class="toolbar clearfix">
                                    <div>
                                        <a href="#" class="forgot-password-link">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                        </a>
                                    </div>

                                    <div>
                                        <a href="../user-login" class="user-signup-link">
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>

                            </div><!-- /.widget-body -->
                        </div><!-- /.login-box -->
                    </div><!-- /.position-relative -->
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<div style="text-align:center;color: #666;margin:10px">
    <p class="copyright text-muted small">权限声明 © SHC 2017. 所有权限保留 <img src="dist/img/icon.png"> <a
            href="http://www.beianbaba.com/icp/pxyzmy.com">京ICP备17020278号-1</a></p>
</div>


<script src="asserts/jquery.min.js"></script>
<script src="asserts/bootstrap.min.js"></script>
<script src="asserts/plugins/layui/layui.js"></script>

<script type="text/javascript">

    layui.use('layer', function () {
        var layer = layui.layer;
        //这段代码可以去除,仅仅用于前端静态测试 TODO
        $("#submit1").click(function () {

            var account = $("input[name='accountforlogin']").val();
            var password = $("input[name='passwordforlogin']").val();

            var myReg = /^[^@\/\'\\\"#$%&\^\*]+$/;

            if (account == "" || password == "" || !myReg.test(account)) {
                layer.msg("帐号或密码未填写或帐号包含特殊字符", {icon: 2, anim: 6, time: 1000});
                return;
            }



        });


    });
</script>

</body>
</html>
