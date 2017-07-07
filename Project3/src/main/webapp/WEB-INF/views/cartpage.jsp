<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="${request.contextPath}/menu" flush="false" />
 <c:forEach items="${cartlist }" var="k">
			상품번호<p>${k.pro_no}</p>
			상품원가<p>${k.oi_price };</p>
			상품갯수<p>${k.oi_procount };</p>
			상품원가<p>${k.oi_price };</p>
			상품가격<p>${k.oi_price };</p>
		</c:forEach>
 <c:choose>
	<c:when test="${empty cartlist}">
		<b>장바구니가 비어있다!!</b>
	</c:when>
	<c:otherwise>
		<c:forEach items="${cartlist }" var="k">
			상품번호<p>${k.pro_no}</p>
			상품원가<p>${k.oi_price };</p>
			상품갯수<p>${k.oi_procount };</p>
			상품원가<p>${k.oi_price };</p>
			상품가격<p>${k.oi_price };</p>
		</c:forEach>
	</c:otherwise>
</c:choose> 


 
 
</body>
</html>