<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<table>
	<tr>
		<th>주문번호</th>
		<th>주문일시</th>
		<th>상품명</th>
		<th>판매수량</th>
		<th>총 금액</th>
		<th>취소 여부</th>
	</tr>
	<c:forEach var="rev" items="${list }">
		<tr>
			<td>${rev.idx }</td>
			<td>${rev.rdate }</td>
			<td>${rev.pname }</td>
			<td>${rev.count }</td>
			<td>${rev.count * rev.cost }</td>
			<td>${rev.cancel }</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>