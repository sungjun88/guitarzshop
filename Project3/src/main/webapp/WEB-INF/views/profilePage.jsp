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
</body>
	<c:choose>
			<c:when test="${login != 1}">
				<a onload="" href="loginpage.do"></a>
			</c:when>
		</c:choose>
<table>
	<tr>
		<th>${uvo.cus_name}</th>
	</tr>
</table>
</html>