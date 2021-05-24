<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="PASSWORD"></p>
	<p><input type="text" name="name" placeholder="NAME"></p>
	<p><input type="number" name="age" placeholder="AGE" min="1" max="150"></p>
	<p><input type="submit" value="가입"></p>
</form>

</body>
</html>