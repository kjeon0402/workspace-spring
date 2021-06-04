<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="i" begin="0" end="9" step="1">
	${i },
</c:forEach>
<br>
<c:forEach var="text" items="${list }" varStatus="st">
	${st.index }. ${text },
	${st.count }. ${text },
</c:forEach>

</body>
</html>