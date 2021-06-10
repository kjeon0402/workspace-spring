<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIST</title>
</head>
<body>

	<h1><a href="${cpath }">다중 파일 업로드</a></h1>
	<ul>
		<li><a href="${cpath }/list">글 목록</a></li>
		<li><a href="${cpath }">글 작성</a></li>
	</ul>
	<hr>
	
	<c:forEach var="dto" items="${list }">
		<p>${dto.idx } | <a href="${cpath }/read/${dto.idx }">${dto.title }</a></p>
	</c:forEach>

</body>
</html>