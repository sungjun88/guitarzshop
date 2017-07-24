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
	<div align= "center" style="">
	<c:choose>
		<c:when test="${login == -1}">
			<b style="font-size: 30px">ID와 비밀번호를 확인해주세요</b>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${login != 1}">
			<c:choose>
				<c:when test="${login2 == true}">
					<b style="font-size: 30px">로그인 후 이용해주세요</b>
				</c:when>
			</c:choose>
		</c:when>
	</c:choose>
	<fieldset>
				<legend>LOG IN</legend>
				<form method="post">
					<input type="text" name="cus_id" placeholder="ID"><br><input
						type="text" name="cus_pw" placeholder="PW"><br> <input type="button"
						value="LOGIN" onclick="login_go(this.form)">
				</form>
			</fieldset>
	</div>

</body>
</html>