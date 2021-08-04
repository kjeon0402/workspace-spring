<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		padding: 0;
		margin: 0;
	}
	.popupAddress_wrap {
		display: flex;
		flex-flow: column;
	}
	.popupAddress_top {
		width: 100%;
		height: 35px;
		background-color: #333333;
		color: white;
		line-height: 35px;
		padding-left: 15px;
		font-size: 10pt;
	}
	.popupAddress_body_top {
		padding: 15px;
		margin: 15px;
		height: 65px;
		border: 5px solid #e8e8e8;
		color: #353535;
	}
	.popupAddress_body_top > h2 {
		margin: 0;
		border-bottom: 1px solid #e8e8e8;
		padding-bottom: 5px;
		font-size: 10pt;
	}
	.popupAddress_body_top > p {
		font-size: 8pt;
		color: #757575;
		margin: 5px 0;
	}
	.popupAddress_body_bottom {
		margin: 15px;
		margin-top: 0;
	}
	.popupAddress_body_bottom_table {
		width: 100%;
		border: 1px solid #aaa;
		border-collapse: collapse;
	}
	.popupAddress_body_bottom_table > tbody > tr > th {
		border: 1px solid #aaa;
		background-color: #ccc;
		font-size: 10pt;
		font-weight: normal;
	}
	.popupAddress_body_bottom_table > tbody > tr > td {
		text-align: center;
		font-size: 10pt;
		word-wrap: break-word;
	}
	.popupAddress_bottom {
		width: 100%;
		height: 45px;
		background-color: #aaa;
		text-align: center;
		line-height: 45px;
	}
	.popupAddress_bottom > button {
		width: 105px;
		height: 30px;
		font-size: 8pt;
	}
	.popupAddress_bottom > button:first-child {
		background-color: white;
		color: black;
		cursor: pointer;
	}
	.popupAddress_bottom > button:last-child {
		background-color: #333666;
		color: white;
		cursor: pointer;
	}
</style>
</head>
<body>

<div class="popupAddress_wrap">
	<div class="popupAddress_top">배송 주소록 관리</div>
	<div class="popupAddress_body_top">
		<h2>배송주소록 유의사항</h2>
		<p>- 배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</p>
		<p>- 자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</p>
	</div>
	<div class="popupAddress_body_bottom">
		<table class="popupAddress_body_bottom_table">
			<tbody>
				<tr>
					<th><input type="checkbox" class="checkbox_address" name="checkbox_controller" onclick="selectAll(this)"></th>
					<th>배송지명</th>
					<th>수령인</th>
					<th>휴대전화</th>
					<th>주소</th>
					<th>배송지관리</th>
				</tr>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td><input type="checkbox" class="checkbox_address" name="checkbox_each"></td>
							<td>${dto.address_name }</td>
							<td><input type="hidden" value="${dto.address_recipient }" class="address_recipient">${dto.address_recipient }</td>
							<td><input type="hidden" value="${dto.address_mphone }" class="address_mphone">${dto.address_mphone }</td>
							<td>
								<input type="hidden" value="${dto.address_info }" class="address_info">
								<input type="hidden" value="${dto.address_detail }" class="address_detail">
								<input type="hidden" value="${dto.address_post }" class="address_post">
								${dto.address_info }${dto.address_detail }
							</td>
							<td>
								<button class="applyBtn">적용</button>
								<button onclick="popupAddressModify()">수정</button>
							</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="popupAddress_bottom">
		<button onclick="popupAddressDeleteAddress()">선택 주소록 삭제</button>
		<button onclick="popupAddressRegister()">배송지 등록</button>
	</div>
</div>

<!-- 체크박스 전체선택/해제 -->
<script>
    function checkSelectAll()  {
        // 전체 체크박스
        const checkboxes 
          = document.querySelectorAll('.checkbox_address');
        // 선택된 체크박스
        const checked 
          = document.querySelectorAll('.checkbox_address:checked');
        // select all 체크박스
        const selectAll 
          = document.querySelector('.checkbox_controller');
        
        if(checkboxes.length === checked.length)  {
          selectAll.checked = true;
        }else {
          selectAll.checked = false;
        }
      
      }
      
      function selectAll(selectAll)  {
        const checkboxes 
           = document.getElementsByName('checkbox_each');
        
        checkboxes.forEach((checkbox) => {
          checkbox.checked = selectAll.checked
        })
      }
</script>
<!-- 선택 상품 삭제 -->
<script>
	function popupAddressDeleteAddress() {
		const selectedAddress = document.querySelectorAll('.checkbox_address')
		for(let i = 0; i < selectedAddress.length; i++) {
			if(selectedAddress[i].checked) {
				const target = selectedAddress[i].parentNode.parentNode
				if(target != selectedAddress[0].parentNode.parentNode) {
					target.parentNode.removeChild(target)
				}
			}
		}
	}
</script>

<!-- 배송지 등록하기 -->
<script>
   function popupAddressRegister() {
        var url = 'popupAddressRegister'
        var name = '더베를린'
        var option = 'width = 600px, height = 800px, top = 100, left = 200, location = no'
        window.open(url, name, option)
    }
</script>
<!-- 배송지 수정하기 -->
<script>
   function popupAddressModify() {
        var url = 'popupAddressModify'
        var name = '더베를린'
        var option = 'width = 600px, height = 800px, top = 100, left = 200, location = no'
        window.open(url, name, option)
    }
</script>


   <script>
		document.querySelectorAll('.applyBtn').forEach(element => element.onclick = function(event) {
			const tr = event.target.parentNode.parentNode
			const address_recipient = tr.querySelector('.address_recipient')
			const address_mphone = tr.querySelector('.address_mphone')
			const address_info = tr.querySelector('.address_info')
			const address_detail = tr.querySelector('.address_detail')
			const address_post = tr.querySelector('.address_post')
			
			
				opener.document.getElementById('new').value = address_recipient.value
				opener.document.getElementById('sample6_postcode').value = address_post.value
				opener.document.getElementById('sample6_address').value = address_info.value
				opener.document.getElementById('sample6_detailAddress').value = address_detail.value
				opener.document.getElementById('new2').value = address_mphone.value.split('-')[1]
				opener.document.getElementById('new3').value = address_mphone.value.split('-')[2]
				window.close()
		})
    </script>

</body>
</html>