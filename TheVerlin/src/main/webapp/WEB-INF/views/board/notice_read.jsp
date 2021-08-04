<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="main">
<h4 class="h4">NOTICE</h4>
<div class="notice_read_wrap">
	<div class="notice_read_posting_title">
		<span class="notice_read_class">SUBJECT</span> <span>${dto.title }</span>
	</div>
	<div class="notice_read_writer">
		<span class="notice_read_class">NAME</span>&nbsp;&nbsp;&nbsp; <span>${dto.member_id }</span>
	</div>
	<div class="notice_read_content">
<!-- 		<p class="notice_read_mini_title">[THE VERLIN APP 다운로드]</p> -->
<!-- 		APP 설치 후 로그인 하시면 앱에서만 발급 가능한 5% 할인 쿠폰 증정.<br> -->
<!-- 		<br> 추후 앱 전용 혜택 및 다양한 이벤트로 찾아뵐 예정입니다.<br> -->
<!-- 		<br> 매일 업데이트 되는 핫한 신상품을 앱으로 빠르게 만나보세요. -->
		${dto.content }
	</div>
</div>
<a href="${cpath }/board/notice">
<button class="notice_list_back">
	list
</button>
</a>
</div>

</body>
</html>