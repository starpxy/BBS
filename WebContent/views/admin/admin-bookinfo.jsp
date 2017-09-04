<%@page import="com.bbs.entities.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BookInfo</title>
    <link rel="stylesheet" href="asserts/bootstrap.min.css">
    <link rel="stylesheet" href="asserts/css/AdminLTE.min.css">
    <link rel="stylesheet" href="asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet" href="asserts/css/_all-skins.min.css">
	 <link rel="stylesheet" href="asserts/plugins/layui/css/layui.css">
</head>
<body>

<div class="container-fluid">
    <row>
        <div class="col-md-12">

            <!-- Horizontal Form -->
            <!-- /.box -->
            <!-- general form elements disabled -->

            <div class="box box-solid"><a id="top"></a>

                <div class="box-header with-border">
                    <h3 class="box-title">书籍详情</h3>
                </div>

                <!-- /.box-header -->
                <div class="box-body">

                    <div class="box box-widget widget-user-2">
                        <!-- Add the bg color to the header using any of the bg-* classes -->
                        <div class="widget-user-header bg-aqua-active">
                            <div class="widget-user-image">
                                <img src="${request.book.simpleChart }" alt="User Avatar" id="simpleChart">

                                <br>
                                <br>
                            </div>
                            <!-- /.widget-user-image -->
                            <h3 class="widget-user-username" id="bookTitle">${request.book.bookTitle }</h3>
                            <h5 class="widget-user-desc" id="author">${request.book.author }</h5>

                        </div>
                        <div class="box-footer no-padding">
                            <ul class="nav nav-stacked">
                                <li><a href="#">ISBN<span class="pull-right" id="isbn">${request.book.isbn }</span></a></li>
                                <li><a href="#">类别<span class="pull-right" id="type">${request.book.type }</span></a></li>
                                <li><a href="#">出版<span class="pull-right" id="publisher">${request.book.publisher }</span></a></li>
                                <li><a href="#">版本<span class="pull-right" id="versionNumber">${request.book.versionNumber }</span></a></li>
                                <li><a href="#">库存<span class="pull-right" id="volume">3</span></a></li>
                                <li><a href="#">借书价格(元/每月)<span class="pull-right" id="price">${request.book.price *0.1}</span></a></li>
								 <li><a href="#">书籍信用分<span class="pull-right" id="bookCredit">${request.book.bookCredit}</span></a></li>

                                <li>

                                    <a class="collapse-toggle">前言<span class="pull-right"><i
                                            class="fa fa-plus"></i></span></a>

                                    <div class="box-body" style="border: 1px solid #f9fae9;display: none" id="preface">
										<pre>${request.book.preface }</pre>
                                    </div>

                                </li>

                                <li>
                                    <a class="collapse-toggle">目录<span class="pull-right"><i
                                            class="fa fa-plus"></i></span></a>

                                    <div class="box-body" style="border: 1px solid #f9fae9;display: none" id="directory">
                                    <pre>   ${request.book.directory }</pre>
                                    </div>
                                </li>


                                <li>
                                    <a class="collapse-toggle">介绍<span class="pull-right"><i
                                            class="fa fa-plus"></i></span></a>
                                    <div class="box-body" style="border: 1px solid #f9fae9;display: none"
                                         id="introduction">
									<pre>${request.book.introduction }</pre>
                                    </div>

                                </li>

                                <li><a href="#form" id="edit">
                                    <button class="btn btn-block btn-info">
                                        <i class="fa fa-edit"></i> 编辑
                                    </button>
                                </a></li>

                            </ul>
                        </div>
                    </div>


                    <div id="form" style="display: none;" >
                        <!-- text input -->
						<input type="hidden" name="bookId" value="${request.book.bookId }">
                        <div class="form-group">
                            <label>缩略图</label><a href="#1" id="1"></a>
                            <input class="form-control" name="simpleChart" type="text">
                        </div>


                        <div class="form-group">
                            <label>书名</label><a href="#2" id="2"></a>
                            <input class="form-control" name="bookTitle" type="text">
                        </div>

                        <div class="form-group">
                            <label>作者</label><a id="3"></a>
                            <input class="form-control" name="author" type="text">
                        </div>

                        <div class="form-group">
                            <label>ISBN</label><a id="4"></a>
                            <input class="form-control" name="isbn" disabled="" type="text">
                        </div>

                        <div class="form-group">
                            <label>出版商</label><a id="5"></a>
                            <input class="form-control" name="publisher" type="text">
                        </div>

                        <div class="form-group">
                            <label>版本号</label><a id="6"></a>
                            <input class="form-control" name="versionNumber" type="text">
                        </div>

                        <div class="form-group">
                            <label>库存</label><a id="7"></a>
                            <input class="form-control" name="bookVolume" disabled="" type="text">
                        </div>

                        <div class="form-group">
                            <label>借书价格(元/每月)</label><a id="8"></a>
                            <input class="form-control" name="price" type="number">
                        </div>
						
						<div class="form-group">
                            <label>书籍信用分</label><a id="12"></a>
                            <input class="form-control" name="bookCreidt" type="number">
                        </div>
                        
                        <div class="form-group">
                            <label>图书种类</label>
                            <select class="form-control" name="type">
                                <option value="经典名著">经典名著</option>
                                <option value="侦探推理">侦探推理</option>
                                <option value="绘本漫画">绘本漫画</option>
                                <option value="流行青春">流行青春</option>
                                <option value="经济理财">经济理财</option>
                                <option value="商业管理">商业管理</option>
                                <option value="人物传记">人物传记</option>
                                <option value="心理学">心理学</option>
                                <option value="计算机科学">计算机科学</option>
                                <option value="历史哲学">历史哲学</option>
                                <option value="科学科普">科学科普</option>
                                <option value="励志成长">励志成长</option>
                                <option value="交互设计">交互设计</option>
                                <option value="生活旅行">生活旅行</option>
                                <option value="更多">更多</option>
                            </select>
                        </div>

                        <!-- textarea -->
                        <div class="form-group">
                            <label>前言</label><a id="9"></a>
                            <textarea class="form-control" rows="5" name="preface"></textarea>
                        </div>


                        <div class="form-group">
                            <label>介绍</label><a id="10"></a>
                            <textarea class="form-control" rows="5" name="introduction"></textarea>
                        </div>

                        <div class="form-group">
                            <label>目录</label><a id="11"></a>
                            <textarea class="form-control" rows="10" name="directory"></textarea>
                        </div>

                        <div style="position: fixed;bottom: 0px;right:20px;margin-top: 100px;width: 90%">
                            <button class="form-control btn btn-info" id="submit" type="button"><i class="fa fa-pencil"></i>提交</button>
                        </div>

                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </row>


</div>




<script src="asserts/jquery.min.js"></script>
<script src="asserts/bootstrap.min.js"></script>
<script src="asserts/plugins/layui/layui.js"></script>
<script>
    $(function () {
    	  layui.use('layer', function () {
    	    	
    	        var layer = layui.layer;

        $(".collapse-toggle").click(function () {
            $(this).next("div").toggle(1000);
            if ($(this).children("span").children("i").hasClass("fa-plus")) {
                $(this).children("span").children("i").removeClass('fa-plus').addClass("fa-minus");
            } else {
                $(this).children("span").children("i").removeClass("fa-minus").addClass("fa-plus");
            }

        });


        $("#edit").click(function () {
            $("#form").toggle();

            $("input[name='simpleChart']").val($("#simpleChart").attr('src'));
            $("input[name='isbn']").val($("#isbn").html());
            $("input[name='volume']").val($("#volume").html());
            $("input[name='publisher']").val($("#publisher").html());
            $("input[name='versionNumber']").val($("#versionNumber").html());
            $("input[name='bookTitle']").val($("#bookTitle").html());
            $("input[name='author']").val($("#author").html());
            $("input[name='price']").val($("#price").html());
            $("select[name='type']").val($("#type").html());
            $("input[name='bookCredit']").val($("#bookCredit").html());
            $("textarea[name='preface']").html($("#preface").text());
            $("textarea[name='directory']").html($("#directory").text());
            $("textarea[name='introduction']").html($("#introduction").text());

        });

        $("#submit").click(function () {
            var priceinput = $("input[name='price']");
            var imageinput = $("input[name='simpleChart']");
            var titleinput = $("input[name='bookTitle']");
            var authorinput = $("input[name='author']");
            var publisherinput = $("input[name='publisher']");
            var pubdateinput = $("input[name='versionNumber']");

            if (priceinput.val().trim() != "" && imageinput.val().trim() != "" && titleinput.val().trim() != "" && authorinput.val().trim() != "" && publisherinput.val().trim() != "" && pubdateinput.val().trim() != "") {

            } else {

                var reg = new RegExp("^[0-9]?$");
                if (!reg.test(priceinput.val().trim())) {
                    priceinput.parent().addClass("has-error");
                    priceinput.next(".help-block").remove();
                    priceinput.after('<span class="help-block">只能输入数字哦</span>')
                }else{
                    priceinput.parent().removeClass("has-error");
                    priceinput.next(".help-block").remove();
                }

                if (imageinput.val().trim() == "") {
                    imageinput.parent().addClass("has-error");
                    imageinput.next(".help-block").remove();
                    $("html,body").animate({scrollTop: $("#1").offset().top}, 1000);
                    imageinput.after('<span class="help-block">需要一个缩略图哦</span>');
                }else{
                    imageinput.parent().removeClass("has-error");
                    imageinput.next(".help-block").remove();
                }


                if (titleinput.val().trim() == "") {
                    titleinput.parent().addClass("has-error");
                    titleinput.next(".help-block").remove();
                    $("html,body").animate({scrollTop: $("#2").offset().top}, 1000);
                    titleinput.after('<span class="help-block">书名不能为空哦</span>');
                }else{
                    titleinput.parent().removeClass("has-error");
                    titleinput.next(".help-block").remove();
                }


                if (authorinput.val().trim() == "") {
                    authorinput.parent().addClass("has-error");
                    authorinput.next(".help-block").remove();
                    $("html,body").animate({scrollTop: $("#3").offset().top}, 1000);
                    authorinput.after('<span class="help-block">给这个书写上作者才行哦</span>');
                }else{
                    authorinput.parent().removeClass("has-error");
                    authorinput.next(".help-block").remove();
                }

                if (publisherinput.val().trim() == "") {
                    publisherinput.parent().addClass("has-error");
                    publisherinput.next(".help-block").remove();
                    $("html,body").animate({scrollTop: $("#5").offset().top}, 1000);
                    publisherinput.after('<span class="help-block">不能为空哦</span>');
                }else{
                    publisherinput.parent().removeClass("has-error");
                    publisherinput.next(".help-block").remove();
                }

                if (pubdateinput.val().trim() == "") {
                    pubdateinput.parent().addClass("has-error");
                    pubdateinput.next(".help-block").remove();
                    $("html,body").animate({scrollTop: $("#6").offset().top}, 1000);
                    pubdateinput.after('<span class="help-block">不能为空哦</span>');
                }else{
                    pubdateinput.parent().removeClass("has-error");
                    pubdateinput.next(".help-block").remove();
                }
                return false;
            }
            $.ajax({
                type: 'POST',
                url: 'book-update',
                data:{'bookId':$("input[name='bookId']").val(),'simpleChart':$("input[name='simpleChart']").val(),'publisher':$("input[name='publisher']").val(),'versionNumber':$("input[name='versionNumber']").val(),'bookTitle':$("input[name='bookTitle']").val(),'author':$("input[name='author']").val(),'price':$("input[name='price']").val(),'type':$("select[name='type']").val(),'preface':$("textarea[name='preface']").val(),'directory':$("textarea[name='directory']").val(),'introduction':$("textarea[name='introduction']").val()},
                dataType: 'json',
                success: function (data) {
					if (data.state==1){
						$("#form").hide(500);
						$("html,body").animate({scrollTop: $("#top").offset().top}, 1000);
						layer.msg("更新成功", {anim: 2, icon: 1, time: 2000});
					}
					else if (data.state==3){
						layer.msg("登录状态异常", {anim: 1, icon: 2, time: 2000});
					}
					else{
						layer.msg("查无此书", {anim: 1, icon: 2, time: 2000});
					}
                },
                error: function (xhr, type) {
                }
            });

        });
     });
 })
</script>

</body>
</html>