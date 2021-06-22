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

<h1>종류별 ajax 예제</h1>
<hr>

<fieldset>
	<legend><h3>XHR</h3></legend>
	<input type="number" name="num1">
	<input type="button" value="제출1">
</fieldset>

<script>
	const num1 = document.querySelector('input[name="num1"]')
	const btn1 = document.querySelector('input[value="제출1"]')
	
	btn1.onclick = function(event) {
		const request = new XMLHttpRequest()
		request.open('GET', '${cpath}/ajax/' + num1.value + '/')
		request.onreadystatechange = function() {
			console.log(request.readyState, request.status)
			if(request.readyState == 4 && request.status == 200) {
				alert('XHR : ' + request.responseText)
			}
		}
		request.send()	// 요청에 담긴 내용을 지정한 주소로 전송
	}
</script>

<!--------------------------------------------------------------->
<fieldset>
	<legend><h3>jQuery</h3></legend>
	<input type="number" name="num2">
	<input type="button" value="제출2">
</fieldset>

<!-- ajax에 관련된 jQuery 라이브러리를 현재 웹 문서에서 사용하기 위한 선언 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	const num2 = document.querySelector('input[name="num2"]')
	const btn2 = document.querySelector('input[value="제출2"]')
	
	btn2.onclick = function() {
		$.ajax({
			url: '${cpath}/ajax/' + num2.value + '/',
			method: 'GET',
			dataType: 'text',
			success: function(data) {
				alert('jQuery : ' + data)
			}
		})
	}
</script>

<!--------------------------------------------------------------->
<fieldset>
	<legend><h3>axios</h3></legend>
	<input type="number" name="num3">
	<input type="button" value="제출3">
</fieldset>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
	const num3 = document.querySelector('input[name="num3"]')
	const btn3 = document.querySelector('input[value="제출3"]')
	
	btn3.onclick = function() {
		axios.get('${cpath}/ajax/' + num3.value + '/')
		.then(function(response) {
			alert('axios : ' + response.data);
		})
	}
	
</script>

<!--------------------------------------------------------------->
<fieldset>
	<legend><h3>fetch</h3></legend>
	<input type="number" name="num4">
	<input type="button" value="제출4">
</fieldset>

<script>
	const num4 = document.querySelector('input[name="num4"]')
	const btn4 = document.querySelector('input[value="제출4"]')
	
	btn4.onclick = function() {
		fetch('${cpath}/ajax/' + num4.value + '/', {method: 'GET'})
		.then(function(resp) { return resp.text() })
		.then(function(text) { alert('fetch : ' + text) })
	}
</script>

</body>
</html>