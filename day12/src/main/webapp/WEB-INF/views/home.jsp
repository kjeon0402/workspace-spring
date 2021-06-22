<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Page</title>
<style>
	body, section {
		width: 75%;
		margin: auto;
		padding: 20px;
	}
	
	h1 {
		display: inline-block;
		float: left;
	}
	
	ul {
		display: inline-block;
		float: right;
	}
	
	hr {
		clear: both;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	li {
		display: inline-block;
		width: 140px;
		cursor: pointer;
		border: 1px solid blue;
		padding: 10px;
		font-size: 12pt;
		font-weight: bolder;
	}
	
	li:hover {
		background-color: burlywood;
	}
	
	input[type="text"], input[type="password"] {
		font-size: 12pt;
		padding: 10px;
		width: 200px;
	}
	
	input[type="button"] {
		font-size: 12pt;
		padding: 10px;
		width: 224px;
		font-weight: bolder;
		background-color: white;
		border: 1px solid blue;
		cursor: pointer;
	}
	
	input[type="button"]:hover {
		background-color: burlywood;
	}
	
	input[type="button"]:active {
		background-color: chocolate;
		color: white;
	}
	
	fieldset {
		text-align: center;
	}
	
	table {
		border-collapse: collapse;
		border: 1px solid black;
	}
	
	th {
		border: 1px solid black;
		padding: 20px;
	}
	
	td {
		border: 1px solid black;
		padding: 10px;
	}
	
	select {
		width: 200px;
		padding: 10px;
		font-size: 12pt;
	}
</style>
</head>


<body>
	<h1>
		<a href="${cpath }/">ITBANK PhoneBook</a>
	</h1>
	<ul>
		<li id="insert">신규등록 <br>(POST, insert)</li>
		<li id="search">검색하기 <br>(GET, select)</li>
		<li id="update">수정하기 <br>(PUT, update)</li>
		<li id="delete">삭제하기 <br>(DELETE, delete)</li>
	</ul>
	<hr>
	<section id="section">
		<article id="insertArticle">
			<form id="insertForm" title="POST">
				<h2>신규등록</h2>
				<fieldset>
					<input class="inputField" type="text" name="name" placeholder="이름을 입력하세요" autofocus> 
					<input class="inputField" type="text" name="pnumber" placeholder="전화번호를 입력하세요"> 
					<label> 
						<input class="inputField" type="radio" name="gender" value="남성" required>남성
					</label> 
					<label> 
						<input class="inputField" type="radio" name="gender" value="여성" required>여성
					</label> 
					<input type="button" id="member-post" value="신규등록">
				</fieldset>
			</form>
		</article>

		<article id="searchArticle">
			<form id="searchForm" title="GET" onSubmit="return false;">
				<h2>검색하기</h2>
				<fieldset>
					<select class="inputField" name="searchType">
						<optgroup label="===검색 조건 선택==="></optgroup>
						<option value="name">이름으로 검색</option>
						<option value="pnumber">전화번호 검색</option>
					</select> 
					<input class="inputField" type="text" name="searchWord" placeholder="검색어를 입력하세요"> 
					<input type="button" id="member-get" value="검색">
				</fieldset>
			</form>
		</article>

		<article id="updateArticle">
			<form id="updateForm" title="PUT">
				<h2>수정하기</h2>
				<fieldset>
					<input class="inputField" type="text" name="name" placeholder="이름을 입력하세요" autofocus> 
					<input class="inputField" type="text" name="pnumber" placeholder="전화번호를 입력하세요"> 
					<label> 
						<input class="inputField" type="radio" name="gender" value="남성" required>남성
					</label> 
					<label> 
						<input class="inputField" type="radio" name="gender" value="여성" required>여성
					</label> 
					<input type="button" id="member-put" value="수정하기">
				</fieldset>
			</form>
		</article>

		<article id="deleteArticle">
			<form id="deleteForm" title="DELETE">
				<h2>삭제하기</h2>
				<fieldset>
					<input class="inputField" type="text" name="name" placeholder="이름을 입력하세요" autofocus> 
					<input class="inputField" type="text" name="pnumber" placeholder="전화번호를 입력하세요"> 
					<label> 
						<input class="inputField" type="radio" name="gender" value="남성" required>남성
					</label> 
					<label> 
						<input class="inputField" type="radio" name="gender" value="여성" required>여성
					</label> 
					<input type="button" id="member-delete" value="삭제하기">
				</fieldset>
			</form>
		</article>

		<div id="listArticle">고정 화면</div>
	</section>
<script type="text/javascript">
	const liList = document.querySelectorAll('ul > li')
	const arList = document.querySelectorAll('article')
	liList.forEach(li => {
		
		li.onclick = (event) => {
			liList.forEach(e => {
				e.style.backgroundColor = 'white'
				e.style.color = 'black'
			})
			event.target.style.backgroundColor = 'chocolate'
			event.target.style.color = 'white'
			
			const id = event.target.id
			arList.forEach(a => a.style.display = 'none')
			document.querySelector('#' + id + 'Article').style.display = 'block'
		}
	})
</script>

<script>
	// 등록
	const name = document.querySelector('input[name="name"]')
	const phone = document.querySelector('input[name="pnumber"]')
	const gender = document.querySelector('input[name="gender"]')
	const insertBtn = document.getElementById('member-post')
	
	insertBtn.onclick = function(event) {
		event.preventDefault()
		console.log('이벤트 발생')
		
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
			return resp.text()
		})
		.then(function(text) {
			if(text == 1) {
				alert('등록 완료')
				event.target.reset()
			} else {
				alert('등록 실패')
			}
		})
	}
</script>

<script>
	// 검색
	const name = document.querySelector('input[name="name"]')
	const phone = document.querySelector('input[name="pnumber"]')
	const searchBtn = document.getElementById('member-get')
	const listArticle = document.getElementById('listArticle')
	
	searchBtn.onclick = function() {
		const url = '${cpath}/' + name.value + '/'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(function(resp) {
			return resp.json()
		})
		.then(function(json) {
			listArticle.innerHTML = ''
			const li = document.createElement('li')
			for(key in json) {
				const value = json[key]
				const li = document.createElement('li')
				li.innerText = key + ' : ' + value
				ul.appendChild(li)
			}
			listArticle.appendChild(ul)
		})
	}
	
</script>
</body>
</html>