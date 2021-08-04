<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.product_search_wrap {
		position: absolute;
	    top: 104px;
	    width: 100%;
	    justify-content: center;
	}
	.product_search_innerwrap {
		width: 1200px;
		margin: auto;
		margin-top: 50px;
	}
	.product_search_select_div {
		text-align: center;
	}
	.product_search_select_div > p {
		height: 40px;
		line-height: 40px;
		margin: 5px 0;
	}
	.product_search_select_category {
		width: 410px;
		height: 40px;
		border: 1px solid #ddd;
	}
	.product_search_select_input_disable {
		border: 1px solid #ddd;
		width: 118px;
		height: 38px;
		text-align: center;
		padding: 0;
		margin-right: 8px;
		background-color: white;
	}
	.product_search_select_input {
		width: 282px;
		height: 40px;
		border: 1px solid #ddd;
	}
	.product_search_hotkeyword {
		display: flex;
		width: 410px;
		margin: 0 auto;
	}
	.product_search_hotkeyword_innerdiv {
		font-size: 10pt;
		font-weight: bold;
		margin-right: 8px;
	}
	.hotkeyword_div {
		font-size: 10pt;
	}
	.product_search_submit_div {
		margin-top: 40px;
	}
	.product_search_sumit_btn {
		width: 156px;
		height: 32px;
		background-color: white;
	}
	.product_search_sumit_btn:hover {
		background-color: black;
		color: white;
		cursor: pointer;
	}
	.product_search_itemCount {
		border: 1px solid black;
		width: 300px;
		height: 42px;
		margin: auto;
		margin-top: 70px;
		line-height: 42px;
		font-weight: bold;
		text-align: center;
	}
	.product_search_itemCount_span {
		font-size: 10pt;
		font-weight: normal;
	}
</style>
<div class="product_search_wrap">
	<div class="product_search_innerwrap">
		<!-- 	h3 search -->
		<div class="product_search_h5">
			<h5>SEARCH</h5>
		</div>
		<!-- 	상품분류, 상품명, 검색란, 정렬, 인기검색어, 검색 버튼 -->
		<div class="product_search_select_div">
			<form method="POST">
				<p><select class="product_search_select_category">
					<option>상품분류 선택</option>
					<option>MADE</option>
					<option>NEW</option>
					<option>SALE</option>
					<option>BASIC-T</option>
					<option>OUTER</option>
					<option>TOP</option>
					<option>BOTTOM</option>
					<option>DRESS</option>
					<option>SET</option>
					<option>SHOES</option>
					<option>BAG</option>
					<option>ACC</option>
					<option>INNERWEAR</option>
				</select></p>
				<p><input class="product_search_select_input_disable" type="text" placeholder="상품명" disabled><input class="product_search_select_input" type="search" name="searchProduct" autofocus></p>
				<p><select class="product_search_select_category">
	                <option>:::기준 선택:::</option>
	                <option value="latest">Latest Products</option>
	                <option value="loved">Most Loved Products</option>
	                <option value="high">Highest Price</option>
	                <option value="low">Lowest Price</option>
				</select></p>
				<!-- 인기검색어 -->
				<div class="product_search_hotkeyword">
					<div class="product_search_hotkeyword_innerdiv">인기검색어</div>
					<div class="hotkeyword_div"></div>
				</div>
				<div class="product_search_submit_div">
					<input class="product_search_sumit_btn"  type="submit" value="SEARCH >">
				</div>
			</form>
		</div>
		<!-- 	검색된 상품 갯수 -->
		<div class="product_search_itemCount_div">
			<div class="product_search_itemCount">${searchProductCount } <span class="product_search_itemCount_span">ITEMS</span></div>
		</div>
		<!-- 	검색 상품 목록 -->
		<div class="product_search_productList_wrap">
			<!-- 예제 삭제예정 -->
			<c:forEach var="search_product" items="${searchProduct }" varStatus="st">
        		<c:if test="${searchProduct[st.index].product_id != searchProduct[st.index + 1].product_id}">
	        		<div class="new_arrive_product">
		                <div><a href="${cpath }/product/detailProduct/${search_product.product_id}"><img class="new_arrive_img" src="${search_product.photo_path }"></a></div>
		                <div class="home_product_icon">
		                	<c:if test="${search_product.product_icon == 'NEW' }">NEW 5% 24H</c:if>
		                	<c:if test="${search_product.product_icon == 'MADE' }">MADE BY VERLIN</c:if>
		                	<c:if test="${search_product.product_icon == 'SALE' }">SALE 5%</c:if>
		                </div>
		                <div class="home_product_name"><a href="${cpath }/product/detailProduct/${search_product.product_id}">${search_product.product_name }</a></div>
		                <div class="home_product_price">\ ${search_product.product_price }</div>
		                <div class="home_product_color">
		                <c:forEach var="option_color" items="${searchProduct }" varStatus="st">
		                	<c:if test="${searchProduct[st.index].option_color != searchProduct[st.index + 1].option_color && search_product.product_id == searchProduct[st.index].product_id}">
				        		<span class="color_chip" style="background-color: ${option_color.color_code };"></span>
				        	</c:if>
					    </c:forEach>
		                </div>
		              </div>
				</c:if>
        	</c:forEach>
		</div>
	</div>
</div>

<!-- 인기검색어 스크립트 -->
<script>
        const recommend = [
            'MADE', 'NEW', 'Sale', 'outer', 'top',
            'bottom', 'dress', 'set', 'shoes', 'bag', 'acc',
            'innerwear', '더베를린', 'THE VERLIN', '지윤포토', '지언포토',
            '재호포토', '지광모델', '승현모델', '포카리룩'
        ]
        const hotkeyword_div = document.querySelector('.hotkeyword_div')
        function writeRecommend() {
            const arr = Array.from(recommend)
            while(arr.length > 5) {
                const index = Math.floor(Math.random() * arr.length)
                arr.splice(index, 1)
            }
            //top_recommend.innerText = arr.join(' | ')
            const linkArray = arr.map(element => {
                const a = document.createElement('a')
                a.href = ''
                a.innerText = element
                a.onclick = function(event) {
                    event.preventDefault()
                    document.querySelector('.product_search_select_input').value = element
                }
                return a
            })
            hotkeyword_div.innerHTML = ''
            linkArray.forEach((e, i) => {
            	hotkeyword_div.appendChild(e)
                if(i != linkArray.length - 1) {
                    const span = document.createElement('span')
                    span.innerText = ' | '
                    	hotkeyword_div.appendChild(span)
                }
            })
        }
        writeRecommend()
        setInterval(writeRecommend, 3000)
</script>


</body>
</html>