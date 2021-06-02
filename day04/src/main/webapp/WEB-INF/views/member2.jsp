<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2 List</title>
</head>
<body>

<h1>member2 List</h1>
<hr>
<form method="POST">
	<p><input type="text" name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="PASSWORD"></p>
	<p><input type="text" name="username" placeholder="NAME"></p>
	<p><input type="text" name="phone" placeholder="PHONE"></p>
	<p><input type="text" name="birth" placeholder="BIRTH 'yyMMdd'"></p>
	<p><input type="submit" value="가입"></p>
</form>

<ul>
	<c:forEach var="member" items="${list }">
		<li><a href="${cpath }/member2/${member.userid }">${member.userid }</a> | ${member.username }</li>
	</c:forEach>
</ul>

</body>
</html>