<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>我的收藏</title>


    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <style>
        .weui-flex-item {
            text-align: center;
            margin: 10px;
        }

        img {
            width: 80px;
            height: 120px;
            border-radius: 4px;
            -webkit-box-shadow: 2px 2px 2px #aeaeae;
            -moz-box-shadow: 2px 2px 2px #aeaeae;
        }

        .book-title {
        	    margin-top:4px;
            color: #0C0C0C;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .book-author {
            color: #666;
        }

    </style>
</head>

<body ontouchstart style="background-color: #f8f8f8;">

<div class="weui-header bg-green">
    <div class="weui-header-left"><a class="icon icon-109 f-white">返回</a></div>
    <h1 class="weui-header-title">我的收藏</h1>
    <div class="weui-header-right"><a href="main_.html" class="icon icon-27 f-white"></a></div>
</div>


<div class="weui-flex">

    <div class="weui-flex-item">

        <a>
            <div class="book-link" hidden>http://localhost:8080/BBS/views/book-bookDetails?bookId=935</div>
            <div class="book-image">
                <img class="act" src="https://img3.doubanio.com/mpic/s6474670.jpg" alt="not found">
            </div>
            <p class="book-title">启示录</p>
            <p class="book-author">[美] Marty Cagan</p>
        </a>

    </div>


    <div class="weui-flex-item">
        <a>
            <div class="book-link" hidden>http://localhost:8080/BBS/views/book-bookDetails?bookId=921215</div>
            <div class="book-image">
                <img class="act" src="https://img3.doubanio.com/mpic/s27264181.jpg" alt="not found">
            </div>
            <p class="book-title">解忧杂货店</p>
            <p class="book-author">东野圭吾</p>
        </a>


    </div>

    <div class="weui-flex-item">

        <a>
            <div class="book-link" hidden>http://localhost:8080/BBS/views/book-bookDetails?bookId=11925</div>
            <div class="book-image">
                <img class="act" src="https://img3.doubanio.com/mpic/s1915036.jpg" alt="not found">
            </div>
            <p class="book-title">启示录</p>
            <p class="book-author">[美] Marty Cagan</p>
        </a>

    </div>
</div>


<!--the second line-->

<div class="weui-flex">
    <div class="weui-flex-item">
        <a>
            <div class="book-link" hidden>http://localhost:8080/BBS/views/book-bookDetails?bookId=932225</div>
            <div class="book-image">
                <img class="act" src="https://img1.doubanio.com/mpic/s4592217.jpg" alt="not found">
            </div>
            <p class="book-title">启示录</p>
            <p class="book-author">[美] Marty Cagan</p>
        </a>
    </div>
    <div class="weui-flex-item">


    </div>

    <div class="weui-flex-item">


    </div>
</div>





<div style="position:fixed;bottom: 0px;width: 100%">

    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <p class="weui_media_desc"><a href="javascript:;" class="weui_btn bg-red" id="clear"><i class="icon icon-23"></i> 清空</a></p>
            </div>
        </div>
    </div>

</div>



<script src="asserts/weui/js/zepto.min.js"></script>

<script>
    $(function () {


        $(document).on("click", ".act", function() {

            var booklink=$(this).parent().siblings('.book-link').html();

            $.actions({
                title: "选择操作",
                onClose: function() {
                    console.log("close");
                },
                actions: [
                    {
                        text: "查看",
                        className: "color-primary",
                        onClick: function() {
//                            var booklink=$('.book-link').html();
                            window.location.href=booklink;
                        }
                    },
                    {
                        text: "删除",
                        className: 'color-danger',
                        onClick: function() {
                            var bookid=booklink.split('=')[1];
                            $.alert("你选择了“删除”"+bookid);
                        }
                    }
                ]
            });
        });

        $("#clear").click(function () {
            $.confirm("你确认清空吗?", "确认", function (text) {

                var booklinks=$('.book-link');

                var arr_bookids=new Array();

                booklinks.each(function () {
                    arr_bookids.push($(this).html().split('=')[1]);
                });

                $.alert("你选择了“确认清空”"+arr_bookids);
            }, function () {

            });
        });

    });
</script>

</body>
</html>