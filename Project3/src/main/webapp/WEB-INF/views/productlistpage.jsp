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
<script type="text/javascript">
	function content_go(k) {

		location.href = "contentpage.do?proidx="+k;
	}
</script>
<style type="text/css">

.outside {
	padding-top: 10%;
	margin-top: 5%;
	margin: auto;
	width: 70%;
	background-color: black;
	background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsNt-VS8BI10UmCmnQD3msi-g0XAb9gcMagbuL1mkaNF7WAaM6dQ");
}

.inside {
	width: 30%;
	margin: 10px;
	padding: 5px;
  	height: 400px;
  	float: left;
  	min-width: 200px;
  	cursor: pointer;
  	font-size: 20px;
}

.intable {
	width: 100%;
}

.proimg {
	max-width: 300px;
	max-height: 200px;
	margin: auto;
	width: 100%;
}

.intable td {
	text-align: center;
}

/*slide  */



</style>
</head>
<body>

	<jsp:include page="${request.contextPath}/menu" flush="false" />

	<br/><br/>	
	<div class="outside">

		<c:choose>
			<c:when test="${productlistsize<=0}">
				<tr>
					<td colspan="3"><h2>등록된 상품이 존재하지 않습니다.</h2></td>
				</tr>
			</c:when>
			<c:otherwise>

				<c:forEach items="${productlist}" var="k" varStatus="vs">
					<div class="inside" onclick="content_go(${k.pro_no})">
						<table class="intable">
							<tr>
								<td><img class="proimg" alt="사진이없습니다."
									src="${k.pro_category}/${k.pro_thum }"></td>
							</tr>
							<tr>
								<td>${k.pro_name }</td>
							</tr>
							<tr>
								<td>
									<p style="text-decoration: line-through;">${k.pro_price } 원</p>
								</td>
							</tr>
							<tr>
								<td><b><fmt:formatNumber value="${k.pro_saleprice }"
											pattern="###,###,###" /> 원</b></td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>