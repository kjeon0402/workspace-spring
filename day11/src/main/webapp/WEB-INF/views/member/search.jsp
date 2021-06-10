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

<h1>회원 검색 예제</h1>
<hr>

<div>
	<input type="search" name="userid" placeholder="검색할 ID를 입력하세요">
	<button id="searchBtn">검색</button>
</div>

<div id="result"></div>

<script>
	const userid = document.querySelector('input[name="userid"]')
	const searchBtn = document.getElementById('searchBtn')
	const result = document.getElementById('result')
	
	searchBtn.onclick = function() {
		const url = '${cpath}/search/' + userid.value + '/'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(function(resp) { 		// JSON.stringify(ob), JSON.parse(str)
// 			return resp.text()		// 응답의 내용을 자바스크립트 문자열로 처리
			return resp.json()		// 응답의 내용을 json으로 인식하고, 객체로 변환하여 처리
		})
		.then(function(json) {
			result.innerHTML = ''	// result 내부의 모든 HTML 태그를 빈 문자열로 대체(삭제)
			const ul = document.createElement('ul')		// ul 하나 만들어 두고
			for(key in json) {					// json 객체의 속성 이름을 key라고 할 때
				const value = json[key]			// json의 key 속성값을 value에 저장하고
				const li = document.createElement('li')	// li 태그에
				li.innerText = key + ' : ' + value		// key와 value를 넣어주고
				ul.appendChild(li)				// ul에 추가한다
			}
			result.appendChild(ul)	// result 안에 ul을 추가한다
		})
	}
</script>

</body>
</html>