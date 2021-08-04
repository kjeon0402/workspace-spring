<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="main">
	<h4 class="h4">CART</h4>
    
    <div>
        <table class="cart_table">
            <tbody>
                <tr>
                    <th class="border_right" rowspan="2">혜택정보</th>
                    <td class="border_bottom">ooo님은, [Member] 회원이십니다.</td>
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
    <div class="cart_product_wrap">
        <div class="cart_product_cnt_bar">일반상품 (2)</div>
        <table class="cart_list">
            <tr>
                <th><input type="checkbox"></th>
                <th>이미지</th>
                <th>상품정보</th>
                <th>수량</th>
                <th>상품구매금액</th>
                <th>할인금액</th>
                <th>적립금</th>
                <th>배송구분</th>
                <th>배송비</th>
                <th>선택</th>
            </tr>
            <tr>
                <td class=cart_checkbox><input type="checkbox"></td>
                <td><div class="cart_product_img"></div></td>
                <td class="cart_product_info">
                    <p>루인 bl</p>
                    <p>[옵션:아이보리/one size]</p>
                    <p>
                    	<button class="option_modify">옵션변경 ></button>
                    	<div class="cart_option_modify hidden">
                    		<div class="option_modify_title">
                    			<span>옵션변경</span>
                    			<span class="option_modify_close">X</span>
                    		</div>
                    		<div class="item_name_option">
                    			<p>루인 bl</p>
                    			<p>[옵션: 아이보리/one size]</p>
                    		</div>
                    		<div class="item_option_detail">
                    			<p>상품옵션</p>
                    			<div class="item_option_color">
									<div class="column_color">color</div>
									<div>
										<select>
											<option>-[필수] 옵션을 선택해 주세요</option>
											<option>--------------------</option>
											<option>아이보리</option>
											<option>네이비</option>
										</select>
									</div>                    			
                    			</div>
                    			<div class="item_option_size">
                    				<div class="column_size">size</div>
                    				<div>
                    					<select>
                    						<option>-[필수] 옵션을 선택해 주세요</option>
											<option>--------------------</option>
											<option>one-size</option>
                    					</select>
                    				</div>
                    			</div>
                    		</div>
                   			<div class="option_modify_line"></div>
                   			<div class="option_modify_btn">
                   				<button class="add_btn">추가</button>
                   				<button class="change_btn">변경</button>
                   			</div>
                    	</div>
                    </p>
                </td>
                <td>
                    <div class="cart_product_cnt">
                        <input id="cnt" type="text" value="1">
                        <div>
                            <p class="plus"><input type="button" value="∧"></p>
                            <p class="minus"><input type="button" value="∨"></p>
                        </div>
                    </div>
                    <p><button class="change_cnt">변경</button></p>
                </td>
                <td>
                    <p class="cart_product_price">
                        <input id="price" type="text" value="47900" readonly>
						<!-- 추가된 부분임 (수량 변경하면 값이 제대로 바뀌도록) -->
                        <input class="original_price" type="hidden" value="47900">
                    </p>
                </td>
                <td><p>-</p></td>
                <td>
                    <p><span class="cart_pay_kind red">무</span> 479원</p>
                    <p><span class="cart_pay_kind green">카</span> 479원</p>
                    <p><span class="cart_pay_kind purple">실</span> 479원</p>
                    <p><span class="cart_pay_kind lightblue">휴</span> 479원</p>
                </td>
                <td><p>기본배송</p></td>
                <td><p>2,500</p></td>
                <td>
                    <p><a href="${cpath }/order"><button class="cart_ordering">주문하기</button></a></p>
                    <p><a href=""><button>관심상품등록</button></a></p>
                    <p><a href=""><button>X 삭제</button></a></p>
                </td>
            </tr>
        </table>
        <div class="cart_product_price_bar">
            <span>[기본배송]</span>
            <span>상품구매금액 47,900 + 배송비 2,500 = 합계 : 50,400</span>
        </div>
        <div class="cart_menu_bar">
            <div class="cart_delete_area">
                <p>선택상품을 <a class="cart_delete" href="">X 삭제하기</a></p>
            </div>
            <div class="cart_util">
                <p>
                    <a href="">장바구니비우기</a>
                    <button id="cart_print_estimate" onclick="printEstimatePopup(event)">견적서출력 ></button>
                </p>
            </div>
        </div>
        
        <div class="cart_pay_sum">
        	<table class="cart_pay_table">
        		<tr>
        			<th>총 상품금액</th>
        			<th>총 배송비</th>
        			<th>총 할인금액 <button id="show_sale">내역 보기 ></button></th>
        			<th>결제예정금액</th>
        		</tr>
        		<tr>
        			<td>￦ 60,800</td>
        			<td>+￦ 2,500</td>
        			<td>-￦ 1,200</td>
        			<td>=￦ 62,100</td>
        		</tr>
        	</table>
        	<div class="cart_pay_menu">
	        	<span><a class="cart_selected_product_order" href="${cpath }/order">선택상품주문</a></span>
	        	<span><a class="cart_all_product_order" href="${cpath }/order">전체상품주문</a></span>
	        	<span><a class="cart_go_home" href="${cpath }">쇼핑계속하기</a></span>
        	</div>
        </div>
    </div>
    
    <div class="cart_interested_product">
    	<p class="cart_interested_product_title">관심상품</p>
    	<table class="cart_interested_product_list">
    		<tr>
    			<th>이미지</th>
    			<th>상품정보</th>
    			<th>판매가</th>
    			<th>적립금</th>
    			<th>배송구분</th>
    			<th>배송비</th>
    			<th>합계</th>
    			<th>선택</th>
    		</tr>
    		<tr>
    			<td><div class="cart_interested_product_img"></div></td>
                <td class="cart_interested_product_info">
                    <p>루인 bl</p>
                    <p>
                    	<button class="option_modify">옵션변경 ></button>
                    	<div class="cart_option_modify hidden">
                    		<div class="option_modify_title">
                    			<span>옵션변경</span>
                    			<span class="option_modify_close">X</span>
                    		</div>
                    		<div class="item_name_option">
                    			<p>루인 bl</p>
                    			<p>[옵션: 아이보리/one size]</p>
                    		</div>
                    		<div class="item_option_detail">
                    			<p>상품옵션</p>
                    			<div class="item_option_color">
									<div class="column_color">color</div>
									<div>
										<select>
											<option>-[필수] 옵션을 선택해 주세요</option>
											<option>--------------------</option>
											<option>아이보리</option>
											<option>네이비</option>
										</select>
									</div>                    			
                    			</div>
                    			<div class="item_option_size">
                    				<div class="column_size">size</div>
                    				<div>
                    					<select>
                    						<option>-[필수] 옵션을 선택해 주세요</option>
											<option>--------------------</option>
											<option>one-size</option>
                    					</select>
                    				</div>
                    			</div>
                    		</div>
                   			<div class="option_modify_line"></div>
                   			<div class="option_modify_btn">
                   				<button class="add_btn">추가</button>
                   				<button class="change_btn">변경</button>
                   			</div>
                    	</div>
                    </p>
                </td>
                <td>
                    <p class="cart_interested_product_price">
                                                            ￦ <input id="price" type="text" value="47900" readonly>
                    </p>
                </td>
                <td>
                    <p><span class="cart_interested_pay_kind red">무</span> 479원</p>
                    <p><span class="cart_interested_pay_kind green">카</span> 479원</p>
                    <p><span class="cart_interested_pay_kind purple">실</span> 479원</p>
                    <p><span class="cart_interested_pay_kind lightblue">휴</span> 479원</p>
                </td>
                <td><p>기본배송</p></td>
                <td><p>￦ 2,500<br>조건</p></td>
                <td><p>￦ 50,400</p></td>
                <td>
                    <p><a href=""><button class="cart_interested_ordering">주문하기</button></a></p>
                    <p><a href=""><button>장바구니담기</button></a></p>
                    <p><a href=""><button>X 삭제</button></a></p>
                </td>
    		</tr>
    	</table>
    	<div class="paging">
            <span><a href=""><</a></span>&nbsp;&nbsp;&nbsp;
            <span class="num"><a href="">1</a></span>&nbsp;&nbsp;&nbsp;
            <span><a href="">></a></span>
        </div>
    </div>

	<div class="cart_guide">
		<div class="cart_guide_detail">
			<p>장바구니 이용안내</p>
			- 선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.<br>
			- [쇼핑계속하기] 버튼을 누르시면 홈페이지 초기 화면으로 돌아갑니다.<br>
			- 장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.<br>
			- 파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드한 파일로 교체됩니다.
		</div><br>
		
		<div class="cart_installment_guide">
			<p>무이자할부 이용안내</p>
			- 상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.<br>
			- [전체 상품 주문] 버튼을 누르시면 장바구니의 구분 없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.<br>
			- 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.
		</div>
	</div>
</div>

    <!-- 수량 up down 스크립트 -->
    <script>
        const count = document.getElementById('cnt');
        // 장바구니에 들어갈 요소가 여럿 있을 수 있으므로 querySelectorAll 사용
        // 금액 부분이 바뀌는 것은 수정중
        document.querySelectorAll('.plus').forEach(btn => {
            btn.onclick = function() {
                const currentValue = +count.value;
                count.value = currentValue + 1;
            }
        });

        document.querySelectorAll('.minus').forEach(btn => {
            btn.onclick = function() {
                const currentValue = +count.value;
                if(currentValue == 1) {
                    alert('수량은 1미만이 될 수 없습니다.');
                    return;
                }
                count.value = currentValue - 1;
            }
        })
        
        const price = document.getElementById('price');
        const originalPrice = document.querySelector('.original_price').value
        document.querySelectorAll('.change_cnt').forEach(btn => {
        	btn.onclick = function() {
        		const currentPrice = +price.value;
//         		const fixedPrice = currentPrice;
        		price.value = originalPrice * +count.value;
        	}
        })
        
    </script>
    
    <!-- 견적서 출력을 눌렀을 때 견적서 신청 팝업 창을 오픈 -->
    <script>
    	function printEstimatePopup(event) {
    		event.preventDefault();
    		const popup = window.open("cart_estimate_popup", "견적서 신청자 정보 입력", "width=750, height=500, left=0, top=0");
    	}
    </script>

	<!-- 옵션 변경을 누르면 옵션 변경 창이 노출되는 스크립트 -->
	<script>
		const optionModify = document.querySelectorAll('.option_modify');
		const cartOptionModify = document.querySelectorAll('.cart_option_modify');
		
// 		optionModify.forEach(btn => {
// 			btn.onclick = function() {
// 				cartOptionModify.classList.remove('hidden');
// 			}
// 		})
		
		for(let i = 0; i < optionModify.length; i++) {
			optionModify[i].onclick = function() {
				cartOptionModify[i].classList.remove('hidden');
			}
		} 
		
		const optionModifyClose = document.querySelectorAll('.option_modify_close');
		
// 		optionModifyClose.onclick = function() {
// 			cartOptionModify.classList.add('hidden');
// 		}
		
		for(let i = 0; i < optionModifyClose.length; i++) {
			optionModifyClose[i].onclick = function() {
				cartOptionModify[i].classList.add('hidden');
			}
		}
		
	</script>

    <!--  수량에 따라 상품구매금액이 변경되는 스크립트 -->
    <!-- <script>
        const count = document.getElementById('cnt')
        const price = document.getElementById('price')

        const currentPrice = +price.value;
        price.value = currentPrice * +count;
    </script> -->

</body>
</html>