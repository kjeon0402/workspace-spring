<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simple todo list</title>
<style>
	.fe {
		display: flex;
		justify-content: flex-end;
	}
	.root {
		width: 700px;
		margin: 20px auto;
		text-align: center;
	}
	input[name="title"] {
		width: 300px;
		font-size: 16px;
	}
	input {
		padding: 10px;
		box-sizing: border-box;
		font-size: 14px;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	.todo {
		border: 1px solid black;
		width: 500px;
		margin: 20px auto;
		text-align: left;
		padding-left: 30px;
		border-radius: 25px;
		cursor: pointer;
	}
	.todo:hover {
		box-shadow: 5px 5px grey;
		background-color: #dadada;
	}
	.todo > p:nth-child(1) {
		font-weight: bold;
	}
</style>
</head>
<body>

<h1><a href="${cpath }">Simple Todo List</a></h1>
<div class="fe">응시자 : ㅇㅇㅇ</div>
<hr>
<div class="root">
	<form>
		<p>
			<input type="date" name="d_day" value="${today }">
			<input type="text" name="title" placeholder="날짜를 지정하고 할 일을 입력하세요" autocomplete="off" required>
			<input type="submit" value="등록">
		</p>
	</form>
	<div id="todoList"></div>
</div>

<script>
	const todoList = document.getElementById('todoList')
	const form = document.forms[0]
	
	function selectList(event) {
		todoList.innerText = ''
		const url = '${cpath}/list'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => {
			json.forEach(data => {
				const div = createDiv(data)
				todoList.appendChild(div)
			})
		})
	}
	
	function createDiv(data) {
		const div = document.createElement('div')
		div.style.zIndex = 5
		div.className = 'todo'
		div.innerHTML = '<p>' + data.d_day + '</p>'
		div.innerHTML += '<p>' + data.title + '</p>'
		div.innerHTML += '<input type="hidden" name="idx" value="' + data.idx + '">'
		div.oncontextmenu = rightClickHandler
		return div
	}
	
	
	
	
	
	
	function rightClickHandler(event) {
		event.preventDefault()
		const target = event.target.className === 'todo' ? event.target : event.target.parentNode
		if(confirm('일정을 삭제하시겠습니까')) {
			const url = '${cpath}/' + target.querySelector('input[name="idx"]').value
			const opt = {
				method: 'DELETE'
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text == 1) {
					selectList()
				}
			})
		}
	}
	
	
	
	
	
	
	function write(event) {
		event.preventDefault()
		const ob = {}
		const formData = new FormData(form)
		for(key of formData.keys()) {
			ob[key] = formData.get(key)
		}
		const url = '${cpath}/write'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			}
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				selectList()
				form.reset()
			}
		})
	}

	form.onsubmit = write
	window.onload = selectList
</script>

</body>
</html>