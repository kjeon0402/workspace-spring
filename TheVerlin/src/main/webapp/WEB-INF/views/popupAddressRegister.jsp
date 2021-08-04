<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
	.popupAddressRegister_main {
		width: 100%;
	}
	.register_box {
	    border: 1px solid black;
	    border-style: hidden;
	    width:96%;
	    height: 280px;
	    margin-bottom: 0;
	    margin-left: 15px;
		}
	
	.register_wrap , .register_wrap_a , .register_wrap_c {
	    width: 100%;
	    height: 50px;
	    display: flex;
	    margin-top: 1px;
	    font-weight: lighter;
	    font-size: 13px;
	
	    
	}
	.register_wrap_b {
	    width: 99.7%;
	    height: 120px;
	    display: flex;
	    margin-top: 1px;
	    font-weight: lighter;
	    font-size: 13px;
	    border-left: 1px solid #dadada;
	    border-right: 1px solid #dadada;
	   
	}
	.register_delivery, .register_name, .register_address, .register_phone {
	    border: 1px solid #dadada;
	    height: 50px; 
	    line-height: 50px; 
	    width: 160px;
	    text-align: left;
	    padding-left: 15px; 
	}
	.register_address {
	   border: none;
	   width: 159px;
	}
	.register_address_input {
	    border-bottom: none;
	    border-left: 1px solid #dadada;
	    width: 855px;
	}
	.register_address_input > p > input {
		margin-left: 15px;
	}
	
	.register_delivery_input, .register_name_input, .register_phone_input{
	    border: 1px solid #dadada;
	    height: 50px; 
	    width: 840px;
	    border-left: hidden;
	    padding-left: 15px;
	   
	}
	.register_delivery_input > input {
	    border: 1px solid #dadada;
	    margin-top: 13px;
	    height: 20px;
	    width: 200px;
	}
	.register_name_input > input {
	    border: 1px solid #dadada;
	    margin-top: 13px;
	    height: 20px;
	    width: 200px;
	}
	.register_phone_input > p > input {
	    border: 1px solid #dadada;
	    height: 20px;
	    width: 50px;
	}
	.register_phone_input > p > select {
	    border: 1px solid #dadada;
	    height: 25px;
	    width: 60px;
	}
	.register_button {
	  	margin-left: 35%;
	    display: flex;
	}
	.register {
	    margin-bottom: 0;
	    margin-top: 0;
	    font-weight: lighter;
	    font-size: 12px;   
	}
	
	#register_btn1 {
	    width: 90px;
	    height: 25px;
	    background-color: #dadada;
	    border-radius: 3px;
	    border-style: solid;
	    font-size: 12px;   
	}
	#register_btn2 {
	    width: 90px;
	    height: 25px;
	    border-radius: 3px;
	    border-style: solid;
	    font-size: 12px;    
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
	
</style>
</head>
<body>

<div class="popupAddressRegister_main">
<div class="popupAddress_body_top">
		<h2>배송주소록 유의사항</h2>
		<p>- 배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</p>
		<p>- 자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</p>
	</div>
<div class="register_box">
	<form id="parForm">
        <div class="register_wrap">
            <div class="register_delivery">배송지명</div>
            <div class="register_delivery_input">
            <input type="hidden" name="member_uid" value="2">
            <input name="address_name"></div>
        </div>
        <div class="register_wrap_a">
            <div class="register_name">성명</div>
            <div class="register_name_input"><input name="address_recipient"></div>
        </div>
        <div class="register_wrap_b">
            <div class="register_address">주소</div>
            <div class="register_address_input">
                <p>
                    <input class="modify_text" type="text" name="address_post" id="sample6_postcode" placeholder="우편번호">
                    <input class="modify_text find_post_btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                </p>
                <p>
                    <input class="modify_text basic_post" type="text" name="address_info" id="sample6_address" placeholder="주소">
                </p>
                <p>
                    <input class="modify_text detail_post" type="text" name="address_detail" id="sample6_detailAddress" placeholder="상세주소">
<!--                     <input class="modify_text" type="text" name="postExtra"id="sample6_extraAddress" placeholder="참고항목"> -->
                </p>
            </div>
        </div>
        <div class="register_wrap_c">
            <div class="register_phone">휴대전화</div>
            <div class="register_phone_input">
                <p>
                    <select>
                        <option>010</option>
                        <option>011</option>
                        <option>016</option>
                        <option>017</option>
                        <option>018</option>
                        <option>019</option>
                    </select>
                    -<input name="address_mphone">-
                    <input>
                </p>
            </div>
        </div>
       
        <div class="register_button">
       
            <p>
            	<input type="button" id="register_btn1" value="적용" onclick="parSubmit(event)">
                <input type="button" id="register_btn2" value="취소" onclick="parCancle(event)">
            </p>
        </div>
  </form>
</div>
</div>

<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
//             var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
//                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
//                     extraAddr += data.bname;
//                 }
//                 if(data.buildingName !== '' && data.apartment === 'Y'){
//                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
//                 }
//                 if(extraAddr !== ''){
//                     extraAddr = ' (' + extraAddr + ')';
//                 }
//                 document.getElementById("sample6_extraAddress").value = extraAddr;
//             } else {
//                 document.getElementById("sample6_extraAddress").value = '';
            }
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
<!-- 등록,취소 -->
<script>
	function parCancle(event) {
		event.preventDefault()
		location.href = '${cpath}/popupAddress'
	}
	
	function parSubmit(event) {
		event.preventDefault()
		const form = document.getElementById('parForm')
		form.method = 'POST'
		form.action = '${cpath}/popupAddress'
		form.submit()
	}
	
</script>

</body>
</html>