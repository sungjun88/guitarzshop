<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script type="text/javascript">
	function join_go(f) {
		f.action = "join.do";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu" flush="false" />

	<c:choose>
		<c:when test="${join == -1}">
			<script type="text/javascript">
			alert("회원가입이 정상적으로 이뤄지지 않았습니다. 관리자에게 문의하세요")
			</script>
		</c:when>
	</c:choose>
	<fieldset>
		<legend>JOIN</legend>
		<form method="post">
			이름 : <input type="text" name="cus_name"><br> ID : <input
				type="text" name="cus_id"><br> PW : <input type="text"
				name="cus_pw"><br> PW확인 : <input type="text"
				name="cus_pw2"><br> 생년월일 : <input type="text"
				name="cus_birth"><br> 성별 : <input type="text"
				name="cus_gender"><br> E-MAIL : <input type="text"
				name="cus_email"><br> 휴대폰번호 : <input type="text"
				name="cus_phone"><br> 주소 : <input type="text"
				name="cus_addr"><br> 추천인 : <input type="text"
				name="cus_recomm"><br> <input type="button" value="JOIN"
				onclick="join_go(this.form)">
		</form>
	</fieldset>



</body>
</html>