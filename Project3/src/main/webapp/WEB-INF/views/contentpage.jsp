<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	
	table{
		font-size: 20px;
	}
	
	table{
		min-width: 70%;
	}
	
	table,tr,td{
		border : solid 1px black;
		border-collapse: collapse;
		
	}
	
	
</style>
<script type="text/javascript">
	function cal(price) {
		var many = document.getElementById("many").value;
		var res = price*many;
		var rescom = insertCommaVal(res)
		document.getElementById("many_result").innerHTML = rescom;
		//수량에따라 hidden의 value를 변경
		var saleprice = ${pvo.pro_saleprice};
		var saleprice2 = saleprice*many;
		var price = ${pvo.pro_price};
		var price2 = price*many;
		$('input[name=saleprice]').attr('value',saleprice2);
		$('input[name=price]').attr('value',price2);
	}
	
	function insertCommaVal(val){//금액에 컴마 넣는 메서드
	    var str = val + "";
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    while( reg.test( str ) ) {
	        str = str.replace(reg, '$1' + ',' + '$2');
	    } 
	    return str;
	}
	
	function cart_go(f){
		var retVal = confirm("상품을 카트에 담았습니다. 카트로 이동합니까?");		
		f.action="cart.do?retVal="+retVal;
		f.submit();
		
	} 
</script>

</head>
<body onload="cal(${pvo.pro_saleprice})">
<jsp:include page="${request.contextPath}/menu" flush="false" />




<form method="post">
<input type="hidden" name="prono" value="${pvo.pro_no }">
<input type="hidden" id="saleprice" name="saleprice" value="${pvo.pro_saleprice }">
<input type="hidden" id="price" name="price" value="${pvo.pro_price }">
<table align="center">
	<tr>
		<td rowspan="5" width="300rem" align="center" style="padding-right: 50px;"><!-- 사진우측여백50px --><img  src="${pvo.pro_category}/${pvo.pro_thum }" style="width:30rem;"></div></td>
		<td colspan="2">${pvo.pro_company }</td>
	</tr>
	<tr>
		<td colspan="2">${pvo.pro_name }</td>
	</tr>
	
	
	
	<tr>
		<td width= "100px">판매가격</td>
		<td><span style="text-decoration: line-through;"><fmt:formatNumber value="${pvo.pro_price}" pattern="###,###,###" /></span> -> <span color="red"><fmt:formatNumber value="${pvo.pro_saleprice}" pattern="###,###,###" /></span></td>
	</tr>
	<tr>
		<td>수량/재고</td>
		<td><input type="number" value="1" name="procount" min="1" max="${pvo.pro_quantity}" width="3" id="many" onkeyup="cal(${pvo.pro_saleprice})" onmouseup="cal(${pvo.pro_saleprice})">/${pvo.pro_quantity}</td>
	</tr>
	<tr>
		<td colspan="2" ><div style="float: right"><span id="many_result" style="font-size: 30px; color: red;"></span><input type="button" value="장바구니에 담기" onclick="cart_go(this.form)"><input type="button" value="구매하기"></div></td>
	</tr>
	<tr>
		<td colspan="3" align="center">${pvo.pro_content}</td>
	</tr>
	
	<tr>
		<td colspan="3" align="center"><img  src="${pvo.pro_category}/${pvo.pro_img1 }" style="max-width: 70%"></td>
	</tr>
	
	<c:choose>
		<c:when test="${!empty pvo.pro_img2}">
			<tr><td colspan="3"><img src="${pvo.pro_category}/${pvo.pro_img2 }" style="width:200px"></td></tr>
		</c:when>
	</c:choose>
	
	<tr>
		<td colspan="3">상품후기를 적을 곳</td>
	</tr>
	<tr>
		<td colspan="3">상품 QnA를 적을 곳</td>
	</tr>
</table>
</form>


</body>
</html>