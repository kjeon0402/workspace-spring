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
<header style="background-color: ${bgcolor };">
<h1><a href="${cpath }">LOGO</a></h1>
<div class="login-info">
	<c:if test="${not empty login }">
		<strong>${login.username }</strong>(${login.userid })
	</c:if>
</div>
<hr>
<ul>
	<li><a href="${cpath }/member/${not empty login ? 'logout' : 'login' }">${not empty login ? '로그아웃' : '로그인' }</a></li>
	<li><a href="${cpath }/member/join">회원가입</a></li>
	<li><a href="${cpath }/member/modify">회원 정보 수정</a></li>
	<li><a href="${cpath }/member/drop">회원탈퇴</a></li>
</ul>

<hr>
<table>
	<tr>
		<th>idx</th>
		<th>id</th>
		<th>pw</th>
		<th>name</th>
		<th>phone</th>
		<th>birth</th>
	</tr>
	
	<c:forEach var="m" items="${list }">
	<tr>
		<td>${m.idx }</td>
		<td>${m.userid }</td>
		<td>${m.userpw }</td>
		<td>${m.username }</td>
		<td>${m.phone }</td>
		<td>${m.birth }</td>
	</tr>
	</c:forEach>	
</table>
</header>
</body>
</html>