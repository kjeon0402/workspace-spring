<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	모든 경로는 절대경로와 상대경로로 구분할 수 있다
	최상위 경로를 명시하지 않으면, 상대경로로 처리한다
 -->
<img src="resources/chrome.png" width="200px">
<img src="/resources/chrome.png" width="200px">
<img src="${pageContext.request.contextPath }/resources/chrome.png" width="200px">

</body>
</html>