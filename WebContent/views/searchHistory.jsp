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
<%-- 	<s:if test="#request.searchHistory==null||request.searchHistory.size()==0">
	</s:if>
		<s:else>
			<s:iterator value="#request.searchHistory">
					<h5>${keyword}</h5>
					<br>
			</s:iterator>
		</s:else>
 --%>
 	<s:if test="#request.borrowedRecord==null||request.borrowedRecord.size()==0">
	</s:if>
		<s:else>
			<s:iterator value="#request.borrowedRecord">
					<h5>${borrowedAt}</h5>
					<br>
			</s:iterator>
		</s:else>
 
</body>
</html>