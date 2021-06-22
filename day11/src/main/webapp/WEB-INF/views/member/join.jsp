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

<h1>회원 가입 예제(ID 중복 확인)</h1>
<hr>

<form method="POST">
	<p>
		<input type="text" name="userid" placeholder="ID" required autofocus>
		<input type="button" name="checkId" value="ID 중복 확인">
		<span id="checkIdMsg"></span>
	</p>
	<p>
		<input type="password" name="userpw" placeholder="PASSWORD" required>
	</p>
	<p>
		<input type="text" name="username" placeholder="NAME" required>
	</p>
	<p>
		<input type="text" name="phone" placeholder="PHONE" required>
	</p>
	<p>
		<input type="text" name="birth" placeholder="BIRTH 000000" required>
	</p>
	<p>
		<input type="submit" value="가입">
	</p>
</form>
<%-- 
		사용자가 입력한 계정이 DB에 등록이 되어있는지 응답 받아서
		checkIdMsg에 한글로 안내 메시지를 출력한다
		AjaxController(RestController)
		
		사용 가능한 ID입니다 (파란색)
		이미 사용 중인 ID입니다 (빨간색)
		1) id 중복 여부만 체크한다면 method를 POST로 처리할 필요가 없다
		2) select count(*) from member2 where userid = #{userid}
 --%>
 
<script>
	// 회원 가입을 ajax로 처리하는 코드
	const joinForm = document.forms[0];
	joinForm.onsubmit = function(event) {
		event.preventDefault()
		console.log('서브밋 이벤트 발생')
		
		// formData를 불러와서 자바스크립트 객체로 변환하고, 자바스크립트 객체를 JSON으로 변환한 후에 서버에 전송한다
		const ob = {}
		const formData = new FormData(event.target)	// 사용자 입력값을 가지고 있는 formData를 불러와서
		
		for(key of formData.keys()) {						// key값에 따라서
			console.log(key + " : " + formData.get(key))	// value를 확인하고
			ob[key] = formData.get(key)						// ob객체에 key와 value를 추가한다
		}
		console.log(ob)		// 자바스크립트 객체
		
		const url = '${cpath}/join'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),	// 자바스크립트 객체를 JSON형식의 문자열로 변경해서 서버에게 보낸다
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
				alert('가입 성공')
				event.target.reset()
				// <input type="reset" value="초기화">
			} else {
				alert('가입 실패')
			}
		})
	}
</script>
 
<script>
	// ID 중복 체크
	const userid = document.querySelector('input[name="userid"]')
	const checkIdBtn = document.querySelector('input[name="checkId"]')
	const checkIdMsg = document.getElementById('checkIdMsg')
	
	checkIdBtn.onclick = function(event) {
		const url = '${cpath}/checkId/' + userid.value + '/';
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(function(resp) { return resp.text() })
		.then(function(text) {
			// 자바스크립트에서는 형식과 산관없이, 값만 비교하려면 ==(!=)을 사용하고
			// 형식과 값이 모두 일치하는지 비교하려면 ===(!==)을 사용한다
			if(text == 0) {
				checkIdMsg.innerText = '사용 가능한 ID입니다.'
				checkIdMsg.style.color = 'blue'
				document.querySelector('input[name="userpw"]').focus()
			} else {
				checkIdMsg.innerText = '이미 사용 중인 ID입니다.'
				checkIdMsg.style.color = 'red'
				userid.select()			// 지정한 input 요소의 값을 블럭선택하는 함수
			}
		})
	}
</script>
</body>
</html>