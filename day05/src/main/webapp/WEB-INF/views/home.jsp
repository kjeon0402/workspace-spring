<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<style>
	body {
		padding: 0;
		margin: 0;
	}
	header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		background-color: white;
	}
	form > ul {
		padding: 0;
		display: flex;
		justify-content: center;
		flex-flow: column;
	}
	form li {
		display: flex;
		justify-content: center;
		margin-bottom: 3px;
	}
	form li > input {
		width: 250px;
		padding: 1px;
		border: 1px solid #dadada;
	}
	.thumbnail {
		display: flex;
		margin-top: 30px;
	}
	.img {
		background-size: 200px;
		background-position: center center;
		background-repeat: no-repeat;
		width: 200px;
		height: 200px;
	}
	.info {
		line-height: 200px;
		margin-left: 30px;
	}
	main {
		padding-top: 250px;
	}
	main > .thumbnail {
		width: 100%;
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>

<header>
<h1>대문 페이지</h1>
<hr>
<fieldset>
	<form method="POST" enctype="multipart/form-data">
		<ul>
			<li><input type="file" name="file"></li>
			<li><input type="text" name="name" placeholder="이름"></li>
			<li><input type="text" name="pnum" placeholder="전화번호"></li>			
		</ul>
		<p><input type="submit" value="제출"></p>
	</form>
</fieldset>
</header>

<main>
<c:forEach var="img" items="${list }">
	<div class="thumbnail">
		<div class="img" style="background-image: url('${cpath }/uploadPath/${img.filename}');"></div> 
		<div class="info">${img.name } | ${img.pnum }</div>
	</div>
</c:forEach>
</main>
</body>
</html>