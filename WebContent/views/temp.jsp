<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title>无微不至的借阅伴侣</title>
<body>
<form id="form" action="user-login" method="post">
	<input name="meth" value="wechat" type="hidden">
</form>
</body>
<script src="asserts/jquery.min.js"></script>
<script type="text/javascript">
		$('#form').submit();
</script>
</head>
</html>