<%@page import="com.bbs.entities.rules.CreditHistoryRule"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bbs.entities.CreditHistory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>会员中心</title>
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>
    <style type="text/css">
        #title {
            height: 100px;
            width: 90%;
            margin:0 auto;
            background-image: url("title.jpg");
            background-size: 100% 100%;
        }

        .div_box {
            margin-bottom: 10px;
            border-top: 2px #eee solid;
            border-bottom: 2px #eee solid;
            padding: 5px;
            background: #fff;
            /*background-image: url("radar_bg.jpg");*/
            /*background-size: 100% 100%;*/
            width: 100%;
        }

        .title {
            font-size: 12px;
            font-weight: bold;
            color: #666;
        }

        .radar_img {
            /*-ms-transform:rotate(7deg); !* IE 9 *!*/
            /*-moz-transform:rotate(7deg); !* Firefox *!*/
            /*-webkit-transform:rotate(7deg); !* Safari and Chrome *!*/
            /*-o-transform:rotate(7deg); !* Opera *!*/
            /*transform:rotate(17deg);*/
            height:80%
        }



        .credit_record {
            padding: 10px;
            margin: 10px;
            border: 2px #eee solid;
            color: #0bb20c;
            font-size: 10px;
        }

        .count {
            float: right;
        }

        .credit_record_ {
            padding: 10px;
            margin: 10px;
            border: 2px #eee solid;
            color: #b2202a;
            font-size: 10px;
        }


    </style>


</head>


<body ontouchstart style="background-color: #f8f8f8;">

<div class="weui-header bg-green">
    <div class="weui-header-left"><a class="icon icon-109 f-white" id="get-back">返回</a></div>
    <h1 class="weui-header-title">会员中心</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>


<div class="page-hd tcenter" id="title">


</div>


<div class="page-hd div_box" id="radar_box">

    <div style="padding: 10px">
        <p class="title">我的信用分析 <span style="color: #0bb20c;float: right"> ${request.userCredit.overAll }/500</span></p>
    </div>

    <div class="weui_progress">
        <div class="weui_progress_bar">
            <div class="weui_progress_inner_bar js_progress" style="width: ${request.userCredit.overAll/5 }%;"></div>
        </div>
        <!--<a href="javascript:;" class="weui_progress_opr">-->
        <!--<i class="weui_icon_cancel"></i>-->
        <!--</a>-->
    </div>


    <br>

    <div class="tcenter radar_img">
        <canvas id="myChart"></canvas>
    </div>

</div>


<div class="page-hd div_box" id="record_box">

    <p class="title">&nbsp;&nbsp;&nbsp;我的信用记录</p>
    <%
    List<CreditHistory> creditHistories = (List<CreditHistory>)request.getAttribute("creditHistory");
    if(creditHistories!=null&&!creditHistories.isEmpty()){
    	Iterator<CreditHistory> iterator = creditHistories.iterator();
    	while(iterator.hasNext()){
    		CreditHistory temp = iterator.next();
    		if(temp.getOperation()>2){
    			out.println("<div class='credit_record_'>");
    			out.println("<p><i class='icon icon-122'></i>"+CreditHistoryRule.getStatus(temp.getOperation())+"</p>");
    			out.println("<span>"+temp.getCreateAt()+"</span>");
    			out.println("<span class='count'>"+temp.getScore()+"</span>");
    			out.println("</div>");
    		}
    		else{
    			out.println("<div class='credit_record'>");
    			out.println("<p><i class='icon icon-36'></i>"+CreditHistoryRule.getStatus(temp.getOperation())+"</p>");
    			out.println("<span>"+temp.getCreateAt()+"</span>");
    			out.println("<span class='count'>+"+temp.getScore()+"</span>");
    			out.println("</div>");
    		}
    	}
    }
    %>

</div>


<div class="page-bd">
    <div class="weui-flex">
        <div class="weui-flex-item">


        </div>
    </div>
</div>


<script src="asserts/weui/js/zepto.min.js"></script>
<!--<script src="asserts/jquery.min.js"></script>-->
<script src="asserts/layui/layui.js"></script>
<script src="asserts/Chart.min.js"></script>

<script>
    var radarChartData = {
        labels: ["活跃程度", "信用历史", "身份特质", "评论质量", "行为偏好"],
        datasets: [
            {
                label: "111",
                fillColor: "rgba(0,0,0,0)",
                strokeColor: "rgba(0,0,0,0)",
                pointColor: "rgba(0,0,0,0)",
                pointStrokeColor: "rgba(0,0,0,0)",
                pointHighlightFill: "rgba(0,0,0,0)",
                pointHighlightStroke: "rgba(0,0,0,0)",
                data: [100, 100, 100, 100, 100]
            },
            {
                label: "22222",
                fillColor: "rgba(60,179,113,0.4)",
                strokeColor: "rgba(60,179,113,1)",
                pointColor: "rgba(60,179,113,1)",
                pointStrokeColor: "#11BA00",
                pointHighlightFill: "#11BA00",
                pointHighlightStroke: "rgba(17,160,4,0.8)",
                data: ['${request.userCredit.activeDegree}', '${request.userCredit.credit}', '${request.userCredit.identity}', '${request.userCredit.commentQulity}', '${request.userCredit.behavior}']
            }
        ]
    };


    window.onload = function () {
        window.myRadar = new Chart(document.getElementById("myChart").getContext("2d")).Radar(radarChartData, {
            responsive: true
        });
    };





    $(function () {


        layui.use('layer', function () {
            layer = layui.layer;

            $("#get-back").click(function () {
                history.back();
            });
/* 
            $(window).scroll(function () {

                if ($(window).scrollTop()>500){

                    $("#radar_box").css({
                        "position":"fixed",
                        "top":0,
                        "box-shadow":"0 6px 10px #eeeeee"
                    });

                }else if($(window).scrollTop()<10){
                    $("#radar_box").css({
                        "position":"static",
                        "top":0
                    });
                }


            }); */


        });
    });
</script>

</body>
</html>


