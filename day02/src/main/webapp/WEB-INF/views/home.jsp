<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	ul {
		list-style: none;
		padding: 0;
	}
</style>
</head>
<body>

<h1><a href="${cpath }">LOGO</a></h1>
<div class="login-info">
	<c:if test="${not empty login }">
		<strong>${login.username }</strong>(${login.userid })
	</c:if>
</div>
<hr>
<ul>
	<li><a href="${cpath }/${not empty login ? 'logout' : 'login' }">${not empty login ? '로그아웃' : '로그인' }</a></li>
	<li><a href="${cpath }/join">회원가입</a></li>
	<li><a href="${cpath }/modify">회원 정보 수정</a></li>
	<li><a href="${cpath }/drop">회원탈퇴</a></li>
	<li><a href="${cpath }/board/list?page=1">게시판</a></li>
</ul>

</body>
</html>