<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="main">
<h4 class="h4">POINT</h4>
    <div class="point_box_wrap">
        <div class="point_box_left">
            <ul>
                <li>
                    <strong class="point_strong">> 총 적립금</strong>
                    <span></span>원
                </li>
                <li>
                    <strong class="point_strong">> 사용된 적립금</strong>
                    <span></span>원
                </li>
                <li>
                    <strong class="point_strong">> 환불예정 적립금</strong>
                    <span></span>원
                </li>
            </ul>
        </div>
        <div class="point_box_right">
            <ul>
                <li>
                    <strong class="point_strong">> 사용가능 적립금</strong>
                    <span></span>원
                </li>
                <li>
                    <strong class="point_strong">> 미가용 적립금</strong>
                    <span></span>원
                </li>
            </ul>
        </div>
    </div>

    <div class="point_click">
       <div class="point_click_1">적립내역보기</div>
       <div class="point_click_2">미가용적립내역보기</div>
       <div class="point_click_3">미가용쿠폰/회원등급적립내역</div>
    </div>
    <table class="point_table">
        <thead>
            <tr id="point_head">
                <th>주문날짜</th>
                <th>적립금</th>
                <th>관련 주문</th>
                <th>적립내용</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="point_a" colspan="4">사용가능 적립금이 없습니다</td>
            </tr>
        </tbody>
    </table>

    <div class="point_page">
        << < 1 > >>
    </div>

    <div class="point_guide">
        <p>쿠폰 이용 안내</p>
        <hr>
        <p>쿠폰인증번호 등록하기에서 쇼핑몰에서 발행한 종이쿠폰/시리얼쿠폰/모바일쿠폰 등의 인증번호를 등록하시면 온라인쿠폰으로 발급되어 사용이 가능합니다</p>
        <p>쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다</p>
        <p>쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구애 시에만 사용이 가능합니다</p>
        <p>특정한 종이쿠폰/시리얼쿠폰/모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다</p>
    </div>
</div>

</body>
</html>