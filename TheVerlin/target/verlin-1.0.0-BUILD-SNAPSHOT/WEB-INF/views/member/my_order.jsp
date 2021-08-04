<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="main">
	<h4 class="h4">ORDER</h4>

    <div class="mypage_order_click">
        <div class="mypage_order_click_1">주문내역조회<span> (0)</span></div>
        <div class="mypage_order_click_2">취소/반품/교환 내역<span> (0)</span></div>
        <div class="mypage_order_click_3">과거주문내역<span> (0)</span></div>
    </div>
    <hr class="mypage_order_hr">

    <div class="mypage_order_box">
        <div class="mypage_order_select">
            <select style="height: 21px;">
                <option>전체 주문처리상태</option>
                <option>입금전</option>
                <option>배송준비중</option>
                <option>배송중</option>
                <option>배송완료</option>
                <option>취소</option>
                <option>교환</option>
                <option>반품</option>
            </select>&nbsp;|
        </div>
        <span class="mypage_order_period">
            &nbsp;<a style="border-right: 1px solid #dadada;" href="">오늘</a>
            <a style="border-right: 1px solid #dadada;" href="">1주일</a>
            <a style="border-right: 1px solid #dadada;" href="">1개월</a>
            <a style="border-right: 1px solid #dadada;" href="">3개월</a>
            <a href="">6개월</a>
        </span>
        &nbsp;<p>
                <input type="date" value="2021-04-06" style="width: 130px; margin-top: 7px;">&nbsp;~
                <input type="date" style="width: 130px; margin-top: 7px;">
                <button>조회</button>
            </p>
    </div>
    <div class="mypage_order_guide" style="height: 30px; margin-bottom: 80px;">
        <p>º기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다</p>
        <p>º완료 후 36개월 이상 경과한 주문은 <a href="" style="font-weight: bold;">[관거주문내역]</a>에서 확인할 수 있습니다</p>
        <p>º주문번호를 클릭하시면 해당 주문에 대한 상세 내역을 확인하실 수 있습니다</p>
    </div>

    <h5 style="margin-bottom: 15px;">주문 상품 정보</h5>
    <table class="mypage_order_table">
        <thead>
            <tr id="mypage_order_head">
                <th>주문일자[주문번호]</th>
                <th>이미지</th>
                <th>상품정보</th>
                <th>수량</th>
                <th>상품구매금액</th>
                <th>주문처리상태</th>
                <th>취소/교환/반품</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="mypage_order_a" colspan="7">주문 내역이 없습니다</td>
            </tr>
        </tbody>
    </table>

    <div class="mypage_order_page">
        << < 1 > >>
    </div>
</div>	
</body>
</html>