<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
</head>
<body>

<h1>정보 수정</h1>
<hr>

<form method="POST">
	<p>
		<input type="hidden" name="userid" placeholder="ID" value="${dto.userid }">
		<strong>${dto.userid }</strong>
	</p>
	<p><input type="password" name="userpw" placeholder="PASSWORD" value="${dto.userpw }"></p>
	<p><input type="text" name="username" placeholder="NAME" value="${dto.username }"></p>
	<p><input type="text" name="phone" placeholder="PHONE" value="${dto.phone }"></p>
	<p><input type="text" name="birth" placeholder="BIRTH 'yyMMdd'" value="${dto.birth }"></p>
	<p><input type="submit" value="수정"></p>
</form>

</body>
</html>