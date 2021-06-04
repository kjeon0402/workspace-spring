<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08</title>
</head>
<body>

<header>
<h1><a href="${cpath }">LOGO</a></h1>

<ul>
	<li><a href="${cpath }/product/order">주문하기</a></li>
	<li><a href="${cpath }/product/update">수량변경</a></li>
	<li><a href="${cpath }/product/revenue">주문확인</a></li>
</ul>
</header>
</body>
</html>