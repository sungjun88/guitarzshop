<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
.dv{
	font-size: 30px;
	width:  80%;
	margin: auto;
}

</style>
<script type="text/javascript">
	function join_go(f) {
		/* 유효성 검사 */////////////////length 들이 안됨 나중에 수정요함 ///////////////////
		if (f.cus_name.value == "") {
			alert("이름을 입력하세요");
			f.cus_name.focus();
			return;
		} else if (f.cus_id.value == "") {
			alert("ID를 입력하세요");
			f.cus_id.focus();
			return;
		} else if (f.cus_id.value.length < 6) {
			alert("ID는 6자 이상 적어주세요");
			f.cus_id.focus();
			return;
		} else if (f.cus_pw.value == "") {
			alert("비밀번호를 입력하세요");
			f.cus_pw.focus();
			return;
		} else if (f.cus_pw.value.length < 6) {
			alert("비밀번호는 6자 이상 적어주세요");
			f.cus_pw.focus();
			return;
		} else if (f.cus_pw.value != f.cus_pw2.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			f.cus_pw2.focus();
			return;
		} else if (f.cus_email.value == "") {
			alert("E-MAIL을 입력하세요");
			f.cus_email.focus();
			return;
		} else if (f.cus_phone.value == "") {
			alert("핸드폰번호를 입력하세요");
			f.cus_phone.focus();
			return;
		} else if (f.cus_phone.value.length != 11) {
			alert("핸드폰번호를 정확히 입력하세요(-없이)");
			f.cus_phone.focus();
			return;
		} else if (f.cus_addr.value == "") {
			alert("주소를 입력하세요");
			f.cus_addr.focus();
			return;
		}

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
	<div class="dv">
	<fieldset>
		<legend>JOIN</legend>
		<form method="post">
			이름 : <input type="text" name="cus_name"><br> ID : <input
				type="text" name="cus_id"><br> PW : <input type="password"
				name="cus_pw"><br> PW확인 : <input type="password"
				name="cus_pw2"><br> 생년월일 : <input type="text"
				name="cus_birth"><br> 성별 : <input type="text"
				name="cus_gender"><br> E-MAIL : <input type="text"
				name="cus_email"><br> 휴대폰번호 : <input type="text"
				name="cus_phone"><br> 주소 : <input type="text"
				name="cus_addr"><br> 추천인 : <input type="text"
				name="cus_recomm"><br> <input type="button"
				value="JOIN" onclick="join_go(this.form)">
		</form>
	</fieldset>
	</div>


</body>
</html>