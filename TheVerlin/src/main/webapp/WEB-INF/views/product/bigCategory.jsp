<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 대분류 페이지 본문을 감싸는 div -->
<div class="bigCategory_wrap">
    <!-- 오늘의 상품 4개 노출 -->
    <div class="today_item">
        <div><h2>today item</h2></div>
        <div class="home_new_arrive_wrap">
<!--         	a태그 href 값 수정해야함!  -->
			<c:forEach var="todayItemList" items="${todayItem }" varStatus="st">
        		<c:if test="${todayItem[st.index].product_id != todayItem[st.index + 1].product_id}">
	        		<div class="new_arrive_product">
		                <div><a href="${cpath }/product/detailProduct/${todayItemList.product_id}"><img class="new_arrive_img" src="${todayItemList.photo_path }"></a></div>
		                <div class="home_product_icon">
		                	<c:if test="${todayItemList.product_icon == 'NEW' }">NEW 5% 24H</c:if>
		                	<c:if test="${todayItemList.product_icon == 'MADE' }">MADE BY VERLIN</c:if>
		                	<c:if test="${todayItemList.product_icon == 'SALE' }">SALE 5%</c:if>
		                </div>
		                <div class="home_product_name"><a href="${cpath }/product/detailProduct/${todayItemList.product_id}">${todayItemList.product_name }</a></div>
		                <div class="home_product_price ${todayItemList.product_icon == 'NEW' ? 'line_throgh' : '' } ${todayItemList.product_icon == 'SALE' ? 'line_throgh' : '' }">\ ${todayItemList.product_price }</div>
		                <c:if test="${todayItemList.product_icon == 'NEW' }">
		              		<fmt:parseNumber var="salepricet" value="${todayItemList.product_price * 0.95 }" integerOnly="true" />
		                	<div class="home_product_saleprice">\ ${salepricet }</div>
		                </c:if>
		                <c:if test="${productList.product_icon == 'SALE' }">
		                	<fmt:parseNumber var="salepricet" value="${todayItemList.product_price * 0.95 }" integerOnly="true" />
		                	<div class="home_product_saleprice">\ ${salepricet }</div>
		                </c:if>
		                <div class="home_product_color">
		                <c:forEach var="option_color" items="${todayItem }" varStatus="st">
		                	<c:if test="${todayItem[st.index].option_color != todayItem[st.index + 1].option_color && todayItemList.product_id == todayItem[st.index].product_id}">
				        		<span class="color_chip" style="background-color: ${option_color.color_code };"></span>
				        	</c:if>
					    </c:forEach>
		                </div>
		              </div>
				</c:if>
        	</c:forEach>
        </div>
    </div>

    <!-- 대분류 상품리스트 가로 4개 -->
    <div class="bigCategory_product_list_wrap">
        <!-- 대분류 소분류 소분류 ... -->
        <div class="category_list">
            <ul>
                <!-- 대분류 이름 (상시 존재해야함) -->
				<!-- a태그 href 파라미터 값 정해줘야함 -->
                <li class="category_list_big"><a href="${cpath }/product/bigCategory/${product[0].option_category }">${product[0].option_category }</a></li>
                <!-- 반복문 통해서 대분류가 가지는 소분류 갯수만큼 li 생성해서 노출시키기 -->
                <!-- 예제 (삭제예정) -->
                <!-- a태그 href 파라미터 값 정해줘야함 -->
                <c:forEach var="innerCategoryList" items="${innerCategoryName }">
                	<li class="category_list_inner"><a href="${cpath }/product/bigCategory/${product[0].option_category }/${innerCategoryList.option_innercategory}">${innerCategoryList.option_innercategory}</a></li>
                </c:forEach>
            </ul>
        </div>

        <!-- 정렬 기준 -->
        <div class="select_sort_div">
            <!-- select에서 onchange 스크립트를 통해서 변경된값에 관해 노출되는 상품 제어(정렬) -->
            <select class="select_sort" onchange="sortCategory()">
                <!-- 지정된 값이 있다면 selected 를 통해 정렬기준 정해져 있어야함 -->
                <option value="latest">Latest Products</option>
                <option value="loved">Most Loved Products</option>
                <option value="high">Highest Price</option>
                <option value="low">Lowest Price</option>
            </select>
        </div>

        <!-- 상품 불러오기 가로 4개 -->
        <div class="bigCategory_product_list">
            <!-- 예제 (삭제예정) -->
            <!-- a태그 href 파라미터 값 정해줘야함 -->
            <c:set var="cnt" value="0" />
            <c:forEach var="productList" items="${product }" varStatus="st">
        		<c:if test="${product[st.index].product_id != product[st.index + 1].product_id and cnt < 12}">
        		<c:set var="cnt" value="${cnt + 1 }" />
	        		<div class="new_arrive_product">
		                <div><a href="${cpath }/product/detailProduct/${productList.product_id}"><img class="new_arrive_img" src="${productList.photo_path }"></a></div>
		                <div class="home_product_icon">
		                	<c:if test="${productList.product_icon == 'NEW' }">NEW 5% 24H</c:if>
		                	<c:if test="${productList.product_icon == 'MADE' }">MADE BY VERLIN</c:if>
		                	<c:if test="${productList.product_icon == 'SALE' }">SALE 5%</c:if>
		                </div>
		                <div class="home_product_name"><a href="${cpath }/product/detailProduct/${productList.product_id}">${productList.product_name }</a></div>
		                <div class="home_product_price ${productList.product_icon == 'NEW' ? 'line_throgh' : '' } ${productList.product_icon == 'SALE' ? 'line_throgh' : '' }">\ ${productList.product_price }</div>
		                <c:if test="${productList.product_icon == 'NEW' }">
		              		<fmt:parseNumber var="saleprice" value="${productList.product_price * 0.95 }" integerOnly="true" />
		                	<div class="home_product_saleprice">\ ${saleprice }</div>
		                </c:if>
		                <c:if test="${productList.product_icon == 'SALE' }">
		                	<fmt:parseNumber var="saleprice" value="${productList.product_price * 0.95 }" integerOnly="true" />
		                	<div class="home_product_saleprice">\ ${saleprice }</div>
		                </c:if>
		                <div class="home_product_color">
		                <c:forEach var="option_color" items="${product }" varStatus="st">
		                	<c:if test="${product[st.index].option_color != product[st.index + 1].option_color && productList.product_id == product[st.index].product_id}">
				        		<span class="color_chip" style="background-color: ${option_color.color_code };"></span>
				        	</c:if>
					    </c:forEach>
		                </div>
		              </div>
				</c:if>
        	</c:forEach>
        </div>
    </div> <!-- bigCategory_product_list_wrap end -->

    <!-- 페이징-->
<!--     <div class="bigCategory_paging">1</div> -->
</div>

<!-- new, made, sale 카테고리에선 대,소분류 없애기 -->
<script>
	const url = window.location.href
	console.log(url)
	if(url == 'http://localhost:8080/TheVerlin/product/productIcon/NEW' || url == 'http://localhost:8080/TheVerlin/product/productIcon/MADE' || url == 'http://localhost:8080/TheVerlin/product/productIcon/SALE') {
		const categoryListBig = document.querySelector('.category_list_big')
		categoryListBig.innerText = ''
		const categoryListInner = document.querySelector('.category_list_inner')
		if(categoryListInner != null)	categoryListInner.innerText = ''
	}

</script>
<!-- 정렬 스크립트 미완 -->
<!-- <script> -->
<!-- 	function sortCategory() { -->
<!-- 		const sort = document.querySelector('.select_sort').value -->
<!-- 		console.log(sort) -->
<!-- 		const url = '${cpath}/product/bigCategory/bigCategoryName/' + sort -->
<!-- 		const opt = { -->
<!-- 				method: 'GET' -->
<!-- 		} -->
<!-- 		fetch(url, opt).then(resp => resp.json()) -->
<!-- 		.then(json => { -->
<!-- 			document.querySelector('.bigCategory_product_list').innerHTML = '' -->
<!-- 			console.log(json) -->
<!-- 		}) -->
<!-- 	} -->
<!-- </script> -->
<%@ include file="../footer.jsp" %>