<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<c:forEach var="dto" items="${list }" varStatus="st">
		<div>
			<input type="hidden" name="list[${st.index }].idx" value="${dto.idx }">
			${dto.name } | <input type="hidden" name="list[${st.index }].name" value="${dto.name }">
			${dto.price }원 | <input type="hidden" name="list[${st.index }].price" value="${dto.price }">
			<input type="number" name="list[${st.index }].count" value="0" min="0" max="${dto.count }">
			판매 가능 수량 : ${dto.count } 
		</div>
	</c:forEach>
	<c:if test="${not empty list }">
		<input type="submit" value="판매">
	</c:if>
</form>

</body>
</html>