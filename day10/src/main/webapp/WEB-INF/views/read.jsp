<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>READ</title>
</head>
<body>

<h1><a href="${cpath }">다중 파일 업로드</a></h1>
	<ul>
		<li><a href="${cpath }/list">글 목록</a></li>
		<li><a href="${cpath }">글 작성</a></li>
	</ul>
	<hr>
	<div>
	<c:forEach var="dto" items="${read }" varStatus="st">
		<c:if test="${st.first }">
			<p>${dto.idx } | ${dto.title } </p>
		</c:if>
		<img src="${cpath }/upload/${dto.filename }" width="200px">
	</c:forEach>
	</div>
</body>
</html>