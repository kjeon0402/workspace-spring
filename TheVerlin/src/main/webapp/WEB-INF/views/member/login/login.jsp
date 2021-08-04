<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<div class="main_Login">
<form class="sub_login" name="loginForm" method="post">
    <div class="my_id">
        <input type="text" placeholder="ID" name="id">
    </div>
    <div class="my_pw">
        <input type="password" placeholder="Password" name="pw">
    </div>
    <div class="my_btn">
        <button onclick="checkLogin()">LOGIN</button>
    </div>
    <c:if test="${param.result == false}">
        <p>로그인에 실패하였습니다.</p>
    </c:if>
</form>

<div class="jf">
    <a href="${cpath }/member/join"><p>MEMBER JOIN</p></a>
    <hr>
    <div class="find_menu">
        <ul>
            <li><input type="checkbox">아이디 저장</li>
            <a href="${cpath }/member/findid"><li>FIND ID</li></a>
            <a href="${cpath }/member/findpw"><li>FIND PW</li></a>
<%--            <li onclick="nonmember()">비회원 주문내역 조회</li>--%>
        </ul>
    </div>
</div>

<br><br>

<form class="d-none NonMember_order" id="order_obj" name="unorder">
    <p><b>ORDER CHECK</b> 비회원 주문조회</p>
    <ul>
        <li>주문자명<input type="text" name="NonMember_order-name"></li>
        <li>주문번호<input type="text" placeholder="하이픈(-)포함" name="NonMember_order-number"></li>
<%--        <li>비회원주문 비밀번호<input type="text" name="NonMember_order-pw"></li>--%>
    </ul>
<%--    <button onclick="checkUnorder()">비회원 로그인</button>--%>
</form>
</div>

</body>

<%--<script>--%>
<%--    function nonmember(){--%>
<%--        var con = document.getElementById("order_obj");--%>
<%--        con.style.display = (con.style.display != 'none') ? "none":"block";--%>
<%--    }--%>
<%--    --%>
<%--    function checkUnorder(){--%>
<%--		var form2 = document.unorder;--%>
<%--		if(form2.NonMember_order-name.value == ""){--%>
<%--            alert("주문자이름을 입력하세요");--%>
<%--            form2.NonMember_order-name.focus();--%>
<%--            return false;--%>
<%--        }--%>
<%--		if (form2.NonMember_order-number.value == ""){--%>
<%--            alert("주문자번호를 입력하세요");--%>
<%--            form2.NonMember_order-number.focus();--%>
<%--            return false;--%>
<%--        }--%>
<%--		if (form2.NonMember_order-pw.value == ""){--%>
<%--            alert("주문자비밀번호를 입력하세요");--%>
<%--            form2.NonMember_order-pw.focus();--%>
<%--            return false;--%>
<%--        }--%>
<%--        form2.submit();--%>
<%--	}--%>
<%--</script>--%>

<script>
    function checkLogin(){
        var form = document.loginForm;
        if(form.id.value == ""){
            alert("아이디를 입력하세요");
            form.my_id.focus();
            return false;
        }else if (form.pw.value == ""){
            alert("비밀번호를 입력하세요");
            form.pw.focus();
            return false;
        }
        form.submit();
    }
</script>


</body>
</html>