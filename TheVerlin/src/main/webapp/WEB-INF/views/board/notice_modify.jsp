<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
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
	<h4 class="h4">NOTICE</h4>
	<div class="notice_write_wrap">
	    <form method="POST">
	        <div class="notice_write_content">
	            <div class="notice_write_upmenu">
	                <div class="notice_write_column">SUBJECT</div>
	                <div class="notice_write_input">
	                	<input type="hidden" name="member_uid" value="${login.member_uid }">
	                    <input type="text" name="title" value="${dto.title }">
	                    <input type="hidden" name="notice_idx" value="${dto.notice_idx }">
	                </div>
	            </div>
	            <textarea id="summernote" name="content">${dto.content }</textarea>
	        </div>
	        <div class="notice_write_down_btn">
	            <span class="notice_list">
	                <a href="${cpath }/board/notice">LIST</a>
	            </span>
	            <span class="notice_submit">
	                <button onclick="regist()">OK</button>
	            </span>
	            <span class="notice_cancel">
	                <a href="${cpath }/board/notice_read/${dto.notice_idx }">CANCEL</a>
	            </span>
	        </div>
	    </form>
	</div>
</div>

    <script>
        function showPopup() {
            const popup = window.open("qna_write_popup.html", "상품정보선택", "width=600, height=400, left=0, top=0");
        }
    </script>
   
   	<script>
   		function regist() {
   			event.preventDefault();
   			const memberUid = $('input[name=member_uid]').val();
//    			const title = $('input[name=title]').val();
   			const title = document.getElementsByName('title')[0].value
//    			const content = $('#summernote').summernote('getHtml');
   			const content = document.getElementById('summernote').value
   			console.log(content);
   			var writeForm = $('<form></form>');
   			writeForm.attr("name", "writeForm");
   			writeForm.attr("method", "POST");
   			writeForm.append($('<input/>', {type: 'hidden', name: 'content', value: content}));
   			writeForm.append($('<input/>', {type: 'hidden', name: 'title', value: title}));
   			writeForm.append($('<input/>', {type: 'hidden', name: 'member_uid', value: memberUid}));   			
   			writeForm.appendTo('body');
   			writeForm.submit();
   		}
   	</script>
</body>
</html>