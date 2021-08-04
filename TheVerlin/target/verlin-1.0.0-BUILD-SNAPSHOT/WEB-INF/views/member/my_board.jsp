<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="main">
<h4 class="h4">MY BOARD LIST</h4>

    <P style="font-size: 12px;">
        분류 선택
        <select>
            <option>분류별</option>
            <option>작성 일자별</option>
        </select>
    </P>

    <table class="myboard_table">
        <thead>
            <tr id="myboard_head">
                <th>NO</th>
                <th>BOARD</th>
                <th>SUBJECT</th>ㅁ
                <th>NAME</th>
                <th>DATE</th>
                <th>HIT</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="myboard_a" colspan="6">게시물이 없습니다</td>
            </tr>
        </tbody>
    </table>

    <p id="myboard_search">
        <select id="myboard_select">
            <option>제목</option>
            <option>내용</option>
            <option>글쓴이</option>
            <option>아이디</option>
            <option>별명</option>
        </select>
        <input class="myboard_input">SEARCH
    </p>
</div>

</body>
</html>