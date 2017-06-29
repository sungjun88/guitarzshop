<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script type="text/javascript">
	function addProduct(){
		// 유효성 검사
		for(var i=0 ; i<document.forms[0].elements.length ; i++){
			if(document.forms[0].elements[i].value == ""){
				if(i>=8 && i<=13) continue;
				alert(document.forms[0].elements[i].name+
						"를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
		}
		document.forms[0].action = "addproductok.do";
		document.forms[0].submit();
	}
</script>
</head>
<body>
<jsp:include page="${request.contextPath}/menu" flush="false" />

<form method="post" 
	encType="multipart/form-data">
		<table summary="상품등록">
			<tbody>
				<tr>
					<th>카테고리:</th>
					<td><input type="text" name="pro_category"/></td>
				</tr>
				<tr>
					<th>상품코드:</th>
					<td><input type="text" name="pro_code" size="12"/></td>
				</tr>
				<tr>
					<th>상품명:</th>
					<td><input type="text" name="pro_name" size="12"/></td>
				</tr>
				<tr>
					<th>제조회사:</th>
					<td><input type="text" name="pro_company" size="12"/></td>
				</tr>
				<tr>
					<th>원가:</th>
					<td><input type="text" name="pro_price" size="12"/></td>
				</tr>
				<tr>
					<th>판매가:</th>
					<td><input type="text" name="pro_saleprice" size="12"/></td>
				</tr>
				<tr>
					<th>썸네일:</th>
					<td><input type="file" name="pro_thum"/></td>
				</tr>
				<tr>
					<th>사진1:</th>
					<td><input type="file" name="pro_img1"/></td>
				</tr>
				<tr>
					<th>사진2:</th>
					<td><input type="file" name="pro_img2"/></td>
				</tr>
				<tr>
					<th>사진3:</th>
					<td><input type="file" name="pro_img3"/></td>
				</tr>
				<tr>
					<th>사진4:</th>
					<td><input type="file" name="pro_img4"/></td>
				</tr>
				<tr>
					<th>사진5:</th>
					<td><input type="file" name="pro_img5"/></td>
				</tr>
				<tr>
					<th>사진6:</th>
					<td><input type="file" name="pro_img6"/></td>
				</tr>
				<tr>
					<th>사진7:</th>
					<td><input type="file" name="pro_img7"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea name="pro_content" cols="50" rows="8"></textarea></td>
				</tr>
				<tr>
					<th>수량:</th>
					<td><input type="number" name="pro_quantity" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록"
						onclick="addProduct()"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
</body>
</html>