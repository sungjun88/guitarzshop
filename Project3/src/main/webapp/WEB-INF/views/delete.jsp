<%@page import="com.hb.mybatis.BVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게 시 판</title>
<script type="text/javascript">
	function delete_go(f) {
		if(f.pwd.value=="${bvo.pwd}"){
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				f.action ="delete_ok.hb";
				f.submit();
			}else{
				history.go(-1);
			}
		}else{
			alert("비번 틀림");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>

<jsp:include page="${request.contextPath}/menu" flush="false" />

	<div align="center">
	<form name="form">
		비 번 : <input type="password" name="pwd" />
		<input type="button" value="삭제" onclick="delete_go(this.form)"/>
		<input type="hidden" name="b_idx" value="${bvo.b_idx}" />
	</form>
	</div>
</body>
</html>