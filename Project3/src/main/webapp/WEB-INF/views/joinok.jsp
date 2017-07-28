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
</style>
</head>
<body>
<jsp:include page="${request.contextPath}/menu" flush="false" />
	<b style="font-size: 50px;">	${uvo.cus_name}님 환영합니다. 로그인 후 사용해 주세요</b>
		
</body>
</html>