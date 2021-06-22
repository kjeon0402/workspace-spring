<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0614 평가</title>
<style>
	form#writeForm {
		display: flex;
		flex-flow: column;
		width: 400px;
		padding: 10px;
		margin: auto;
	}
	#writeForm input[type="text"] {
		all: unset;
		padding: 5px;
		border: 0;
		border-bottom: 2px solid black;
	}
	#writeForm textarea {
		resize: none;
		width: 400px;
		height: 100px;
		padding: 10px;
	}
	#contents {
		display: flex;
		flex-flow: column;
		align-items: center;
	}
	.content {
		border: 1px solid black;
		margin: 20px 0;
		padding: 10px;
		background-color: #dadada;
		width: 400px;
	}
	.content > pre {
		background-color: white;
		padding: 10px;
	}
</style>
</head>
<body>

<h1>guestbook_0614</h1>
<div style="display: flex; justify-content: flex-end">
응시자 : O O O
</div>
<hr>

<form id="writeForm">
	<p><input type="text" name="writer" placeholder="작성자"></p>
	<p><textarea name="content" placeholder="내용을 입력하세요"></textarea></p>
	<p><input type="submit" value="전송"></p>
</form>

<div id="contents"></div>

<script>
	const writeForm = document.getElementById('writeForm')
	writeForm.onsubmit = function(event) {
		event.preventDefault()
// 		console.log('write')
		
		const formData = new FormData(writeForm)
		const ob = {}	// js의 object를 json으로 변환하기 위해서 필요한 빈 객체
		for(key of formData.keys()) {
			ob[key] = formData.get(key)	// {writer : "이지은"}
		}
// 		console.log(data)
		
		const url = '${cpath}/'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),	// {writer : "이지은", content : "안녕하세요"}
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		fetch(url, opt)
		.then(resp => {			// 응답 객체를 받아서	
// 			console.log(resp)	// 그대로 출력
// 			return resp.text()
			return resp.json()
		})	
		.then(json => {
// 			console.log(text)	// 응답의 내용을 text로 처리하여 출력
// 			console.log(JSON.parse(text))	// 응답한 내용을 JSON형식에 맞추어서 객체로 변환하고 출력
			if(json == 1) {
				writeForm.reset()
				loadContent()
			} else {
				alert('작성 실패')
			}
		})
// 		.then(json => {
// 			console.log(json)
// 		})
	}
	// 데이터를 불러와서 화면에 찍는 함수 정의
	function loadContent() {
		const contents = document.getElementById('contents')
		
		console.log('목록을 불러와서 화면에 띄우기')
		const url = '${cpath}/list'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			contents.innerHTML = ''		// 이미 불러온 내용이 있으면, 지우고 나서
			for(let i = 0; i < json.length; i++) {
				const dto = json[i]		// 배열의 각 요소를 dto라고 할 때
				console.log(dto)
				const div = createDiv(dto)	// dto를 div형식으로 바꿔서 반환하는 함수를 호출한다
				contents.appendChild(div)	// 반환한 div를 contents에 하나씩 추가한다
			}
		})
	}
	window.onload = loadContent		// 페이지가 로딩이 끝나면 바로 호출할 함수
	
	function createDiv(dto) {
		const div = document.createElement('div')
		div.innerHTML = dto.idx + '-' + 
						dto.writer + '-' + 
						dto.wdate + '<br>' + 
						'<pre>' + dto.content + '</pre>'
		div.className = 'content'
// 		div.style.border = '1px solid black'
// 		div.style.margin = '20px 0'
// 		div.style.padding = '10px'
// 		div.style.backgroundColor = '#dadada'
		return div
	}
</script>

</body>
</html>