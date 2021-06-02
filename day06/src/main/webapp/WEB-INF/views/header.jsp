<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafe</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	.info {
		display: flex;
		justify-content: flex-end;
	}
	ul {
		padding: 0;
		list-style: none;
		display: flex;
		justify-content: center;
		margin: 0;
	}
	ul > li {
		margin: 20px;
		font-size: 20px;
		font-weight: bold;
		width: 200px;
		text-align: center;
	}
</style>
</head>
<body>

<h1><a href="${cpath }">Main</a></h1>
<div class="info"><p>응시자 : 강지언</p></div>

<header>
	<nav>
		<ul>
			<li><a href="${cpath }/product">상품판매</a></li>
			<li><a href="${cpath }/product/insert">상품등록</a></li>
			<li><a href="${cpath }/product/update">수량변경</a></li>
			<li><a href="${cpath }/product/revenue">매출확인</a></li>
		</ul>
	</nav>
	<hr>
</header>

</body>
</html>