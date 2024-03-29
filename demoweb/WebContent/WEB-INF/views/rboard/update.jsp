<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>자료업로드</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input2.css" />
</head>
<body>

	<div id="pageContainer">
	
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">업로드 자료 정보</div>
		        <form action="update.action"
		        	  method="post" enctype="multipart/form-data">
		        <input type="hidden" name="uploadNo" value="${ upload.uploadNo }">
		        <table>
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="title" style="width:580px" value="${ upload.title }" />
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>
		                ${ upload.uploader }
		                </td>
		            </tr>
		            <tr>
		                <th>첨부자료</th>
		                <td>
			                <c:forEach var="file" items="${ upload.files }">
			                <a href="download.action?fileNo=${ file.uploadFileNo }">${ file.userFileName }</a>
			                <a href="delete-file.action?fileNo=${ file.uploadFileNo }">[x]</a>
			                <br>
			                </c:forEach>
		                    <input type="file" name="attach" style="width:580px;height:25px" />
		                </td>
		            </tr>
		            <tr>
		                <th>자료설명</th>
		                <td>
		                	<textarea name="content" 
		                		style="width:580px" rows="15">${ upload.content }</textarea>
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">
		        	<input type="submit" value="자료등록" style="height:25px" />
		        	<input type="button" id="cancel" value="취소" style="height:25px"  />
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#cancel').on('click', function(event) {
			history.back();
			//location.href = "list.action";
		});
	});
	</script>
</body>
</html>