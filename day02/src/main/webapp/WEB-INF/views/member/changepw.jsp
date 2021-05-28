<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>

<form method="POST">
	<input type="hidden" name="idx" value="${login.idx }">
	<p><input type="password" name="userpw" placeholder="새로운 비밀번호를 입력"></p>
</form>

</body>
</html>