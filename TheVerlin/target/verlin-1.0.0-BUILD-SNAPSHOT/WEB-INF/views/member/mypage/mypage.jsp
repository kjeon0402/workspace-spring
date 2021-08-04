<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<div class="d-flex align-items-center flex-column">
    <div class="header-empty-space"></div>
    <div class="default-wrap-size mb-5">
        <p class="font-weight-bold font-size-m">MY PAGE</p>
        <div class="d-flex ml-3 mt-3">
            <div>
                <img src="${cpath}/resources/img/img_member_default.gif" alt="" width="50px" height="50px">
            </div>
            <div class="ml-3 mt-2">
                <p>김시언 님은 [Member] 회원 이십니다.</p>
            </div>
        </div>
        <div>
            <p></p>
        </div>
        <div class="border mt-4 h-110">
            <div class="ml-3 pt-3 h-40">
                <strong class="font-size-m">ORDER STATUS</strong><span class="font-size-s c8f8f8f">recent 3 months</span>
            </div>
            <div class="d-flex ml-3 h-70">
                <div class="order-status w-75 d-flex align-items-center">
                    <p>
                        <span>입금전</span>
                        <strong>0</strong>
                    </p>
                    <p>
                        <span>배송준비중</span>
                        <strong>0</strong>
                    </p>
                    <p>
                        <span>배송중</span>
                        <strong>0</strong>
                    </p>
                    <p>
                        <span>배송완료</span>
                        <strong>0</strong>
                    </p>
                </div>
                <div class="order-status w-25 d-flex align-items-center">
                    <p>
                        <span>취소</span>
                        <strong>0</strong>
                    </p>
                    <p>
                        <span>교환</span>
                        <strong>0</strong>
                    </p>
                    <p>
                        <span>반품</span>
                        <strong>0</strong>
                    </p>
                </div>
            </div>
        </div>
        <div class="ml-3 mt-3 order-status-point d-flex align-items-center">
            <p>가용적립금
                <strong>3,000원</strong>
                <a href="${cpath}/member/point"><button class="ml-4 bg-white">조회</button></a>
            </p>
            <p>총 적립금
                <strong>3,000원</strong>
            </p>
            <p>사용적립금
                <strong>0원</strong>
            </p>
            <p>총주문
                <strong>0(0 회)</strong>
            </p>
            <p>쿠폰
                <strong>0 개</strong>
                <a href="${cpath}/member/coupon"><button class="ml-4 bg-white">조회</button></a>
            </p>
        </div>
    </div>
    <div class="mypage-menu default-wrap-size mb-5">
        <div class="d-flex mt-2">
            <a class="border w-50 pl-3 pt-3 h-90" href="${cpath}/member/my_order">
                <p class="font-size-m">
                    <strong>ORDER</strong>
                </p>
                <p>
                    고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다<br>
                    비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다
                </p>
            </a>
            <a class="border w-50 ml-2 pl-3 pt-3 h-90"  href="${cpath}/member/modify">
                <p class="font-size-m">
                    <strong>MODIFY</strong>
                </p>
                <p>
                    회원이신 고객님의 개인정보를 관리하는 공간입니다<br>
                    개인정보를 최신 정보로 유지하면서 보다 간편히 쇼핑을 즐기실 수 있습니다.
                </p>
            </a>
        </div>
        <div class="d-flex mt-2">
            <a class="border w-50 pl-3 pt-3 h-90" href="${cpath}/member/">
                <p class="font-size-m">
                    <strong>WISH LIST</strong>
                </p>
                <p>
                    관심상품으로 등록하신 상품의 목록을 보여드립니다.
                </p>
            </a>
            <a class="border w-50 ml-2 pl-3 pt-3 h-90" href="${cpath}/member/">
                <p class="font-size-m">
                    <strong>LIKE IT</strong>
                </p>
                <p>
                    '좋아요'를 선택한 상품과 상품분류 목록을 보여드립니다.
                </p>
            </a>
        </div>
        <div class="d-flex mt-2">
            <a class="border w-50 pl-3 pt-3 h-90" href="${cpath}/member/point">
                <p class="font-size-m">
                    <strong>POINT</strong>
                </p>
                <p>
                    적립금은 상품 구매 시 사용하실 수 있습니다.<br>
                    적립된 금액은 현금으로 환불되지 않습니다.
                </p>
            </a>
            <a class="border w-50 ml-2 pl-3 pt-3 h-90" href="${cpath}/member/coupon">
                <p class="font-size-m">
                    <strong>COUPON</strong>
                </p>
                <p>
                    고객님이 보유하고 계신 쿠폰내역을 보여드립니다
                </p>
            </a>
        </div>
        <div class="d-flex mt-2">
            <a class="border w-50 pl-3 pt-3 h-90" href="${cpath}/member/my_board">
                <p class="font-size-m">
                    <strong>MY BOARD</strong>
                </p>
                <p>
                    고객님께서 작성하신 게시물을 관리하는 공간입니다
                    고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.
                </p>
            </a>
            <a class="border w-50 ml-2 pl-3 pt-3 h-90" href="${cpath}/member/address">
                <p class="font-size-m">
                    <strong>ADDRESS</strong>
                </p>
                <p>
                    자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.
                </p>
            </a>
        </div>
    </div>

</div>
</body>
</html>
