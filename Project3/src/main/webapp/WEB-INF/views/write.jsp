<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:80%;
	    margin: auto;
	    border:2px solid black;
	    border-collapse:collapse;
	    font-size:20px;
	    
	}
	
	#bbs table caption {
	    font-size:30px;
	    font-weight:bold;
	    margin-bottom:20px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:#DB0000}
	
	.odd {background:#DB0000}
	
		
</style>
<script type="text/javascript">
	function sendData(){
		// 유효성 검사
		for(var i=0 ; i<document.forms[0].elements.length ; i++){
			if(document.forms[0].elements[i].value == ""){
				if(i==3) continue;
				alert(document.forms[0].elements[i].name+
						"를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
		}
		document.forms[0].action = "write_ok.hb";
		document.forms[0].submit();
	}
</script>
</head>
<body>

<jsp:include page="${request.contextPath}/menu" flush="false" />
	<div id="bbs">
	<form method="post" 
	encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<caption>Q & A</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" size="45"/></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="writer" size="12" value="${uvo.cus_name}"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" cols="50" 
							rows="8"></textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="file_name"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" size="12"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="보내기"
						onclick="sendData()"/>
						<input type="reset" value="다시"/>
						<input type="button" value="목록" 
						onclick="send_go()"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>

