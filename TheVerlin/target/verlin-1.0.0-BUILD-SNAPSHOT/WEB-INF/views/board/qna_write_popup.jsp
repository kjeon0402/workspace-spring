<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            flex-flow: column;
            align-items: center;
        }
        header {
            width: 100%;
            background-color: #333333;
            color: white;
            font-size: 13px;
            font-weight: bold;
            padding: 5px 0;
        }
        header > p {
            margin-left: 15px;
            margin: 0;
            margin-left: 15px;
        }
        main {
            width: 90%;
            display: flex;
            flex-flow: column;
            justify-content: center;
            align-items: center;
        }
        main > .search {
            width: 540px;
            border: 5px solid #e8e8e8;
            margin: 18px 0;
            text-align: center;
            padding: 15px 0;
        }
        main > .search > select {
            width: 90px;
            padding: 3px;
            font-size: 12px;
        }
        main > .search > input[type="text"] {
            width: 200px;
            padding: 5px;
            border: 1px solid #d5d5d5;
        }
        main > .search > input[type="text"]:focus {
            outline: none;
        }
        main > .search > input[type="submit"] {
            background-color: #495164;
            color: white;
            border: 1px solid #495164;
            font-size: 12px;
            padding: 5px;
            cursor: pointer;
        }
        main > p {
            width: 540px;
            display: flex;
            justify-content: space-between;
            font-size: 12px;
        }
        main > p > span:first-child {
            color: #008bcc;
        }
        main > p select {
            padding: 3px;
            font-size: 12px;
        }
        table {
            width: 540px;
            font-size: 12px;
            border-collapse: collapse;
        }
        table th {
            border: 1px solid #d5d5d5;
            font-weight: normal;
            height: 30px;
            background-color: #fbfafa;
        }
        table th:first-child  {
            width: 20%;
        }
        table th:last-child {
            width: 15%;
        }
        table td {
            padding: 5px;
            height: 100px;
        }
        table td:last-child {
            text-align: center;
        }
    </style>
</head>
<body>

<header>
        <p>상품검색</p>
    </header>
    <main>
        <div class="search">
            <select>
                <option value="name">상품명</option>
                <option value="code">상품코드</option>
                <option value="itself_code">상품자체코드</option>
                <option value="manufacture">제조사</option>
                <option value="model">모델명</option>
                <option value="brand">브랜드명</option>
                <option value="trend">트렌드명</option>
            </select>
            <input type="text" name="search_keyword">
            <input type="submit" value="검색하기">
        </div>
        <p>
            <span>총 0개의 상품이 검색되었습니다.</span>
            <span>
                <select>
                    <option value="5">5개씩 보기</option>
                    <option value="10">10개씩 보기</option>
                    <option value="20">20개씩 보기</option>
                    <option value="30">30개씩 보기</option>
                </select>
            </span>
        </p>
        <table>
            <tr>
                <th>상품 이미지</th>
                <th>상품 정보</th>
                <th>선택</th>
            </tr>
            <c:forEach var="list" items="${product }">
	            <tr>
	                <td id="img">
	                    <div class="review_write_img" style="background-image: url('${list.photo_path}'); 
						height: 100px; width: 80px; background-size: 100%; background-position: center center;
	                    background-repeat: no-repeat;"></div>
	                    <input type="hidden" class="hiddenImg" value="${list.photo_path }">
	                </td>
	                <td>
	                    <p id="name">${list.product_name }</p>
	                    <p id="price">${list.product_price }</p>
	                    <input type="hidden" class="product_id" value="${list.product_id }">
	                    <input type="hidden" class="product_name" value="${list.product_name }">
	                    <input type="hidden" class="product_price" value="${list.product_price }">
	                </td>
	                <td><button id="btn" class="select_btn">선택</button></td>
	            </tr>
            </c:forEach>
        </table>
    </main>

    <script>
		document.querySelectorAll('.select_btn').forEach(element => element.onclick = function(event) {
			const tr = event.target.parentNode.parentNode
			const img = tr.querySelector('.hiddenImg')
			const name = tr.querySelector('.product_name')
			const price = tr.querySelector('.product_price')
			const product_id = tr.querySelector('.product_id')
			
			if(name != '' && price != '') {
				opener.document.getElementById('qna_write_img').style.backgroundImage = 'url(' + img.value + ')'
				opener.document.getElementById('product_info_name').innerText = name.value
				opener.document.getElementById('product_info_price').innerText = price.value
				opener.document.querySelector('.product_info_id').value = product_id.value
				window.close()
			}
		})
    </script>

</body>
</html>