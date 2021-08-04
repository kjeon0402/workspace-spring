<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="main">
        <h4 class="h4">NOTICE</h4>
        <table class="notice_list">
            <tr>
                <!-- 구분하기 위해 제목, 글쓴이 라고 써둔 것 -->
                <th>NO</th>
                <th></th>
                <th></th>
            </tr>
            <!-- forEach -->
            <c:forEach var="list" items="${list }">
	            <tr>
	                <td>${list.notice_idx }</td>
	                <td><a href="${cpath }/board/notice_read/${list.notice_idx }">${list.title }</a></td>
	                <td>${list.member_id }</td>
	            </tr>
            </c:forEach>
        </table>
        	
        	<c:if test="${login.member_uid == 1 }">
        		<a href="${cpath }/board/notice_write">write</a>
        	</c:if>
        	
        <div class="paging">
            <span>
            	<a href="${cpath }/board/notice/${pag.page - 1}?search_kind=${pag.search_kind}&search_keyword=${pag.search_keyword}"><</a>
            </span>&nbsp;&nbsp;&nbsp;
            <c:forEach var="i" begin="${pag.begin }" end="${pag.end }">
	            <span class="num">
	            	<a href="${cpath }/board/notice/${i}?search_kind=${pag.search_kind}&search_keyword=${pag.search_keyword}">
	            		${i == pag.page ? '<strong>' : '' }
	            			${i }	
						${i == pag.page ? '</strong>' : '' }
	            	</a>
	            </span>&nbsp;&nbsp;&nbsp;
            </c:forEach>
           	<span>
           		<a href="${cpath }/board/notice/${pag.page + 1}?search_kind=${pag.search_kind}&search_keyword=${pag.search_keyword}">></a>
           	</span>
        </div>
        
        <div class="notice_search">
			<form method="GET">
			<!-- 기간 기능 뺄지 논의중 -->
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