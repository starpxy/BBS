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
<style>
body {
    font-family:'楷体', '微软雅黑';
    font-size: 16px;
    font-weight: 300;
    color: #888;
    line-height: 30px;
    text-align: center;
    background-image:url(../asserts/images/bg1.jpeg);
}

strong { font-weight: 500; }
 d
a, a:hover, a:focus {
	color: #4aaf51;
	text-decoration: none;
    -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
}

h1, h2 {
	margin-top: 10px;
	font-size: 38px;
    font-weight: 100;
    color: #555;
    line-height: 50px;
}

h3 {
	font-size: 22px;
    font-weight: 300;
    color: #555;
    line-height: 30px;
}

img { max-width: 100%; }

::-moz-selection { background: #4aaf51; color: #fff; text-shadow: none; }
::selection { background: #4aaf51; color: #fff; text-shadow: none; }


.btn-link-1 {
	display: inline-block;
	height: 50px;
	margin: 5px;
	padding: 16px 20px 0 20px;
	background: #4aaf51;
	font-size: 16px;
    font-weight: 300;
    line-height: 16px;
    color: #fff;
    -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
}
.btn-link-1:hover, .btn-link-1:focus, .btn-link-1:active { outline: 0; opacity: 0.6; color: #fff; }

.btn-link-1.btn-link-1-facebook { background: #4862a3; }
.btn-link-1.btn-link-1-twitter { background: #55acee; }
.btn-link-1.btn-link-1-google-plus { background: #dd4b39; }

.btn-link-1 i {
	padding-right: 5px;
	vertical-align: middle;
	font-size: 20px;
	line-height: 20px;
}

.btn-link-2 {
	display: inline-block;
	height: 50px;
	margin: 5px;
	padding: 15px 20px 0 20px;
	background: rgba(0, 0, 0, 0.3);
	border: 1px solid #fff;
	font-size: 16px;
    font-weight: 300;
    line-height: 16px;
    color: #fff;
    -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
}
.btn-link-2:hover, .btn-link-2:focus, 
.btn-link-2:active, .btn-link-2:active:focus { outline: 0; opacity: 0.6; background: rgba(0, 0, 0, 0.3); color: #fff; }


/***** Top content *****/

.inner-bg {
    padding: 100px 0 170px 0;
}

.top-content .text {
	color: #fff;
}

.top-content .text h1 { color: #fff; }

.top-content .description {
	margin: 20px 0 10px 0;
}

.top-content .description p { opacity: 0.8; }

.top-content .description a {
	color: #fff;
}
.top-content .description a:hover, 
.top-content .description a:focus { border-bottom: 1px dotted #fff; }

.form-box {
	margin-top: 35px;
}

.form-top {
	overflow: hidden;
	padding: 0 25px 15px 25px;
	background: #fff;
	-moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; border-radius: 4px 4px 0 0;
	text-align: left;
}

.form-top-left {
	float: left;
	width: 75%;
	padding-top: 25px;
}

.form-top-left h3 { margin-top: 0; }

.form-top-right {
	float: left;
	width: 25%;
	padding-top: 5px;
	font-size: 66px;
	color: #ddd;
	line-height: 100px;
	text-align: right;
}

.form-bottom {
	padding: 25px 25px 30px 25px;
	background: #eee;
	-moz-border-radius: 0 0 4px 4px; -webkit-border-radius: 0 0 4px 4px; border-radius: 0 0 4px 4px;
	text-align: left;
}

.form-bottom form textarea {
	height: 100px;
}

.form-bottom form button.btn {
	width: 100%;
}

.form-bottom form .input-error {
	border-color: #4aaf51;
}

.social-login {
	margin-top: 35px;
}

.social-login h3 {
	color: #fff;
}

.social-login-buttons {
	margin-top: 25px;
}


</style>
</head>


<body>
<div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登录到后台</h3>
                            		<p>输入管理员账号和密码:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="user-adminLogin"  id="loginform"  method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">用户名</label>
			                        	<input type="text" name="phoneNumber" placeholder="用户名" class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">密码</label>
			                        	<input type="password" name="password" placeholder="密码" class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit"  id="submit1" class="btn btn-success">登录</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                
                </div>
            </div>
            
        </div>

<div style="text-align:center;color: #666;margin:10px">
    <p class="copyright text-muted small">权限声明 © SHC 2017. 所有权限保留 <img src="dist/img/icon.png"> <a
            href="http://www.beianbaba.com/icp/pxyzmy.com">京ICP备17020278号-1</a></p>
</div>


<script src="asserts/jquery.min.js"></script>
<script src="asserts/bootstrap.min.js"></script>
<script src="asserts/backstrech.min.js"></script>
<script src="asserts/plugins/layui/layui.js"></script>

<script type="text/javascript">


    layui.use('layer', function () {
        var layer = layui.layer;

        
        /*
            Form validation
        */


        //这段代码可以去除,仅仅用于前端静态测试 TODO
        $("#submit1").click(function () {

            var account = $("input[name='phoneNumber']").val();
            var password = $("input[name='password']").val();

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
