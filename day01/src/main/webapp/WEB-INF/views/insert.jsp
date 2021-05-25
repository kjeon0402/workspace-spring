<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<p><input type="text" name="title" placeholder="제목"></p>
	<p><input type="text" name="author" placeholder="저자"></p>
	<p><input type="text" name="publisher" placeholder="출판사"></p>
	<p><input type="text" name="pbday" placeholder="출간일 oooo-oo-oo"></p>
	<p><input type="number" name="count" placeholder="수량"></p>
	<p><input type="submit" value="등록"></p>
</form>

</body>
</html>