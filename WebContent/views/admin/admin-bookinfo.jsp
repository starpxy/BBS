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

</head>
<body>

<div class="container-fluid">
    <row>
        <div class="col-md-12">

            <!-- Horizontal Form -->
            <!-- /.box -->
            <!-- general form elements disabled -->

            <div class="box box-solid">

                <div class="box-header with-border">
                    <h3 class="box-title">书籍详情</h3>
                </div>

                <!-- /.box-header -->
                <div class="box-body">

                    <div class="box box-widget widget-user-2">
                        <!-- Add the bg color to the header using any of the bg-* classes -->
                        <div class="widget-user-header bg-aqua-active">
                            <div class="widget-user-image">
                                <img src="https://img3.doubanio.com/mpic/s6474670.jpg" alt="User Avatar" id="image">

                                <br>
                                <br>
                            </div>
                            <!-- /.widget-user-image -->
                            <h3 class="widget-user-username" id="title">启示录</h3>
                            <h5 class="widget-user-desc" id="author">[美] Marty Cagan</h5>

                        </div>
                        <div class="box-footer no-padding">
                            <ul class="nav nav-stacked">
                                <li><a href="#">ISBN<span class="pull-right" id="isbn">9787560970189</span></a></li>
                                <li><a href="#">类别<span class="pull-right" id="type">交互设计</span></a></li>
                                <li><a href="#">出版<span class="pull-right" id="publisher">华中科技大学出版社</span></a></li>
                                <li><a href="#">版本<span class="pull-right" id="pubdate">2001-5</span></a></li>
                                <li><a href="#">库存<span class="pull-right" id="volum">3</span></a></li>
                                <li><a href="#">借书价格(元/每月)<span class="pull-right" id="price">0.01</span></a></li>


                                <li>

                                    <a class="collapse-toggle">前沿<span class="pull-right"><i
                                            class="fa fa-plus"></i></span></a>

                                    <div class="box-body" style="border: 1px solid #f9fae9;display: none" id="preface">
                                        GilescColborne曾任职于英国航空公司、英国物理学会出版社和灵智集团，二十多年来潜心钻研交互式设计与易用性，颇有建树。2003年至2007年任英国易用性专家协会主席，曾与英国标准机构合作制定可访问性方面的标准。2004年与人共同创立咨询公司cxpartners，该公司服务的全球客户包括诺基亚、万豪国际酒店、eBay等。
                                    </div>

                                </li>

                                <li>

                                    <a class="collapse-toggle">目录<span class="pull-right"><i
                                            class="fa fa-plus"></i></span></a>

                                    <div class="box-body" style="border: 1px solid #f9fae9;display: none" id="catalog">
                                        第1章　话说简单　　1
                                        关于简单的故事　　2
                                        简单的威力　　4
                                        复杂的产品不可持续　　6
                                        不是那种简单法　　8
                                        特征　　10
                                        貌似简单　　12
                                        了解你自己　　14
                                        第2章　明确认识　　　17
                                        描述要点的两种方式　　18
                                        走出办公室　　20
                                        观察什么　　22
                                        三种用户　　24
                                        为什么应该忽略专家型用户　　26
                                        为主流用户而设计　　28
                                        主流用户想要什么　　30
                                        感情需求　　32
                                        简单意味着控制　　34
                                        正确选择“什么”　　36
                                        描述用户体验　　38
                                        .讲故事　　40
                                        环境、角色、情节　　42
                                        极端的可用性　　44
                                        简便的方式　　46
                                        洞察力　　48
                                        明确认识　　50
                                        分享　　52
                                        第3章　简约四策略　55
                                        简化遥控器　　56
                                        遥控器　　58
                                        四个策略　　60
                                        第4章　删除　　63
                                        删除　　64
                                        避免错删　　66
                                        关注核心　　68
                                        砍掉残缺功能　　70
                                        假如用户……　　72
                                        但我们的用户想要　　74
                                        方案，不是流程　　76
                                        如果功能不是必要的　　78
                                        真有影响吗　　80
                                        排定功能优先级　　82
                                        负担　　84
                                        决策　　86
                                        分心　　88
                                        聪明的默认值　　90
                                        选项和首选项　　92
                                        如果一个选项还嫌多　　94
                                        错误　　96
                                        视觉混乱　　98
                                        删减文字　　100
                                        精简句子　　102
                                        删减过多　　104
                                        你能做到　　106
                                        焦点　　108
                                        第5章　组织　111
                                        组织　　112
                                        分块　　114
                                        围绕行为组织　　116
                                        是非分明　　118
                                        字母表与格式　　120
                                        搜索　　122
                                        时间和空间　　124
                                        网格　　126
                                        大小和位置　　128
                                        分层　　130
                                        色标　　132
                                        期望路径　　134
                                        第6章　隐藏　　　137
                                        隐藏　　138
                                        不常用但不能少　　140
                                        自定义　　142
                                        自动定制　　144
                                        渐进展示　　146
                                        阶段展示　　148
                                        适时出现　　150
                                        提示与线索　　152
                                        让功能容易找到　　154
                                        隐藏的要求　　156
                                        第7章　转移　159
                                        转移　　160
                                        在设备之间转移　　162
                                        移动平台与桌面平台　　164
                                        向用户转移　　166
                                        用户最擅长做什么　　168
                                        创造开放式体验　　170
                                        菜刀与钢琴　　172
                                        非结构化数据　　174
                                        信任　　176
                                        第8章　最后的叮嘱　　179
                                        顽固的复杂性　　180
                                        细节　　182
                                        简单发生在用户的头脑中　　184
                                        图片致谢　　187
                                    </div>

                                </li>


                                <li>

                                    <a class="collapse-toggle">介绍<span class="pull-right"><i
                                            class="fa fa-plus"></i></span></a>

                                    <div class="box-body" style="border: 1px solid #f9fae9;display: none"
                                         id="introduction">
                                        追求简单易用是人类的本性，无论是互联网产品。还是移动应用。亦或其他交互式设计，简单易用始终都是赢得用户的关键。同时，简单易用的程度也与产品寿命的长短密切相关。在《简约至上:交互式设计四策略》中，作者Giles托20多年交互式设计的探索与实践。提出了合理删除、分层组织、适时隐藏和巧妙转移这四个达成简约至上的终极策略，讲述了为什么应该站在主流用户一边，以及如何从他们的真实需求和期望出发，简化设计，提升易用性。创造出卓而不群、历久弥新的用户体验。
                                    </div>

                                </li>

                                <li><a href="#form" id="edit">
                                    <button class="btn btn-block btn-info">
                                        <i class="fa fa-edit"></i> Edit
                                    </button>
                                </a></li>

                            </ul>
                        </div>
                    </div>


                    <form role="form" id="form" style="display: none;" action="admin-bookinfo.html?page=221221212"
                          method="post">
                        <!-- text input -->

                        <div class="form-group">
                            <label>缩略图</label>
                            <input class="form-control" name="image" type="text">
                        </div>


                        <div class="form-group">
                            <label>书名</label>
                            <input class="form-control" name="title" type="text">
                        </div>

                        <div class="form-group">
                            <label>作者</label>
                            <input class="form-control" name="author" type="text">
                        </div>

                        <div class="form-group">
                            <label>ISBN</label>
                            <input class="form-control" name="isbn" disabled="" type="text">
                        </div>

                        <div class="form-group">
                            <label>出版商</label>
                            <input class="form-control" name="publisher" type="text">
                        </div>

                        <div class="form-group">
                            <label>出版日期</label>
                            <input class="form-control" name="pubdate" type="text">
                        </div>

                        <div class="form-group">
                            <label>库存</label>
                            <input class="form-control" name="volum" disabled="" type="text">
                        </div>

                        <div class="form-group">
                            <label>借书价格(元/每月)</label>
                            <input class="form-control" name="price" type="number">
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
                            <label>前言</label>
                            <textarea class="form-control" rows="5" name="preface"></textarea>
                        </div>


                        <div class="form-group">
                            <label>介绍</label>
                            <textarea class="form-control" rows="5" name="introduction"></textarea>
                        </div>

                        <div class="form-group">
                            <label>目录</label>
                            <textarea class="form-control" rows="10" name="catalog"></textarea>
                        </div>

                        <div style="position: fixed;bottom: 0px;right:20px;margin-top: 100px;width: 90%">
                            <button class="form-control btn btn-info" id="submit" type="submit"><i class="fa fa-pencil"></i>提交</button>
                        </div>

                    </form>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </row>


</div>




<script src="asserts/jquery.min.js"></script>
<script src="asserts/bootstrap.min.js"></script>
<script>
    $(function () {


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

            $("input[name='image']").val($("#image").attr('src'));
            $("input[name='isbn']").val($("#isbn").html());
            $("input[name='volum']").val($("#volum").html());
            $("input[name='publisher']").val($("#publisher").html());
            $("input[name='pubdate']").val($("#pubdate").html());
            $("input[name='title']").val($("#title").html());
            $("input[name='author']").val($("#author").html());
            $("input[name='price']").val($("#price").html());
            $("select[name='type']").val($("#type").html());
            $("textarea[name='preface']").html($("#preface").html());
            $("textarea[name='catalog']").html($("#catalog").html());
            $("textarea[name='introduction']").html($("#introduction").html());

        });

        $("#submit").click(function () {

            var priceinput = $("input[name='price']");
            var imageinput = $("input[name='image']");
            var titleinput = $("input[name='title']");
            var authorinput = $("input[name='author']");
            var publisherinput = $("input[name='publisher']");
            var pubdateinput = $("input[name='pubdate']");

            if (priceinput.val().trim() != "" && imageinput.val().trim() != "" && titleinput.val().trim() != "" && authorinput.val().trim() != "" && publisherinput.val().trim() != "" && pubdateinput.val().trim() != "") {

            } else {

                var reg = new RegExp("^[0-9]+(.[0-9]{1,3})?$");
                if (!reg.test(priceinput.val().trim())) {
                    priceinput.parent().addClass("has-error");
                    priceinput.next(".help-block").remove();
                    priceinput.after('<span class="help-block">只能输入有1~3位小数的正实数</span>')
                }else{
                    priceinput.parent().removeClass("has-error");
                    priceinput.next(".help-block").remove();
                }

                if (imageinput.val().trim() == "") {
                    imageinput.parent().addClass("has-error");
                    imageinput.next(".help-block").remove();
                    imageinput.after('<span class="help-block">需要一个缩略图哦</span>');
                }else{
                    imageinput.parent().removeClass("has-error");
                    imageinput.next(".help-block").remove();
                }


                if (titleinput.val().trim() == "") {
                    titleinput.parent().addClass("has-error");
                    titleinput.next(".help-block").remove();
                    titleinput.after('<span class="help-block">标题不能为空哦</span>');
                }else{
                    titleinput.parent().removeClass("has-error");
                    titleinput.next(".help-block").remove();
                }


                if (authorinput.val().trim() == "") {
                    authorinput.parent().addClass("has-error");
                    authorinput.next(".help-block").remove();
                    authorinput.after('<span class="help-block">给这个书写上作者才行哦</span>');
                }else{
                    authorinput.parent().removeClass("has-error");
                    authorinput.next(".help-block").remove();
                }

                if (publisherinput.val().trim() == "") {
                    publisherinput.parent().addClass("has-error");
                    publisherinput.next(".help-block").remove();
                    publisherinput.after('<span class="help-block">不能为空哦</span>');
                }else{
                    publisherinput.parent().removeClass("has-error");
                    publisherinput.next(".help-block").remove();
                }

                if (pubdateinput.val().trim() == "") {
                    pubdateinput.parent().addClass("has-error");
                    pubdateinput.next(".help-block").remove();
                    pubdateinput.after('<span class="help-block">不能为空哦</span>');
                }else{
                    pubdateinput.parent().removeClass("has-error");
                    pubdateinput.next(".help-block").remove();
                }
                return false;
            }

        });

    })
</script>

</body>
</html>