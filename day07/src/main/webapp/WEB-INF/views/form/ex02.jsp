<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>form/ex02</h2>
<!-- 
	Ex02DTO.java를 만들어서 커맨드 객체 형태로 매개변수를 받고
	model에 전달해서, ${name }님은 ${age }살입니다. 형식으로 출력하세요
 -->

<form method="POST">
	<p>
		<input name="name" placeholder="이름">
		<input name="age" placeholder="나이">
	</p>
	<p><input type="submit"></p>
</form>

</body>
</html>