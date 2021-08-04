<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 상세페이지 본문 감싸는 div -->
<div class="detail_product_wrap">
    <!-- 이미지/정보 영역 -->
    <div class="detail_product_top">
        <!-- 이미지 / 리뷰 영역 -->
        <div class="detail_product_top_left">
            <div class="detail_product_img" onclick="popupDetailImg()"></div>
            <div class="detail_product_review">
                <div class="detail_product_review_div_star">
                    <div class="detail_product_review_inner">별점</div>
                    <div class="detail_product_review_inner">${starAverage }</div>
                    <div class="detail_product_review_inner detail_product_review_inner_starcount"></div>
                </div>
<!--                 반복문 통해서 리뷰 이미지 불러오기 -->
				<c:forEach var="dto" items="${review }" varStatus="st">
					<div class="review_thumbnail">
					<input type="hidden" class="review_hidden_img" value="${dto.review_img1 }">
		        	<input type="hidden" class="review_rdate" value="${dto.rdate }">
		        	<input type="hidden" class="review_product_name" value="${dto.product_name }">
		        	<input type="hidden" class="review_product_price" value="${dto.product_price }">
		        	<input type="hidden" class="review_star" value="${dto.star }">
		        	<input type="hidden" class="review_member_name" value="${dto.member_name }">
		        	<input type="hidden" class="review_content" value="${dto.content }">
		        	<input type="hidden" class="review_content_img" value="${dto.photo_path }">
					<c:if test="${st.index < 4 }">
		                <div class="detail_product_review_div">
		                    <img class="detail_product_review_img" src="${cpath }/theVerlinUploadPath/${dto.review_img1 }">
		                </div>
					</c:if>
					</div>
				</c:forEach>
            </div>
            <!-- 리뷰 클릭 시, 오버레이 및 모달 -->
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
        
        <!-- 상품정보 및 주문선택 영역 -->
        <div class="detail_product_top_right">
            <form method="POST">
                <!-- 상품 아이콘(수제인지 세일인지 등등 태그같은거) -->
                <c:if test="${product[0].product_icon == 'NEW' }">
                	<div class="detail_product_icon">NEW ▼5% 24H</div>
                </c:if>
                <c:if test="${product[0].product_icon == 'MADE' }">
                	<div class="detail_product_icon">MADE BY VERLIN</div>
                </c:if>
                <c:if test="${product[0].product_icon == 'SALE' }">
                	<div class="detail_product_icon">5% SALE</div>
                </c:if>
                <!-- 상품정보 영역 -->
                <div class="detail_product_info">
                    <table>
                        <!-- 상품명 인풋 히든으로 전달하기 -->
                        <tr><td class="table_td">${product[0].product_name }
                            <input type="hidden" name="product_name" value="${product[0].product_name }">
                            <input type="hidden" name="photo_path" value="${product[0].photo_path }">
                        </td></tr>
                        <tr><td  class="table_td need_line_throgh" style="${product[0].product_icon == 'SALE' || product[0].product_icon == 'NEW' ? 'text-decoration: line-through;' : ''}">\ ${product[0].product_price }
                        	<input type="hidden" class="pprice_before_sale" value="${product[0].product_price }"></td></tr>
                        <!-- if문으로 세일상품이면 노출되게 -->
                        <c:if test="${product[0].product_icon == 'SALE' }">
	                        <tr><td  class="table_td after_sale_price">
	                        	<input type="hidden" class="pprice_after_sale" value="${product[0].product_price * 0.95 }">
	                        </td></tr>
                        </c:if>
                        <c:if test="${product[0].product_icon == 'NEW' }">
	                        <tr><td  class="table_td after_sale_price">
	                        	<input type="hidden" class="pprice_after_sale" value="${product[0].product_price * 0.95 }">
	                        </td></tr>
                        </c:if>
                    </table>
                </div>
                <!-- 옵션 선택 영역 -->
                <div class="detail_product_option">
                    <table>
                        <tr>
                            <td class="table_td">color</td>
                            <td class="table_td">
                                <select name="option_color" id="product_select_color" onchange="showSize()">
                                    <option value="select_info" selected>-[필수] 옵션을 선택해주세요-</option>
                                    <option value="" disabled>--------------------------------------</option>
                                    <c:set var="color_count" value="${product[0].color_count }" />
                                    <c:set var="size_count" value="${product[0].size_count }" />
                                    <c:forEach var="i" begin="0" end="${color_count * size_count - 1}" step="${size_count }">
                                    	<option value="${product[i].option_color }">${product[i].option_color }</option>	
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_td">size</td>
                            <td class="table_td">
                                <select name="option_size" id="product_select_size" onchange="showResult()">
                                    <option value="select_info" selected>-[필수] 옵션을 선택해주세요-</option>
                                    <option value="" disabled>--------------------------------------</option>
                                    <c:forEach var="pro" items="${product }" varStatus="i">
                                    	<c:set var="unitCount" value="${pro.size_count}" />
                                    	<c:if test="${i.index < unitCount }">
                                    		<option value="${pro.option_size }">${pro.option_size }</option>
                                    	</c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- 선택 상품 결과 영역 -->
                <div class="detail_product_select_result hidden">
                    <table class="detail_product_select_result_table">
                    	<tbody class="detail_product_select_result_table_tbody">
	                        <!--onchange = showResult() 작동 시 td 3개 만들어서 넣어주기-->
<!-- 	                        <tr> -->
<!-- 	                            <td class="table_td">시엔sh<br>- 컬러/사이즈</td> -->
<!-- 	                            <td class="table_td"><input class="detail_product_count" name="pcount" type="number" min="1" value="1"><img class="detail_product_close_result" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" onclick="closeResult()"></td> -->
<!-- 	                            <td class="table_td">\ 34,000</td> -->
<!-- 	                        </tr> -->
	                        <tr class="detail_product_select_result_table_tbody_tr2">
	                            <td class="table_td detail_product_select_result_table_tbody_tr2_td"></td>
	                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 서브밋 버튼 영역 -->
                <div class="detail_product_button">
                    <p><input class="buy" type="button" value="BUY NOW"></p>
                    <p><input class="tocart" type="button" value="ADD TO CART"></p>
                </div>
            </form>
            <!-- 리뷰 큐앤에이 관련상품 -->
            <div class="detail_product_top_right_bottom">
<!--             	a태그 href 파라미터 el태그로 상품명으로 잡아줘야함 -->
<!-- 					related product는 span으로 잡고 스크립트로 페이지 아래로 이동시켜야함 -->
                <a href="" onclick="goReviewList(event)">REVIEW ${listSize }</a> | <a href="" onclick="goQNAList(event)">Q & A ${qnaSize }</a> | <a href="" onclick="goRelatedProduct(event)">RELATED PRODUCT</a>
            </div>
        </div>
    </div>
    
    <!-- 상품 설명/ 모델컷 영역 (이미지로 따와서 넣기)-->
    <div class="detail_product_cont">
        <div class="detail_product_menu_nav">
        	<ul class="detail_product_menu_ul">
        		<li class="detail_product_menu_li" onclick="goReviewList(event)">리뷰 ${listSize }</li>
        		<li class="detail_product_menu_li" onclick="goQNAList(event)">Q & A ${qnaSize }</li>
        		<li class="detail_product_menu_li" onclick="goRelatedProduct(event)">관련상품</li>
        	</ul>
        </div>
        <!-- 모델컷 -->
        <c:forEach var="detailList" items="${detail }">
	        <div class="detail_product_cont_img">
	            <img class="detail_product_cont_img_each" src="${detailList.photo_path }">
	        </div>
        </c:forEach>
    <!-- 리뷰왕 이벤트 이미지 -->
    <div class="detail_product_reviewkingevent_img">
        <img src="https://theverlin.com/web/upload/NNEditor/20210707/38cf4246b067e5f377b89d2e91ee0b81.jpg">
    </div>
	
    <!-- 관련상품 노출 -->
    <div class="detail_product_related">
        <div>RELATED PRODUCT</div>
        <div class="detail_product_related_img_wrap">
            <!-- 반복문통해서 div 만들고 노출 -->
            <div class="detail_product_related_img">
                <div><a href=""><img src="https://www.theverlin.com/web/product/medium/202012/c2418c3f214277e3a483cebc8890834b.jpg"></a></div>
                <div class="detail_product_related_info">
                    <p><a href="">에르바 집게핀</a></p>
                    <p>\ 7,000</p>
                </div>
            </div>
            <div class="detail_product_related_img">
                <div><a href=""><img src="https://www.theverlin.com/web/product/medium/202106/cafb906d3898a17183a37b51cb035fdc.png"></a></div>
                <div class="detail_product_related_info">
                    <p><a href="">러너블 pt</a></p>
                    <p>\ 64,400</p>
                </div>
            </div>
            <div class="detail_product_related_img">
                <div><a href=""><img src="https://www.theverlin.com/web/product/medium/20200605/a648096869a39784c6cb5ca355708395.webp"></a></div>
                <div class="detail_product_related_info">
                    <p><a href="">키트 쪼리 (3color)</a></p>
                    <p>\ 39,600</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 리뷰	 -->
	<div class="detail_product_bottom_review_wrap">
		<!-- 제목 -->
		<div class="detail_product_bottom_review_title">REVIEW</div>
		<!-- 별점, 별점 -->
		<div class="detail_product_bottom_review_starpoint_wrap">
			<div class="detail_product_bottom_review_starpoint">
				<div class="detail_product_bottom_review_starpoint_count">총 상품평 수 ${listSize }개</div>
				<div class="detail_product_bottom_review_starpoint_number">${starAverage } / 5 <span class="detail_product_bottom_review_starpoint_number_span"></span></div>
			</div>
			<div class="detail_product_bottom_review_starpoint_graph_wrapper">
				<div class="detail_product_bottom_review_starpoint_graph_wrap">
					<div class="detail_product_bottom_review_starpoint_starcount" style="width: 100px;">★★★★★</div>
					<div class="detail_product_bottom_review_starpoint_graph">
						<div class="detail_product_bottom_review_starpoint_graph_left" style="width: ${fiveStar / totalStar * 100 }px; background-color: #3868d6; height: 10px;"></div> <!-- 차오르는 그래프 -->
						<div class="detail_product_bottom_review_starpoint_graph_right" style="width: ${fiveStar == 0 ? '100' : 100 - (fiveStar / totalStar * 100) }px; background-color: #777777; height: 10px;"></div> <!-- 공백 그래프 -->
					</div>
					<div class="detail_product_bottom_review_starpoint_percent">${fiveStar == 0 ? '0' : fiveStar / totalStar * 100 }%</div>
				</div>
				<div class="detail_product_bottom_review_starpoint_graph_wrap">
					<div class="detail_product_bottom_review_starpoint_starcount" style="width: 100px;">★★★★</div>
					<div class="detail_product_bottom_review_starpoint_graph">
						<div class="detail_product_bottom_review_starpoint_graph_left" style="width: ${fourStar / totalStar * 100 }px; background-color: #3868d6; height: 10px;"></div> <!-- 차오르는 그래프 -->
						<div class="detail_product_bottom_review_starpoint_graph_right" style="width: ${fourStar == 0 ? '100' : 100 - (fourStar / totalStar * 100) }px; background-color: #777777; height: 10px;"></div> <!-- 공백 그래프 -->
					</div>
					<div class="detail_product_bottom_review_starpoint_percent">${fourStar == 0 ? '0' : fourStar / totalStar * 100 }%</div>
				</div>
				<div class="detail_product_bottom_review_starpoint_graph_wrap">
					<div class="detail_product_bottom_review_starpoint_starcount" style="width: 100px;">★★★</div>
					<div class="detail_product_bottom_review_starpoint_graph">
						<div class="detail_product_bottom_review_starpoint_graph_left" style="width: ${threeStar / totalStar * 100 }px; background-color: #3868d6; height: 10px;"></div> <!-- 차오르는 그래프 -->
						<div class="detail_product_bottom_review_starpoint_graph_right" style="width: ${threeStar == 0 ? '100' : 100 - (threeStar / totalStar * 100) }px; background-color: #777777; height: 10px;"></div> <!-- 공백 그래프 -->
					</div>
					<div class="detail_product_bottom_review_starpoint_percent">${threeStar == 0 ? '0' : threeStar / totalStar * 100 }%</div>
				</div>
				<div class="detail_product_bottom_review_starpoint_graph_wrap">
					<div class="detail_product_bottom_review_starpoint_starcount" style="width: 100px;">★★</div>
					<div class="detail_product_bottom_review_starpoint_graph">
						<div class="detail_product_bottom_review_starpoint_graph_left" style="width: ${twoStar / totalStar * 100 }px; background-color: #3868d6; height: 10px;"></div> <!-- 차오르는 그래프 -->
						<div class="detail_product_bottom_review_starpoint_graph_right" style="width: ${twoStar == 0 ? '100' : 100 - (twoStar / totalStar * 100) }px; background-color: #777777; height: 10px;"></div> <!-- 공백 그래프 -->
					</div>
					<div class="detail_product_bottom_review_starpoint_percent">${twoStar == 0 ? '0' : twoStar / totalStar * 100 }%</div>
				</div>
				<div class="detail_product_bottom_review_starpoint_graph_wrap">
					<div class="detail_product_bottom_review_starpoint_starcount" style="width: 100px;">★</div>
					<div class="detail_product_bottom_review_starpoint_graph">
						<div class="detail_product_bottom_review_starpoint_graph_left" style="width: ${oneStar / totalStar * 100 }px; background-color: #3868d6; height: 10px;"></div> <!-- 차오르는 그래프 -->
						<div class="detail_product_bottom_review_starpoint_graph_right" style="width: ${oneStar == 0 ? '100' : 100 - (oneStar / totalStar * 100) }px; background-color: #777777; height: 10px;"></div> <!-- 공백 그래프 -->
					</div>
					<div class="detail_product_bottom_review_starpoint_percent">${oneStar == 0 ? '0' : oneStar / totalStar * 100 }%</div>
				</div>
			</div>
		</div>
		<!-- 리뷰 리스트 -->
		<div class="detail_product_bottom_review_thumbnial_wrap">
			<c:forEach var="review" items="${review }">
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
        
        <div class="paging">
	        <span><a href=""><</a></span>&nbsp;&nbsp;&nbsp;
	        <span class="num"><a href="">1</a></span>&nbsp;&nbsp;&nbsp;
	        <span><a href="">></a></span>
    	</div>
        
		<!-- 전체 리뷰 목록 -->
        <div class="review_bar">
			<div class="review_left">
				<span class="review_little_title">상품평수</span> <span>20154개</span> <span>
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
							포인트 지급 제한 사유 <br> 포인트 지급은 리뷰 작성 시점에 결정 되어 설정에 따라 실제 지급되는<br>
							포인트는 유동적일 수 있으며, 아래 사유로 제한될 수 있습니다.<br>
							<br> · 리뷰 작성 시점의 품절상품 혜택 지급 가능<br> · 상품 수령(배송 완료) 후 14일
							이후 혜택 지급불가<br> · 상품 금액 10,000원 미만 상품 혜택 지급불가
						</div>
					</div>
				</div>
				<span class="review_search_input">
					<input type="text" name="search_keyword">
				</span>
				<span><button>검색</button></span>
				<span><a href="${cpath }/board/review_write"><button>리뷰 작성</button></a></span>
			</div>
		</div>

		<c:forEach var="review" items="${review }">
		    <div class="review_list">
		        <div class="review_one_content">
		            <div class="review_image" style="background-image:url('${review.photo_path}')"></div>
		            <div class="review_info">
		                <p><span class="review_star_point">★★★★★</span><span>최고</span></p>
		                <p><span>NAME ${review.member_name.substring(0, 1) }**</span></p>
		                <p>${review.content }</p>
		                <div class="review_real_image" style="background-image:url('${review.review_img1 }');"></div>
		                <p>${review.rdate }</p>
		                <div class="review_thumbup_reply">
		                    <span>리뷰가 도움이 되요</span>
		                    <div class="review_thumbup_img"></div>
		                    <span>0</span>
		                    <div class="review_reply_img"></div>
		                    <span>1</span>
		                </div>                    
		            </div>
		        </div>
		    </div>
  	  	</c:forEach>
		<div class="paging">
		    <span><a href=""><</a></span>&nbsp;&nbsp;&nbsp;
		    <span class="num"><a href="">1</a></span>&nbsp;&nbsp;&nbsp;
		    <span><a href="">></a></span>
	    </div>
	</div>
	
	
	<!-- Q & A -->
	<div class="detail_product_qna_wrap">
		<div class="main">
			<h4 class="h4">QNA</h4>
			<table class="qna_list">
				<tr>
					<!-- 구분하기 위해 제목, 글쓴이 라고 써둔 것 -->
					<th>NO</th>
					<th>ITEM</th>
					<th></th>
					<th>NAME</th>
				</tr>
				<!-- forEach -->
				<c:forEach var="qna_List" items="${qnaList }">
				<tr>
					<td>${qna_List.qna_idx }</td>
					<td><img class="qna_list_img" src="${qna_List.photo_path }"></td>
					<td><a href="${cpath }/board/qna_read/${qna_List.qna_idx }">
							<p>${qna_List.product_name }</p>
							<p>${qna_List.title }</p>
					</a></td>
					<td>${qna_List.member_name.substring(0, 1) }**</td>
				</tr>
				</c:forEach>
			</table>
			<a href="${cpath }/board/qna"><button class="qna_list_btn">LIST</button></a>
			<a href="${cpath }/board/qna_write"><button class="qna_write">WRITE</button></a>
			<div class="paging">
				<span><a href=""><</a></span>&nbsp;&nbsp;&nbsp; <span class="num"><a
					href="">1</a></span>&nbsp;&nbsp;&nbsp; <span><a href="">></a></span>
			</div>
		</div>
	</div>
    </div>
    
</div>

<!-- 옵션 선택 관련 스크립트 -->
<script>
    const productSelectColor = document.getElementById('product_select_color')
    const productSelectSize = document.getElementById('product_select_size')
    const productOptionSize = document.querySelectorAll('.product_option_size')
    const result = document.querySelector('.detail_product_select_result')
    const tbody = document.querySelector('.detail_product_select_result_table_tbody')
    const table = document.querySelector('.detail_product_select_result_table')
    const tr2 = document.querySelector('.detail_product_select_result_table_tbody_tr2_td')
    const pname = document.getElementsByName('product_name')[0].value

    // 컬러 선택 시, 사이즈 노출
    function showSize() {
        	if(productSelectColor.value != 'select_info') {
		        productOptionSize.forEach(e => {
	            	e.classList.remove('hidden')
        		})
        	} else {
        		productOptionSize.forEach(e => {
	            	e.classList.add('hidden')
        		})
        		result.classList.add('hidden')
        	}
    }
    // 사이즈 선택 시, 결과 노출
    function showResult() {
    	if(productSelectSize.value == 'select_info' || productSelectColor.value == 'select_info') {
    		document.querySelector('.detail_product_select_result_table_tbody_tr1').parentNode.removeChild(document.querySelector('.detail_product_select_result_table_tbody_tr1'))
    		result.classList.add('hidden')
    	} else {
    		if(document.querySelectorAll('.detail_product_select_result_table_tbody_tr1').length == 0) {
	        	result.classList.remove('hidden')
	        	
	        	const tr1 = document.createElement('tr')
	        	tr1.classList.add('detail_product_select_result_table_tbody_tr1')
	        	const td1 = document.createElement('td')
	        	const td2 = document.createElement('td')
	        	const td3 = document.createElement('td')
	        	td1.classList.add('table_td')
	        	td2.classList.add('table_td')
	        	td3.classList.add('table_td')
	        	td3.classList.add('before_sale_price')
	        	
	        	td1.innerHTML = pname + '<br>- ' + productSelectColor.value + '/' + productSelectSize.value
	        	td2.innerHTML = '<input class="detail_product_count" name="product_count" type="number" min="1" value="1" onclick="changePrice(event)"><img class="detail_product_close_result" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" onclick="closeResult()">'
	        	td3.innerHTML = '\\ ' + (document.querySelector('.pprice_before_sale').value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') 
	        	
	        	tr1.appendChild(td1)
	        	tr1.appendChild(td2)
	        	tr1.appendChild(td3)
	        	tbody.appendChild(tr1)
	        	table.appendChild(tbody)
	        	const saleOrMade = '${product[0].product_icon }'
	        	console.log(saleOrMade)
	        	if(saleOrMade == 'SALE') {
		        	tr2.innerHTML = 'TOTAL \\ ' + Math.floor(document.querySelector('.pprice_after_sale').value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') +' (' + document.querySelector('.detail_product_count').value + '개)'
	        	} else {
	        		tr2.innerHTML = 'TOTAL \\ ' + Math.floor(document.querySelector('.pprice_before_sale').value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') +' (' + document.querySelector('.detail_product_count').value + '개)'
	        	}
	        	
	        	
	        	
	        	
// 	        	productSelectColor.value = 'select_info'
// 	        	productSelectSize.value = 'select_info'
	        	return
    		} else {
    			document.querySelector('.detail_product_select_result_table_tbody_tr1').parentNode.removeChild(document.querySelector('.detail_product_select_result_table_tbody_tr1'))
    			tr2.innerHTML = ''
    			result.classList.add('hidden')
    		}
    	}
    }
    
	// 수량 변경시 가격 조정
	function changePrice(event) {
		const beforePrice = document.querySelector('.before_sale_price')
		beforePrice.innerHTML = ''
		beforePrice.innerHTML = '\\ ' + (document.querySelector('.pprice_before_sale').value * document.querySelector('.detail_product_count').value).toLocaleString()
		tr2.innerHTML = ''
		if(saleOrMade == 'SALE') {
			tr2.innerHTML = 'TOTAL \\ ' + (document.querySelector('.pprice_after_sale').value * document.querySelector('.detail_product_count').value).toLocaleString() + ' (' + document.querySelector('.detail_product_count').value + '개)'
		} else{
			tr2.innerHTML = 'TOTAL \\ ' + (document.querySelector('.pprice_before_sale').value * document.querySelector('.detail_product_count').value).toLocaleString() + ' (' + document.querySelector('.detail_product_count').value + '개)'
		}
	}
    
    // x 눌렀을 때, 결과 숨기기
    function closeResult(event) {
    	document.querySelector('.detail_product_select_result_table_tbody_tr1').parentNode.removeChild(document.querySelector('.detail_product_select_result_table_tbody_tr1'))
        result.classList.add('hidden')
    }
    // 리뷰 보이기
//     function showReview() {
//         document.querySelector('.detail_product_review_div_overlay').classList.remove('hidden')
//         document.querySelector('.detail_product_review_div_modal').classList.remove('hidden')
//     }
    // 리뷰창 닫기
//     function closeReview() {
//         document.querySelector('.detail_product_review_div_overlay').classList.add('hidden')
//         document.querySelector('.detail_product_review_div_modal').classList.add('hidden')
//     }
</script>

<!-- 구매 , 카트담기 -->
<script>
	document.querySelector('.buy').onclick = function(event) {
		const result = document.querySelector('.detail_product_select_result')
		const pcolor = document.getElementsByName('option_color')[0].value
		const psize = document.getElementsByName('option_size')[0].value
		if(pcolor == '' && psize == '') {
			event.preventDefault()
			alert('옵션을 선택해주세요!')
			return
		} else if(result.classList.contains('hidden')) {
			event.preventDefault()
			alert('옵션을 선택해주세요!')
			return
		}
		event.preventDefault()
		if(saleOrMade == 'SALE') {
			var productPrice = (document.querySelector('.pprice_after_sale').value * document.querySelector('.detail_product_count').value)
			tr2.innerHTML += '<input type="hidden" name="product_price" value="' + productPrice + '">'
		} else {
			var productPrice = (document.querySelector('.pprice_before_sale').value * document.querySelector('.detail_product_count').value)
			tr2.innerHTML += '<input type="hidden" name="product_price" value="' + productPrice + '">'
		}
		const form = document.forms[1]
		form.action = '${cpath}/order'
		form.submit()
	}
	
	document.querySelector('.tocart').onclick = function(event) {
		const result = document.querySelector('.detail_product_select_result')
		const pcolor = document.getElementsByName('option_color')[0].value
		const psize = document.getElementsByName('option_size')[0].value
		if(pcolor == '' && psize == '') {
			event.preventDefault()
			alert('옵션을 선택해주세요!')
			return
		} else if(result.classList.contains('hidden')) {
			event.preventDefault()
			alert('옵션을 선택해주세요!')
			return
		}
		event.preventDefault()
		const form = document.forms[0]
		form.action = '${cpath}/cart'
		form.submit()
	}
	
</script>

<!-- 상세이미지 -->
<script>
    function popupDetailImg() {
    	const product_id = ${product[0].product_id}
        var url = 'detailImg/' + product_id
        var name = '더베를린'
        var option = 'width = 500px, height = 700px, top = 100, left = 200, location = no'
        window.open(url, name, option)
    }
</script>

<!-- 관련상품 위치로 스크롤이동 -->
<script>
	function goRelatedProduct(event) {
		event.preventDefault()
		var location = document.querySelector(".detail_product_related").offsetTop;
		console.log(location)
		window.scrollTo({top:location - 160, behavior:'auto'});
	}
</script>
<!-- 리뷰 목록 위치로 스크롤이동 -->
<script>
	function goReviewList(event) {
		event.preventDefault()
		var location = document.querySelector(".detail_product_bottom_review_wrap").offsetTop;
		window.scrollTo({top:location - 160, behavior:'auto'});
	}
</script>
<!-- Q & A 목록 위치로 스크롤이동 -->
<script>
	function goQNAList(event) {
		event.preventDefault()
		var location = document.querySelector(".detail_product_qna_wrap").offsetTop;
		window.scrollTo({top:location - 160, behavior:'auto'});
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
    	const detailProductReviewDiv = document.querySelectorAll('.detail_product_review_img')
    	
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
    	
    	detailProductReviewDiv.forEach(element => element.onclick = function(event) {
    		
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
<!-- 상품이미지 url 설정 -->
<script>
	const imgUrl = document.querySelector('.detail_product_img')
	imgUrl.style.backgroundImage = "url('${product[0].photo_path}')"
</script>

<script>
// 썸네일 아래 리뷰 별점 기능
	const starCount = document.querySelector('.detail_product_review_inner_starcount')
	const spanStar = document.querySelector('.detail_product_bottom_review_starpoint_number_span')
	const starAverage = ${starAverage}
	const topReviewStar = '★'
	for(let i = 0; i < Math.floor(starAverage); i++) {
		starCount.innerText += topReviewStar 
		spanStar.innerText += topReviewStar
	}
// 가격 소수점 버리기
	const afterSalePrice = document.querySelector('.after_sale_price')
	const salePrice = ${product[0].product_price * 0.95 }
	const saleOrMade = '${product[0].product_icon }'
	if(saleOrMade == 'SALE') {
		afterSalePrice.innerHTML += '\\ ' + Math.floor(salePrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
	}
	if(saleOrMade == 'NEW') {
		afterSalePrice.innerHTML += '\\ ' + Math.floor(salePrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
	}
</script>

<%@ include file="../footer.jsp" %>
