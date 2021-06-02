<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 정보 확인</title>
</head>
<body>

<h1>계정 정보 확인</h1>
<hr>
<ul>
	<li><strong>IDX</strong> : ${dto.idx }</li>
	<li><strong>ID</strong> : ${dto.userid }</li>
	<li><strong>PASSWORD</strong> : **********</li>
	<li><strong>NAME</strong> : ${dto.username }</li>
	<li><strong>PHONE</strong> : ${dto.phone }</li>
	<li><strong>BIRTH</strong> : ${dto.birth }</li>
</ul>

<a href="${cpath }/member2/update/${dto.userid }"><button>수정</button></a>
<a href="${cpath }/member2/delete/${dto.userid }"><button>삭제</button></a>

</body>
</html>