<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:forEach var="revenue" items="${list }">
	<div>
		${revenue.idx } | ${revenue.rdate } | ${revenue.pname } | 판매수량 : ${revenue.count } | 총 금액 : ${revenue.cost * revenue.count } | 취소 여부 : ${revenue.cancel }
	</div>
</c:forEach>

</body>
</html>