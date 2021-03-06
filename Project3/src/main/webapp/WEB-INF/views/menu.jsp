<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<style>

 @import url(//fonts.googleapis.com/earlyaccess/hanna.css);

* {
	box-sizing: border-box;
	font-family: 'Hanna';
}

body {
	margin-bottom: 100px;
	
}

a:visited {
	color: black;
}

/* 상단메뉴 */
.topest {
	overflow: hidden;
	background-color: #DB0000;
	font-size: 17px;
	width: 100%;
	font-weight: bold;
}

.topest a {
	float: right;
	text-decoration: none;
	padding: 10px;
	display: block;
	font-size: 25px;
}

.topest a:link, a:visited {
	color: black;
	text-decoration: none;
	cursor: auto;
}

.banner {
	overflow: hidden;
	background-color: #DB0000;
	font-size: 70px;
	width: 100%;
	text-align: center;
	color: white;
}

.topnav {
	overflow: hidden;
	background-color: #DB0000;
}

.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
	font-weight: bold;
	font-size: 25px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav .icon {
	display: none;
}

@media screen and (max-width: 600px) {
	.topnav
	 
	a
	:not
	 
	(
	:first-child
	 
	)
	{
	display
	:
	 
	none
	;
	
	
}

.topnav a.icon {
	float: right;
	display: block;
}

}
@media screen and (max-width: 600px) {
	.topnav.responsive {
		position: relative;
	}
	.topnav.responsive .icon {
		position: absolute;
		right: 0;
		top: 0;
	}
	.topnav.responsive a {
		float: none;
		display: block;
		text-align: left;
	}

	/* LOGIN FORM */
	.modal-header, h4, .close {
		background-color: #5cb85c;
		color: white !important;
		text-align: center;
		font-size: 30px;
	}
	.modal-footer {
		background-color: #f9f9f9;
	}
}
</style>
<script>
	function myFunction() {
		var x = document.getElementById("myTopnav");
		if (x.className === "topnav") {
			x.className += " responsive";
		} else {
			x.className = "topnav";
		}
	}
</script>
<body>
	<div class="topest">
		<c:choose>
			<c:when test="${login == 1}">
				<c:choose>
					<c:when test="${uvo.cus_id=='admin'}">
						<b>${uvo.cus_name}님 환영합니다.</b>
						<a href="adminpage.do">관리자페이지</a>
						<a href="logout.do">로그아웃</a>
					</c:when>
					<c:otherwise>
						<b>${uvo.cus_name}님 환영합니다.</b>
						<a href="logout.do">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<a href="loginpage.do">로그인</a>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${login != 1}">
				<a href="joinPage.do">회원가입</a> 
			</c:when>
		</c:choose>
		<a href="profilePage.do">마이페이지</a> <a href="#about">주문/배송</a>
		<a href="cartpage.do">장바구니</a>
	</div>

	<div class="banner">
		<b>GUITARZ SHOP.COM</b>
	</div>

	<div class="topnav" id="myTopnav">
		<a href="main.do">HOME</a> <a href="productlistpage.do">ALL ITEMS</a><a href="productlistpage.do?protype=elec">ELEC</a> <a href="productlistpage.do?protype=acoustic">ACOUSTIC</a>
		<a href="productlistpage.do?protype=effector">EFFECTOR</a> <a href="productlistpage.do?protype=amp">AMP</a> <a href="productlistpage.do?protype=etc">ETC</a>
		<a href="list.hb">Q&A</a>
		<a href="javascript:void(0);" style="font-size: 15px;" class="icon"
			onclick="myFunction()">&#9776;</a>
	</div>
	<div style="width:100%; height:100px">
	</div>

</body>
</html>