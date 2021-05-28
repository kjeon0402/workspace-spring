<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>

<c:if test="${empty login }">
	<script>
		alert('로그인이 필요합니다.');
		location.href('${cpath }/login');
	</script>
</c:if>

<c:if test="${not empty login }">
	<form method="POST">
		<input type="hidden" name="idx" value="${login.idx }">
		<p><input type="text" name="userid" value="${login.userid }"></p>
		<p><input type="text" name="username" value="${login.username }"></p>
		<p><input type="text" name="phone" value="${login.phone }"></p>
		<p><input type="text" name="birth" value="${login.birth }"></p>
		<p><input type="submit" value="수정 완료"></p>
	</form>
	<a href="${cpath }/member/changepw"><button>비밀번호 변경</button></a>
</c:if>
</body>
</html>