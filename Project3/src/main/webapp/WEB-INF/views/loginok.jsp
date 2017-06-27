<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
legend {
	display: block;
	padding-left: 2px;
	padding-right: 2px;
	border: none;
}

fieldset {
	width: 40%;
	border: solid 5px black;
	margin: auto;
	font-size: 25px;
	font-weight: bold;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu" flush="false" />

	<fieldset>
		<legend>LOG IN</legend>
		<form method="post">
			<b>${uvo.cus_id }님 환영합니다. </b>
		</form>
	</fieldset>
</body>
</html>