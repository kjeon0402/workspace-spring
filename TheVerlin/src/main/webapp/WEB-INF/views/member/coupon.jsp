<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="main">
<h4 class="h4">MY COUPON</h4>

    <div class="coupon_title">
        <h5>마이 쿠폰 목록</h5>
        <p>사용가능 쿠폰 : 0장</p>
        
    </div>

    <table class="coupon_table">

        <thead>
            <tr id="coupon_head">
                <th>번호</th>
                <th>쿠폰명</th>
                <th>쿠폰적용 상품</th>
                <th>구매금액</th>
                <th>결제수단</th>
                <th>쿠폰 혜택</th>
                <th>사용가능 기간</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="coupon_a" colspan="7">보유하고 계신 쿠폰 내역이 없습니다</td>
            </tr>
        </tbody>
    </table>

    <div class="coupon_page">
        << < 1 > >>
    </div>


    <div class="coupon_register">
        쿠폰인증번호 등록하기
    </div>
        <div class="coupon_box">
            <p><input><button>쿠폰번호인증</button></p>
            <p>반드시 쇼핑몰에서 발행한 쿠폰번호만 입력해주세요.(10~35자 일련번호"-"제외)</p>
        </div>

    <div class="coupon_guide">
        <p>쿠폰 이용 안내</p>
        <hr class="coupon_hr">
        <p>쿠폰인증번호 등록하기에서 쇼핑몰에서 발행한 종이쿠폰/시리얼쿠폰/모바일쿠폰 등의 인증번호를 등록하시면 온라인쿠폰으로 발급되어 사용이 가능합니다</p>
        <p>쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다</p>
        <p>쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구애 시에만 사용이 가능합니다</p>
        <p>특정한 종이쿠폰/시리얼쿠폰/모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다</p>
    </div>
</div>


</body>
</html>