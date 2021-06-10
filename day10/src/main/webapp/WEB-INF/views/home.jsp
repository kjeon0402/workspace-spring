<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<body>

	<h1><a href="${cpath }">다중 파일 업로드</a></h1>
	<ul>
		<li><a href="${cpath }/list">글 목록</a></li>
		<li><a href="${cpath }">글 작성</a></li>
	</ul>
	<hr>
	
	
	<fieldset>
		<legend><b>test1</b></legend>
		<form method="POST" action="${cpath }/test1" enctype="multipart/form-data">
			<p><input type="text" name="title" placeholder="제목"></p>
			<p><input type="date" name="vdate" placeholder="방문일자"></p>
			<p><input type="file" name="files[0]"></p>
			<p><input type="file" name="files[1]"></p>
			<p><input type="file" name="files[2]"></p>
			<p><input type="submit" value="등록"></p>
		</form>
	</fieldset>
	
	<fieldset>
		<legend><b>test2</b></legend>
		<form method="POST" action="${cpath }/test2" enctype="multipart/form-data">
			<p><input type="text" name="title" placeholder="제목"></p>
			<p><input type="date" name="vdate" placeholder="방문일자"></p>
			<p><input type="file" name="files" accept="image/*" multiple></p>
			<p><input type="submit" value="등록"></p>
		</form>
	</fieldset>

</body>
</html>