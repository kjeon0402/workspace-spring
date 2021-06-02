<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>mybatis test</h1>
<hr>

<h3>test1 : ${test1 }</h3>
<h3>test2 : ${test2 }</h3>

<a href="${cpath }/member2/"><button>member2 List</button></a>

</body>
</html>