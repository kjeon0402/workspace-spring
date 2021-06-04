<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form method="POST">
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>가격</th>
			<th>구매 수량</th>
			<th>수량</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="st">
			<tr>
				<td>${dto.idx }<input type="hidden" name="list[${st.index }].idx" value="${dto.idx }"></td>
				<td>${dto.name }<input type="hidden" name="list[${st.index }].name" value="${dto.name }"></td>
				<td>${dto.price }원<input type="hidden" name="list[${st.index }].price" value="${dto.price }"></td>
				<td><input type="number" name="list[${st.index }].count" value="0" min="0" max="${dto.count }"></td>
				<td>${dto.count }</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${not empty list }">
		<input type="submit" value="판매">
	</c:if>
</form>

</body>
</html>