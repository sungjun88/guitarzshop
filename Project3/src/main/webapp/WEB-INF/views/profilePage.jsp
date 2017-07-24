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
		<td> <input type="text" value="${uvo.cus_id}"/> </td>
	</tr>
	<tr>
		<td>PW</td>
		<td> <input type="password" value="${uvo.cus_pw}" /> </td>
	</tr>
	<tr>
		<td>이름</td>
		<td> <input type="text" value="${uvo.cus_name}" /> </td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td> <input type="text" value="${uvo.cus_birth}" /> </td>
	</tr>
	<tr>
		<td>성별</td>
		<td> <input type="text" value="${uvo.cus_gender}" /> </td>
	</tr>
	<tr>
		<td>E-MAIL</td>
		<td> <input type="text" value="${uvo.cus_email}" /> </td>
	</tr>
	<tr>
		<td>PHONE</td>
		<td> <input type="text" value="${uvo.cus_phone}" /> </td>
	</tr>
	<tr>
		<td>주소</td>
		<td> <input type="text" value="${uvo.cus_addr}" /> </td>
	</tr>
</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</html>