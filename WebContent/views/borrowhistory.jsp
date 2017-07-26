<%@page import="java.util.Iterator"%>
<%@page import="com.bbs.entities.BorrowedRecord"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>

</head>

<body ontouchstart class="page-bg">

<div class="weui-header bg-green">
    <div class="weui-header-left"><a href="user-login" class="icon icon-109 f-white">返回</a></div>
    <h1 class="weui-header-title">我的借阅历史</h1>
    <div class="weui-header-right"><a href="user-login" class="icon icon-27 f-white"></a></div>
</div>

<div class="weui_cells">

    <div class="weui_cell weui_cell_select weui_select_after">

        <div class="weui_cell_hd">
            <label for="" class="weui_label">过滤显示</label>
        </div>

        <div class="weui_cell_bd weui_cell_primary">

            <select class="weui_select select2" name="select2">
                <option value="1">全部</option>
                <option value="2">已借出</option>
                <option value="3">已还书</option>
                <option value="4">还书过期</option>
            </select>

        </div>
    </div>

</div>

<div style="margin-top: 10px">&nbsp;</div>
<% if(request.getAttribute("records")!=null){
	List<BorrowedRecord> borrowedRecords = (List<BorrowedRecord>)request.getAttribute("records");
	Iterator<BorrowedRecord> iterator = borrowedRecords.iterator();
	while(iterator.hasNext()){
		BorrowedRecord borrowedRecord = iterator.next();
		float m = 100f;
%>
<div class="weui-form-preview">
    <div>
        <div class="weui-form-preview-hd">
            <label class="weui-form-preview-label">付款金额</label>
            <em class="weui-form-preview-value">¥<%=borrowedRecord.getBookItem().getBook().getPrice()/m %></em>
        </div>
        <div class="weui-form-preview-bd">
            <p>
                <a href="book.html" style="color:orange">
                    <label class="weui-form-preview-label">书名</label>
                    <span class="weui-form-preview-value">月亮和六便士</span>
                </a>
            </p>
            <p>
                <label class="weui-form-preview-label">借书日期</label>
                <span class="weui-form-preview-value">2017-05-16</span>
            </p>
            <p>
                <label class="weui-form-preview-label">应还日期</label>
                <span class="weui-form-preview-value">2017-06-16</span>
            </p>


            <p>
                <label class="weui-form-preview-label">借书时间</label>
                <span class="weui-form-preview-value">2017-06-16 12:00:10</span>
            </p>


        </div>

        <div class="weui-form-preview-ft">
            <a class="weui-form-preview-btn weui-form-preview-btn-primary borrow-status">已借未还</a>
        </div>

    </div>


</div>
<%	}
}%>


<script src="asserts/weui/js/zepto.min.js"></script>


<script>
    $(function () {

    	$('#back').click(function(){
            history.back();
        });

        $(".select2").change(function(){

//            alert($(this).val());
            var borrowstatus=$(this).val();

            var allstatus=$('.borrow-status');

            if (borrowstatus==1){
                allstatus.each(function () {
                    $(this).parent().parent().parent().show();
                });
            }else if(borrowstatus==2){

                allstatus.each(function () {
                    if ($(this).text()==="已还书"){
                        $(this).parent().parent().parent().show();
                    }else{
                        $(this).parent().parent().parent().hide();
                    }
                });

            }else if(borrowstatus==3){

                allstatus.each(function () {
                    if ($(this).text()==="已借出"){
                        $(this).parent().parent().parent().show();
                    }else{
                        $(this).parent().parent().parent().hide();
                    }
                });

            }
            else if(borrowstatus==4){

                allstatus.each(function () {
                    if ($(this).text()==="还书过期"){
                        $(this).parent().parent().parent().show();
                    }else{
                        $(this).parent().parent().parent().hide();
                    }
                });

            }



        });



    });

</script>

</body>
</html>
