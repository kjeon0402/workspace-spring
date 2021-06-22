<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook</title>
<style>
	body {
		width: 100%;
		padding: 0;
		margin: 0;
	}
	main {
		display: flex;
		justify-content: center;
		flex-flow: column;
	}
	form {
		background-color: #dadada;
		width: 75%;
		padding: 10px;
	}
	form input {
		all: unset;
		border-bottom: 2px solid black;
		padding: 5px;
		margin: 5px;
		width: 200px;
	}
	form textarea {
		all: unset;
		width: 90%;
		background-color: white;
		border: 1px solid black;
	}
	div {
		background-color: #dadada;
		width: 75%;
		padding: 10px;
		display: flex;
		flex-flow: column;
		justify-content: center;
		text-align: center;
		margin-top: 30px;
	}
</style>
</head>
<body>

<h1>GuestBook</h1>
<hr>
<main>
<form method="POST" id="writeForm">
	<p><input type="text" name="writer" placeholder="작성자"></p>
	<p><textarea name="content" placeholder="내용을 입력하세요"></textarea>
	<p><input type="submit" value="작성"></p>
</form>
</main>
	
<div id="contents"></div>	

<script>

	const createDiv = function(ob) {
		const writer = document.createElement('div')
		const writedate = document.createElement('div')
		const content = document.createElement('div')
		const wrap = document.createElement('div')
		const top = document.createElement('div')
		const bottom = document.createElement('div')
		
		writer.className = 'writer';
		writedate.className = 'writedate';
		content.className = 'content';
		wrap.className = 'wrap';
		top.className = 'top';
		bottom.className = 'bottom';
		
		writer.innerText = ob.writer;
		writedate.innerText = ob.writedate;
		
		content.innerText = ob.content;
		
		top.appendChild(writer);
		top.appendChild(writedate);
		top.style.display = 'flex';
		top.style.justifyContent = 'space-between';
		bottom.appendChild(content);
		
		wrap.appendChild(top);
		wrap.appendChild(bottom);
		
		return wrap;
	}
	
	const loadContent = function(event) {
		const url = '${cpath}/'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			contents.innerHTML = '';
			for(let i = 0; i < json.length; i++) {
				contents.appendChild(createDiv(json[i]));
			}
		})
	}

	const writeForm = document.getElementById('writeForm');
	const contents = document.getElementById('contents');
	
	writeForm.onsubmit = function(event) {
		event.preventDefault()
		
		const ob = {}
		const formData = new FormData(event.target)
		for(key of formData.keys()) {
			ob[key] = formData.get(key)
		}
		
		const url = '${cpath}/'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8',
			}
		}
		fetch(url, opt)
		.then(function(resp) {
			return resp.json()
		})
		.then(function(json) {
			contents.innerHTML = ''
// 			const ul = document.createElement('ul')
// 			for(key in json) {
// 				const value = json[key]
// 				const li = document.createElement('li')
// 				li.innerText = value
// 				ul.appendChild(li)
// 			}
// 			contents.appendChild(ul)
			loadContent()
		})
		event.target.reset()
	}
</script>

</body>
</html>