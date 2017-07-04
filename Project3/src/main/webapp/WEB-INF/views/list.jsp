<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#bbs{
		font-size: 200px;
	}

	#bbs table {
	    width:80%;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:20px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th,#bbs table td {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:5%}
	.subject {width:70%}
	.writer {width:10%}
	.reg {width:10%}
	.hit {width:5%}
	.title{background:#DB0000}
	
	.odd {background:silver}
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #DB0000;
	    color:#2f313e;
	    font-weight:bold;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#DB0000;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #DB0000;
	    background:#DB0000;
	    color:white;
	    font-weight:bold;
	}
		
</style>
<script type="text/javascript">
	function send_go() {
		location.href="write.hb";
	}
</script>
</head>
<body>
<jsp:include page="${request.contextPath}/menu" flush="false" />


	<div id="bbs" align="center">
		<table summary="게시판 목록">
			<caption>Q&A</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr><td colspan="5"><h2>현재 등록된 게시물이 존재하지 않습니다.</h2></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="vs">
							<tr>
								<td>${pvo.totalRecord-((pvo.nowPage-1)*pvo.numPerPage+vs.index)}</td>
								<td style="text-align: left"><a href="view.hb?b_idx=${k.b_idx}&cPage=${pvo.nowPage}">${k.subject }</a></td>
								<td>${k.writer }</td>
								<td>${k.write_date.substring(0,10)}</td>
								<td>${k.hit }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
							<c:choose>
								<c:when test="${pvo.beginPage <= pvo.pagePerBlock}">
									<li class="disable">이전으로</li>
								</c:when>
								<c:otherwise>
								    <li><a href="list.hb?cPage=${pvo.beginPage-pvo.pagePerBlock}">이전으로</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" >
								<c:choose>
									<c:when test="${k == pvo.nowPage }">
										<li class="now">${k}</li>
									</c:when>
									<c:otherwise>
										<li><a href="list.hb?cPage=${k}">${k }</a></li>
									</c:otherwise>	
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pvo.endPage >= pvo.totalPage}">
									<li class="disable">다음으로</li>
								</c:when>
								<c:otherwise>
								    <li><a href="list.hb?cPage=${pvo.beginPage+pvo.pagePerBlock}">다음으로</a></li>
								</c:otherwise>
							</c:choose>							
						</ol>
					</td>
					<td><input type="button" value="글쓰기" onclick="send_go()"/> </td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
