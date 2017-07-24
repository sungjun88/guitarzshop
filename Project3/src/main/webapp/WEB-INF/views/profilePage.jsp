<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
table{
	font-size: 20px;
	margin: 20px;
}
input [type:text] {
	 border : 0px;
}
</style>
<script type="text/javascript">


	function modi_go(f){
		if (f.cus_id.value.length < 6) {
			alert("ID는 6자 이상 적어주세요");
			f.cus_id.focus();
			return;
		} else if (f.cus_pw.value.length < 6) {
			alert("비밀번호는 6자 이상 적어주세요");
			f.cus_pw.focus();
			return;
		} else if (f.cus_pw.value != f.cus_pw2.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			f.cus_pw2.focus();
			return;
		} else{
			var res = confirm("수정하시겠습니까?");
			if(res == true) {
				f.action = "modify.do";
				f.submit;
			}
		}
	}
</script>
</head>
<body>
<jsp:include page="${request.contextPath}/menu" flush="false" />
</body>
<table>
	<tr>
		<td style="min-width: 100px">ID</td>
		<td>${uvo.cus_id}</td>
	</tr>
	<tr>
		<td>PW</td>
		<td>${pwhint}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${uvo.cus_name}</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${uvo.cus_birth}</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>${uvo.cus_gender}</td>
	</tr>
	<tr>
		<td>E-MAIL</td>
		<td>${uvo.cus_email}</td>
	</tr>
	<tr>
		<td>PHONE</td>
		<td>${uvo.cus_phone}</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${uvo.cus_addr}</td>
	</tr>
</table>

<form method="post">
<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">수정</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- modal 수정-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">개인정보 수정</h4>
        </div>
        <div class="modal-body">
          <table>
	<tr>
		<td style="min-width: 100px">ID</td>
		<td> <input type="text" value="${uvo.cus_id}" name="cus_id" disabled="disabled"/> </td>
	</tr>
	<tr>
		<td>PW</td>
		<td> <input type="password" value="${uvo.cus_pw}" name="cus_pw"/> </td>
	</tr>
	<tr>
		<td>PW확인</td>
		<td> <input type="password" value="${uvo.cus_pw}" name="cus_pw2"/> </td>
	</tr>
	<tr>
		<td>이름</td>
		<td> <input type="text" value="${uvo.cus_name}" name="cus_name"/> </td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td> <input type="text" value="${uvo.cus_birth}" name="cus_birth"/> </td>
	</tr>
	<tr>
		<td>성별</td>
		<td> <input type="text" value="${uvo.cus_gender}" name="cus_gender"/> </td>
	</tr>
	<tr>
		<td>E-MAIL</td>
		<td> <input type="text" value="${uvo.cus_email}" name="cus_email"/> </td>
	</tr>
	<tr>
		<td>PHONE</td>
		<td> <input type="text" value="${uvo.cus_phone}" name="cus_phone"/> </td>
	</tr>
	<tr>
		<td>주소</td>
		<td> <input type="text" value="${uvo.cus_addr}" name="cus_addr"/> </td>
	</tr>
</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="modi_go(this.form)">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
</form>

</html>