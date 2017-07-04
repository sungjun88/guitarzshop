<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	
	table{
		font-size: 20px;
	}
	
	table{
		min-width: 70%;
	}
	
	table,tr,td{
		border : solid 1px black;
		border-collapse: collapse;
		
	}
	
	
</style>

</head>
<body>
<jsp:include page="${request.contextPath}/menu" flush="false" />





<table align="center">
	<tr>
		<td rowspan="5" width="300rem" align="center" style="padding-right: 50px;"><!-- 사진우측여백50px --><img  src="${pvo.pro_category}/${pvo.pro_thum }" style="width:30rem;"></div></td>
		<td colspan="2">${pvo.pro_company }</td>
	</tr>
	<tr>
		<td colspan="2">${pvo.pro_name }</td>
	</tr>
	<tr>
		<td width= "100px">판매가격</td>
		<td><p style="text-decoration: line-through;">${pvo.pro_price}</p> -> <p color="red">${pvo.pro_saleprice}</p></td>
	</tr>
	<tr>
		<td>수량/재고</td>
		<td><input type="number" value="1" min="1" max="${pvo.pro_quantity}" width="3">/${pvo.pro_quantity}</td>
	</tr>
	<tr>
		<td colspan="2">${pvo.pro_content}</td>
	</tr>
	<tr>
		<td colspan="3" align="center"><img  src="${pvo.pro_category}/${pvo.pro_img1 }" style="max-width: 70%"></td>
	</tr>
	
	<c:choose>
		<c:when test="${!empty pvo.pro_img2}">
			<tr><td colspan="3"><img  src="${pvo.pro_category}/${pvo.pro_img2 }" style="width:200px"></td></tr>
		</c:when>
	</c:choose>
	
	<tr>
		<td colspan="3">상품후기를 적을 곳</td>
	</tr>
	<tr>
		<td colspan="3">상품 QnA를 적을 곳</td>
	</tr>
</table>



</body>
</html>