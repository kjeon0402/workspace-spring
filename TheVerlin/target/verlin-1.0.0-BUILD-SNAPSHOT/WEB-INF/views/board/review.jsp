<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="review main">
    <h4 class="h4">REVIEW</h4>
    <p class="review_photo_title"><span>포토리뷰</span>&nbsp;&nbsp;<span>포토리뷰 모아보기</span></p>
    <div class="review_photo_review"><!-- overflow: hidden, 범위를 벗어나는 내용은 표시하지 않는다 -->
    
		<div class="review_thumbnail_wrap"><!-- 전체 너비가 넓게 잡혀있고, translateX에 의해서 위치가 조정된다 -->
			<c:set var="cnt" value="0"/>
			<c:forEach var="review" items="${review }">
			<c:set var="cnt" value="${cnt + 1 }"/>
		        <div class="review_thumbnail ${(cnt) % 5 == 0 ? 'specialmargin' : '' }">
		        	<input type="hidden" class="review_hidden_img" value="${review.review_img1 }">
		        	<input type="hidden" class="review_rdate" value="${review.rdate }">
		        	<input type="hidden" class="review_product_name" value="${review.product_name }">
		        	<input type="hidden" class="review_product_price" value="${review.product_price }">
		        	<input type="hidden" class="review_star" value="${review.star }">
		        	<input type="hidden" class="review_member_name" value="${review.member_name }">
		        	<input type="hidden" class="review_content" value="${review.content }">
		        	<input type="hidden" class="review_content_img" value="${review.photo_path }">
		        	
		            <div class="review_img" style="background-image: url('${cpath}/theVerlinUploadPath/${review.review_img1 }');"></div>
		            <div class="review_info">
		                <div class="review_content_img" style="background-image: url('${review.photo_path}');"></div>
		                <div class="review_product_info">
		                    <p>
		                    	<span>${review.product_name }</span>
		                    	<span>${review.product_price }원</span>
		                    </p>
		                    <p>리뷰 32개 평점 4.8</p>
		                </div>
		            </div>
		            <div class="review_detail_info">
		                <p>★★★★★ ${review.star }</p>
		                <p>
		                	<span>NAME ${review.member_name }</span>
		                	<span>${review.rdate }</span>
		                </p>
		                <p>${review.content }</p>
		            </div>
		        </div>
	        </c:forEach>
        </div>
        <div class="next_photo_review"></div>
        <div class="prev_photo_review"></div>
    </div>

    <div class="review_notice">
        <div class="review_notice_title">
            <span>공지</span>
            <span>리뷰 적립금 안내</span>
            <span>2021년 5월 11일 ▼</span>
        </div>
        <div class="review_notice_content">
            <br><br><br>
            the verlin<br><br>
	                텍스트 (50자 이상) : 500원<br>
	                포토 (사진 1장 이상 첨부) : 500원<br>
	                설문 : 500원<br>
	                동영상 : 1000원<br>
	                인스타그램 : 2000원<br><br>
	                혜택은 중복지급이 가능합니다.<br>
            ex) 텍스트+포토 작성시 1000원 지급<br><br>
            [유의사항]<br>
            * 상품 수령(배송 완료) 후 14일 이후 주문건은 혜택이 지급되지 않습니다.<br>
            * 리뷰 작성시점에 품절인 상품은 적립금 지급이 가능합니다.<br>
            * 텍스트 리뷰 작성시, 기본 50자 이상 작성해주셔야 합니다.<br>
            (300자 이상 작성시 추가 적립금 지급)<br>
            * 추가 문의사항은 게시글 또는 고객센터로 연락 주시면 안내 도와드리겠습니다.
        </div>
    </div>
    
    <div class="review_bar">
        <div class="review_left">
            <span class="review_little_title">상품평수</span>
            <span>20154개</span>
            <span>
                <select>
                    <option>추천순</option>
                    <option>별점순</option>
                    <option selected>최신순</option>
                </select>
            </span>
        </div>
        <div class="review_right">
<!-- 리뷰 정책 클릭시 숨겨진 div 떠야함 -->
            <div class="review_policy">
            	<div class="review_policy_title">리뷰 정책</div>
            	<div class="review_policy_content hidden">
            		<div class="review_policy_content_title">리뷰 정책</div>
            		<hr>
            		<div class="review_policy_content_content">
             		포인트 지급 제한 사유 <br>
             		포인트 지급은 리뷰 작성 시점에 결정 되어 설정에 따라 실제 지급되는<br>
             		포인트는 유동적일 수 있으며, 아래 사유로 제한될 수 있습니다.<br><br>
             		· 리뷰 작성 시점의 품절상품 혜택 지급 가능<br>
             		· 상품 수령(배송 완료) 후 14일 이후 혜택 지급불가<br>
             		· 상품 금액 10,000원 미만 상품 혜택 지급불가
            		</div>
            	</div>
            </div>
            <form method="GET">
	            <span class="review_search_input"><input type="text" name="search_keyword"></span>
	            <span><a href="${cpath }/board/review/${pag.page}?search_keyword=${pag.search_keyword}"><button>검색</button></a></span>
            </form>
            <span><a href="${cpath }/board/review_write"><button>리뷰 작성</button></a></span>
        </div>
    </div>

	<c:forEach var="review" items="${review }">
    <div class="review_list">
        <div class="review_one_content">
            <div class="review_image" style="background-image:url('${review.photo_path}')"></div>
            <div class="review_info">
                <p><span class="review_star_point">★★★★★</span><span>최고</span></p>
                <p><span>NAME ${review.member_name }</span></p>
                <p>${review.content }</p>
                <div class="review_real_image" style="background-image:url('${cpath}/theVerlinUploadPath/${review.review_img1 }');"></div>
                <p>${review.rdate }</p>
                <div class="review_thumbup_reply">
                    <span>리뷰가 도움이 되요</span>
                    <div class="review_thumbup_img"></div>
                    <span><input type="text" class="thumbup_cnt" value="0" readonly></span>
                    <div class="review_reply_img"></div>
                    <span>1</span>
                </div>                    
            </div>
        </div>
    </div>
    </c:forEach>

    <div class="paging">
        <span>
           	<a href="${cpath }/board/review/${pag.page - 1}?search_keyword=${pag.search_keyword}"><</a>
        </span>&nbsp;&nbsp;&nbsp;
        <c:forEach var="i" begin="${pag.begin }" end="${pag.end }">
        	<span class="num">
         		<a href="${cpath }/board/review/${i}?search_keyword=${pag.search_keyword}">
         			${i == pag.page ? '<strong>' : '' }
         				${i }	
					${i == pag.page ? '</strong>' : '' }
         		</a>
        	</span>&nbsp;&nbsp;&nbsp;
        </c:forEach>
       	<span>
       		<a href="${cpath }/board/review/${pag.page + 1}?&search_keyword=${pag.search_keyword}">></a>
       	</span>
    </div>

	<div class="review_modal hidden">
		<div class="review_modal_image"></div>
		<div class="review_modal_info">
			<button id="review_modal_close">X</button>
			<div class="review_modal_product">
				<div class="review_modal_product_img"></div>
				<div class="review_modal_product_info">
					<p class="review_modal_product_name"></p>
                    <p><span>평점 4.8</span><span>리뷰 26개</span></p>
				</div>
			</div>
			<div class="review_modal_detail_info">
				<p>★★★★★ <span class="review_modal_star"></span></p>
				<p>
					<span class="name review_modal_detail_info_name"></span>
					<span class="review_modal_detail_info_rdate"></span>
				</p>
				<p class="review_modal_detail_content">
					<span class="review_modal_detail_contents"></span>
   				</p>
				<p>0명에게 리뷰가 도움이 됐어요!</p>
				<div class="review_modal_reply">
					<p>안녕하세요 고객님!</p>
					<p>더베를린</p>
				</div>
			</div>
			<div class="review_other">
				<div class="review_other_one">
					<p>★5<br> 화면과 비슷해요!</p>
				</div>
			</div>
		</div>
	</div>
	<div class="review_overlay hidden"></div>
</div>

    <!-- 공지 제목을 누르면 공지가 노출되는 자바스크립트 -->
    <script>
        const notice_title = document.querySelector('.review_notice_title')
        const notice_content = document.querySelector('.review_notice_content')
        const foldHeight = notice_content.clientHeight
        console.log(foldHeight)
        notice_content.style.height = '0px'

        notice_title.onclick = function(event) {
            if(notice_content.style.height == '0px') {
                notice_content.style.height = foldHeight + 'px'
            } else {
                notice_content.style.height = '0px'
            }
        }
    </script>
    
    <!-- '리뷰정책'을 누르면 리뷰정책에 대한 내용이 노출되는 자바스크립트 -->
    <script>
    	const reviewPolicyTitle = document.querySelector('.review_policy_title')
    	const reviewPolicyContent = document.querySelector('.review_policy_content')
    	
    	reviewPolicyTitle.onclick = function() {
    		if(reviewPolicyContent.classList.contains('hidden')) {
    			reviewPolicyContent.classList.remove('hidden')
    		} else {
    			reviewPolicyContent.classList.add('hidden')
    		}
    	}
    </script>
    
    <!-- 포토리뷰의 썸네일을 누르면 리뷰 모달을 노출하는 자바스크립트 -->
    <script>
    	function findReview_thumbnail(node) {
    		if(node.classList.contains('review_thumbnail') == false) {
    			return findReview_thumbnail(node.parentNode)
    		}
    		return node
    	}
    
    	const reviewImgList = document.querySelectorAll('.review_thumbnail')
    	const reviewModal = document.querySelector('.review_modal')
    	const reviewModalClose = document.getElementById('review_modal_close')
    	const reviewOverlay = document.querySelector('.review_overlay')
    	
    	
    	reviewImgList.forEach(element => element.onclick = function(event) {
    		
    		// 클릭한 대상의 idx를 이용해서 사진과 글을 모달안에 미리 넣어둔다
    		const thumbnail = findReview_thumbnail(event.target)
    		document.querySelector('.review_modal_image').style.backgroundImage = 'url(${cpath}/theVerlinUploadPath/' + thumbnail.querySelectorAll('input')[0].value + ')'
    		document.querySelector('.review_modal_product_name').innerText = thumbnail.querySelectorAll('input')[2].value
    		document.querySelector('.review_modal_star').innerText = thumbnail.querySelectorAll('input')[4].value
    		document.querySelector('.review_modal_detail_info_name').innerText = thumbnail.querySelectorAll('input')[5].value
    		document.querySelector('.review_modal_detail_info_rdate').innerText = thumbnail.querySelectorAll('input')[1].value
    		document.querySelector('.review_modal_detail_contents').innerText = thumbnail.querySelectorAll('input')[6].value
    		document.querySelector('.review_modal_product_img').style.backgroundImage = 'url(' + thumbnail.querySelectorAll('input')[7].value + ')'
    		
    		// 모달 보이기
    		reviewModal.classList.remove('hidden')
    		reviewOverlay.classList.remove('hidden')
    		
    	})
    	
    	reviewModalClose.onclick = function() {
    		reviewModal.classList.add('hidden')
    		reviewOverlay.classList.add('hidden')
    	}
    	reviewOverlay.onclick = function() {
    		reviewModal.classList.add('hidden')
    		reviewOverlay.classList.add('hidden')
    	}
    </script>
    
   	<script>
   		const thumbup = document.querySelectorAll('.review_thumbup_img')
   		
   		thumbup.forEach(element => element.onclick = function(event) {
   			const reply = event.target.parentNode
   			const count = reply.querySelector('.thumbup_cnt')
   			const currentCount = +count.value
   			count.value = currentCount + 1
   			
   		})
   	</script> 
   	
   	<script>
   		
   		const cpath = '${cpath}'
   	
   		let w = 0
   		let unit = 148
   		const review_photo_review = document.querySelector('.review_photo_review')
   		const review_thumbnail_wrap = document.querySelector('.review_thumbnail_wrap')
   		const review_thumbnail = document.querySelectorAll('.review_thumbnail')
   		
   		const length = review_thumbnail.length
   		review_thumbnail_wrap.style.width = length * 200 + 'px'
   		
   		const next_photo_review = document.querySelector('.next_photo_review')
   		const prev_photo_review = document.querySelector('.prev_photo_review')
   		prev_photo_review.style.backgroundImage = 'url(' + cpath + '/resources/prev.png)' 
   		next_photo_review.style.backgroundImage = 'url(' + cpath + '/resources/next.png)' 
   		
   		
   		next_photo_review.onclick = function() {
   			w += length * unit
   			if(w > length * unit) w = length * unit
   			review_thumbnail_wrap.style.transitionDuration = '0.5s'
			review_thumbnail_wrap.style.transform = 'translateX(-' + w + 'px)'
   		}
   		
   		prev_photo_review.onclick = function() {
   			w -= length * unit
   			if(w < 0) w = 0
   			review_thumbnail_wrap.style.transitionDuration = '0.5s'
			review_thumbnail_wrap.style.transform = 'translateX(-' + w + 'px)'
   		}
   	</script>
   
</body>
</html>