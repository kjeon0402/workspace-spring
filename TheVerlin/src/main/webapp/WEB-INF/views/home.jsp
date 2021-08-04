<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- 본문을 감싸는 div -->
<div class="home_wrap">

    	
    <!-- 1. 이미지 슬라이드 (미완)-->
    <div class="home_img_slider slider">
        <!-- 예제 (삭제예정)-->
        <div class="slider_window">
	        <div class="slider_wrap">
				
				<img class="slide_img" src="https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/16/f53b57b52eb3967777d6cbed069b7c8c.png">
				<img class="slide_img" src="https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/16/6b8689b8dbe129ee2c3a4c31816cb646.png">
				
				<img class="slide_img" src="https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/16/a957e902b8aa452f160f2917543771ed.png">
				<img class="slide_img" src="https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/16/04fe25319726ce1e36416f53c664e39b.png">
			</div>
		</div>
<!--         <a href=""><img class="slide_img" src="https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/02/a1881b574e372b10566c1e0182e942d4.png"></a> -->
    </div>  
    
    <!-- 2. 핸드메이드 이미지 클릭시, made(수제)페이지 이동 -->
    <div class="home_center">
        <a href="${cpath }/product/productIcon/MADE"><img class="made_img" src="https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/02/a1881b574e372b10566c1e0182e942d4.png"></a>
    </div>
    
    <!-- 3. 신상품 불러오기 가로 3상품씩 -->
    <!-- width 정하고 isplay flex, flex-flow wrap  통해서 제어 -->
    <div class="home_new_arrive">
        <div><h2>NEW ARRIVALS</h2></div>
        <!-- 반복문 통해서 상품 불러오기 (div도 하나씩 만들어서 상품담기) (미완)-->
        <!-- 각각의 div의 width는 wrap width를 참조해서 3개씩 들어갈 수 있도록 지정하기 -->
        <!-- 예제 (삭제예정) -->
        <div class="home_new_arrive_wrap">
       		<c:set var="cnt" value="0" />
        	<c:forEach var="total_product" items="${totalProduct }" varStatus="st">
        		<c:if test="${totalProduct[st.index].product_id != totalProduct[st.index + 1].product_id and cnt < 12}">
        			<c:set var="cnt" value="${cnt + 1 }" />
        			
	        		<div class="new_arrive_product">
		                <div><a href="${cpath }/product/detailProduct/${total_product.product_id}"><img class="new_arrive_img" src="${total_product.photo_path }"></a></div>
		                <div class="home_product_icon">
		                	<c:if test="${total_product.product_icon == 'NEW' }">NEW 5% 24H</c:if>
		                	<c:if test="${total_product.product_icon == 'MADE' }">MADE BY VERLIN</c:if>
		                	<c:if test="${total_product.product_icon == 'SALE' }">SALE 5%</c:if>
		                </div>
		                <div class="home_product_name"><a href="${cpath }/product/detailProduct/${total_product.product_id}">${total_product.product_name }</a></div>
		                <div class="home_product_price ${total_product.product_icon == 'NEW' ? 'line_throgh' : '' } ${total_product.product_icon == 'SALE' ? 'line_throgh' : '' }">\ ${total_product.product_price }</div>
		                <c:if test="${total_product.product_icon == 'NEW' }">
		              		<fmt:parseNumber var="saleprice" value="${total_product.product_price * 0.95 }" integerOnly="true" />
		                	<div class="home_product_saleprice">\ ${saleprice }</div>
		                </c:if>
		                <c:if test="${total_product.product_icon == 'SALE' }">
		                	<fmt:parseNumber var="saleprice" value="${total_product.product_price * 0.95 }" integerOnly="true" />
		                	<div class="home_product_saleprice">\ ${saleprice }</div>
		                </c:if>
		                <div class="home_product_color">
		                <c:forEach var="option_color" items="${totalProduct }" varStatus="st">
		                	<c:if test="${totalProduct[st.index].option_color != totalProduct[st.index + 1].option_color && total_product.product_id == totalProduct[st.index].product_id}">
				        		<span class="color_chip" style="background-color: ${option_color.color_code };"></span>
				        	</c:if>
					    </c:forEach>
		                </div>
		              </div>
				</c:if>
        	</c:forEach>
    	</div>
    
    <!-- 4. 리뷰 불러오기 가로 5개, 세로 2줄 (최근10개만 불러옴)-->
    <!-- width 정하고 display flex, flex-flow wrap 통해서 제어 -->
    <div class="home_review_viewer">
        <div><h2>REVIEW</h2></div>
        <!-- 반복문 통해서 상품 불러오기 (div도 하나씩 만들어서 상품담기) (미완)-->
        <!-- 각각의 div의 width는 wrap width를 참조해서 5개씩 들어갈 수 있도록 지정하기 -->
        <!-- 예제 (삭제예정) -->
        <div class="home_review_viewer_wrap">
			<c:forEach var="review" items="${review }" begin="0" end="9">
	        <div class="review_thumbnail">
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
	                <p>
	                	<c:if test="${review.star == 5 }">
	                	★★★★★
	                	</c:if>
	                	<c:if test="${review.star == 4 }">
	                	★★★★☆
	                	</c:if>
	                	<c:if test="${review.star == 3 }">
	                	★★★☆☆
	                	</c:if>
	                	<c:if test="${review.star == 2 }">
	                	★★☆☆☆
	                	</c:if>
	                	<c:if test="${review.star == 1 }">
	                	★☆☆☆☆
	                	</c:if>
	                </p>
	                <p>
	                	<span>NAME ${review.member_name }</span>
	                	<span>${review.rdate }</span>
	                </p>
	                <p>${review.content }</p>
	            </div>
	        </div>
	        </c:forEach>
        </div>
    </div>
    
	<!-- 리뷰 클릭시 나오는 모달 -->
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
	<!-- 리뷰 오버레이 -->
	<div class="review_overlay hidden"></div>
	</div>
</div>

	<!-- 메인 페이지 슬라이드 -->
	<script>
	
// 		window.onload = function(){
// 			slideShow();
// 		}
		
		let w = 0
		const slider_wrap = document.querySelector('.slider_wrap')
		const length = slider_wrap.children.length
		slider_wrap.style.width = length * 600 + 'px'
		
		slider_wrap.appendChild(slider_wrap.children[0].cloneNode())
		slider_wrap.appendChild(slider_wrap.children[1].cloneNode())
		
		function slideShow() {
			
			if(w == length * 1200 / 2) {
				w = 0
				slider_wrap.style.transitionDuration = '0s'
				slider_wrap.style.transform = 'translateX(-' + w + 'px)'
				setTimeout(slideShow, 200)
			}
			else {
				w += 1200			
				slider_wrap.style.transitionDuration = '1s'
				slider_wrap.style.transform = 'translateX(-' + w + 'px)'
				setTimeout(slideShow, 4000)
			}
		}
		
		setTimeout(slideShow, 4000)
// 		setInterval(slideShow, 2500)

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
    		console.log(thumbnail)
//     		const img = thumbnail.querySelector('.review_hidden_img')
//     		const name = thumbnail.querySelector('.review_product_name')
//     		const star = thumbnail.querySelector('.review_star')
//     		const member = thumbnail.querySelector('.review_member_name')
//     		const rdate = thumbnail.querySelector('.reveiw_rdate')
//     		const content = thumbnail.querySelector('.review_content')
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
<%@ include file="footer.jsp" %>

