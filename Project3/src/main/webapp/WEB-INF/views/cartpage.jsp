<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
table, tr, td{
	margin: auto;
	font-size: 20px;
}
th{
	border: solid 1px black;
}
td{
}
table{
	width: 80%;
	border-collapse: collapse;
}

#pno {
	width: 10%;
	padding-left: 5px;
}
#pimg {
	width: 60px;
}
#pname {
	width: 60%;
	padding-left: 10px;
}
#pcount {
	width: px;
	padding-left: 10px;
}
#pprice {
	width: 15%;
	padding-left: 10px;
}
#psale {
	width: 15%;
	padding-left: 10px;
}

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu" flush="false" />

	<table>
		<c:choose>
			<c:when test="${empty cartlist}">
				<tr>
					<td><b style="">장바구니가 비어있다!!</b></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr >
					<th colspan="2" style="text-align: center">상품</th>
					<th style="text-align: center">수량</th>
					<th style="text-align: center">상품원가</th>
					<th style="text-align: center">판매가</th>
				</tr>
				<c:forEach items="${cartlist }" var="k">
					<tr>
						<td id="pimg"><img class="proimg" alt="사진이없습니다." src="${k.oi_pvo.pro_category}/${k.oi_pvo.pro_thum }" style="width:50px; height:50px"></td>
						<td id="pname">${k.oi_pvo.pro_name}</td>
						<td id="pcount">${k.oi_procount }</td>
						<td id="pprice"><b><fmt:formatNumber value="${k.oi_price }"
											pattern="###,###,###" /> 원</b></td>
						<td id="psale"><b><fmt:formatNumber value="${k.oi_saleprice }"
											pattern="###,###,###" /> 원</b></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>
	<table>
		<tr>
			<th>총 수량</th>
			<th>총 판매가</th>
			<th>배송비</th>
			<th>총 할인</th>
			<th>총 금액</th>
		</tr>
		<tr>
			
		</tr>
	
	</table>




</body>
</html>