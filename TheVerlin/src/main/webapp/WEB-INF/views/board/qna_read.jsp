<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <div class="main">
        <h4 class="h4">QNA</h4>
        <div class="qna_read_wrap">
            <div class="qna_read_item">
                <div class="qna_read_img" style="background-image: url('${dto.photo_path }')"></div>
                <div class="qna_read_product_info">
                    <!-- product_info에서 상품명이나 item detail을 클릭하면 상품 세부 페이지로 이동 -->
                    <p><a href="${cpath }/product/detailProduct/${dto.product_id }">${dto.product_name }</a></p>
                    <p>${dto.product_price }</p>
                    <p><a href="${cpath }/product/detailProduct/${dto.product_id }"><button>ITEM DETAIL</button></a></p>
                </div>
            </div>
            <div class="qna_read_posting_title">
                <span class="qna_read_class">SUBJECT</span>
                <span>${dto.title }</span>
            </div>
            <div class="qna_read_writer">
                <span class="qna_read_class">NAME</span>&nbsp;&nbsp;&nbsp;
                <span>${dto.member_name }</span>
            </div>
            <div class="qna_read_content">
               	${dto.content }
               	<div class="qna_read_content_imgList">
	               	<div class="qna_read_content_img" style="background-image: url('${cpath}/theVerlinUploadPath/${dto.qna_img1 }')"></div>
	               	<div class="qna_read_content_img" style="background-image: url('${cpath}/theVerlinUploadPath/${dto.qna_img2 }')"></div>
	               	<div class="qna_read_content_img" style="background-image: url('${cpath}/theVerlinUploadPath/${dto.qna_img3 }')"></div>
	               	<div class="qna_read_content_img" style="background-image: url('${cpath}/theVerlinUploadPath/${dto.qna_img4 }')"></div>
               	</div>
            </div>
        </div>
        <div class="qna_read_password_input">
            <p><span>PASSWORD</span><input type="password"><span>삭제하려면 비밀번호를 입력하세요</span></p>        
        </div>
        <div class="qna_read_menu">
            <a href="${cpath }/board/qna"><button class="list">list</button></a>
            <a href=""><button class="delete">delete</button></a>
            <a href=""><button class="modify">modify</button></a>
        </div>
    </div>
</body>
</html>