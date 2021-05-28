<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>

<h1><a href="${cpath }">day03</a></h1>
<div>${login.username }</div>

<hr>

<ul>
	<li><a href="${cpath }/login">로그인</a></li>
	<li><a href="${cpath }/logout">로그아웃</a></li>
	<li><a href="${cpath }/board">게시판</a></li>
	<li><a href="${cpath }/gallery">이미지 갤러리</a></li>
	<li><a href="${cpath }/qna">질문과 답변</a></li>
</ul>

</body>
</html>