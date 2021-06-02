<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<c:forEach var="dto" items="${list }" varStatus="st">
		<div>
			<input type="hidden" name="list[${st.index }].idx" value="${dto.idx }">
			<input type="text" name="list[${st.index }].name" value="${dto.name }">
			<input type="number" name="list[${st.index }].price" value="${dto.price }">
			<input type="number" name="list[${st.index }].count" value="${dto.count }"> 
		</div>
	</c:forEach>
	<c:if test="${not empty list }">
		<input type="submit" value="정보 수정">
	</c:if>
</form>

</body>
</html>