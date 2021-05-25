<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<p><input type="text" name="title" value="${dto.title }" placeholder="제목"></p>
	<p><input type="text" name="author" value="${dto.author }" placeholder="저자"></p>
	<p><input type="text" name="publisher" value="${dto.publisher }" placeholder="출판사"></p>
	<p><input type="text" name="pbday" value="${dto.pbday }" placeholder="출간일 oooo-oo-oo"></p>
	<p><input type="number" name="count" value="${dto.count }" placeholder="수량"></p>
	<p><input type="submit" value="수정"></p>
</form>

</body>
</html>