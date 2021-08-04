<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더 베를린</title>
<style>
	body {
		margin: 0;
		padding: 0;
	}
	header {
		width: 100%;
		background-color: #333333;
		color: white;
		font-weight: bold;
		font-size: 12px;
		padding: 8px 20px;
	}
	header > p {
		margin: 0;
	}
	main {
		width: 95%;
		margin: 0 auto;
		margin-bottom: 30px;
	}
	main > .headline {
		font-size: 12px;
		margin: 0;
		margin-top: 20px;
		margin-bottom: 10px;
		font-weight: bold;
	}
	.estimate_apply_form {
		font-size: 11px;
		border: 1px solid #d7d5d5;
		width: 100%;
	}
	.apply_member_name, .apply_member_phone,
	.apply_member_email, .personal_info_policy {
		display: flex;
		box-sizing: border-box;
	}
	.apply_member_name > .column_name,
	.apply_member_phone > .column_name,
	.apply_member_email > .column_name,
	.personal_info_policy > .column_name {
		width: 15%;
		background-color: #fbfafa;
		padding: 10px 15px;
		border-bottom: 1px solid #d5d5d5;
		border-right: 1px solid #d5d5d5;
	}
	.estimate_apply_form input[type="text"] {
		all: unset;
	}
	.apply_member_name > .column_content,
	.apply_member_phone > .column_content,
	.apply_member_email > .apply_member_email_detail,
	.personal_info_policy > .personal_info_policy_content {
		width: 75%;
		padding: 10px 15px;
		border-bottom: 1px solid #d5d5d5;
	}
	.apply_member_email > .apply_member_email_detail > p {
		margin: 0;
	}
	.apply_member_email > .apply_member_email_detail > p:first-child {
		margin-bottom: 10px;
	}
	.personal_info_policy_content > .personal_info_policy_box {
		overflow: auto;
		height: 100px;
		padding: 5px;
		border: 1px solid #d5d5d5;
	}
	.line {
		width: 100%;
		height: 0;
		border-bottom: 1px solid #d5d5d5;
	}
	.area_btn {
		width: 100%;
		display: flex;
		justify-content: center;
	}
	.area_btn > #apply_estimate {
		all: unset;
		padding: 5px 20px;
		margin: 15px;
		background-color: #495164;
		color: white;
		font-size: 13px;
		border: 1px solid #495164;
		cursor: pointer;
	}
</style>
</head>
<body>

<header>
	<p>견적서 신청자 정보 입력</p>
</header>

<main>
	<p class="headline">신청자 정보</p>
	<div class="estimate_apply_form">
		<div class="apply_member_name">
			<div class="column_name">신청자명</div>
			<div class="column_content"><input type="text" value="강지언" readonly></div>
		</div>
		<div class="apply_member_phone">
			<div class="column_name">휴대전화</div>
			<div class="column_content"><input type="text" value="010-4709-9965" readonly></div>
		</div>
		<div class="apply_member_email">
			<div class="column_name">이메일</div>
			<div class="apply_member_email_detail">
				<p><input type="text" value="k47099965@gmail.com" readonly></p>
				<p>- 견적서를 전송받을 이메일 주소를 입력합니다.</p>
			</div>
		</div>
		<div class="personal_info_policy">
			<div class="column_name">개인정보 취급방침</div>
			<div class="personal_info_policy_content">
				<div class="personal_info_policy_box">
					&nbsp; ** 본 양식은 쇼핑몰 운영에 도움을 드리고자 샘플로 제공되는 서식으로 쇼핑몰 운영형태에 따른 수정이 필요합니다.
					쇼핑몰에 적용하시기 전, 쇼핑몰 운영 사항 등을 확인하시고 적절한 내용을 반영하여 사용하시기 바랍니다. **<br>
					1. 개인정보 수집목적 및 이용목적<br>
					가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금 정산<br>
					콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스<br>
					나. 회원 관리<br>
					회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지,
					가입 의사 확인, 연력확인, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리, 고지사항 전달<br>
					2. 수집하는 개인정보 항목 : 이름, 생년월일, 성별, 로그인ID, 비밀번호, 자택 전화번호, 휴대전화 번호,
					이메일, 14세 미만 가입자의 경우 법정대리인의 정보<br>
					3. 개인정보의 보유기간 및 이용기간<br>
					원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로
					명시한 기간 동안 보존합니다.<br>
					가. 회사 내부 방침에 의한 정보 보유 사유<br>
					o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년<br>
					나. 관련 법령에 의한 정보보유 사유<br>
					o 계약 또는 철약철회 등에 관한 기록<br>
					-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>
					-보존기간 : 5년<br>
					o 대금 결제 및 재화 등의 공금에 관한 기록<br>
					-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>
					-보존기간 : 5년<br>
					o 소비자 불만 또는 분쟁처리에 관한 기록<br>
					-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>
					-보존기간 : 3년<br>
					o 로그 기록<br>
					-보존이유 : 통신비밀보호법<br>
					-보존기간 : 3개월<br>
					※ 동의를 거부할 수 있으나 거부시 회원가입이 불가능합니다.
				</div>
				<p>
					<span>개인정보취급방침에 동의하십니까?</span>
					<span>
						<label><input type="radio" name="agreement_check">동의함</label>
						<label><input type="radio" name="agreement_check" checked>동의안함</label>
					</span>
				</p>
			</div>
		</div>
	</div>	
</main>

<footer>
	<div class="line"></div>
	<div class="area_btn">
		<button id="apply_estimate">확인하기</button>
	</div>
</footer>

<!-- 
	확인하기를 눌렀을 때 생성되는 별도의 폼이 있는데
	견적서를 이메일로 전송하거나 다운로드할 수 있는 양식임.
	추가로 여유가 되면 구현하도록  
-->

</body>
</html>