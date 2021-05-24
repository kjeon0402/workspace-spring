<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:forEach var="book" items="${list }">
	<div>
		${book.num } |
		${book.title } |
		${book.author } |
		${book.publisher } |
		${book.pbday } |
		${book.count }
	</div>
</c:forEach>

</body>
</html>