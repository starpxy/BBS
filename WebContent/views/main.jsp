<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Title</title>

    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <link rel="stylesheet" href="asserts/mycss/index.css">


</head>
<body ontouchstart style="background-color: #f8f8f8;">


<!--<div class="weui-header bg-blue">-->
<!--<div class="weui-header-left"><a href="#" class="icon icon-109 f-white">返回</a></div>-->
<!--<h1 class="weui-header-title">无微不至借阅伴侣</h1>-->
<!--<div class="weui-header-right"><a href="#" class="icon icon-29 f-white">主页</a></div>-->
<!--</div>-->

<div class="searchbar_wrap"></div>


<div class="slide" id="slide1">
    <ul>
        <li>
            <a href="#">
                <img src="asserts/images/swipe/swipe1.jpg">
            </a>
            <div class="slide-desc">这是一张暂时替代的标题文本1</div>
        </li>
        <li>
            <a href="#">
                <img src="asserts/images/swipe/swipe2.jpg">
            </a>
            <div class="slide-desc">这是一张暂时替代的标题文本2</div>
        </li>
        <li>
            <a href="#">
                <img src="asserts/images/swipe/swipe3.jpg">
            </a>
            <div class="slide-desc">这是一张暂时替代的标题文本3</div>
        </li>
    </ul>


    <div class="dot">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>


<div class="page-hd-desc" style="margin-top: 20px">

    <h3>&nbsp;图书分类</h3>
    <div class="weui_grids">
        <a href="booklist.html" class="weui_grid js_grid">

            <p class="weui_grid_label">
                经典名著
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                生活保健
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                经管理财
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                成人教育
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                小说传记
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                历史军事
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                文学技术
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                人文社科
            </p>
        </a>

        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                计算机科学
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                人际关系
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                语言学习
            </p>
        </a>

        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                人物传记
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                西方哲学
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                生物医学
            </p>
        </a>
        <a href="javascript:;" class="weui_grid js_grid">

            <p class="weui_grid_label">
                更多
            </p>
        </a>

    </div>
</div>

<div class="weui_cells_title" style="height:60px;">&nbsp;</div>
<section class="weui-menu">
    <div class="weui-menu-inner">
        <em></em>
        <!--<span>图书操作</span>-->
        <span>搜书</span>
        <ul>
            <em></em>
            <li>搜书</li>
            <li>借书</li>
            <li>还书</li>
        </ul>
    </div>
    <div class="weui-menu-inner">
        <em></em>
        <!--<span>图书管理</span>-->
        <span>借书单</span>
        <ul>
            <em></em>
            <li>借书单</li>
            <li>预约单</li>
            <li>借阅历史</li>
            <li>搜索历史</li>
        </ul>
    </div>
    <div class="weui-menu-inner">
        <em></em>
        <!--<span>我的</span>-->
        <span>个人信息</span>
        <ul>
            <em></em>
            <li>个人信息</li>
            <li>提醒设置</li>
            <li>系统消息</li>
            <li>退出</li>
        </ul>
    </div>


</section>


<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/weui/js/swipe.js"></script>


<script type="text/javascript">

    $(function () {


        $('.searchbar_wrap').searchBar({
            cancelText: "取消",
            searchText: '关键字',
            onfocus: function (value) {
//                window.location.href="login.html";
            },
            onblur: function (value) {
            },
            oninput: function (value) {

            },
            onsubmit: function (value) {
            },
            oncancel: function () {

            },

            onclear: function () {
//                $.toast('yes to clear');

            }
        });



        $('.weui-menu-inner').click(function () {
            var $menu = $(this).find('ul'),
                    height = $menu.find('li').length * 40 + 15 + 'px',
                    opacity = $menu.css('opacity');

            $('.weui-menu-inner ul').css({
                'top': '0',
                'opacity': '0'
            });

            if (opacity == 0) {
                $menu.css({
                    'top': '-' + height,
                    'opacity': 1
                });
            } else {
                $menu.css({
                    'top': 0,
                    'opacity': 0
                });
            }
        });


        $('#slide1').swipeSlide({
            autoSwipe:true,//自动切换默认是
            speed:3000,//速度默认4000
            continuousScroll:true,//默认否
            transitionType:'cubic-bezier(0.22, 0.69, 0.72, 0.88)',//过渡动画linear/ease/ease-in/ease-out/ease-in-out/cubic-bezier
            lazyLoad:true,//懒加载默认否
            firstCallback : function(i,sum,me){
                me.find('.dot').children().first().addClass('cur');
            },
            callback : function(i,sum,me){
                me.find('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
            }
        });

    });


</script>


</body>
</html>