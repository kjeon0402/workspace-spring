<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>form/ex01</h1>
<hr>

<form method="POST">
	<input type="number" name="n1" min="0" max="99">
	<select name="oper">
		<option>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option>
	</select>
	<input type="number" name="n2" min="0" max="99">
	<input type="submit" value="=">
</form>

</body>
</html>