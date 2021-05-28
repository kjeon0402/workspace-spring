<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>

<c:if test="${empty login }">
	<script>
		alert('로그인이 필요합니다.');
		location.href('${cpath}');
	</script>
</c:if>

<c:if test="${not empty login }">
	<form method="POST">
		<input type="hidden" name="idx" value="${login.idx }">
		<p><input type="password" name="userpw" placeholder="비밀번호 입력"></p>
	</form>
</c:if>
</body>
</html>