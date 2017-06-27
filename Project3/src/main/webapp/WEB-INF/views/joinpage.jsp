<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu" flush="false" />

	<fieldset>
		<legend>JOIN</legend>
		<form method="post">
			ID : <input type="text" name="cus_id"><br> 
			PW : <input	type="text" name="cus_pw"><br> 
			<input type="button" value="LOGIN" onclick="login_go(this.form)">
		</form>
	</fieldset>


</body>
</html>