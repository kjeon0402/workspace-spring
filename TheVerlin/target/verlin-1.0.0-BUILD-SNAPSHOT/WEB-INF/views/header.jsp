<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coding House Project</title>
<style>
/* 	header.jsp css end */
	html {
		scroll-behavior: smooth;
	}
	body {
		padding: 0;
		margin: 0;
	}
	a {
		text-decoration: none !important;
		color: inherit !important;
	}
	li {
		list-style: none; 
	}
	.hidden {
		display: none !important;
	}
	/* 	헤더 스타일 */
	header {
		width: 100%;
		position: fixed;
		background-color: white;
		top: 0;
		z-index: 1;
	}
	.header_wrap {
		display: flex;
		width: 1200px;
		margin: 0 auto;
		justify-content: space-between;
	}
	/* 	헤더 좌측 */
	.header_left {
		padding: 22px 15px 0 0;
		font-size: 16pt;
		margin-top: 20px;
		font-weight: bold;
		line-height: 40px;
	}
	.header_left > a {
		display: block;
		width: 130px;
	}
	/* 	헤더 가운데 */
	.header_center {
		margin-top: 20px;
		position: relative;
/* 		margin-left: 30px; */
	}
	.header_ul {
		display: flex;
		padding: 0;
		margin-top: 16px;
	}
	.header_ul > li {
		margin: 10px;
	}
	.swimCate > a {
		display: block;
		width: 89px;
	}
	.a {
		font-size: 11pt;
 		color: blue; 
/* 		font-weight: bold; */
		padding-top: 7px;
	}
	.b {
		font-size: 11pt;
/* 		font-weight: bold; */
		padding-top: 7px;
	}
	.c {
		font-size: 11pt;
		padding-top: 7px;
	}
	/* 	헤더 우측 */
	.header_right {
		margin-top: 16px;
		margin-left: 97px;
		font-size: 9pt;
	}
	.header_right > ul {
		padding-top: 13px;
	}
	/* 	카테고리 오버레이 (소분류 카테고리에서 마우스 벗어나면 소분류 숨기려고 만듬)*/
	.upperOverlay {
		position: absolute;
		top: -7px;
		left: 0;
		width: 1300px;
		height: 30px;
	}
	.downOverlay {
		position: absolute;
		top: 80px;
		left: 0;
		width: 1300px;
		height: 1000px;
	}
	/* 	소분류 */
	.innercategory {
		position: absolute;
		width: 100px;
		font-size: 10pt;
		background-color: white;
	}
	.innercategory > ul {
		padding-left: 10px;
	}
/* 	.innerBasict { */
/* 		left: 200px; */
/* 		top: 65px; */
/* 		z-index: 5; */
/* 	} */
	.innerOuter {
		left: 284px;
		top: 65px;
		z-index: 5;
	}
	.innerTop {
		left: 98px;
		top: 65px;
		z-index: 5;
	}
	.innerBottom {
		left: 158px;
		top: 65px;
		z-index: 5;
	}
	.innerShoes {
		left: 349px;
		top: 65px;
		z-index: 5;
	}
	.innerAcc {
		left: 399px;
		top: 65px;
		z-index: 5;
	}
	.innerBoard {
		left: 895px;
		top: 65px;
		z-index: 5;
	}
	/* 	검색 오버레이 */
	.search_overlay {
		position: fixed;
		width: 100%;
		height: 100%;
		left: 0;
		top: 0;
		background-color: rgba(0, 0, 0, 0.8);
		z-index: 1;
	}
	.search_modal {
		position: fixed;
		left: 25%;
		top: 10%;
		width: 50%;
		height: 800px;
		background-color: rgba(0, 0, 0, 0);
		z-index: 5;
	}
	.close_modal {
		float: right;
		font-size: 20pt;
		font-weight: bold;
		color: white;
	}
	.search_div {
		margin-top: 200px;
		text-align: center;
		font-size: 30pt;
		font-weight: bold;
		color: white;
	}
	.search_div > form > input {
		border: 2px solid white;
		width: 550px;
		height: 50px;
		background-color: inherit;
		color: white;
		font-size: 20pt;
	}
	.small_font {
		font-size: 10pt;
	}
		/* 리모컨 */
/* 	.remote_controller { */
/* 		position: fixed; */
/* 		width: 50px; */
/* 		right: 20px; */
/* 		bottom: 20px; */
/* 		font-size: 20pt; */
/* 		font-weight: bold; */
/* 		text-align: center; */
/* 	} */
/* 	.remote_controller:hover { */
/* 		cursor: pointer; */
/* 	} */
/* 	header.jsp css end */
/* 	home.jsp css */
        .home_wrap {
        	margin-top: 104px;
            width: 100%;
            height: 100%;
            display: flex;
            flex-flow: column;
            justify-content: center;
        }
        
        
        
        /* 이미지 슬라이더 */
        .home_img_slider {
            width: 1200px;
            height: 790px;
            margin: auto;
        }
        /* 대문 페이지 이미지 슬라이더 */
        .aside {
            position: fixed;
            top: 0;
            right: -300px;
            transition-duration: 0.5s;
            z-index: 5;

            width: 299px;
            height: 100%;
            border: 1px solid #ddd;
            background: #fff;
            cursor: pointer;
		}
		.aside_img {
		   width: 191px;
		   height: 191px;
		   margin-left: 58px;
		   margin-top: 53px;
        }
        
		
		.slider_window {
            overflow: hidden; 
		}        
        .slider_wrap {
        	display: flex;
         	align-items: center;
        }
       .slide_img {
           width: 595px;
           margin-right: 5px;
           
       } 
        /* 수제 페이지 로고 */
        .home_center {
            width: 390px;
            height: 500px;
            margin: auto;
        }
        .made_img {
            width: 100%;
            height: 100%;
        }
        
        /* 대문페이지 오른쪽 슬라이더 */
        .quick-menu-button {
        	position: absolute;
    		top: 390px;
    		left: -43px;
        	width: 40px;
        	height: 42px;
        	background-color: black;
        	color: white;
        	text-align: center;
        	line-height: 43px;
        	border: 1px solid white;
        }
        #closeBtn {
        	position: absolute;
    		top: 433px;
    		left: -43px;
        	width: 40px;
        	height: 42px;
        	background-color: black;
        	color: white;
        	text-align: center;
        	font-size: 15px;
        	line-height: 43px;
        	border: 1px solid white;
        }
        .go_top {
        	position: absolute;
    		top: 475px;
    		left: -43px;
        	width: 40px;
        	height: 42px;
        	background-color: black;
        	color: white;
        	text-align: center;
        	font-size: 15px;
        	line-height: 43px;
        	border: 1px solid white;
        }
        .go_down {
        	position: absolute;
    		top: 517px;
    		left: -43px;
        	width: 40px;
        	height: 42px;
        	background-color: black;
        	color: white;
        	text-align: center;
        	font-size: 15px;
        	line-height: 43px;
        	border: 1px solid white;
        }
        
        
        .aside_div {
		    width: 250px;
		    height: 85px;
		    /* border: 1px solid black; */
		    text-align: left;
		    word-spacing: 85px;
		    margin-left: 40px;
		    margin-top: 50px;
		    font-weight: bold;
		    font-size: 14px;
		    
        }
        .aside_div_two {
        	 width: 250px;
		    height: 85px;
        	text-align: left;
 		    word-spacing: 80px; 
		    margin-left: 40px;
		    margin-top: 30px;
		    font-weight: bold;
		    font-size: 12px;
		    color: #aaa;
        }
        .aside_p{
        	margin-bottom: 8px;
        }
        .aside_hr {
        	width: 225px;
		    margin-right: 24px;
		    margin-top: 0%;
		    border: 1px solid #dadada;
        }
        .today_view {
        	width: 237px;
		    height: 235px;
		    border: 1px solid black;
		    margin-left: 35px;
		    margin-top: -3px;
        }
        
        .overlay {
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;             
            right:0;
            background-color: rgba(0,0,0,0.4);
            z-index: 1;
        }
        .hidden {
            display: none;
        }
        
        

        /* 신상 불러오는 div */
        .home_new_arrive {
            text-align: center;
            width: 1200px;
            margin: auto;
        }
        .home_new_arrive_wrap, .product_search_productList_wrap {
            width: 1100px;
            display: flex;
            flex-flow: wrap;
            margin: auto;
            justify-content: space-between;
        }
        /* 예제 (삭제예정) */
        .new_arrive_product, .product_search_product_each {
            width: 300px;
            text-align: left;
        }
/*          .new_arrive_product { */
/*          	margin-right: 20px; */
/*          } */
        .new_arrive_img, .product_search_product_img {
            width: 100%;
            height: 100%;
        }
        .new_arrive_product > div > a, .product_search_product_each > div > a {
            text-decoration: none;
            color: inherit;
        }

        /* 리뷰 불러오는 div */
        .home_review_viewer {
            text-align: center;
            width: 1200px;
            margin: auto;
        }
        .home_review_viewer_wrap {
            width: 1200px;
            display: flex;
            flex-flow: wrap;
            margin: auto;
            justify-content: space-between;
        }
         /* 예제 (삭제예정) */
        .home_review_each {
            width: 230px;
        }
        .home_review_img {
            width: 100%;
            height: 100%;
        }
        /* 리모컨 */
        .remote_controller {
            position: fixed;
            width: 50px;
            right: 20px;
            bottom: 20px;
            font-size: 20pt;
            font-weight: bold;
            text-align: center;
        }
        .remote_controller:hover {
            cursor: pointer;
        }
        /* 컬러칩 */
        .color_chip {
            display: inline-block;
            width: 8px;
            height: 8px;
            border: 1px solid #ddd;
        }
        .home_product_icon, .product_search_icon {
            font-style: oblique;
            font-weight: bold;
        }
/* 	home.jsp css end*/
/* 	bigCategory css */
        .category_list > ul {
            display: flex;
        }
        .category_list > ul > li {
            list-style: none;
            margin: 0 10px;
        }
        /* 대분류페이지 본문 */
        .bigCategory_wrap {
        	margin: auto;
        	margin-top: 104px;
            width: 100%;
            display: flex;
            flex-flow: column;
            justify-content: center;
        }
        /* 오늘의 상품 */
        .today_item {
            text-align: center;
            width: 1100px;
            margin: auto;
        }
        .today_item_wrap {
            width: 1100px;
            display: flex;
            flex-flow: wrap;
            justify-content: space-between;
        }
        /* 예제 (삭제예정) */
        .today_item_each {
            width: 230px;
        }
        .today_item_img {
            width: 100%;
            height: 100%;
        }
        /* 대분류 상품리스트  */
        .bigCategory_product_list_wrap {
            display: flex;
            flex-flow: column;
            width: 1200px;
            margin: auto;
            margin-top: 10px;
        }
        /* 정렬 기준 */
        .select_sort_div {
            text-align: right;
        }
        .select_sort {
        	height: 30px;
        }
        /* 대분류 상품 불러오기 */
        .bigCategory_product_list {
            width: 1100px;
            display: flex;
            flex-flow: wrap;
            margin: auto;
            justify-content: space-between;
        }
        .bigCategory_product_each {
            width: 270px;
        }
        .bigCategory_product_img {
            width: 100%;
            height: 100%;
        }
        
        /* 페이징 */
        .bigCategory_paging {
            text-align: center;
        }
/* 	bigCategory css end*/
/* 	product css */
		.table_td {
            padding: 10px;
        }
        .table_td > select {
            height: 30px;
        }
         .line_throgh {
         	text-decoration: line-through;
         }
        /* <!-- 이미지/정보 영역 --> */
        .detail_product_top {
            display: flex;
            width: 1200px;
            height: 750px;
            margin: auto;
        }
        .detail_product_top_left {
            display: flex;
            flex-flow: column;
            width: 600px;
        }
        .detail_product_top_right {
            display: flex;
            flex-flow: column;
            width: 600px;
            margin-left: 50px;
        }
        .detail_product_img {
            background-image: url('https://www.theverlin.com/web/product/big/202107/a64fe927763288a7eb0af41da9388583.png');
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            width: 100%;
            height: 100%;
        }
        .detail_product_img:hover {
            cursor: pointer;
        }
        .detail_product_review {
            display: flex;
            height: 120px;
            padding: 5px;
            background-color: rgba(229,229,229,0.6);
        }
        .detail_product_review_div, .detail_product_review_div_star {
            width: 120px;
            height: 120px;
            margin-right: 5px;
            border: 1px solid #888;
        }
        .detail_product_review_div:hover {
            cursor: pointer;
        }
        .detail_product_review_img {
            width: 99%;
            height: 98%;
            border: 0.5px solid #888;
        }
        .detail_product_review_inner {
            height: 38px;
            text-align: center;
            line-height: 40px;
            font-weight: bold;
        }
        .detail_product_info, .detail_product_option, .detail_product_select_result, .detail_product_button {
            margin: 30px 0;
            height: 120px;
        }
        .detail_product_count {
            width: 27px;
        }
        .detail_product_top_right_bottom {
            font-size: 10pt;
            text-align: center;
        }
        /*리뷰 클릭 시, 오버레이 및 모달*/
        .detail_product_review_div_overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
        }
        .detail_product_review_div_modal {
            position: fixed;
            left: 25%;
            top: 10%;
            width: 50%;
            height: 800px;
            background-color: white;
        }
        .detail_product_review > .review_thumbnail {
			width: 120px;
			border: 0px;
		}
        /* 버튼 관련 */
        .detail_product_button {
            text-align: center;
        }
        .buy {
            border: 2px solid black;
            background-color: white;
            width: 370px;
            height: 60px;
        }
        .buy:hover {
            background-color: black;
            color: white;
            cursor: pointer;
        }
        .tocart {
            border: 1px solid #888;
            background-color: white;
            width: 370px;
            height: 30px;
        }
        .tocart:hover {
            border: 1px solid black;
            cursor: pointer;
        }
        /* 상품설명, 모델컷 영역 */
        .detail_product_wrap {
        	margin: auto;
        	margin-top: 154px;
        }
        .detail_product_cont {
            width: 1200px;
            margin: auto;
        }
        .detail_product_cont_img {
            width: 1000px;
            height: 1333px;
            margin: auto;
        }
        .detail_product_cont_img_each {
            width: 100%;
            height: 100%;
        }
        /* 리뷰왕 이벤트 */
        .detail_product_reviewkingevent_img {
            width: 1000px;
            height: 540px;
            margin: auto;
        }
        /* 관련상품 */
        .detail_product_related {
            width: 1200px;
            height: 620px;
            margin: auto;
            margin-top: 80px;
        }
        .detail_product_related_img_wrap {
            display: flex;
        }
        .detail_product_related_img {
            width: 200px;
            height: 340px;
            margin-right: 30px;
        }
        .detail_product_related_img > div > a > img {
            width: 100%;
            height: 100%;
        }
        .detail_product_related_info > p {
            margin: 0;
        }
        .detail_product_close_result:hover {
            cursor: pointer;
        }
	.detail_product_menu_ul {
		display: flex;
		padding: 0;
	}
	.detail_product_menu_li {
		border: 1px solid black;
		text-align: center;		
		width: 400px;
		height: 50px;
		line-height: 50px;
		font-weight: bold;
	}
	.detail_product_menu_li:hover {
		cursor: pointer;
		background-color: black;
		color: white;
	}
	.detail_product_bottom_review_wrap {
		width: 1200px;
		margin: auto;
		margin-bottom: 50px;
	}
	.detail_product_bottom_review_starpoint_wrap {
		margin-top: 20px;
		display: flex;
	}
	.detail_product_bottom_review_title {
		padding-left: 15px;
	}
	.detail_product_bottom_review_starpoint {
		margin-right: 500px;
		color: #777777;
		font-size: 10pt;
	}
	.detail_product_bottom_review_starpoint_graph_wrap {
		display: flex;
		height: 20px;
	}
	.detail_product_bottom_review_starpoint_graph {
		display: flex;
		padding-top: 8px;
		margin-left: 10px;
	}
	.detail_product_bottom_review_starpoint_number {
		margin-top: 20px;
		color: black;
	}
	.detail_product_bottom_review_starpoint_number_span {
		color: #3868d6;
		font-size: 20pt;
	}
	.detail_product_bottom_review_starpoint_starcount {
		color: #3868d6;
		font-size: 15pt;
		line-height: 15pt;
	}
	.detail_product_bottom_review_starpoint_percent {
		line-height: 25px;
		color: #212529;
		font-size: 10pt;
		margin-left: 10px;
	}
	.detail_product_bottom_review_thumbnial_wrap {
		display: flex;
		flex-flow: wrap;
		margin: 10px 10px 50px 0;
	}
	.detail_product_select_result_table_tbody_tr2_td {
		width: 180px;
	}
	.qna_list_img {
		width: 80px;
		height: 80px;
	}
	.detail_product_menu_nav {
		position: sticky;
	    top: 99px;
	    background-color: white;
	}
/* 	product css end*/
/* 	order css */
        .order_input:focus {
            outline: none;
        }
        .order_select:focus {
            outline: none;
        }
        .order_textarea:focus {
            outline: none;
        }
        .order_wrap {
            position: relative;
            top: 104px;
            display: flex;
            flex-flow: column;
            width: 1200px;
            margin: auto;
        }
        /*회원정보 영역*/
        .order_member_info {
            margin-bottom: 50px;
        }
        .order_member_info > div > table {
            border: 1px solid #aaa;
        }
        .order_member_info_table {
            width: 1200px;
            height: 70px;
        }
        .order_member_info_table > tbody > tr > td {
            background-color: whitesmoke;
        }
        .order_member_info_table > tbody > tr > td > span {
            margin-right: 80px;
            font-size: 10pt;
            padding-left: 10px;
        }
        .order_member_info_table > tbody > tr > td > span > a > span {
            color: red;
            font-size: 12pt;
        }
        .border_right {
            border-right: 1px solid #aaa;
            background-color: seashell;
        }
        .border_bottom {
            border-bottom: 1px solid #aaa;
            font-size: 10pt;
            padding-left: 10px;
        }
        /*배송상품 주문내역 영역*/
        .order_delivery_info {
            margin-bottom: 50px;
        }
        .order_delivery_table {
            border: 1px solid #aaa;
            border-collapse: collapse;
            width: 1200px;
        }
        .order_delivery_table > thead > tr > th {
            background-color: seashell;
        }
        .order_delivery_table > tbody > tr > td {
            background-color: whitesmoke;
        }
        .order_delivery_table > thead > tr > th, .order_delivery_table > tbody > tr > td {
            border: 1px solid #aaa;
            text-align: center;
        }
        .order_delivery_lower {
            height: 40px;
            line-height: 40px;
            font-size: 10pt;
            color: red;
            padding-left: 10px;
            border-bottom: 1px solid #aaa;
            margin-bottom: 10px;
        }
        .order_delivery_table_td_left {
            text-align: left;
        }
        .order_delivery_table_final {
            padding: 10px; 
            font-size: 10pt;
        }
        .order_delivery_table_final_left_span {
            float: left;
        }
        .order_delivery_table_final_right_span {
            float: right;
        }
        .order_delivery_lower_left {
            float: left; 
            font-size: 10pt;
        }
        .order_delivery_lower_right {
            float: right; 
            font-size: 10pt;
        }
        .order_delivery_lower_button {
            background-color: gainsboro;
            border: 1px solid #888;
            border-radius: 5px;
            color: grey;
            height: 25px;
        }
        .order_delivery_lower_button:hover {
            cursor: pointer;
            background-color: lightgray;
            color: black;
        }
        .order_delivery_table_img {
            width: 75px;
            height: 98px;
        }
        /*경계선*/
        .order_line {
            border: 1px solid #888;
            margin-bottom: 30px;
        }
        /*배송지 정보*/
        .order_address_info {
            margin-bottom: 30px;
        }
        .order_address_info_h3 {
            margin-bottom: 0;
        }
        .order_address_info_p {
            text-align: right; 
            margin-top: 0;
        }
        .order_address_info_red_span {
            color: red;
            font-size: 8pt;
        }
        .order_address_info_grey_span {
            color: #aaa; 
            font-size: 8pt;
        }
        .order_address_info_table {
            border-top: 2px solid #aaa;
            border-bottom: 2px solid #aaa;
            border-collapse: collapse;
            width: 1200px;
        }
        .order_address_info_table > tbody > tr > th {
            border-right: 1px solid #aaa;
            border-bottom: 1px solid #aaa;
            padding: 10px;
            text-align: left;
            font-weight: normal;
            font-size: 10pt;
            background-color: seashell;
        }
        .order_address_info_table > tbody > tr > th > span {
            color: red;
            font-size: 10pt;
        }
        .order_address_info_table > tbody > tr > td {
            border-bottom: 1px solid #aaa;
            padding: 10px;
            font-size: 10pt;
            line-height: 30px;
            background-color: whitesmoke;
        }
        .order_address_info_table > tbody > tr > td > textarea {
            width: 500px;
            height: 100px;
            resize: none;
        }
        .order_address_info_table > tbody > tr > td > span {
            font-size: 10pt;
            color: #888;
        }
        .order_address_info_table_button {
            width: 100px;
            height: 30px;
            background-color: cornsilk;
            border: 1px solid #aaa;
            border-radius: 15px;
        }
        .order_address_info_table_input1 {
            width: 80px;
            height: 20px;
        }
        .order_address_info_table_input2 {
            width: 100px;
            height: 20px;
        }
        .order_address_info_table_input3, .order_address_info_table_input4 {
            width: 300px;
            height: 20px;
        }
        .order_address_info_table_select1 {
            width: 60px;
            height: 26px;
        }
        .order_address_info_table_input5, .order_address_info_table_input6 {
            width: 60px;
            height: 20px;
        }
        .order_address_info_table_input7, .order_address_info_table_input8 {
            height: 20px;
        }
        .order_address_info_table_button:hover {
            cursor: pointer;
        }
        .order_address_info_table_button > span {
            color: tomato;
        }
        /*결제 예정 영역*/
        .order_pay_info {
            margin-bottom: 30px;
        }
        .order_pay_info > button {
            width: 1200px;
            height: 50px;
            font-size: 15pt;
            background-color: whitesmoke;
            border: 1px solid #aaa;
            border-radius: 5px;
        }
        .order_pay_info > button:hover {
            cursor: pointer;
            background-color: seashell;
        }
        /*이용안내*/
        .order_using_info {
            font-size: 10pt;
            color: #888;
            margin-bottom: 30px;
            background-color: whitesmoke;
            border: 1px solid #aaa;
            padding: 20px;
        }
/* 	order css end*/

/* 	board css */
	.main {
		width: 1100px;
		margin: 0 auto;
		margin-top: 150px;
	}
	.h4 {
		font-size: 15px !important;
	}
	.paging {
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 12px;
		margin-bottom: 20px;
	}
	.paging a {
		text-decoration: none;
		color: #d5d5d5;
		font-weight: bold;
	}
	.paging > .num > a {
		font-style: italic;
		color: black;
	}
/* notice_write css */
		.note-resizebar {
			display: none;
		}
		.note-status-output {
			display: none !important;
		}
        .notice_write_wrap {
            width: 1100px;
            padding-bottom: 150px;
            border-bottom: 1px solid #d5d5d5;
        }
        .notice_write_wrap > form > .item {
            display: flex;
            flex-flow: column;
            border-top: 1px solid #d5d5d5;
            border-bottom: 1px solid #d5d5d5;
            padding: 10px 0;
            margin-bottom: 10px;
        }
        .notice_write_wrap > form > .img {
            width: 100px;
            height: 150px;
            border: 1px solid #d5d5d5;
            box-sizing: border-box;
            margin-right: 30px;
        }
        .notice_write_wrap > form > .item > p {
            height: 50px;
            display: flex;
            align-items: center;
        }
        .notice_write_wrap > form > .item > p > input {
            cursor: pointer;
            background-color: white;
            border: 1px solid #d5d5d5;
            font-size: 12px;
            padding: 5px;
            height: 30px;
        }
        .notice_write_content .notice_write_upmenu, .notice_write_downmenu {
            display: flex;
        }
        .notice_write_content .notice_write_column {
            border: 1px solid #f2f2f2;
            padding: 10px;
            font-size: 11px;
            width: 150px;
            display: flex;
            align-items: center;
        }
        .notice_write_content .notice_write_input {
            border: 1px solid #f2f2f2;
            padding: 10px;
            font-size: 11px;
            width: 1100px;
            border-left: 0;
        }
        .notice_write_content .notice_write_input > select {
            padding: 3px;
            width: 200px;
        }
        .notice_write_content .notice_write_input > label {
            font-weight: normal;
            align-items: center;
        }
        .note-toolbar {
            z-index: -1;
        }
        .notice_write_down_btn {
            padding: 0;
            margin: 20px 0;
            width: 1100px;
        }
        .notice_write_down_btn > span a {
            padding: 9px 10px;
            margin-right: 5px;
            font-size: 11px;
            line-height: 30px;
            border: 1px solid #ccc;
        }
        .notice_write_down_btn > span button {
            padding: 0 20px;
            margin-right: 5px;
            font-size: 11px;
            line-height: 30px;
            border: 1px solid #333;
            background-color: #333;
            color: #ccc;
        }
        .notice_write_down_btn > span:first-child {
            float: left;
        }
        .notice_write_down_btn > span:nth-child(2) {
            float: right;
        }
        .notice_write_down_btn > span:last-child {
            float: right;
        }
        .modal-backdrop {
            z-index: -999999;
        }
        .note-toolbar {
            z-index: initial !important;
        }
/* notice_write css end */

/* notice css */
        .notice_list {
            width: 100%;
            margin-bottom: 30px;
            border-collapse: collapse;
        }
        .notice_list th {
            border-bottom: 1px solid #d5d5d5;
            font-size: 11px;
            padding: 3px 0;
        }
        .notice_list td {
            border-bottom: 1px solid #d5d5d5;
            padding: 3px 0;
            font-size: 12px;
        }
        .notice_list td:first-child, .notice_list td:last-child {
            text-align: center;
        }
        .notice_list td > a {
            text-decoration: none;
            color: inherit;
        }
        .notice_list td > a:hover {
            color: #aaaaaa;
        }
        
        .notice_search  select {
            border: 1px solid #d5d5d5;
            padding: 1px;
        }
        .notice_search  input {
            border: 1px solid #d5d5d5;
            padding: 2px;
        }
        .notice_search input:focus {
            outline: none;
        }
        .notice_search input[type="submit"] {
            background-color: white;
            border: none;
            font-size: 12px;
            cursor: pointer;
        }
/* notice css end */

/* notice_read css */
        .notice_read_wrap {
            width: 1000px;
            margin-bottom: 250px;
        }
        .notice_read_posting_title, .notice_read_writer {
            border-bottom: 1px solid #d5d5d5;
            font-size: 13px;
            margin-bottom: 5px;
            padding-bottom: 5px;
        }
        .notice_read_wrap .notice_read_class {
            padding-right: 40px;
        }
        .notice_read_writer {
            margin-bottom: 40px;
        }
        .notice_read_content {
            font-size: 13px;
        }
        .notice_read_content > .notice_read_mini_title {
            font-size: 20px;
            font-weight: bold;
        }
        .notice_list_back {
            background-color: white;
            border: 1px solid #d5d5d5;
            padding: 5px;
            cursor: pointer;
        }
        .notice_list_back a {
            text-decoration: none;
            color: inherit;
        }
/* notice_read css end

/* qna css */
        .qna_list {
            width: 100%;
            margin-bottom: 30px;
            border-collapse: collapse;
        }
        .qna_list th {
            border-bottom: 1px solid #d5d5d5;
            font-size: 11px;
            padding: 3px 0;
        }
        .qna_list td {
            border-bottom: 1px solid #d5d5d5;
            padding: 3px 0;
            font-size: 12px;
        }
        .qna_list td:first-child {
            width: 10%;
            text-align: center;
        }
        .qna_list td:nth-child(2) {
            width: 10%;
            height: 100px;
            text-align: center;
            align-content: center;
        }
        .qna_list td:nth-child(3) a {
            text-decoration: none;
            color: inherit;
        }
        .qna_list td:nth-child(3) a > p:first-child {
            color: #aaaaaa;
        }
        .qna_list td:last-child {
            width: 15%;
            text-align: center;
        }
        .qna_list .qna_list_img {
        	width: 80px;
        	height: 90px;
        	margin: auto;
        	background-position: center cetner;
        	background-size: 100%;
        	background-repeat: no-repeat;
        }
        .qna_list_btn, .qna_write  {
            float: right;
            background-color: white;
            padding: 5px 30px;
            border: 1px solid black;
            cursor: pointer;
        }
        .qna_write:hover, .qna_list_btn:hover {
            background-color: black;
            color: white;
        }
        .qna_search select {
            border: 1px solid #d5d5d5;
            padding: 1px;
        }
        .qna_search input {
            border: 1px solid #d5d5d5;
            padding: 2px;
        }
        .qna_search input:focus {
            outline: none;
        }
        .qna_search input[type="submit"] {
            background-color: white;
            border: none;
            font-size: 12px;
            cursor: pointer;
        }
/* qna css end */

/* qna_read css */
        .qna_read_wrap {
            width: 100%;
            padding-bottom: 250px;
            border-bottom: 1px solid #d5d5d5;
        }
        .qna_read_wrap > .qna_read_item {
            display: flex;
            border-top: 1px solid #d5d5d5;
            border-bottom: 1px solid #d5d5d5;
            padding: 10px 0;
        }
        .qna_read_wrap > .qna_read_item > .qna_read_img {
            width: 100px;
            height: 150px;
            border: 1px solid #d5d5d5;
            box-sizing: border-box;
            margin-right: 30px;
            background-size: 100%;
            background-position: center center;
            background-repeat: no-repeat;
        }
        .qna_read_wrap > .qna_read_item > .qna_read_product_info {
            font-size: 13px;
        }
        .qna_read_wrap > .qna_read_item > .qna_read_product_info a {
            text-decoration: none;
            color: inherit;
        }
        .qna_read_wrap > .qna_read_item > .qna_read_product_info button {
            margin-top: 20px;
            background-color: white;
            border: 1px solid #d5d5d5;
            padding: 5px;
            cursor: pointer;
        }
        .qna_read_wrap > .qna_read_item > .qna_read_product_info button > a {
            text-decoration: none;
            color: inherit;
            font-size: 13px;
        }
        .qna_read_wrap > .qna_read_posting_title, .qna_read_writer {
            border-bottom: 1px solid #d5d5d5;
            font-size: 13px;
            margin-bottom: 5px;
            padding-bottom: 5px;
        }
        .qna_read_wrap .qna_read_class {
            padding-right: 40px;
        }
        .qna_read_writer {
            margin-bottom: 40px;
        }
        .qna_read_content {
            font-size: 13px;
        }
        .qna_read_content > .qna_read_content_imgList {
        	display: flex;
        }
        .qna_read_content > .qna_read_content_imgList > .qna_read_content_img {
        	width: 200px;
        	height: 200px;
        	margin: 10px;
        	background-position: center center;
        	background-repeat: no-repeat;
        	background-size: 100%;
        }
        .qna_read_password_input {
            font-size: 12px;
        }
        .qna_read_password_input > p > span:nth-child(1) {
            margin-right: 40px;
        }
        .qna_read_password_input input {
            border: 1px solid #d5d5d5;
            width: 130px;
            height: 21px;
        }
        .qna_read_password_input input:focus {
            outline: none;
        }
        .qna_read_password_input > p > span:last-child {
            margin-left: 10px;
            color: #8b7575;
        }
        .qna_read_menu button {
            background-color: white;
            border: 1px solid #d5d5d5;
            padding: 5px;
        }
        .qna_read_menu > a > button  {
            text-decoration: none;
            color: inherit;
            cursor: pointer;
        }
        .qna_read_menu .modify {
            float: right;
            margin-right: 5px;
            cursor: pointer;
        }
        .qna_read_menu .delete {
            float: right;
            cursor: pointer;
        }
/* qna_read css end */

/* qna_write css */
        .qna_write_wrap {
            width: 1100px;
            padding-bottom: 250px;
            border-bottom: 1px solid #d5d5d5;
        }
        .qna_write_wrap > form > .qna_write_item {
            display: flex;
            border-top: 1px solid #d5d5d5;
            border-bottom: 1px solid #d5d5d5;
            padding: 10px 0;
            margin-bottom: 10px;
        }
        .qna_write_wrap > form > .qna_write_item > #qna_write_img {
            width: 100px;
            height: 130px;
            border: 1px solid #d5d5d5;
            box-sizing: border-box;
            margin-right: 30px;
            background-size: 100%;
            background-position: center center;
         	background-repeat: no-repeat;
        }
        .qna_write_wrap > form > .qna_write_item > p {
            height: 50px;
            display: flex;
            align-items: center;
        }
        .qna_write_wrap > form > .qna_write_item > #qna_write_info > p > input {
            cursor: pointer;
            background-color: white;
            border: 1px solid #d5d5d5;
            font-size: 12px;
            padding: 5px;
            height: 30px;
        }
        /* .qna_write_content {
            z-index: -5;
        } */
        .qna_write_content .qna_write_upmenu, .qna_write_downmenu {
            display: flex;
        }
        .qna_write_content .qna_write_column {
            border: 1px solid #f2f2f2;
            padding: 10px;
            font-size: 11px;
            width: 150px;
            display: flex;
            align-items: center;
        }
        .qna_write_content .qna_write_input {
            border: 1px solid #f2f2f2;
            padding: 10px;
            font-size: 11px;
            width: 1100px;
            border-left: 0;
        }
        .qna_write_content .qna_write_input > select {
            padding: 3px;
            width: 200px;
        }
        .qna_write_content .qna_write_input > label {
            font-weight: normal;
            align-items: center;
        }
        .qna_write_down_btn {
            padding: 0;
            margin: 20px 0;
            width: 1100px;
        }
        .qna_write_down_btn > span a {
            padding: 9px 10px;
            margin-right: 5px;
            font-size: 11px;
            line-height: 30px;
            border: 1px solid #ccc;
        }
        .qna_write_down_btn > span button {
            padding: 0 20px;
            margin-right: 5px;
            font-size: 11px;
            line-height: 30px;
            border: 1px solid #333;
            background-color: #333;
            color: #ccc;
        }
        .qna_write_down_btn > span:first-child {
            float: left;
        }
        .qna_write_down_btn > span:nth-child(2) {
            float: right;
        }
        .qna_write_down_btn > span:last-child {
            float: right;
        }
        .modal-backdrop {
            z-index: -999999;
        }
        .note-toolbar {
            z-index: initial !important;
        }
/* qna_write css end */

/* review css */
		.review {
			position: relative;
		}
        .review_photo_title > span:first-child {
            font-size: 13px;
        }
        .review_photo_title > span:last-child {
            font-size: 12px;
            color: #b0b0b0;
        }
         .review_photo_review { 
         	overflow: hidden;
         }
        .review_thumbnail_wrap {
            display: flex;
        }
        .review_thumbnail {
            width: 200px;
            border: 1px solid #d5d5d5;
            cursor: pointer;
            margin-right: 20px;
            margin-bottom: 20px;
        }
        .specialmargin {
        	margin-right: 390px;
        }
        .review_thumbnail > .review_img {
            background-image: url(이미지1.png);
            width: 200px;
            height: 200px;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 100%;
        }
        .review_thumbnail > .review_info {
            padding: 10px;
            display: flex;
            border-bottom: 1px solid #d5d5d5;
        }
        .review_thumbnail > .review_info > .review_content_img {
            background-image: url(이미지2.gif);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 100%;
        }
        .review_thumbnail > .review_info > .review_product_info {
            font-size: 11px;
        }
        .review_thumbnail > .review_info > .review_product_info > p {
            width: 120px;
            margin: 0;
            margin-left: 10px;
            margin-top: 5px;
        }
        .review_thumbnail > .review_info > .review_product_info > p:first-child {
            font-weight: bold;
            display: flex;
            justify-content: space-between;
        }
        .review_thumbnail > .review_info > .review_product_info > p:first-child > span:last-child {
            color: #d5d5d5;
            font-weight: normal;
        }
        .review_thumbnail > .review_detail_info {
            padding: 10px;
        }
        .review_thumbnail > .review_detail_info > p {
            margin: 0;
            font-size: 11px;
        }
        .review_thumbnail > .review_detail_info > p > span {
            font-size: 11px;
        }
        .review_thumbnail > .review_detail_info > p:first-child {
            color: #3868d6;
        }
        .review_thumbnail > .review_detail_info > p:nth-child(2) {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .review_thumbnail > .review_detail_info > p:last-child {
            color: #b0b0b0;
        }
        .next_photo_review {
        	position: absolute;
        	width: 100px;
        	height: 200px;
         	background-position: center center;
         	background-size: 100%;
         	background-repeat: no-repeat;
        	cursor: pointer;
        	right: -100px;
        	top: 150px;
        }
        .prev_photo_review {
        	position: absolute;
        	width: 100px;
        	height: 200px;
         	background-position: center center;
         	background-size: 100%;
         	background-repeat: no-repeat;
        	cursor: pointer;
        	left: -100px;
        	top: 150px;
        }
        .review_notice {
            width: 1100px;
            border: 1px solid #d5d5d5;
            padding: 10px;
            margin: 30px 0; 
        }
        .review_notice > .review_notice_title {
            font-size: 13px;
            cursor: pointer;
        }
        .review_notice > .review_notice_title > span:first-child {
            margin-right: 30px;
        }
        .review_notice > .review_notice_title > span:last-child {
            float: right;
        }
        .review_notice > .review_notice_content {
            font-size: 12px;
            overflow: hidden;
            transition-duration: 0.5s;
        }
        .review_bar {
            width: 1100px;
            padding: 10px;
            display: flex;
            justify-content: space-between;
        }
        .review_bar .review_policy_title {
            font-size: 13px;
            font-weight: bold;
            padding-right: 20px;
            cursor: pointer;
        }
        .review_bar .review_policy_content {
        	width: 450px;
        	border: 1px solid black;
        	border-radius: 10px;
        	font-size: 12px;
        	padding: 10px;
        	position: absolute;
        	background-color: white;
        	margin-top: 10px;
        	left: 600px;
        }
        .review_bar .review_policy_content > .review_policy_content_title {
        	font-weight: bold;
        }
        .review_bar > .review_left > span:nth-child(2) {
            font-size: 12px;
            padding-right: 15px;
            border-right: 1px solid #d5d5d5;
        }
        .review_bar > .review_left > span:nth-child(3) {
            padding-right: 70px;
        }
        .review_bar select {
            width: 100px;
            padding: 1px; 
        }
        .review_bar > .review_right {
        	display: flex;
        }
        .review_bar > .review_right > .review_search_input {
            border-left: 1px solid #d5d5d5;
            padding-left: 15px;
        }
        .review_bar > .review_right > .review_search_input > input {
            width: 190px;
            height: 20px;
            padding: 0 5px;
            border: 1px solid #d5d5d5;
        }
        .review_bar button {
            all: unset;
            font-size: 12px;
            cursor: pointer;
            border: 1px solid #3868d6;
            padding: 3px 10px;
            color: #3868d6;
        }
        .review_list {
            border: 1px solid #d5d5d5;
            width: 1120px;
        }
        .review_list > .review_one_content {
            display: flex;
            padding: 10px;
        }
        .review_list > .review_one_content > .review_image {
            background-image: url(이미지2.gif);
            width: 100px;
            height: 100px;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 100%;
            cursor: pointer;
            margin-right: 20px;
        }
        .review_list > .review_one_content p {
            font-size: 13px;
        }
        .review_star_point {
            color: #3868d6;
            padding-right: 10px;
        }
        .review_info > p:first-child {
            margin-bottom: 5px;
        }
        .review_info > p:first-child > span:last-child {
            color: black;
        }
        .review_info > p:nth-child(2) {
            margin-bottom: 15px;
        }
        .review_info > p:nth-child(2) > span:first-child {
            color: #b0b0b0;
            padding-right: 25px;
        }
        .review_info > p:nth-child(3) {
            color: #6f6f6f;
            margin-bottom: 20px;
        }
        .review_info > .review_real_image {
            background-image: url(이미지1.png);
            width: 100px;
            height: 100px;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 100%;
            margin-bottom: 20px;
        }
        .review_thumbup_reply {
            display: flex;
            margin: 10px 0;
            font-size: 12px;
            color: #6f6f6f;
        }
        .review_thumbup_reply > div {
            margin: 0 5px;
            width: 20px;
            height: 20px;
            cursor: pointer;
        }
        .review_thumbup_reply > .review_thumbup_img {
            background-image: url('https://i.pinimg.com/originals/52/55/d0/5255d09ed4f8622b912661775f26bd58.png');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 100%;
        }
        .review_thumbup_reply > .review_reply_img {
            background-image: url('https://mpng.subpng.com/20180427/syw/kisspng-computer-icons-facebook-like-button-like-share-comment-5ae2b6d99d3965.697623621524807385644.jpg');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 100%;
        }
        .review_thumbup_reply .thumbup_cnt {
        	all: unset;
        	width: 10px;
        }
        .review_modal {
        	display: flex;
        	justify-content: center;
        	width: 60%;
        	height: 600px;
        	margin: 20px auto;
        	position: fixed;
        	top: 150px;
        	left: 20%;
        	background-color: white;
        	z-index: 5;
        }
        .review_modal p {
        	margin: 0;
        	font-size: 13px;
        }
        .review_modal > .review_modal_image {
        	width: 55%;
        	background-color: black;
        	background-position: center center;
        	background-repeat: no-repeat;
        	background-size: 100%;
        }
        .review_modal > .review_modal_info {
        	width: 45%;
        	padding: 10px;
        }
        .review_modal > .review_modal_info > #review_modal_close {
        	all: unset;
        	cursor: pointer;
        	float: right;
        }
        .review_modal > .review_modal_info > .review_modal_product {
        	display: flex;
        	cursor: pointer;
        	border-bottom: 1px solid #d5d5d5;
        	padding: 10px;
        	margin-bottom: 10px;
        }
        .review_modal_product_img {
        	width: 40px;
        	height: 40px;
        	background-color: black;
        	border-radius: 50%;
        	background-position: center center;
        	background-size: 100%;
        	background-repeat: no-repeat;
        }
        .review_modal_product > .review_modal_product_info > p {
        	margin-bottom: 10px;
        	margin-left: 10px;
        	font-size: 14px;
        }
        .review_modal_product > .review_modal_product_info > p:first-child {
        	font-weight: bold;	
        }
        .review_modal_product > .review_modal_product_info > p > span:first-child {
        	margin-right: 20px;
        }
        .review_modal_detail_info > p:first-child {
        	color: #3868d6;
        	font-size: 14px;
        	margin-bottom: 10px;
        }
        .review_modal_detail_info > p:nth-child(2) {
        	margin-bottom: 10px;
        }
        .review_modal_detail_info > p > .name {
        	font-weight: bold;
        	font-size: 14px;
        	margin-right: 20px;
        }
        .review_modal_detail_content {
        	display: flex;
        	flex-flow: column;
        }
        .review_modal_detail_content > span:first-child {
        	color: #666666;
        	margin-bottom: 10px;
        }
        .review_modal_detail_content > span:nth-child(2) {
        	color: #666666;
        	margin-bottom: 10px;
        }
        .review_modal_detail_content > span:last-child {
        	margin-bottom: 50px;
        }
        .review_modal_reply {
        	background-color: antiquewhite;
        	padding: 15px;
        	margin: 10px 0;
        }
        .review_other_one {
        	width: 60px;
        	height: 60px;
        	text-align: center;
        	display: flex;
        	align-items: center;
        	background-color: black;
        	color: white;
        	padding: 5px;
        }
        .review_overlay {
        	position: fixed;
        	top: 0;
        	left: 0;
        	z-index: 3;
        	background-color: rgba(0, 0, 0, 0.5);
        	width: 100%;
        	height: 100vh;
        }
/* review css end */

/* review_write css */
        .review_write_wrap {
            width: 1100px;
            padding-bottom: 250px;
            border-bottom: 1px solid #d5d5d5;
        }
        .review_write_wrap > form > .review_write_item {
            display: flex;
            border-top: 1px solid #d5d5d5;
            border-bottom: 1px solid #d5d5d5;
            padding: 10px 0;
            margin-bottom: 10px;
        }
        .review_write_wrap > form > .review_write_item > #review_write_img {
            width: 100px;
            height: 130px;
            border: 1px solid #d5d5d5;
            box-sizing: border-box;
            margin-right: 30px;
            background-size: 100%;
            background-position: center center;
         	background-repeat: no-repeat;
        }
        .review_write_wrap > form > .review_write_item > p {
            height: 50px;
            display: flex;
            align-items: center;
        }
        .review_write_wrap > form > .review_write_item > #review_write_info > p > input {
            cursor: pointer;
            background-color: white;
            border: 1px solid #d5d5d5;
            font-size: 12px;
            padding: 5px;
            height: 30px;
        }
        .review_write_content .review_write_upmenu, .review_write_downmenu {
            display: flex;
        }
        .review_write_content .review_write_column {
            border: 1px solid #f2f2f2;
            padding: 10px;
            font-size: 11px;
            width: 150px;
            display: flex;
            align-items: center;
        }
        .review_write_content .review_write_input {
            border: 1px solid #f2f2f2;
            padding: 10px;
            font-size: 11px;
            width: 1100px;
            border-left: 0;
        }
        .review_write_content .review_write_input > .review_write_star {
            cursor: pointer;
            color: #3868d6;
            font-weight: bold;
        }
        #summernote {
            font-size: 11px;
        }
        .review_write_down_btn {
            padding: 0;
            margin: 20px 0;
            width: 1100px;
        }
        .review_write_down_btn > span a {
            padding: 9px 10px;
            margin-right: 5px;
            font-size: 11px;
            line-height: 30px;
            border: 1px solid #ccc;
        }
        .review_write_down_btn > span button {
            padding: 0 20px;
            margin-right: 5px;
            font-size: 11px;
            line-height: 30px;
            border: 1px solid #333;
            background-color: #333;
            color: #ccc;
        }
        .review_write_down_btn > span:first-child {
            float: left;
        }
        .review_write_down_btn > span:nth-child(2) {
            float: right;
        }
        .review_write_down_btn > span:last-child {
            float: right;
        }
        .modal-backdrop {
            z-index: -999999;
        }
        .note-toolbar {
            z-index: initial !important;
        }
        .review_write_input > .star {
        	cursor: pointer;
        }
/* review_write css end */
/* 	board css end*/

/* address_register*/
	  .register_box {
	    border: 1px solid black;
	    border-style: hidden;
	    width: 1000px;
	    height: 280px;
	    margin-bottom: 0;
		}
	
	.register_wrap , .register_wrap_a , .register_wrap_c {
	    width: 1000px;
	    height: 50px;
	    display: flex;
	    margin-top: 1px;
	    font-weight: lighter;
	    font-size: 13px;
	
	    
	}
	.register_wrap_b {
	    width: 998px;
	    height: 150px;
	    display: flex;
	    margin-top: 1px;
	    font-weight: lighter;
	    font-size: 13px;
	    border-left: 1px solid #dadada;
	    border-right: 1px solid #dadada;
	   
	}
	.register_delivery, .register_name, .register_address, .register_phone {
	    border: 1px solid #dadada;
	    height: 50px; 
	    line-height: 50px; 
	    width: 160px;
	    text-align: left;
	    padding-left: 15px; 
	}
	.register_address {
	   border: none;
	}
	.register_address_input {
	    border-bottom: none;
	    border-left: 1px solid #dadada;
	    width: 855px;
	}
	.register_address_input > p > input {
		margin-left: 15px;
	}
	
	.register_delivery_input, .register_name_input, .register_phone_input{
	    border: 1px solid #dadada;
	    height: 50px; 
	    width: 840px;
	    border-left: hidden;
	    padding-left: 15px;
	   
	}
	.register_delivery_input > input {
	    border: 1px solid #dadada;
	    margin-top: 13px;
	    height: 20px;
	    width: 200px;
	}
	.register_name_input > input {
	    border: 1px solid #dadada;
	    margin-top: 13px;
	    height: 20px;
	    width: 200px;
	}
	.register_phone_input > p > input {
	    border: 1px solid #dadada;
	    height: 20px;
	    width: 50px;
	}
	.register_phone_input > p > select {
	    border: 1px solid #dadada;
	    height: 25px;
	    width: 60px;
	}
	.register_button {
	    margin-left: 81%; 
	}
	.register {
	    margin-bottom: 0;
	    margin-top: 0;
	    font-weight: lighter;
	    font-size: 12px;   
	}
	.register_hr {
		
	}
	#register_btn1 {
	    width: 90px;
	    height: 25px;
	    background-color: rgb(107, 128, 148);
	    border-radius: 3px;
	    border-style: solid;
	    font-size: 12px;   
	}
	#register_btn2 {
	    width: 90px;
	    height: 25px;
	    border-radius: 3px;
	    border-style: solid;
	    font-size: 12px;    
	}
/* address */

	  .address_box {
            border: 1px solid #dadada;
            height: 150px;
            width: 1100px;
            display: flex;
        }
      
        .address_fix, .address_delivery, .address_name, .address_phone, .address_address, .address_modify {
            height: 28px;
            width: 150px;
            text-align: center;
            border-bottom: 1px solid #dadada;
            padding-top: 10px;
            font-weight: lighter;
            font-size: 13px;
            
        }
        .address_address {
            width: 600px;
            text-align: center;
        }
        #address_button {
          	float:right;
            margin-top: 10px;
        }
        #address_h5 {
            margin-bottom: 0;
            margin-top: 0;
            font-weight: lighter; 
        }
        #address_hr {
            width: 1100px;
        }
/* coupon */
	 
        .coupon_table {
            width: 1100px;
            border: 0;
            border-spacing: 0;
            border-collapse: collapse;
            margin-top: 30px;
            border: 1px solid #aaa;
            height: 150px;
            margin-left: 0;

        }
        .coupon_title > p {
            font-size: 10px;
            color: #aaa;
           	float: right;
        }
        .coupon_title > h5 {
        	margin-bottom: 0;
        }
        
       
        #coupon_head {
            border-bottom: 1px solid rgb(207, 205, 205);
            height: 33px;
            font-size: 10px;
            color: #aaa;
            background-color: #f8f6f6;
        }

        .coupon_register {
            margin-top: 50px;
            text-align: center;
            font-size: 12px;
            font-weight: bold;
           	height: 20px;
         	margin-right: 15px;
            border: none;
          

        }

        .coupon_box {
            background-color: #fcf9f9;
            width: 1100px;
            height: 100px;
            text-align: center;
            border: 1px solid #dadada;
            margin-top: 10px;
            font-weight: lighter;
            margin-left: 0;
        }

        .coupon_box > p > input {
            width: 300px;
            height: 22px;
            border: 1px solid #dadada;
            margin-top: 10px;


        }

        .coupon_box > p {
            font-size: 10px;
            color: #757575;
        }

        .coupon_guide {
            width: 1100px;
            height: 300px;
            font-size: 10px;
            color: #757575;
            margin-top: 65px;
            margin-right: 0px;

        }

        .coupon_guide > p {
            margin: auto;
            margin-top: 1px;
        }

        .coupon_hr { 
             background-color: #757575;
             width: 1100px;
        }

        #coupon_a {
            text-align: center;
            font-size: 10px;
            color: #757575;
        }

        .coupon_page {
            margin-left: 500px;
            margin-top: 15px;
            font-size: 13px;
        }
        
/* modify */
	
		.basic_post {
			width: 250px;
		}
		.detail_post {
			width: 250px;
		}
		.find_post_btn:hover {
			cursor: pointer;
		}
        .basic > p {
            font-size: 13px;
            font-weight: bold;
        }
        .modify_table {
            width: 1100px;
            border: 0;
            border-spacing: 0;
            border-collapse: collapse;
            margin-top: 30px;
            border-top: 1px solid #b6afaf;
            border-bottom: 1px solid #b6afaf;
            height: 460px;
            border-left: none;
            border-right: none;
            font-size: 12px;
            text-align: left;
            font-weight: lighter;
            margin-top: 0;    
        }
        
        
         .modify_tr { 
             border-bottom: 1px solid rgb(226, 225, 225);
         }
         .modify_tr_birth {
         	border-bottom: 1px solid rgb(226, 225, 225);
         	height: 43px;
         	line-height: 43px;
         }
         .modify_tr_refund {
        	border-bottom: 1px solid rgb(226, 225, 225);
         	height: 43px;
         	line-height: 43px;
         }
        .modify_th {
            border-right: 1px solid rgb(226, 225, 225);
            border-bottom: 1px solid rgb(226, 225, 225);
            padding-left: 13px;
            width: 150px;
            font-size: 11px;
            font-weight: lighter;
            background-color: #f7f6f6;
           
        }
        .modify_th_refund {
        	border-right: 1px solid rgb(226, 225, 225);
            padding-left: 13px;
            width: 150px;
            font-size: 11px;
            font-weight: lighter;
            background-color: #f7f6f6;
        }
        .modify_td {
            padding-left: 13px;
           	float: left;
        }
        .modify_td_address {
    		padding-left: 10px;
        }
        .modify_text, .modify_password  {
            line-height: 15px;
            padding: 2px 4px;
            border: 1px solid #d5d5d5;
            color: #353535;
            font-size: 12px;
            margin-top: 8px;  
        }
        .modify_th_address {
            border-right: 1px solid rgb(226, 225, 225);
            padding-left: 13px;
            width: 150px;
            font-size: 11px;
            font-weight: lighter;
            background-color: #f7f6f6;
       		height: 70px;
        }
        .modify_th_phone {
            border-right: 1px solid rgb(226, 225, 225);
            padding-left: 13px;
            width: 150px;
            font-size: 11px;
            font-weight: lighter;
            background-color: #f7f6f6;
       		height: 20px;
        	
        }
        .modify_th_confirm {
            border-right: 1px solid rgb(226, 225, 225);
            padding-left: 13px;
            width: 150px;
            font-size: 11px;
            font-weight: lighter;
            background-color: #f7f6f6;
       		height: 30px;
        
        }
        
      	.modify_radio {
            margin-top: 12px;
            margin-bottom: 0;
        }
        .add {
            width: 1100px;
            border: 0;
            border-spacing: 0;
            border-collapse: collapse;
            margin-top: 30px;
            border-top: 1px solid #b6afaf;
            border-bottom: 1px solid #b6afaf !important;
            height: 100px;
            border-left: none;
            border-right: none;
            font-size: 12px;
            text-align: left;
            font-weight: lighter;
            margin-top: 0;
        }
        #add_button {
            margin-left: 560px; 
            margin-top: 15px;
           
        }


/* my board */

        .myboard_table {
            width: 1100px;
            border: 0;
            border-spacing: 0;
            border-collapse: collapse;
            margin-top: 30px;
            border: 1px solid rgb(226, 225, 225);
            height: 70px;
            border-left: none;
            border-right: none;

        }
     

        #myboard_head {
            border-bottom: 1px solid rgb(226, 225, 225);
            height: 33px;
            font-size: 10px;
            color: #aaa;
            background-color: #ffffff;
            height: 25px;
           
        }

        #myboard_a {
            text-align: center;
            font-size: 10px;
            color: #757575;
        }
        #myboard_search {
            margin-left: 400px;
        }
        #myboard_select {
           width: 60px;
           height: 20px;
           border: 1px solid #c2c1c1;
        }
        .myboard_input {
            width: 180px;
            height: 15px;
            border: 1px solid #c2c1c1;
        }
/* mypage_order */
		.mypage_order_table p{
			margin: 0;
		}
		.mypage_order_table th{
			padding: 11px;
			font-weight: lighter;
		}
		
		
		.mypage_order_click {
            display: flex;
        }
        .mypage_order_click_1 {
            width: 230px;
            height: 28px;
            text-align: center;
            padding-top: 10px;
            font-size: 12px;
            color: white;
            background-color: #8b8585;
            cursor: pointer;
            border-bottom: none;
            border-top: 1px solid black; 
			border-right: 1px solid black; 
			border-left: 1px solid black;
        }
        .mypage_order_click_2 {
            border: 1px solid #dadada;
            width: 230px;
            height: 27px;
            text-align: center;
            padding-top: 10px;
            font-size: 12px;
            cursor: pointer;
            border-bottom: none;
         	border-bottom: 1px solid black;
         	border-right: none;
        }
        .mypage_order_click_3 {
            border: 1px solid #dadada;
            width: 230px;
            height: 27px;
            text-align: center;
            padding-top: 10px;
            font-size: 12px;
            cursor: pointer;
            border-bottom: none;
            border-bottom: 1px solid black;
        }
        .mypage_order_hr { 
             width: 1100px; 
             margin-top: 0; 
             margin-left: 1px;
         } 
        .mypage_order_box {
            border: 1px solid #dadada;
            width: 1100px;
            height: 70px;
            margin-top: 13px;
            display: flex;
            vertical-align:middle;
        }
        .mypage_order_btn{
			color: white;
			background-color: #495164;
			border: none;
			height: 24px; 
		}
        .mypage_order_select {
            border: 1px solid #dadada;
            height: 40px;
            width: 145px;
            margin-left: 30px;
            margin-top: 23px;
            border: hidden;
            margin-right: 5px;
        }
        .mypage_order_select_input_date {
	        width: 130px;
	        margin-top: 7px;
        }
        .mypage_order_period {
            width: 200px;
            height: 22px;
            margin-top: 22px;
            border: 1px solid #dadada;
            background-color: #f7f7f7;
            font-size: 13px;
            padding-top: 3px;
            border-radius: 5px;
        }
        .mypage_order_period a {
            padding-right: 2px;
            border-right: 1px solid #dadada;
        }
        .mypage_order_guide {
            width: 970px;
            height: 30px;
            margin-bottom: 80px;
            font-size: 12px;
            color: #757575;
            margin-top: 15px;
        }
        .mypage_order_guide > p {
            margin: auto;
            margin-top: 2px;
        }

       .mypage_order_table {
             width: 1100px; 
             height: 200px; 
             border: 0;
             border-spacing: 0; 
             border-collapse: collapse; 
             margin-top: 0; 
             border: 1px solid rgb(226, 225, 225); 
         } 
        #mypage_order_head {
            border-bottom: 1px solid rgb(226, 225, 225);
            height: 35px;
            font-size: 12px;
            color: rgb(131, 123, 123);
            background-color: #ffffff;
        }
        #mypage_order_a {
            text-align: center;
            font-size: 10px;
            color: #757575;
        }
        .mypage_order_page {
            margin-left: 510px;
            margin-top: 30px;
            font-size: 13px;
        }

/* my page */
	  .mypage_godiv:hover {
         cursor: pointer;
      }
      .mypage_member {
         width: 50px;
         height: 50px;
      }
      .mypage_member_div {
         display: flex;
         margin-bottom: 7px;
      }
      .mypage_member_innerdiv {
         line-height: 50px;
         padding-left: 15px;
      }
      .mypage_box {
            border: 1px solid #dadada;
            height: 120px;
            width: 1100px;
        }
   
        .mypage_box > ul {
            list-style: none;
            display: flex;
            height: 100px;
        }

        .mypage_box_a {
            border: 1px solid #dadada;
          border-style: hidden;
          margin-top: 30px;
             height: 50px;
          display: flex;
          justify-content: space-around;
          font-size: 13px;
          margin-bottom: 35px;
        }
      
        .mypage_box > ul > li {
            width: 150px;
            height: 20px;
            font-size: 13px;
            color: #423f3f;
            margin-top: 10px;
        }
    
        .mypage_wrap,
        .mypage_wrap_a,
        .mypage_wrap_b {
            border: 1px solid #dadada;
            border-style: hidden;
            height: 120px;
            width: 1120px;
            display: flex;
            margin-top: 15px;
            font-size: 12px;
            font-weight: lighter;
        
        }
        .mypage_h5 {
           font-size: 14px;
           font-weight: bold;
           margin-bottom: 8px;
           
        }

        .mypage_order,
        .mypage_modify,
        .mypage_point,
        .mypage_coupon,
        .mypage_myboard,
        .mypage_address {
            border: 1px solid #dadada;
            height: 120px;
            width: 600px;
            margin-right: 15px;
            padding-left: 20px;
        }
/* point */

        .point_box_left {
            width: 550px;
            border: 1px solid #dadada;
            height: 100px;
        }

        .point_strong {
            font-size: 13px;
            color: #8b8585;
            font-weight: bold;
        }

        .point_box_right {
            width: 550px;
            border: 1px solid #dadada;
            height: 100px;
            border-left: none;

        }
        .point_box_wrap {
            display: flex;
        }
        .point_click {
            display: flex;
            margin-top: 50px;
        }
        .point_click_1 {
            border: 1px solid #dadada;
            width: 230px;
            height: 28px;
            text-align: center;
            padding-top: 10px;
            font-size: 12px;
            color: white;
            background-color: #8b8585;
            cursor: pointer;
            border-bottom: none;
           
        }
        .point_click_2 {
            border: 1px solid #dadada;
            width: 230px;
            height: 27px;
            text-align: center;
            padding-top: 10px;
            font-size: 12px;
            cursor: pointer;
            border-bottom: none;
         
        }
        .point_click_3 {
            border: 1px solid #dadada;
            width: 230px;
            height: 27px;
            text-align: center;
            padding-top: 10px;
            font-size: 12px;
            cursor: pointer;
            border-bottom: none;
        }
         .point_table { 
             width: 1100px; 
             border: 0; 
             border-spacing: 0;
             border-collapse: collapse; 
             margin-top: 0; 
             border: 1px solid rgb(226, 225, 225); 
             height: 100px; 
             border-left: none; 
             border-right: none; 
      
         } 
        #point_head {
            border-bottom: 1px solid rgb(226, 225, 225);
            height: 35px;
            font-size: 10px;
            color: rgb(131, 123, 123);
            background-color: #ffffff;
        }
        #point_a {
            text-align: center;
            font-size: 10px;
            color: #757575;
        }
        .point_guide {
            width: 1100px;
            height: 300px;
            font-size: 10px;
            color: #757575;
            margin-top: 70px;

        }

        .point_guide>p {
            margin: auto;
            margin-top: 1px;
        }
        .point_page {
            margin-top: 30px;
            font-size: 13px;
            margin-left: 530px;
        }
/*         mypage css end */
/* member css */
/* login css */
	.main_Login{
		padding: 200px 0px 0px 0px;
	}
    .sub_login{
	    display: flex;
	    flex-direction: column;
        align-items: center;
    }
    .sub_login input{
        width: 300px;
	    height: 30px;
    }
    .my_pw, .my_btn{
        margin-top: 7px;
    }
    .my_btn button{
        width: 308px;
	    height: 35px;
        font-size: 10px;
        background-color: black;
        color: white;
        border: none;
        cursor: pointer;
    }
    .jf{
        text-align: center;
    }
    .jf hr{
        width: 300px;
    }
    .jf a { 
        text-decoration: none;
        color: black;
    }
    .find_menu ul{
        margin: 0px 0px;
        padding: 0px;
    }
    .find_menu ul li{
        display: inline;
        font-size: 5px;
        padding: 4px;
        cursor: pointer;
    }
    .NonMember_order{
        text-align: center;
    }
    .NonMember_order button{
        background-color: white;
        border: 1px solid black;
        width: 308px;
	   	height: 35px;
        font-size: 15px;
        cursor: pointer;
        margin: 13px;
    }
    .NonMember_order ul{
        margin: 0px 0px;
        padding: 0px;
    }
    .NonMember_order input{
        width: 100px;
    }
/* login css end*/
/* join css */
	.star {
    	color: red;
    	font-size: 13px;
	}
	.join_total hr {
        width: 100%;
        border: 1.6px solid #d7d5d5;
        background-color: #d7d5d5;
	}
	.join_total{
		width: 1200px;
		margin: auto;
		margin-top: 104px;
	}
	.join_total h3{
		padding: 15px 0;
	}
    .join_total hr{
        width: 100%;
    }
    .join_total table{
        border: 1px solid;
        width: 100%;
        text-align: left;
        border-collapse: collapse;
        font-size: 10px;
        border-right: 0;
        border-left: 0;
        margin: auto;
        border-top: 3px solid #d7d5d5;
    }
    .join_total th{
        border-bottom: 1px solid;
        padding: 8px;
        border-bottom: 1px solid #dfdfdf;
		font: 11px Martel, "맑은고딕";
    }
    .first p{
    	margin: 0;
	}
	.first p input{ 
    	vertical-align:middle;
	}
	.join_total .first input[type=checkbox]{
   	   width: 22px; 
	   height: 22px;
	}
	.second p, .third p, .fourth p{
    	margin: 0 0 10px;
    }
    .join_total th:first-child {
        border-right: 1px solid #dfdfdf;
        background-color: #FBFAFA;
    }
    .first, .second, .third, .fourth{
        border: 1px solid #b6bfc7;
        font-size: 12px;
        margin: 0px 15px ;
        background-color: #FBFAFA;
    }
    .first{
        background-color: #f5f6f7;
        width: 97%;
        padding: 20px;
        display: inline-block;
        font-size: 15px;
        font-weight: bold;
        margin-left: 0;
        margin-right: 0;
    }
    .second, .third, .fourth{
        background-color: #f5f6f7;
        width: 97%;
        padding: 20px;
        margin-left: 0;
        margin-right: 0;
    }
    .join_total textarea{
        height: 152px;
        width: 96%;
        padding: 20px;
        resize: none;
    }
    .join_btn{
        margin: 20px;
        font-size: 11px;
        text-align: center;
    }
    .join_btn1, .join_btn2{
        width: 150px;
        height: 35px;
        font-size: 10px;
        cursor: pointer;

    }
    .join_btn1{
        background-color: white;
        border: 1px solid black;
    }
    .join_btn2{
        background-color: black;
        border: none;
        color: white;
    }
    .join_textarea {
      font-size: 12px;
      color: gray;
   }
/* join css end*/
/* findid css */
	.findidtotal h4{
		padding: 15px;
		text-align: center;
	}
	.findidtotal{
		padding: 100px 0px 0px 0px;
		margin: auto;
		margin-top: 104px;
	}
	.findid{
    	padding: 30px;
        font-size: 11px;
        margin: auto;
    }
    .findid select{
        width: 170px;
        height: 22px;
    }
    .findid fieldset{
        border: none;
        width: 340px;
        margin: auto;
    }
    .findid input[type="text"]{
        width: 180px;
    }
    .findid select{
        width: 188px;
    }
    .findid strong{
        display: inline-block;
        width: 120px;
        padding: 0px 0px 0px 10px;
    }
    .radioselect{
        margin: 7px 0px 30px 135px;
    }
    .findid button{
        height: 32px;
        width: 330px;
        background-color: white;
        border: 1px solid;
        cursor: pointer;
    }
/* findid css end*/
/* findpw css */
	.findpwtotal h4{
		padding: 15px;
		text-align: center;
	}
	.findpwtotal{
		padding: 100px 0px 0px 0px;
		margin: auto;
		margin-top: 104px;
	}
	.findpw{
    	padding: 30px;
        font-size: 11px;
        margin: auto;
    }
    .findpw select{
        width: 170px;
        height: 22px;
    }
    .findpw fieldset{
        border: none;
        width: 340px;
        margin: auto;
    }
    .findpw input[type="text"]{
        width: 180px;
    }
    .findpw select{
        width: 188px;
    }
    .findpw strong{
        display: inline-block;
        width: 120px;
        padding: 0px 0px 0px 10px;
    }
    .radioselect{
        margin: 7px 0px 30px 135px;
    }
    .findpw button{
        height: 32px;
        width: 330px;
        background-color: white;
        border: 1px solid;
        cursor: pointer;
    }
/* findpw css end*/
/* member css end*/
/* cart css */
		.cart_table {
			border: 1px solid #d5d5d5;
			width: 1100px;
			height: 70px;
		}
		.cart_table > tbody > tr > td {
			background-color: whitesmoke;
		}
		.cart_table > tbody > tr > td > span {
			margin-right: 80px;
	    	font-size: 10pt;
	    	padding-left: 10px;
		}
		.cart_table > tbody > tr > td > span > a > span {
			color: red;
    		font-size: 12pt;
		}
        .cart_product_wrap {
            width: 1100px;
            margin-top: 30px;
        }
        .cart_product_wrap > .cart_product_cnt_bar {
            padding: 10px 5px;
            font-size: 13px;
            font-weight: bold;
            border: 1px solid #d5d5d5;
        }
        .cart_product_wrap > .cart_list {
            width: 1100px;
            font-size: 12px;
            border-left: 1px solid #d5d5d5;
            border-right: 1px solid #d5d5d5;
            border-collapse: collapse;
        }
        .cart_product_wrap > .cart_list tr, 
        .cart_product_wrap > .cart_list th, 
        .cart_product_wrap > .cart_list td {
            border: 1px solid #d5d5d5;
        }
        .cart_product_wrap > .cart_product_price_bar {
            padding: 10px 5px;
            font-size: 13px;
            font-weight: bold;
            border: 1px solid #d5d5d5;
            display: flex;
            justify-content: space-between;
        }
        .cart_checkbox {
            text-align: center;
        }
        .cart_product_img {
            height: 100px;
            margin: 0;
            background-image: url(이미지1.png);
            background-size: 100%;
            background-position: center center;
            background-repeat: no-repeat;
        }
        .cart_list th {
            font-weight: normal;
            padding: 5px 1px;
            border-bottom: 1px solid #d5d5d5;
        }
        .cart_list p {
            margin-left: 10px; 
        }
        .cart_list .cart_product_info > p:first-child {
            font-weight: bold;
        }
        .cart_list button {
            all: unset;
            border: 1px solid #d5d5d5;
            padding: 3px 10px;
            cursor: pointer;
        }
        .cart_option_modify {
        	width: 450px;
        	height: 250px;
        	border: 1px solid black;
        	position: absolute;
        	background-color: white;
        }
        .cart_option_modify > .option_modify_title {
       		display: flex;
       		justify-content: space-between;
       		background-color: #333333;
       		color: white;
       		font-size: 13px;
       		font-weight: bold;
       		padding: 5px 15px;
        }
        .cart_option_modify > .option_modify_title > .option_modify_close {
        	cursor: pointer;
        }
        .cart_option_modify > .item_name_option {
        	margin: 18px 15px;
        	border-bottom: 1px dotted #959595;
        	margin-bottom: 12px;
        }
        .cart_option_modify p {
        	margin: 0;
        }
        .cart_option_modify > .item_name_option > p:first-child {
        	font-weight: bold;
        }
        .cart_option_modify > .item_name_option > p:last-child {
        	margin-bottom: 15px;
        	color: #959595;
        }
        .cart_option_modify > .item_option_detail {
        	margin: 18px 15px;
        }
        .cart_option_modify > .item_option_detail > p {
       		font-weight: bold;
       		margin-bottom: 5px;
        }
        .cart_option_modify > .item_option_detail > .item_option_color,
        .cart_option_modify > .item_option_detail > .item_option_size {
        	display: flex;
        	width: 100%;
        }
        .cart_option_modify > .item_option_detail select {
        	width: 290px;
        	border: 1px solid #d5d5d5;
        	margin: 5px;
        	padding: 1px;
        	font-size: 12px;
        }
        .cart_option_modify > .item_option_detail .column_color,
        .cart_option_modify > .item_option_detail .column_size {
        	width: 30%;
        	line-height: 30px;
        }
        .cart_option_modify > .option_modify_line {
        	width: 100%;
        	border-bottom: 1px solid #d5d5d5;
        }
        .cart_option_modify > .option_modify_btn {
        	width: 100%;
			display: flex;
			justify-content: center;
        }
        .cart_option_modify > .option_modify_btn > button {
        	padding: 5px 30px;
        	margin: 0 5px;
        	margin-top: 5px;
        }
        .cart_option_modify > .option_modify_btn > button:first-child {
        	background-color: #495164;
        	color: white;
        }
        .cart_product_cnt {
            display: flex;
            height: 26px;
            margin-left: 10px;
        }
        .cart_product_cnt > input[type="text"] {
            all: unset;
            width: 25px;
            border: 1px solid #d5d5d5;
            box-sizing: border-box;
            padding-left: 5px;
        }
        .cart_product_cnt p {
            margin: 0;
            width: 22px;
            height: 13px;
            border: 1px solid #d5d5d5;
            border-left: none;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        .cart_product_cnt p:first-child {
            border-bottom: none;
        }
        .cart_product_cnt p > input[type="button"] {
            all: unset;
            display: block;
        }
        .cart_product_price > input {
            all: unset;
            width: 70px;
            cursor: default;
        }
        .cart_pay_kind {
            font-size: 11px;
            color: white;
            border-radius: 10px;
        }
        .cart_list td > p > .red {
            background-color: salmon;
        }
        .cart_list td > p > .green {
            background-color: limegreen;
        }
        .cart_list td > p > .purple {
            background-color: purple;
        }
        .cart_list td > p > .lightblue {
            background-color: lightblue;
        }
        .cart_list td:last-child {
            width: 10%;
        }
        .cart_list td:last-child > p {
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .cart_list td:last-child button {
            width: 90px;
            height: 24px;
            border: 1px solid #d5d5d5;
            text-align: center;
        }
        .cart_list td:last-child button > a {
            display: block;
        }
        .cart_list td:last-child .ordering {
            color: white;
            background-color: #111111;
        }
        .cart_list td:last-child button:hover {
            color: black;
            background-color: white;
            border: 1px solid black;
        }
        .cart_menu_bar {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
        }
        .cart_menu_bar > .cart_delete_area > p {
            font-weight: bold;
        }
        .cart_menu_bar > .cart_delete_area > p > .cart_delete {
            width: 75px;
            background-color: #111111;
            color: white !important;
            padding: 2px 10px;
            margin-left: 5px;
            border: 1px solid black;
        }
        .cart_menu_bar > .cart_util > p > a {
            width: 95px;
            padding: 2px 10px;
            border: 1px solid #d5d5d5;
        }
        .cart_menu_bar > .cart_util > p > button {
        	all:unset;
        	border: 1px solid #d5d5d5;
            width: 75px;
            margin-left: 5px;
            padding: 2px 10px;
            cursor: pointer;
        }
        .cart_menu_bar a:hover { 
            border: 1px solid black;
            background-color: white;
            color: black;
        }
        .cart_pay_sum {
        	width: 1100px;
        	height: 250px;
        	margin-top: 40px;
        }
		.cart_pay_table {
			width: 1100px;
			border-collapse: collapse;
			border: 1px solid black;
		}
		.cart_pay_table th {
			height: 40px;
			font-weight: normal;
			font-size: 11px;
			background-color: #fbfafa;
			width: 25%;
		}
		.cart_pay_table th > #show_sale {
			all: unset;
			margin-left: 10px;
			cursor: pointer;
			border: 1px solid #d5d5d5;
			padding: 5px;
			font-size: 12px;
			background-color: white;
		}
		.cart_pay_table td {
			height: 60px;
			font-size: 22px;
			text-align: center;
		}
		.cart_pay_sum .cart_selected_product_order,
		.cart_pay_sum .cart_all_product_order,
		.cart_pay_sum .cart_go_home {
			border: 1px solid #555;
			color: #555;
			padding: 10px 55px;
			margin: 0 5px;
			margin-top: 15px;
			font-size: 12px;
		}
		.cart_pay_sum .cart_all_product_order {
			background-color: black;
			color: white !important;
		}
		.cart_pay_sum > p {
			text-align: center;
		}
		.cart_pay_sum .cart_selected_product_order,
		.cart_pay_sum .cart_all_product_order {
			float: left;
		}
		.cart_pay_sum .cart_go_home {
			float: right;
		}
		.cart_interested_product {
			width: 1100px;
		}
		.cart_interested_product > .cart_interested_product_title {
			text-align: center;
			font-size: 13px;
			font-weight: bold;
		}
		.cart_interested_product_list {
			width: 1100px;
			border-collapse: collapse;
		}
		.cart_interested_product_list th {
			font-size: 12px;
			height: 25px;
			border: 1px solid #d5d5d5;
		}
		.cart_interested_product_list td {
			font-size: 12px;
			padding-left: 10px;
			border: 1px solid #d5d5d5;
		}
		.cart_interested_product_list td button {
			all: unset;
			border: 1px solid #d5d5d5;
			padding: 3px 10px;
			cursor: pointer;
		}
		.cart_interested_product_price > input {
            all: unset;
            width: 70px;
            cursor: default;
        }
		.cart_interested_pay_kind {
            font-size: 11px;
            color: white;
            border-radius: 10px;
        }
        .cart_interested_product_list td > p > .red {
            background-color: salmon;
        }
        .cart_interested_product_list td > p > .green {
            background-color: limegreen;
        }
        .cart_interested_product_list td > p > .purple {
            background-color: purple;
        }
        .cart_interested_product_list td > p > .lightblue {
            background-color: lightblue;
        }
        .cart_interested_product_list td:last-child {
            width: 10%;
        }
        .cart_interested_product_list td:last-child > p {
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .cart_interested_product_list td:last-child button {
            width: 90px;
            height: 24px;
            border: 1px solid #d5d5d5;
            text-align: center;
        }
        .cart_interested_product_list td:last-child button > a {
            display: block;
        }
        .cart_interested_product_list td:last-child .ordering {
            color: white;
            background-color: #111111;
        }
        .cart_interested_product_list td:last-child button:hover {
            color: black;
            background-color: white;
            border: 1px solid black;
        }
        .cart_guide {
        	width: 1100px;
        	height: 350px;
        	font-size: 12px;
        	padding: 10px;
        	color: #9d9d9d;
        }
        .cart_guide p {
        	color: #666666;
        }
/* cart css end */

		.slider-box {
            width: 400px;
            overflow: hidden;   /* 영역을 벗어나는 내용은 숨긴다 */
        }
        .slider-list {
            display: flex;
            width: 2000px;
        }
        .slider-content {
            background-color: antiquewhite;
            width: 200px;
            height: 225px;
            line-height: 225px;
            text-align: center;
            font-size: 40px;
            font-weight: bold;
            user-select: none;
            background-repeat:  no-repeat;
        }
        .item-first {
            background-image: url(https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/16/f53b57b52eb3967777d6cbed069b7c8c.png);
        }
        .item-second {
            background-image: url(https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/16/6b8689b8dbe129ee2c3a4c31816cb646.png);
        }
        .item-third {
            background-image: url(https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/16/a957e902b8aa452f160f2917543771ed.png);
        }
        .item-fourth {
            background-image: url(https://app-storage-edge-005.cafe24.com/bannerplus/theverlin/2021/07/16/04fe25319726ce1e36416f53c664e39b.png);
        }
	
</style>
	<link rel="stylesheet" href="${cpath}/resources/css/style.css">
	<link rel="stylesheet" href="${cpath}/resources/css/tag_style.css">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${cpath}/resources/bootstrap/css/bootstrap.min.css">
</head>
<body>

<header>	<!-- 헤더 -->
		<div class="header_wrap">
		<div class="header_left">	<!-- 로고 -->
			<a href="${cpath }/">THE VERLIN</a>
		</div>
		<div class="header_center">	<!-- 카테고리 -->
			<ul class="header_ul">
				<li class="b"><a class="category" href="${cpath }/product/productIcon/NEW">NEW</a></li>
				<li class="a"><a class="category" href="${cpath }/product/productIcon/MADE">MADE</a></li>
				<li class="c"><a class="category top" href="${cpath }/product/bigCategory/TOP">TOP</a></li>
				<li class="c"><a class="category bottom" href="${cpath }/product/bigCategory/BOTTOM">BOTTOM</a></li>
				<li class="c"><a class="category" href="${cpath }/product/bigCategory/OPS">OPS</a></li>
				<li class="c"><a class="category outer" href="${cpath }/product/bigCategory/OUTER">OUTER</a></li>
				<li class="c"><a class="category shoes" href="${cpath }/product/bigCategory/SHOES">SHOES</a></li>
				<li class="c"><a class="category acc" href="${cpath }/product/bigCategory/ACC">ACC</a></li>
				<li class="c swimCate"><a class="category" href="${cpath }/product/bigCategory/SWIMWEAR">SWIM WEAR</a></li>
				<li class="b"><a class="category" href="${cpath }/product/productIcon/SALE">SALE</a></li>
			</ul>
			<div class="innercategory innerOuter hidden">
				<ul>
					<li><a href="${cpath }/product/bigCategory/coat">coat</a></li>
					<li><a href="${cpath }/product/bigCategory/jacket">jacket</a></li>
					<li><a href="${cpath }/product/bigCategory/jumper">jumper</a></li>
					<li><a href="${cpath }/product/bigCategory/cardigan">cardigan</a></li>
				</ul>
			</div>
			<div class="innercategory innerTop hidden">
				<ul>
					<li><a href="${cpath }/product/bigCategory/halftee">1/2 tee</a></li>
					<li><a href="${cpath }/product/bigCategory/tee">tee</a></li>
					<li><a href="${cpath }/product/bigCategory/shirt_blouse">shirt / blouse</a></li>
					<li><a href="${cpath }/product/bigCategory/knit">knit</a></li>
					<li><a href="${cpath }/product/bigCategory/sleeveless">sleeveless</a></li>
				</ul>
			</div>
			<div class="innercategory innerBottom hidden">
				<ul>
					<li><a href="${cpath }/product/bigCategory/denim">denim</a></li>
					<li><a href="${cpath }/product/bigCategory/pants">pants</a></li>
					<li><a href="${cpath }/product/bigCategory/skirt">skirt</a></li>
				</ul>
			</div>
			<div class="innercategory innerShoes hidden">
				<ul>
					<li><a href="${cpath }/product/bigCategory/mule">mule</a></li>
					<li><a href="${cpath }/product/bigCategory/loafers">loafers</a></li>
					<li><a href="${cpath }/product/bigCategory/boots">boots</a></li>
					<li><a href="${cpath }/product/bigCategory/heels">heels</a></li>
					<li><a href="${cpath }/product/bigCategory/sandal">sandal</a></li>
					<li><a href="${cpath }/product/bigCategory/slipper">slipper</a></li>
				</ul>
			</div>
			<div class="innercategory innerAcc hidden">
				<ul>
					<li><a href="${cpath }/product/bigCategory/earring">earring</a></li>
					<li><a href="${cpath }/product/bigCategory/ring">ring</a></li>
					<li><a href="${cpath }/product/bigCategory/scarf">scarf / muffler</a></li>
					<li><a href="${cpath }/product/bigCategory/belt">belt</a></li>
					<li><a href="${cpath }/product/bigCategory/hair">hair</a></li>
					<li><a href="${cpath }/product/bigCategory/cap">cap</a></li>
					<li><a href="${cpath }/product/bigCategory/necklace">necklace</a></li>
					<li><a href="${cpath }/product/bigCategory/bracelet">bracelet</a></li>
					<li><a href="${cpath }/product/bigCategory/etc">etc</a></li>
				</ul>
			</div>
			<div class="innercategory innerBoard hidden">
				<ul>
					<li><a href="${cpath }/board/notice/1">notice</a></li>
					<li><a href="${cpath }/board/qna/1">q & a</a></li>
					<li><a href="${cpath }/board/review/1">review</a></li>
				</ul>
			</div>
			<!--	소분류 카테고리 사라지게하려고		-->
			<div class="innercategory_overlay downOverlay hidden"></div>
			<div class="innercategory_overlay upperOverlay hidden"></div>
		</div>
		<div class="header_right">	<!-- 기능메뉴(로그인 ~ 검색) -->
			<ul class="header_ul">
				<c:if test="${empty login}">
					<li><a href="${cpath }/member/login">LOGIN</a></li>
					<li><a href="${cpath }/member/join">JOIN</a></li>
				</c:if>
				<c:if test="${not empty login}">
					<li><a href="${cpath }/member/logout">Logout</a></li>
					<li><a href="${cpath }/member/mypage">MYPAGE</a></li>
				</c:if>
				<li><a href="${cpath }/member/cart">CART</a></li>	<!-- CART 뒤에 담긴상품 갯수 출력해야함 (미완)-->
				<li><img class="searchIcon" src="https://www.theverlin.com/web/upload/designfixy/images/search_btn.png"></li>
			</ul>
		</div>
		</div>
		<div class="aside hidden">
    		<div class="quick-menu-button openBtn">ON</div>
            <div id="closeBtn">OFF</div>
            <div class="go_top" onclick="gotop()">▲</div>
            <div class="go_down" onclick="godown()">▼</div>
        	<div class="aside_img">
        		<img src="https://app-storage-edge-008.cafe24.com/bannermanage2/mall66/2021/07/09/21b74d89d000b0a5961f2a416eb518b2.gif">
        	</div>
        	<div class="aside_div">
        		<p class="aside_p">
        		   <a href="${cpath }/member/login">Login</a>
        		   <a href="${cpath }/member/join">Join</a>
        		</p><hr class="aside_hr">
        		<p class="aside_p">
        			<a href="${cpath }/board/notice">Board</a>
        			<a href="${cpath }/mypage">Mypage</a>
        		</p><hr class="aside_hr">
        	</div>
        	<div class="aside_div_two">
        		<p class="aside_p">
        		   <a href="${cpath }/board/notice">공지사항</a>
        		   <a href="${cpath }/board/qna">Q&A</a>
        		</p><hr class="aside_hr">
        		<p class="aside_p">
        		   <a href="">자주하는질문</a>
        		   <a href="">이벤트</a>
        		</p><hr class="aside_hr">
        	</div>
        	<div class="today_view">
        		<p>TodayView</p>
        	</div>
        
        </div>
    	<div class="overlay hidden"></div>
	</header>
	
	<!-- 검색 모달 -->
	<div class="search_modal hidden">
		<div class="close_modal"><a href="">X</a></div>
		<div class="search_div">
			<p><a href="${cpath }/">the verlin</a></p>
			<form method="POST" action="${cpath }/product/search">
				<input class="search_product_input" type="search" name="searchProduct">
			</form>
			<p class="small_font">HOT</p>
		</div>
	</div>
	<!-- 검색 오버레이 -->
	<div class="search_overlay hidden"></div>

	    <!-- 5. 리모컨 -->
<div class="remote_controller">
    <!-- 위로 -->
    <div class="go_top" onclick="gotop()">▲</div>

    <!-- 아래로 -->
    <div class="go_down" onclick="godown()">▼</div>
</div>
    
    <!-- 리모컨 스크립트 -->
<script>
    function gotop() {
        document.documentElement.scrollTop = 0;
    }
    function godown() {
        document.documentElement.scrollTop = document.body.scrollHeight;
    }
</script>
	
	
	<!-- 카테고리 관련 스크립트 -->
	<script>
		const category = document.querySelectorAll('.category')
		const innerCategory = document.querySelectorAll('.innercategory')
		const innerCategoryOverlay = document.querySelectorAll('.innercategory_overlay')
	
	// 	각 li마다 onmouseover
		category.forEach(e => {
			e.onmouseover = function(event) {
				if(event.target.classList.contains('basic_t')) {
					baiscTHandler()
				} else if (event.target.classList.contains('outer')) {
					outerHandler()
				} else if (event.target.classList.contains('top')) {
					topHandler()
				} else if (event.target.classList.contains('bottom')) {
					bottomHandler()
				} else if (event.target.classList.contains('shoes')) {
					shoesHandler()
				} else if (event.target.classList.contains('acc')) {
					accHandler()
				} else if (event.target.classList.contains('board')) {
					boardHandler()
				} else {
					hiddenHandler()
				}
			}
		})
	// 	베이직t 소분류 카테고리 보이게하기
		function baiscTHandler() {
			innerCategory.forEach(e => {
				if(e.classList.contains('innerBasict')) {
					e.classList.remove('hidden')
					innerCategoryOverlay.forEach(element => {
						element.classList.remove('hidden')
					})
				} else {
					e.classList.add('hidden')
				}
			})
		}
	// 	아우터 소분류 카테고리 보이게 하기
		function outerHandler() {
			innerCategory.forEach(e => {
				if(e.classList.contains('innerOuter')) {
					e.classList.remove('hidden')
					innerCategoryOverlay.forEach(e => {
						e.classList.remove('hidden')
					})
				} else {
					e.classList.add('hidden')
				}
			})
		}
	// 	탑 소분류 카테고리 보이게 하기
		function topHandler() {
			innerCategory.forEach(e => {
				if(e.classList.contains('innerTop')) {
					e.classList.remove('hidden')
					innerCategoryOverlay.forEach(e => {
						e.classList.remove('hidden')
					})
				} else {
					e.classList.add('hidden')
				}
			})
		}
	// 	바텀 소분류 카테고리 보이게 하기
		function bottomHandler() {
			innerCategory.forEach(e => {
				if(e.classList.contains('innerBottom')) {
					e.classList.remove('hidden')
					innerCategoryOverlay.forEach(e => {
						e.classList.remove('hidden')
					})
				} else {
					e.classList.add('hidden')
				}
			})
		}
	// 	슈즈 소분류 카테고리 보이게 하기
		function shoesHandler() {
			innerCategory.forEach(e => {
				if(e.classList.contains('innerShoes')) {
					e.classList.remove('hidden')
					innerCategoryOverlay.forEach(e => {
						e.classList.remove('hidden')
					})
				} else {
					e.classList.add('hidden')
				}
			})
		}
	// 	악세 소분류 카테고리 보이게 하기
		function accHandler() {
			innerCategory.forEach(e => {
				if(e.classList.contains('innerAcc')) {
					e.classList.remove('hidden')
					innerCategoryOverlay.forEach(e => {
						e.classList.remove('hidden')
					})
				} else {
					e.classList.add('hidden')
				}
			})
		}
	// 	보드 소분류 카테고리 보이게 하기
		function boardHandler() {
			innerCategory.forEach(e => {
				if(e.classList.contains('innerBoard')) {
					e.classList.remove('hidden')
					innerCategoryOverlay.forEach(e => {
						e.classList.remove('hidden')
					})
				} else {
					e.classList.add('hidden')
				}
			})
		}
	// 	소분류 카테고리 숨기기
		function hiddenHandler() {
			innerCategory.forEach(e => {
				if(!e.classList.contains('hidden')) {
					e.classList.add('hidden')
					innerCategoryOverlay.forEach(element => {
						element.classList.add('hidden')
					})
				}
			})
		}
		innerCategoryOverlay.forEach(e => {
			e.onmouseover = hiddenHandler
		})
	</script>
	
	<!-- 검색 관련 스크립트 -->
	<script>
		const searchIcon = document.querySelector('.searchIcon')
		searchIcon.onmouseover = searchIcon.style.cursor = 'pointer'
		const searchOverlay = document.querySelector('.search_overlay')
		const searchModal = document.querySelector('.search_modal')
		
		searchIcon.onclick = function() {
			searchOverlay.classList.remove('hidden')
			searchModal.classList.remove('hidden')
		} 
	</script>
	
		<!-- 사이트 오른쪽 슬라이드 --> -->
 	<script>
        const openBtn = document.querySelector('.openBtn')
        const closeBtn = document.getElementById('closeBtn')
        const overlay = document.querySelector('.overlay')
        const aside = document.querySelector('.aside')
        
        const openHandler = function() {
            aside.style.right = '0px'
            overlay.classList.remove('hidden')
        }
        
        const closeHandler = () => {
	        aside.style.right = '-300px'
	        overlay.classList.add('hidden')
	    }
        
       
        openBtn.onclick = openHandler
        closeBtn.onclick = closeHandler

    </script>

<!-- 리모컨(위/아래 이동) -->
	<script>
	    function gotop() {
	        document.documentElement.scrollTop = 0;
	    }
	    function godown() {
	        document.documentElement.scrollTop = document.body.scrollHeight;
	    }
</script>

	<script>
	
	console.log(document.body)
	const home_wrap = document.querySelector('.home_wrap')
	document.body.onscroll = function(event) {
		const scrollTop = document.documentElement.scrollTop
		const scrollHeight = document.documentElement.scrollHeight
		const clientHeight = document.documentElement.clientHeight
// 		console.log({
// 			'scrollTop' : scrollTop,
// 			'scrollHeight' : scrollHeight,
// 			'clientHeight' : clientHeight,
// 		})
		if(scrollTop == 0) {
			aside.classList.add('hidden')
		}
		else {
			aside.classList.remove('hidden')
		}
	}
	</script>

