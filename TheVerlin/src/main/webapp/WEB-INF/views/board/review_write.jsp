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
        <h4 class="h4">REVIEW</h4>
        <div class="review_write_wrap">
            <form class="writeForm" method="POST" enctype="multipart/form-data">
                <div class="review_write_item">
	                <div id="review_write_img"></div>
                    <div id="review_write_info">
                    	<p id="product_info_name"></p>
                    	<p id="product_info_price"></p>
                    	
                    	<p><input type="hidden" name="product_name" class="product_info_name" value=""></p>
                    	<p><input type="hidden" name="product_price" class="product_info_price" value=""></p>
                    	<p><input type="hidden" name="product_id" class="product_info_id" value=""></p>
                    	<p><input type="button" value="상품정보선택 >" onclick="showPopup();" /></p>
                    </div>
                </div>
                <input type="hidden" name="member_uid" value="${login }">
                <div class="review_write_content">
                    <div class="review_write_upmenu">
                        <div class="review_write_column">별점</div>
                        <div class="review_write_input">
                            <span class="star">★</span>
                            <span class="star">☆</span>
                            <span class="star">☆</span>
                            <span class="star">☆</span>
                            <span class="star">☆</span>
                            <input type="hidden" name="star" id="star_point" value="">
                        </div>
                    </div>
                    <textarea id="summernote" name="content"></textarea>
                    <div class="review_write_downmenu">
                        <div class="review_write_column">FILE</div>
                        <div class="review_write_input">
                            <input type="file" name="file1">
                        </div>
                    </div>
                    <div class="review_write_downmenu">
                        <div class="review_write_column">FILE</div>
                        <div class="review_write_input">
                            <input type="file" name="file2">
                        </div>
                    </div>
                    <div class="review_write_downmenu">
                        <div class="review_write_column">FILE</div>
                        <div class="review_write_input">
                            <input type="file" name="file3">
                        </div>
                    </div>
                    <div class="review_write_downmenu">
                        <div class="review_write_column">FILE</div>
                        <div class="review_write_input">
                            <input type="file" name="file4">
                        </div>
                    </div>
                </div>
                <div class="review_write_down_btn">
                    <span class="review_list_back">
                        <a href="${cpath }/board/review">LIST</a>
                    </span>
                    <span class="review_submit">
                        <button>OK</button>
                    </span>
                    <span class="review_cancel">
                        <a href="${cpath }/board/review">CANCEL</a>
                    </span>
                </div>
            </form>
        </div>
    </div>
    
    <!-- 상품 정보 입력을 위한 popup창 불러오기 -->
    <script>
        function showPopup() {
            const popup = window.open("review_write_popup", "상품정보선택", "width=600, height=400, left=0, top=0");
        }
    </script>

    <!-- 별점 찍기 -->
    <script>
        const starList = document.querySelectorAll('.star')
        
        for(let i = 0; i < starList.length; i++) {
            const star = starList[i]
            star.onclick = function() {
            	document.getElementById('star_point').value = (i + 1)
                for(let j = 0; j < starList.length; j++) {
                    starList[j].innerText = (i >= j) ? '★' : '☆'
                }
            } 
        }
    </script>
</body>
</html>