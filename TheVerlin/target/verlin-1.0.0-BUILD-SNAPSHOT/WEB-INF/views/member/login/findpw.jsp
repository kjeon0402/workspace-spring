<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>


<div class="findpwtotal">
<h4>FIND PW</h4>

<div class="findpw">
    <fieldset>
        <p>
            <strong>회원유형</strong>
            <select>
                <option value="one" selected="selected">개인회원</option>
                <option value="two">개인 사업자회원</option>
                <option value="three">법인 사업자회원</option>
                <option value="third">외국인회원</option>
            </select>
        </p>
        <p class="radioselect">
            <input name="rds" type="radio" onclick="getAddress(event)" id="finde"><label>이메일</label>
            <input name="rds" type="radio" onclick="getAddress(event)" id="findph"><label>휴대폰번호</label>
        </p>
        <p>
            <strong>아이디</strong>
            <input type="text">
        </p>
        <p>
            <strong>이름</strong>
            <input type="text">
        </p>
        <p for="finde" class="d-none">
            <strong>이메일로 찾기</strong>
            <input type="text">
        </p>
        <p for="findph" class="d-none">
            <strong>휴대폰번호로 찾기</strong>
            <input type="text">
        </p>
        <p id="result"></p>
        <button>확인</button>
    </fieldset>
</div>
</div>

</body>

<!-- 이메일, 휴대폰번호 -->
<script>
    function getAddress(event){
        const radioId = event.target.id;
        const query = 'p[for="'+ radioId + '"]'
        const text = document.querySelector(query).innerHTML;

        document.getElementById('result').innerHTML = text;
    }
</script>

</html>