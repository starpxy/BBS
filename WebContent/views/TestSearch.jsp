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
<script
  src='http://demo.easyrec.org:8080/api-js/easyrec.js'
  type='text/javascript'>
</script>
<script type='text/javascript'>
  var apiKey      = "3570f6da7aea44f8abd15e3399b6d978";
  var tenantId    = "BBSTenant";
</script>
<!--
Useage : easyrec_sendAction(actionType,parameters);
         easyrec_buy(parameters);    // same as easyrec_sendAction("buy",parameters);
         easyrec_view(parameters);   // same as easyrec_sendAction("view",parameters);
         easyrec_rate(parameters);   // same as easyrec_sendAction("rate",parameters);
Example:
-->
 
<script type='text/javascript'>
           easyrec_sendAction("view",{
                                    itemId:"710",
                                    itemUrl:"http://localhost:8080/BBS/views/searchHistory-searchBooks",
                                    itemDescription:"二十五史军事人物随笔，ISBN：9787509402382，作者：刘焕民 著"});
</script>
<!--
Usage : easyrec_getRecommendations(recommendationType,parameters);
 
// same as easyrec_getRecommendations("otherusersalsoviewed",parameters);
easyrec_otherUsersAlsoViewed(parameters);

// same as easyrec_getRecommendations("otherusersalsobought",parameters);
easyrec_otherUsersAlsoBought(parameters);

// same as easyrec_getRecommendations("itemsratedgoodbyotherusers",parameters);
easyrec_itemsRatedGoodByOtherUsers(parameters);

// same as easyrec_getRecommendations("recommendationsforuser",parameters);
easyrec_recommendationsForUser(parameters);

// same as easyrec_getRecommendations("relateditems", parameters);
easyrec_relatedItems(parameters);

Example:
-->

<script type='text/javascript'>
            easyrec_getRecommendations("relatedItems",{
                                       itemId:"710",
                                       drawingCallback:"drawRecommendationList"});
</script>
</html>