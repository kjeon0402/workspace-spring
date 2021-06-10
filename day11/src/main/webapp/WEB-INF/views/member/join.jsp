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
		<input type="text" name="userid" placeholder="ID">
		<input type="button" name="checkId" value="ID 중복 확인">
	</p>
	<div id="checkIdMsg"></div>
	<p>
		<input type="password" name="userpw" placeholder="PASSWORD">
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