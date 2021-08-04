<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

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
            <c:forEach var="qna" items="${qna }">
	            <tr>
	                <td>${qna.qna_idx }</td>
	                <td>
	                	<div class="qna_list_img" style="background-image: url('${qna.photo_path }')"></div>
	                </td>
	                <td>
	                    <a href="${cpath }/board/qna_read/${qna.qna_idx }">
	                        <p>${qna.product_name }</p>
	                        <p>${qna.title }</p>
	                    </a>
	                </td>
	                <td>${qna.member_name }</td>
	            </tr>
            </c:forEach>
        </table>
        <c:if test="${not empty login }">
        	<a href="${cpath }/board/qna_write"><button class="qna_write">WRITE</button></a>        
        </c:if>
        
       	<div class="paging">
            <span>
            	<a href="${cpath }/board/qna/${pag.page - 1}?search_kind=${pag.search_kind}&search_keyword=${pag.search_keyword}"><</a>
            </span>&nbsp;&nbsp;&nbsp;
            <c:forEach var="i" begin="${pag.begin }" end="${pag.end }">
	            <span class="num">
	            	<a href="${cpath }/board/qna/${i}?search_kind=${pag.search_kind}&search_keyword=${pag.search_keyword}">
	            		${i == pag.page ? '<strong>' : '' }
	            			${i }	
						${i == pag.page ? '</strong>' : '' }
	            	</a>
	            </span>&nbsp;&nbsp;&nbsp;
            </c:forEach>
           	<span>
           		<a href="${cpath }/board/qna/${pag.page + 1}?search_kind=${pag.search_kind}&search_keyword=${pag.search_keyword}">></a>
           	</span>
        </div>
        <div class="qna_search">
        	<form method="GET">
<!-- 	            <select> -->
<!-- 	                <option value="this_week">일주일</option> -->
<!-- 	                <option value="this_month">한 달</option> -->
<!-- 	                <option value="three_months">세 달</option> -->
<!-- 	                <option value="all">전체</option> -->
<!-- 	            </select> -->
	            <select name="search_kind">
	                <option ${pag.search_kind == 'title' ? 'selected' : '' } value=title>제목</option>
	                <option ${pag.search_kind == 'content' ? 'selected' : '' } value="content">내용</option>
	                <option ${pag.search_kind == 'member_id' ? 'selected' : '' } value="member_id">아이디</option>
	            </select>
	            <input type="text" name="search_keyword" value="${pag.search_keyword }">
	            <input type="submit" value="SEARCH">
            </form>
        </div>
</div>

</body>
</html>