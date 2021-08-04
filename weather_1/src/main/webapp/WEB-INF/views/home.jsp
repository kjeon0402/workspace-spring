<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장마주의보</title>
<style>
	.info {
		display: flex;
		justify-content: flex-end;
	}
	.weather_table {
		display: flex;
	}
	ul {
		border-right: 1px solid black;
		border-top: 1px solid black;
	}
	ul:first-child {
		border-left: 1px solid black;
	}
	li {
		border-bottom: 1px solid black;
		padding: 10px;
	}
</style>
</head>
<body>

<h1>장마 조심하세요</h1>
<div class="info">응시자 : 강지언</div>
<hr>

<h2>
	해운대구 우2동 동네예보 - 
	<span id="clock"></span>
</h2>

<!-- <table class="weather_table"></table> -->
<div class="weather_table"></div>

<script>
	function zero(num) {
		return (num < 10 ? '0' + num : '' + num);
	}

	function clock() {
		const time = new Date();
	
		const hours = zero(time.getHours());
		const minutes = zero(time.getMinutes());
		const seconds = zero(time.getSeconds());
	
		document.getElementById('clock').innerHTML = hours + ":" + minutes + ":" + seconds;
	}
	
	clock();
	setInterval(clock, 1000);
</script>

<script>
	const url = '${cpath}/weather'
	const opt = {
			method: 'GET'
	}
	fetch(url, opt).then(resp => resp.json())
	.then(json => {
		const arr = json.response.body.items.item
		
		const ul1 = document.createElement('ul')
		const ul2 = document.createElement('ul')
		const ul3 = document.createElement('ul')
		const ul4 = document.createElement('ul')
		const ul5 = document.createElement('ul')
		
		for(let i = 0; i < arr.length; i++) {
			const li = document.createElement('li');
			if(arr[i].category == 'SKY') {
				const date = arr[i].fcstDate;
				const input = date.slice(0, 4) + '-' + date.slice(4, 6) + '-' + date.slice(6, 8);
				li.innerText = input;
				ul1.appendChild(li);
				li.style.listStyle = 'none';
				ul1.style.padding = '0';
			}
		}
		for(let i = 0; i < arr.length; i++) {
			const li = document.createElement('li');
			if(arr[i].category == 'SKY') {
				const time = String(arr[i].fcstTime).slice(0, 2);
				const now = time + '시';
				li.innerText = now;
				ul2.appendChild(li);
				li.style.listStyle = 'none';
				ul2.style.padding = '0';
			}
		}
		arr.forEach(element => {
			const li = document.createElement('li');
			switch(element.category) {
				case 'SKY':
					let sky;
					switch(element.fcstValue) {
						case '1': sky = '맑음'; break;
						case '3': sky = '구름 많음'; break;
						case '4': sky = '흐림'; break;
					}
					li.innerText = '날씨 : ' + sky;
					ul3.appendChild(li);
					li.style.listStyle = 'none';
					ul3.style.padding = '0';
					break;
				case 'RN1':
					li.innerText = '강수량 : ' + element.fcstValue;
					ul4.appendChild(li);
					li.style.listStyle = 'none';
					ul4.style.padding = '0';
					break;
				case 'WSD':
					li.innerText = '풍속 : ' + element.fcstValue + 'm/s';
					ul5.appendChild(li);
					li.style.listStyle = 'none';
					ul5.style.padding = '0';
					break;
			}
		})
		document.querySelector('.weather_table').appendChild(ul1)
		document.querySelector('.weather_table').appendChild(ul2)
		document.querySelector('.weather_table').appendChild(ul3)
		document.querySelector('.weather_table').appendChild(ul4)
		document.querySelector('.weather_table').appendChild(ul5)
	})
</script>

</body>
</html>