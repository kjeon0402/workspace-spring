<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>form/ex03</h2>

<form method="POST">
	<div id="paramList">
		<p>
			<input name="name" placeholder="이름">
			<input name="age" placeholder="나이">
		</p>
	</div>
	<p>
		<input type="button" value="추가">
		<input type="submit">
	</p>
</form>

<script>
	const addHandler = function(event) {
		const p = document.createElement('p')			// p 태그 하나 생성
		const input1 = document.createElement('input')	// input 하나 생성
		const input2 = document.createElement('input')	// input 하나 더 생성
		input1.name = 'name'							// 첫번째 input의 name은 name
		input1.placeholder = '이름'						// 첫번째 input의 placeholder는 이름
		input2.name = 'age'								// 두번째 input의 name은 age
		input2.placeholder = '나이'						// 두번째 input의 placeholder는 나이
		p.appendChild(input1)							// p 내부에 첫번째 input을 추가
		p.appendChild(input2)							// p 내부에 두번째 input을 추가
		document.getElementById('paramList').appendChild(p)	// p를 id="paramList" 안에 추가
	}
	document.querySelector('input[value="추가"]').onclick = addHandler
	// 추가 버튼을 클릭하면 addHandler 함수가 작동하도록 한다
</script>

</body>
</html>