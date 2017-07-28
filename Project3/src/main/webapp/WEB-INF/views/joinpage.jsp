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
#cus_id {
	border: 2px solid red;
}
</style>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script type="text/javascript">

	var idchk = 0;
	function join_go(f) {
		/* 유효성 검사 */////////////////length 들이 안됨 나중에 수정요함 ///////////////////
		alert(idchk);
		if (f.cus_name.value == "") {
			alert("이름을 입력하세요");
			f.cus_name.focus();
			return;
		} else if (f.cus_id.value == "") {
			alert("ID를 입력하세요");
			f.cus_id.focus();
			return;
		} else if (idchk == 0) {
			alert("ID중복검사를 하세요");
			f.cus_id.focus();
			return;
		} else if (f.cus_pw.value == "") {
			alert("비밀번호를 입력하세요");
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
		} else if (f.cus_addr.value == "") {
			alert("주소를 입력하세요");
			f.cus_addr.focus();
			return;
		} else{
			f.action = "join.do";
			f.submit();
		}

	}
	/* if (f.cus_id.value.length < 6) {
			alert("ID는 6자 이상 적어주세요");
			f.cus_id.focus();
			return;
	} else if (f.cus_pw.value.length < 6) {
			alert("비밀번호는 6자 이상 적어주세요");
			f.cus_pw.focus();
			return;
	} else if (f.cus_phone.value.length != 11) {
		alert("핸드폰번호를 정확히 입력하세요(-없이)");
		f.cus_phone.focus();
		return;
	} else */
	
	/* if($.trim(f) == 1){
		alert("사용가능한 ID입니다");
	}else{
		alert("안되");
	} */
	
	$(function() {
	      $("#btn2").click(function() {
	         $.ajax({
	            url : "dupidchk.do",
	            type : "post",
	            data : {"cus_id":$("#cus_id").val()},
	            datatype : "html",
	            success : function(data) {
	            	idchk = data;
	            	if(data == 1){
	            		alert("ID사용가능");
	            		document.getElementById("cus_id").style.border="2px solid green";
	            	}else{
	            		alert("동일ID존재. 다른아이디를 입력하세요");
	            		document.getElementById("cus_id").value="";
	            	}
	            },
	            error : function() {
	               alert("실패했습니다. 다시 시도해주세요");
	            }
	         });
	      });
	   });
	
	
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
		<form id="join_form" method="post">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="cus_name"></td>
				</tr>
				<tr>
					<td>ID</td>
					<td><input type="text" name="cus_id" id="cus_id"><input type="button" value="중복확인" id="btn2"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" name="cus_pw"></td>
				</tr>
				<tr>
					<td>PW확인</td>
					<td><input type="password" name="cus_pw2"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="cus_birth"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="cus_gender"></td>
				</tr>
				<tr>
					<td>E-MAIL</td>
					<td><input type="text" name="cus_email"></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" name="cus_phone"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="cus_addr"></td>
				</tr>
				<tr>
					<td>추천인</td>
					<td><input type="text" name="cus_recomm"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="JOIN" onclick="join_go(this.form)" style="float : right"></td>
				</tr>
			</table>
		</form>
	</fieldset>
	</div>




</body>
</html>