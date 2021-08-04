<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- 본문 전체 감싸는 div -->
<div class="order_wrap">
    <!-- 회원정보 -->
    <div class="order_member_info">
        <h3>ORDER</h3>
        <div>
            <table class="order_member_info_table">
                <tbody>
                    <tr>
                        <th class="border_right" rowspan="2">혜택정보</th>
                        <td class="border_bottom">${mdto.member_name }님은, [Member] 회원이십니다.</td>
                    </tr>
                    <tr>
                        <td>
                            <span><a href="">포인트 : <span>0</span></a></span>
                            <span><a href="">쿠폰 : <span>0</span></a></span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 주문내역 -->
    <div class="order_delivery_info">
        <h3>배송상품 주문내역</h3>
        <div>
            <table class="order_delivery_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" name="checkbox_controller" class="checkbox_product" onclick="selectAll(this)"></th>
                        <th>이미지</th>
                        <th>상품정보</th>
                        <th>판매가</th>
                        <th>수량</th>
                        <th>적립금</th>
                        <th>배송구분</th>
                        <th>배송비</th>
                        <th>합계</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 반복문 필요 (상세페이지서 구매시 해당품목1개, 장바구니에서 여러품목 전체,선택 구매시 해당되는 품목 여러개) -->
                    <tr>
                        <td><input type="checkbox" name="checkbox_each" class="checkbox_product"></td>
                        <td><img class="order_delivery_table_img" src="https://www.theverlin.com/web/product/tiny/202106/94df04401ec9fd8ac4e9e82716279f2d.webp"></td>
                        <td class="order_delivery_table_td_left">${dto.product_name }<br>[옵션: ${dto.option_color }/${dto.option_size }]</td>
                        <td>\ ${dto.product_price }</td>
                        <td> ${dto.product_count }</td>
                        <td>396원</td>
                        <td>기본배송</td>
                        <td>[조건]</td>
                        <td>\ ${dto.product_price }</td>
                    </tr>
                    <tr>
                        <td colspan="9" class="order_delivery_table_final">
                            <span class="order_delivery_table_final_left_span">기본배송</span>
                            <span class="order_delivery_table_final_right_span">상품구매금액 39,600 + 배송비 2,500 = 합계 : \ 42,100</span>
                        </td>               
                    </tr>
                </tbody>
            </table>
            <div class="order_delivery_lower">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</div>
            <div>
                <span class="order_delivery_lower_left"><strong>선택상품을</strong> <button class="order_delivery_lower_button" onclick="orderDeleteProduct()">X 삭제하기</button></span>
                <span class="order_delivery_lower_right"><button class="order_delivery_lower_button" onclick="goToBack()">이전 페이지 ></button></span>
            </div>
        </div>
    </div>

    <!-- 경계선 -->
    <div class="order_line"></div>

    <!-- 배송지 정보 -->
    <div class="order_address_info">
        <h3 class="order_address_info_h3">배송 정보</h3>
        <p class="order_address_info_p"><span class="order_address_info_red_span">*</span><span class="order_address_info_grey_span">필수입력사항</span></p>
        <div class="order_address_info_table_div">
            <table class="order_address_info_table">
                <tbody>
                    <tr>
                        <th>배송지 선택</th>
                        <td>
                            <label><input type="radio" name="address">회원정보와 동일</label>
                            <label><input type="radio" name="address" onclick="newAddress()">새로운 배송지</label>
                            <button class="order_address_info_table_button" onclick="popupAddress()">주소록보기</button>
                        </td>
                    </tr>
                    <tr>
                        <th>받으시는 분 <span>*</span></th>
                        <td><input class="order_address_info_table_input1 order_input" type="text" name="" id="new" value="${mdto.member_name }" required></td>
                    </tr>
                    <tr>
                        <th>주소 <span>*</span></th>
                        <td>
                        	<input class="order_address_info_table_input2" type="text" name="postcode" id="sample6_postcode" value="${mdto.member_post }" placeholder="우편번호">
		         			<input class="order_address_info_table_button" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		         			<input class="order_address_info_table_input3" type="text" name="address" id="sample6_address" value="${mdto.member_address_info }" placeholder="주소"><br>
		         			<input class="order_address_info_table_input3" type="text" name="postDetail" id="sample6_detailAddress" value="${mdto.member_address_detail }" placeholder="상세주소">
<!-- 							<input class="order_address_info_table_input3" type="text" name="postExtra"id="sample6_extraAddress" placeholder="참고항목"> -->
<!--                             <input class="order_address_info_table_input2 order_input" type="text" required> <span><button class="order_address_info_table_button">우편번호 <span>▶</span></button></span><br> -->
<!--                             <input class="order_address_info_table_input3 order_input" type="text" required> <span>기본주소</span><br> -->
<!--                             <input class="order_address_info_table_input4 order_input" type="text" required> <span>나머지주소(선택입력가능)</span> -->
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화 <span>*</span></th>
                        <td>
                            <select class="order_address_info_table_select1 order_select" name="" id="">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            - <input class="order_address_info_table_input5 order_input" type="text" value="${fn:split(mdto.member_mphone, '-')[1] }" id="new2" required>
                            - <input class="order_address_info_table_input6 order_input" type="text" value="${fn:split(mdto.member_mphone, '-')[2] }" id="new3" required>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일 <span>*</span></th>
                        <td>
                            <input class="order_address_info_table_input7 order_input" type="text" value="${mdto.member_email }" required>
                            @
                            <input class="order_address_info_table_input8 order_input" type="text"  id="result" required>
                            <!-- onchange 함수로 도메인 인풋값 전달해주기 -->
                            <select id="mail" class="order_select" onchange="handleOnChange(this)">
                                <option value="" disabled>-이메일 선택-</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="hotmail.com">hotmail.com</option>
                                <option value="yahoo.com">yahoo.com</option>
                                <option value="empas.com">empas.com</option>
                                <option value="korea.com">korea.com</option>
                                <option value="dreamwiz.com">dreamwiz.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="" selected>직접입력</option>
                            </select>
                            <br>
                            <span>이메일을 통해 주문처리과정을 보내드립니다.<br>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>배송메시지</th>
                        <td>
                            <textarea class="order_textarea" name=""></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 결제 예정 금액 -->
    <div class="order_pay_info">
        <h2>총 결제 예정 금액 : \ 00000원</h2>
        <!-- 결제 기능 구현예정 없으므로 클릭시, 알럿창으로 주문완료 띄워주고 주문내역 페이지로 넘기기 -->
        <button onclick="payBtn()">00000원 결제하기</button>
    </div>
    
    <!-- 이용안내 -->
    <div class="order_using_info">
        - 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지않습니다.<br>
        &nbsp&nbsp무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.<br>
        - 최소 결제 가능 금액은 결제금ㅇ액에서 배송비를 제외한 금액입니다.
    </div>
</div>

<!-- 체크박스 전체선택/해제 -->
<script>
    function checkSelectAll()  {
        // 전체 체크박스
        const checkboxes 
          = document.querySelectorAll('.checkbox_product');
        // 선택된 체크박스
        const checked 
          = document.querySelectorAll('.checkbox_product:checked');
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
	function orderDeleteProduct() {
		const selectedProduct = document.querySelectorAll('.checkbox_product')
		for(let i = 0; i < selectedProduct.length; i++) {
			if(selectedProduct[i].checked) {
				const target = selectedProduct[i].parentNode.parentNode
				if(target != selectedProduct[0].parentNode.parentNode) {
					target.parentNode.removeChild(target)
				}
			}
		}
	}
</script>

<!-- 이전페이지 -->
<script>
	function goToBack() {
		location.href = '${cpath}/product/detailProduct/productName'
	}
</script>

<!-- 결제 버튼 -->
<!-- form으로 상품명, 옵션, 가격 등 주문내역으로 정보 보낼수있게 해야함 (미완) -->
<script>
	function payBtn() {
		const selectedProduct = document.querySelectorAll('.checkbox_product')
		if(selectedProduct.length == 1) {
			alert('결제하실 상품이 없습니다 !')
			return
		}else {
			alert('00000원이 결제되었습니다')
			location.href = '${cpath}/mypage_order'
			return
		}
	}
</script>

<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>


<!-- 배송지 팝업 -->
<script>
    function popupAddress() {
        var url = 'popupAddress'
        var name = '더베를린'
        var option = 'width = 800px, height = 300px, top = 100, left = 200, location = no'
        window.open(url, name, option)
    }
</script>

<!-- 새로운 배송시 클릭시 정보 삭제 -->
<script>
    function newAddress() {
        document.getElementById("new").value ='';                 // 받으시는분 id="new"
        document.getElementById("new2").value =''; 		 // 휴대전화 id="new2"
        document.getElementById("sample6_postcode").value =''; 
        document.getElementById("sample6_address").value =''; 
        document.getElementById("sample6_detailAddress").value =''; 
    }
</script>

<!-- 이메일 선택 후 출력 -->
<script>
    function handleOnChange(e) {
    	var mail = document.getElementById("mail");		// select id값
    	var result = document.getElementById("result");		// input id값
    	
    	const value = e.value;

    	 result.value = mail.options[mail.selectedIndex].text;
      }
</script>

<script>
	var tel = document.getElementById("new2").value;
	var strArray = tel.split('-');
	console.log(strArray[0])


</script>
</body>
</html>