<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>success</h2>
	<s:if test="#request.books==null||request.books.size()==0">
	</s:if>
		<s:else>
		<table border="1" cellpadding="10" cellspacing="0">
			<tr>
				<td>图标</td>
				<td>书名</td>
				<td>作者</td>
			</tr>
			<s:iterator value="#request.books">
				<tr>
					<td><img alt="hh" src="${simpleChart }"></td>
					<td>${bookTitle}</td>
					<td>${author}</td>
				</tr> 
			</s:iterator>
		</table>
	</s:else>
	
</body>
</html>