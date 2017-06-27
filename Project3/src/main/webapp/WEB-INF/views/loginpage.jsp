<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	function login_go(f) {
		f.action = "login.do";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu" flush="false" />
	${login }
	<c:choose>
		<c:when test="${login == -1}">
			<b>ID와 비밀번호를 확인해주세요</b>
			<fieldset>
				<legend>LOG IN</legend>
				<form method="post">
					ID : <input type="text" name="cus_id"><br> PW : <input
						type="text" name="cus_pw"><br> <input type="button"
						value="LOGIN" onclick="login_go(this.form)">
				</form>
			</fieldset>
		</c:when>
		<c:when test="${login == 1}">
			<fieldset>
				<legend>LOG IN</legend>
				<form method="post">
					ID : <input type="text" name="cus_id"><br> PW : <input
						type="text" name="cus_pw"><br> <input type="button"
						value="LOGIN" onclick="login_go(this.form)">
				</form>
			</fieldset>
		</c:when>
		<c:otherwise>
			<fieldset>
				<legend>LOG IN</legend>
				<form method="post">
					ID : <input type="text" name="cus_id"><br> PW : <input
						type="text" name="cus_pw"><br> <input type="button"
						value="LOGIN" onclick="login_go(this.form)">
				</form>
			</fieldset>
		</c:otherwise>
	</c:choose>


</body>
</html>