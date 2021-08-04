<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
        body {
            padding: 0;
            margin: 0;
        }
        .popup_detailImg_wrap {
            display: flex;
            flex-flow: column;
            width: 100%;
            height: 550px;
            border-bottom: 1px solid #EEEEEE;
        }
        .popup_detailImg_img {
            width: 280px;
            height: 373px;
            margin: 0 auto;
        }
        .popup_detailImg_img:hover {
            cursor: pointer;
        }
        .popup_detailImg_more_img {
            width: 280px;
            height: 77px;
            display: flex;
            margin: auto;
            margin-top: 0;
        }
        .popup_detailImg_more_img > div {
            padding: 10px 10px 0 0;
            width: 67px;
            height: 77px;
        }
        .popup_detailImg_top {
            background-color: #EEEEEE;
            padding-left: 30px;
            height: 35px;
            line-height: 35px;
            margin-bottom: 20px;
        }
        .popup_detailImg_button {
            text-align: center;
            padding-top: 10px;
        }
        .popup_detailImg_button_close {
            width: 128px;
            height: 24px;
            background-color: white;
            border: 1px solid #EEEEEE;
            font-size: 6pt;
        }
        .popup_detailImg_button_close:hover {
            border: 1px solid black;
            cursor: pointer;
        }
        img {
            width: 100%;
            height: 100%;
        }
        
    </style>
</head>
<body>
<div class="popup_detailImg_wrap" onclick="popupClose()">
        <div class="popup_detailImg_top">zoom</div>
        <div class="popup_detailImg_img">
            <img src="${product[0].photo_path }">
        </div>
        <div class="popup_detailImg_more_img">
            <div class=""><img src="${product[0].photo_path }"></div>
            <div class=""><img src="${product[0].photo_path }"></div>
        </div>
    </div>
    <div class="popup_detailImg_button">
        <button class="popup_detailImg_button_close" onclick="popupClose()">C L O S E</button>
    </div>

<script>
    function popupClose() {
        close()
    }
</script>
</body>
</html>