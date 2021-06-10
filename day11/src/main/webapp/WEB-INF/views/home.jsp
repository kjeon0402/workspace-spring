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

<h1>day11 - 비동기 통신</h1>
<hr>

<h2>
        <marquee>AJAX : Asynchronous Javascript And XML (json)</marquee>
</h2>
<p>비동기식으로 자바스크립트를 이용하여 데이터를 주고 받는 통신</p>
<p>데이터는 xml이나 json처럼 문자열의 형태로 표현이 가능한 형식을 사용하여 직렬화/역직렬화 없이 전송한다</p>

<ul>
	<li><a href="${cpath }/member/join">회원 가입 예제(아이디 중복 확인)</a></li>
	<li><a href="${cpath }/member/search">회원 검색 예제</a></li>
</ul>

<fieldset>
        <legend><b>test1</b></legend>
        <input type="text" name="test1" placeholder="이름을 입력하세요">
        <input type="button" id="test1Btn" value="전송">
</fieldset>

<fieldset>
        <legend><b>test2</b></legend>
        <input type="text" name="test2" placeholder="이름을 입력하세요">
        <input type="button" id="test2Btn" value="전송">
        <div id="test2Msg"></div>
</fieldset>

<fieldset>
        <legend><b>test3</b></legend>
        <form id="test3Form">
        	<input type="text" name="name" placeholder="이름을 입력하세요">
        	<input type="number" name="age" placeholder="나이을 입력하세요">
        	<input type="submit" value="전송">
        </form>
        <div id="test3Msg"></div>
</fieldset>

<script>
        //test1
        const test1 = document.querySelector('input[name="test1"]')
        const test1Btn = document.getElementById('test1Btn')
        
        test1Btn.onclick = function(event) {
                console.log('test1 이벤트 함수 실행 !!')
                const url = '${cpath}/test1/' + test1.value + '/'
                const opt = {
                        method: 'GET'
                }
                fetch(url, opt)                                                                // 지정한 주소와 옵션으로 서버에 요청을 전송한다
                .then(function(resp) {return resp.text()})        // 돌아오는 응답을 어떤 형식으로 변환하여 처리할지 결정한다
                .then(function(text) {                                                // text를 받아서 어떤 마무리 작업을 수행할지 작성한다
                        console.log(text)
                        alert('응답 : ' + text)
                })
        }
        
</script>

<script>
	// test2
	const test2 = document.querySelector('input[name="test2"]')
	const test2Btn = document.getElementById('test2Btn')
	const test2Msg = document.getElementById('test2Msg')
	
	test2Btn.onclick = function(event) {
		console.log('test2 실행')
		const url = '${cpath}/test2/' + test2.value + '/'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)									// 요청을 전송
		.then(function(resp) {return resp.text() })		// 응답을 어떤 형식으로 처리할지(text, json...)
		.then(function(text) {
			test2Msg.innerText = text
			test2Msg.style.color = 'blue'
			test2Msg.style.fontWeight = 'bold'		// font-weight => fontWeight
		})
	}
</script>

<script>
	// test3 : form을 전송하기
	const test3From = document.getElementById('test3Form')
	const test3Msg = document.getElementById('test3Msg')
	
	test3Form.onsubmit = function(event) {		// form이 제출될 때 작동하는 이벤트 함수
		event.preventDefault()		// 기본 작동(form:submit)을 막는다
		
		const formData = new FormData(event.target)
		const url = '${cpath}/test3'
		const opt = {
			method: 'POST',
			body: formData,
		}
		fetch(url, opt)
		.then(function(resp) { return resp.text() })
		.then(function(text) {
			test3Msg.innerText = text
			test3Msg.style.display = 'inline-block'
			test3Msg.style.padding = '10px'
			test3Msg.style.color = 'white'
			test3Msg.style.backgroundColor = 'black'
			test3Msg.style.fontSize = '20px'
			test3Msg.style.fontFamily = '고딕'
			test3Msg.style.fontWeight = 'bold'
		})
	}
</script>

</body>
</html>
