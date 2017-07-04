<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<style>
#banner{
   height: 20rem;
   background-image: url('resources/image/3.jpg');
   background-position: center;
   background-size: cover;
   background-repeat: no-repeat;
   display: flex;
   justify-content: center;
   align-items: center;
   text-align: center
}
#banner2{
   height: 20rem;
   background-image: url('resources/image/2.jpg');
   background-position: center;
   background-size: cover;
   background-repeat: no-repeat;
   display: flex;
   justify-content: center;
   align-items: center;
   text-align: center
}
#banner3{
   height: 20rem;
   background-image: url('resources/image/1.jpg');
   background-position: center;
   background-size: cover;
   background-repeat: no-repeat;
   display: flex;
   justify-content: center;
   align-items: center;
   text-align: center
}
</style>
<script>

</script>
<body>
<jsp:include page="${request.contextPath}/menu" flush="false" />



<br>
<br>
<br>
<br>

</div>

<table border="1px solid black" style="margin: auto; width: 80%;">
	<tr>
		<td colspan="2" style="width:70%;"><img src="resources/image/3.jpg" style="width:100%; height: 500px"></td>
		<td><img src="resources/image/5.jpg" style="width:100%; height: 500px"></td>
	</tr>
	<tr>
		<td><img src="resources/image/6.jpg" style="width:80%; height: 300px"></td>
		<td><img src="resources/image/7.jpg" style="width:80%; height: 300px"></td>
		<td><img src="resources/image/8.jpg" style="width:100%; height: 300px"></td>
	</tr>
</table>



</body>
</html>