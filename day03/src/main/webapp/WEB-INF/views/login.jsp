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

<!-- 
	로그인은 세션에 객체를 저장하므로,
	어떤 페이지로 리다이렉트 하더라도 상관없다(로그인 유지가 된다)
	
	form 태그는 action 속성으로 넘길 대상을 결정할 수 있다
	queryString or input type="hidden"으로 원래 이동하려던 주소를 컨트롤러에게 전달
	컨트롤러는 이동할 주소가 없으면 대문페이지로 이동시키고
	이동할 주소가 있으면 해당 주소로 이동시키도록 한다
 -->
<form method="POST">
<%-- 	<input type="hidden" name="url" value="${param.url }"> --%>
	<p><input type="text" name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="PASSWORD"></p>
	<p><input type="submit" value="로그인"></p>
</form>

</body>
</html>