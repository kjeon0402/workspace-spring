<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>

<main>
	<table>
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>				
				<th>작성자</th>				
				<th>등록 시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list }">
			<tr>
				<td>${board.idx }</td>
				<td>${board.title }</td>
				<td>${board.writer }</td>
				<td>${board.writeDate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</main>

</body>
</html>