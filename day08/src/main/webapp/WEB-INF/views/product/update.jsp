<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form method="POST">
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>가격</th>
			<th>변동 수량</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="st">
			<tr>
				<td>${dto.idx }<input type="hidden" name="list[${st.index }].idx" value="${dto.idx }"></td>
				<td>${dto.name }<input type="hidden" name="list[${st.index }].name" value="${dto.name }"></td>
				<td>${dto.price }원<input type="hidden" name="list[${st.index }].price" value="${dto.price }"></td>
				<td><input type="number" name="list[${st.index }].count" value="${dto.count }"></td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${not empty list }">
		<input type="submit" value="변경">
	</c:if>
</form>

</body>
</html>