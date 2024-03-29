<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>자료 목록</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<style>
	a {
	text-decoration: none;
	}
	</style>
</head>
<body>

	<div id="pageContainer">
	
	
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
		
		<div style="padding-top:25px;text-align:center">
			[ <a href="write.action">자료 등록</a> ]
			<br /><br />
			<table border="1" style="width:600px;margin:0 auto">
				<tr style="background-color:orange;height:30px">
					<th style="width:50px">번호</th>
					<th style="width:300px">제목</th>
					<th style="width:125px">작성자</th>
					<th style="width:125px;text-align:center">작성일</th>
				</tr>
				
				<c:forEach var="upload" items="${ requestScope.uploads }">
				<tr style="height:30px">
					<td>${ upload.uploadNo }</td>
					<td>
					<c:choose>
					<c:when test="${ not upload.deleted }">
					<a href="detail.action?uploadNo=${ upload.uploadNo }">${ upload.title }</a>
					</c:when>
					<c:otherwise>
					<span style="color:lightgray">${ upload.title } (삭제된 글)</span>
					</c:otherwise>
					</c:choose>
					</td>
					<td>${ upload.uploader }</td>
					<td>${ upload.regDate }</td>
				</tr>
				</c:forEach>
				
			</table>
			<br /><br /><br /><br />
		
		</div>
		
	</div>
		

</body>
</html>











