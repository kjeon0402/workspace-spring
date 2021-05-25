<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div style="display: flex; width: 950px; flex-flow: wrap;">
<c:forEach var="book" items="${list }">
	<div style="padding: 10px; border: 2px solid #dadada; width: 200px; margin: 5px;">
		<div>${book.idx }) ${book.title }</div>
		<div>${book.author }</div>
		<div>${book.publisher }</div>
		<div>${book.pbday }</div>
		<div>${book.count }</div>
		<div>
			<a href="${cpath }/book/update/${book.idx }/"><button>수정</button></a>
			<button class="deleteBtn" data-idx="${book.idx }">삭제</button>
		</div>
	</div>
</c:forEach>
</div>

<script>
	const deleteUrl = '${cpath }/book/delete/';
	const deleteBtnList = document.querySelectorAll('.deleteBtn');
	const deleteHandler = function(event) {
		const idx = event.target.dataset.idx;
// 		console.log('idx : ' + idx);
		const answer = confirm(idx + '번 도서를 삭제하시겠습니까?');
		if(answer) {
			location.href = deleteUrl + idx;
		}
	}
	deleteBtnList.forEach(function(btn) {
		btn.onclick = deleteHandler;
	});
</script>

</body>
</html>