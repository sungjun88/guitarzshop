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
	
</script>
<style type="text/css">
	.outside{
		margin-top : 5%;
		margin : auto;
		width: 70%;
		background-color: red;
		}
	.inside{
		width: 25%;
		background-color: yellow;
	}
	.intable{
	}
	.proimg{
		width: 100%
	}
	.intable td{
		text-align: center;
	}
</style>
</head>
<body >

	<jsp:include page="${request.contextPath}/menu" flush="false" />
	
	<div class="outside">
	
	
	<c:choose>
		<c:when test="${productlistsize<=0}">
			<tr><td colspan="3"><h2>등록된 상품이 존재하지 않습니다.</h2></td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${productlist}" var="k" varStatus="vs">
				<a href="#"><div class="inside">
					<table class="intable">
						<tr><td>
						${k.pro_category}/${k.pro_thum }
							<img class="proimg" alt="사진이없습니다." src="${k.pro_category}/${k.pro_thum }">
						</td></tr>
						<tr><td>
								${k.pro_name }
						</td></tr>
						<tr><td>
								<p style="text-decoration: line-through;">${k.pro_price } 원</p>
						</td></tr>
						<tr><td>
								<b>${k.pro_saleprice } 원</b>
						</td></tr>
					</table>
				</div>
				</a>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	</div>
</body>
</html>