<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">

    <title>确认借书</title>

    <link rel="stylesheet" href="asserts/weui/css/weui.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui2.css"/>
    <link rel="stylesheet" href="asserts/weui/css/weui3.css"/>


</head>
<body ontouchstart style="background-color: #f8f8f8;">

<!--麦田里的守望者(the cather in the rye)-[美,塞林格]-->


<div class="page-hd">

    <div class="weui_msg" id="msg1">
        <div class="weui_icon_area"><i class="weui_icon_msg weui_icon_info"></i></div>
        <div class="weui_text_area">
            <h2 class="weui_msg_title">《${request.book.bookTitle }》</h2>
            <p class="weui_msg_desc">请将您借的书在30天之内归还,您也可以通过续借延长借书时间</p>
        </div>
        <div class="weui_opr_area">
            <p class="weui_btn_area">
                <a id="con" class="weui_btn weui_btn_primary">确定添加到借书单</a>
                <a id="cancel" href="javascript:;" class="weui_btn weui_btn_default">取消</a>
            </p>
        </div>
        <div class="weui_extra_area">

        </div>
    </div>

</div>


<script src="asserts/weui/js/zepto.min.js"></script>

<script>
    $(function () {

        $("#con").click(function () {
        	$.ajax({
                type:'POST',
                data:{"itemId":"${request.itemId}"},
                url:'borrowedRecord-createRecord',
                dataType : 'json',
                success: function (data){
					if(data.state==2){
						 $.confirm("借书成功", "确定", function () {
	                         window.location.href="borrowedRecord-borrowlist"
	                     }, function () {
	                     	    
	                	 });
					}
					else if(data.state==0){
						$.confirm("对不起，当前不可借阅！", "确定", function () {
							 history.back();
	                     }, function () {
	                         
	                	 });
					}
					else{
						 $.confirm("借书单中最多可添加两本书！", "确定", function () {
							 history.back();
						 }, function () {
	                     	    
	                	 });
						
					}
                },
                error: function(){
                	alert('服务器错误');
                }
             });
        });
        $("#cancel").click(function () {
        	history.back();
        });
    });


</script>



</body>
</html>