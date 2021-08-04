<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

	<div class="findidtotal">
		<h4>FIND ID</h4>

		<div class="findid">
    		<fieldset>
			    <p>
					<strong>회원유형</strong>
		            <select>
        		        <option value="one" selected="selected">개인회원</option>
                		<option value="two">개인 사업자회원</option>
            		</select>
		        </p>
				<form action="post">
					<p class="radioselect">
						<input name="rds" type="radio" value="email"><label>이메일</label>
						<input name="rds" type="radio" value="phone"><label>휴대폰번호</label>
					</p>
					<p id="findemail" for="findemail">
						<strong>이름</strong>
						<input type="text" name="name">
						<strong>이메일로 찾기</strong>
						<input type="text" name="email">
					</p>
					<p id="findphone" for="findph" class="d-none">
						<strong>이름</strong>
						<input type="text" name="name">
						<strong>휴대폰번호로 찾기</strong>
						<input type="text" name="phone">
					</p>
					<input type="submit" id="findid_submit" value="확인">
				</form>
    		</fieldset>
		</div>
	</div>
<!-- 이메일, 휴대폰번호 -->
<script>
	window.onsubmit = function (e){
		console.log("submit")
		e.preventDefault();
	}
	document.querySelectorAll("input[name='rds']").forEach(e => e.addEventListener("change",function (event){
		const viewname = 'find' + event.target.value
		switch (viewname){
			case 'findemail':
				document.getElementById('findemail').style.display = ""
				document.getElementById('findphone').style.display = "none"
				break;
			case 'findphone':
				document.getElementById('findemail').style.display = "none"
				document.getElementById('findphone').style.display = ""
				break;
		}
		console.log(event.target.value)
	}) );

</script>

</body>


</html>