<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/js/summernote-ko-KR.js"></script>

<script>
	   $(document).ready(function() {
	         $('#summernote').summernote({
	           width: 1100,
	           height: 500,
	           lang: 'ko-KR',
	           toolbar: [
	               // [groupName, [list of button]]
	               ['Font Style', ['fontname']],
	               ['style', ['bold', 'italic', 'underline']],
	               ['font', ['strikethrough']],
	               ['fontsize', ['fontsize']],
	               ['color', ['color']],
	               ['para', ['paragraph']],
	               ['height', ['height']],
	               ['Insert', ['picture']],
	               ['Insert', ['link']],
	               ['Misc', ['fullscreen']]
	            ]
	       });
	   });
</script>

<div class="main">
<h4 class="h4">QNA</h4>
<div class="qna_write_wrap">
	<form class="writeForm" method="POST" enctype="multipart/form-data">
		<div class="qna_write_item">
			<div id="qna_write_img"></div>
			<div id="qna_write_info">
				<p id="product_info_name"></p>
                <p id="product_info_price"></p>
                <p><input type="hidden" name="product_id" class="product_info_id" value=""></p>
				<p><input type="button" value="상품정보선택 >" onclick="showPopup(event);" /></p>
			</div>
		</div>
		<input type="hidden" name="member_uid" value="${login }">
		<div class="qna_write_content">
			<div class="qna_write_upmenu">
				<div class="qna_write_column">SUBJECT</div>
				<div class="qna_write_input">
					<select name="title">
						<option value="배송문의">배송문의</option>
						<option value="상품문의">상품문의</option>
						<option value="배송 전 변경/취소">배송 전 변경/취소</option>
						<option value="배송 후 교환/반품">배송 후 교환/반품</option>
						<option value="기타 문의">기타 문의</option>
					</select>
				</div>
			</div>
			<textarea id="summernote" name="content">
                 - 지그재그 또는 에이브리, 브랜디 앱으로 주문 해주신 경우, 해당 판매처 내 Q&A로 문의 부탁드립니다.<br>
                 - 상품 기본 배송준비기간 영업일 기준 3-5일 정도 소요 됩니다.<br>
                 - 기본 배송준비기간보다 지연되는 상품의 경우, 카카오 알림톡으로 개별 안내 도와드리고 있습니다.<br><br>
                        ★ 매일 오후 12시 입고 예정인 Q&A 게시판 [입고 일정] 게시글 업데이트<br>
                        ★ 매일 오후 3시 모든 상품 당일 입고여부 확인 가능<br>
                        ----------------------------------------------------<br><br>
                        주문자명: <br>
                        주문번호 또는 연락처: <br><br>
                        문의 내용:
                    </textarea>
			<div class="qna_write_downmenu">
				<div class="qna_write_column">FILE</div>
				<div class="qna_write_input">
					<input type="file" name="file1">
				</div>
			</div>
			<div class="qna_write_downmenu">
				<div class="qna_write_column">FILE</div>
				<div class="qna_write_input">
					<input type="file" name="file2">
				</div>
			</div>
			<div class="qna_write_downmenu">
				<div class="qna_write_column">FILE</div>
				<div class="qna_write_input">
					<input type="file" name="file3">
				</div>
			</div>
			<div class="qna_write_downmenu">
				<div class="qna_write_column">FILE</div>
				<div class="qna_write_input">
					<input type="file" name="file4">
				</div>
			</div>
			<div class="qna_write_downmenu">
				<div class="qna_write_column">PASSWORD</div>
				<div class="qna_write_input">
					<input type="password" name="password">
				</div>
			</div>
			<div class="qna_write_downmenu">
				<div class="qna_write_column">비밀글설정</div>
				<div class="qna_write_input">
					<label><input type="radio" name="open" disabled
						style="cursor: initial;">공개글</label> <label><input
						type="radio" name="secret" checked>비밀글</label>
				</div>
			</div>
		</div>
		<div class="qna_write_down_btn">
			<span class="qna_list_back"> <a href="${cpath }/board/qna">LIST</a>
			</span> <span class="qna_write_submit">
				<button>OK</button>
			</span> <span class="qna_write_cancel"> <a href="${cpath }/board/qna">CANCEL</a>
			</span>
		</div>
	</form>
</div>
</div>

<script>
        function showPopup(event) {
        	event.preventDefault()
            const popup = window.open("qna_write_popup", "상품정보선택", "width=600, height=400, left=0, top=0");
        }
</script>

</body>
</html>