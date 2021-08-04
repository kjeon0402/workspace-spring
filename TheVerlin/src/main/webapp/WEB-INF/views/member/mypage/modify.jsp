<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<div class="d-flex align-items-center flex-column">

    <form method="post" name="formMemberModify">
        <div class="default-wrap-size mb-2">
            <%-- 헤더 공백처리     --%>
            <div class="header-empty-space"></div>
            <div>
                <h4 class="h4 mb-3">MY PROFILE (회원정보수정)</h4>
                <table class="table table-bordered address-table" >
                    <tr>
                        <td>아이디</td>
                        <td><p id="id" class="m-0"></p></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="pw" class="input-width-m" placeholder="*******"></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" name="pw_r" class="input-width-m" placeholder="*******"></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><p id="name" class="m-0"></p></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td class="d-flex flex-column flex">
                            <div class="mb-2">
                                <input id="postcode" name="postcode" type="text" readonly class="input-width-s">
                                <input class="bg-white c636363" onclick="execDaumPostcode()" type="button" value="우편번호 >">
                            </div>
                            <div class="mb-2">
                                <input id="address" name="address" type="text" readonly class="input-width-l" placeholder="기본주소">
                            </div>
                            <div class="mb-2">
                                <input id="detailAddress" name="postDetail" type="text" class="input-width-l" placeholder="나머지주소(선택 입력 가능)">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="modify-mPhone-td-width">휴대전화<i class="text-danger">*</i></td>
                        <td>
                            <select id="mp0" name="mp0" class="input-width-s">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            -<input id="mp1" name="mp1" type="text" maxlength="4" class="input-width-s">
                            -<input id="mp2" name="mp2" type="text" maxlength="4" class="input-width-s">
                        </td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="text" id="email" name="email" class="input-width-m"></td>
                    </tr>
                    <tr>
                        <td>이메일 수신여부</td>
                        <td>
                            <label><input name="email_receive_check" type="radio" value="y">수신함</label>
                            <label><input name="email_receive_check" type="radio" value="n">수신안함</label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="default-wrap-size mb-5">
            <div class="d-flex flex-column align-content-center">
                <h4 class="h4 mb-3">환불계좌</h4>
                <table class="table table-bordered address-table">
                    <tr>
                        <td>예금주</td>
                        <td>
                            <p id="account_name" class="m-0"></p>
                        </td>
                    </tr>
                    <tr>
                        <td>은행선택</td>
                        <td>
                            <select id="bank" name="bank">
                                <option value="" selected="selected">-선택하세요-</option>
                                <option value="산업은행">산업은행</option>
                                <option value="기업은행">기업은행</option>
                                <option value="국민은행">국민은행</option>
                                <option value="하나(외환)은행">하나(외환)은행</option>
                                <option value="수협중앙회">수협중앙회</option>
                                <option value="농협중앙회">농협중앙회</option>
                                <option value="농협개인">농협개인</option>
                                <option value="농협">농협</option>
                                <option value="우리은행">우리은행</option>
                                <option value="유안타증권">유안타증권</option>
                                <option value="KB증권">KB증권</option>
                                <option value="SC제일은행">SC제일은행</option>
                                <option value="미래에셋증권">미래에셋증권</option>
                                <option value="대우증권">대우증권</option>
                                <option value="삼성증권">삼성증권</option>
                                <option value="한국투자증권">한국투자증권</option>
                                <option value="신한은행">신한은행</option>
                                <option value="교보증권">교보증권</option>
                                <option value="하이투자증권">하이투자증권</option>
                                <option value="현대차증권">현대차증권</option>
                                <option value="SK증권">SK증권</option>
                                <option value="대신증권">대신증권</option>
                                <option value="한화증권">한화증권</option>
                                <option value="하나대투증권">하나대투증권</option>
                                <option value="신한금융투자">신한금융투자</option>
                                <option value="동부증권">동부증권</option>
                                <option value="유진투자증권">유진투자증권</option>
                                <option value="메리츠증권">메리츠증권</option>
                                <option value="카카오페이증권">카카오페이증권</option>
                                <option value="NH투자증권">NH투자증권</option>
                                <option value="신영증권">신영증권</option>
                                <option value="케이뱅크">케이뱅크</option>
                                <option value="카카오뱅크">카카오뱅크</option>
                                <option value="LIG증권">LIG증권</option>
                                <option value="OK저축은행">OK저축은행</option>
                                <option value="대구은행">대구은행</option>
                                <option value="부산은행">부산은행</option>
                                <option value="광주은행">광주은행</option>
                                <option value="제주은행">제주은행</option>
                                <option value="전북은행">전북은행</option>
                                <option value="경남은행">경남은행</option>
                                <option value="모건스탠리은행">모건스탠리은행</option>
                                <option value="씨티은행">씨티은행</option>
                                <option value="유에프제이은행">유에프제이은행</option>
                                <option value="미즈호코퍼레이트은행">미즈호코퍼레이트은행</option>
                                <option value="미쓰비시도쿄은행">미쓰비시도쿄은행</option>
                                <option value="뱅크오브아메리카">뱅크오브아메리카</option>
                                <option value="우체국">우체국</option>
                                <option value="신용보증기금">신용보증기금</option>
                                <option value="기술신용보증기금">기술신용보증기금</option>
                                <option value="하나은행">하나은행</option>
                                <option value="농협회원조합">농협회원조합</option>
                                <option value="도이치은행">도이치은행</option>
                                <option value="상호저축은행">상호저축은행</option>
                                <option value="새마을금고">새마을금고</option>
                                <option value="수출입은행">수출입은행</option>
                                <option value="신용협동조합">신용협동조합</option>
                                <option value="홍콩상하이은행(HSBC)">홍콩상하이은행(HSBC)</option>
                                <option value="에이비엔암로은행">에이비엔암로은행</option>
                                <option value="산림조합">산림조합</option>
                                <option value="한국주택금융공사">한국주택금융공사</option>
                                <option value="서울보증보험">서울보증보험</option>
                                <option value="경찰청">경찰청</option>
                                <option value="금융결제원">금융결제원</option>
                            </select>
                        </td>
                    </tr>
                    <tr >
                        <td>계좌번호</td>
                        <td>
                            <input type="text" name="account_number" id="account_number" placeholder="'-' 없이 숫자만 입력">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="default-wrap-size mb-5 d-flex justify-content-between">
            <div></div>
            <div>
                <input class="bg-white" type="submit" value="회원정보수정">
                <input class="bg-white" type="button" value="취소" id="btnCancel">
            </div>
            <div>
                <input class="bg-white" type="button" value="회원탈퇴" data-toggle="modal" data-target="#exampleModal">
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-secondary">
                        <div class="modal-title text-white" id="exampleModalLabel">회원탈퇴</div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex border modal-body-height">
                            <div class="w-25 d-flex flex-column justify-content-center align-content-center" >
                                <p class="m-0 text-center">적립금 정보</p>
                            </div>
                            <div class="w-75">
                                <div class="d-flex align-items-center h-50 border-bottom">
                                    <p class="m-0">탈퇴시 보유하고 있는 적립금은 모두 삭제됩니다.</p>
                                </div>
                                <div class="d-flex align-items-center h-50">
                                    <p class="m-0">현재 적립금 : <span class="c0f6674">${MemberInfo.MEMBER_POINT}</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2">
                            <p class="font-weight-bold">회원탈퇴 사유</p>
                            <table class="modal-table border-top border-bottom w-100">
                                <tr class="p-2">
                                    <td class="border-right">
                                        <p>탈퇴 사유</p>
                                    </td>
                                    <td>
                                        <p>
                                            <select id="leave_reason" name="leave_reason">
                                                <option value="" selected="selected">-선택하세요-</option>
                                                <option value="상품종류가 부족하다">상품종류가 부족하다</option>
                                                <option value="상품가격이 비싸다">상품가격이 비싸다</option>
                                                <option value="상품가격에 비해 품질이 떨어진다">상품가격에 비해 품질이 떨어진다</option>
                                                <option value="배송이 느리다">배송이 느리다</option>
                                                <option value="반품/교환이 불만이다">반품/교환이 불만이다</option>
                                                <option value="상담원 고객응대 서비스가 불만이다">상담원 고객응대 서비스가 불만이다</option>
                                                <option value="쇼핑몰 혜택이 부족하다 (쿠폰, 적립금,할인 등)">쇼핑몰 혜택이 부족하다 (쿠폰, 적립금,할인 등)</option>
                                                <option value="이용빈도가 낮다">이용빈도가 낮다</option>
                                                <option value="개인정보 유출이 염려된다">개인정보 유출이 염려된다</option>
                                                <option value="기타">기타</option>
                                            </select>
                                        </p>
                                    </td>
                                </tr>
                                <tr class="border-top p-2">
                                    <td class="border-right"><p>비밀번호 확인</p></td>
                                    <td>
                                        <p>
                                            <input type="password" id="input_modal_pw" placeholder="비밀번호를 입력해주세요">
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="modal_btnLeave" class="btn btn-secondary">탈퇴</button>
                        <button type="button" class="btn bg-white" data-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    function displayPhone(id0,id1,id2,txt_Phone){
        //휴대번호 초기화
        const phone = txt_Phone.split('-')
        const select = document.getElementById(id0)
        const p0 = phone[0]
        for(let i = 0; i < select.length; i++){
            if(select[i].value === p0){
                select[i].selected = true
            }
        }
        document.getElementById(id1).value = (phone[1] === undefined ? '' : phone[1]);
        document.getElementById(id2).value = (phone[2] === undefined ? '' : phone[2]);
    }
    function btnModifyCancel(){
        location.href = '${cpath}/member/mypage'
    }

    function btnLeave(){
        const select = document.getElementById('leave_reason')
        if (select.value === ''){
            alert('탈퇴 사유를 선택해주세요.')
        }
        ajax_loginPwCheck()
    }

</script>
<script>
    document.onsubmit = function (event){
        const form = document.formMemberModify

        if(form.pw.value === '' || form.pw_r.value === ''){
            alert('비밀번호를 입력해주세요')
            return false
        }
        const Reg_pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/; // pw 유효성
        // console.log(Reg_pw.test(form.pw.value))
        if(!Reg_pw.test(form.pw.value)){
            alert('비밀번호는 영대소문자 + 숫자/특수문자 2가지 이상 조합으로 10~16자리 사용해야 합니다.')
            return false;
        }
        if(form.pw.value !== form.pw_r.value){
            alert('비밀번호가 일치하지 않습니다.')
            return false
        }
        if(form.mp1.value === '' || form.mp2.value === ''){
            alert('휴대폰 번호를 입력해주세요')
            return false
        }
        if(form.email.value === ''){
            alert('이메일을 입력해주세요')
            return false
        }

        const Reg_MobilePhone    = /^\d{3}-\d{3,4}-\d{4}$/
        if(!Reg_MobilePhone.test(form.mp0.value +'-' + form.mp1.value + '-' + form.mp2.value)){
            alert('잘못된 휴대전화 번호입니다.')
            return false
        }

        const Reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        if(!Reg_email.test(form.email.value)){
            alert("올바른 이메일 형식이 아닙니다.");
            return false;
        }

        // event.preventDefault();
    }
</script>
<script>
    window.onload = function (){
        //아이디
        document.getElementById('id').innerText = '${MemberInfo.MEMBER_ID}'
        //이름
        document.getElementById('name').innerText = '${MemberInfo.MEMBER_NAME}'
        //우편번호
        document.getElementById('postcode').value = '${MemberInfo.MEMBER_POST}'
        //기본주소
        document.getElementById('address').value = '${MemberInfo.MEMBER_ADDRESS_INFO}'
        //상세주소
        document.getElementById('detailAddress').value = '${MemberInfo.MEMBER_ADDRESS_DETAIL}'
        //휴대번호 초기화
        displayPhone('mp0','mp1','mp2','${MemberInfo.MEMBER_PHONE}')

        //이메일 초기화
        document.getElementById('email').value = '${MemberInfo.MEMBER_EMAIL}'
        //이메일 수신여부 초기화
        const email_receive_check = document.querySelectorAll('input[name="email_receive_check"]')

        email_receive_check.forEach(el => {
            if(el.value === '${MemberInfo.MEMBER_EMAIL_CHECK}')
                el.checked = true
        })

        //예금주명
        document.getElementById('account_name').innerText = '${MemberInfo.MEMBER_NAME}'
        //계좌번호
        const account_number = document.getElementById('account_number')
        account_number.value = '${MemberInfo.MEMBER_ACCOUNT_NUMBER}'

        if(account_number.value !== ''){
        	//은행
        	const select_bank = document.getElementById('bank')
        	for(let i = 0; i < select_bank.length; i++){
        		if(select_bank[i].value === '${MemberInfo.MEMBER_ACCOUNT_BANK}'){
        			select_bank[i].selected = true
        		}
        	}        	
        }        

        document.getElementById('modal_btnLeave').onclick = btnLeave
        document.getElementById('btnCancel').onclick = btnModifyCancel
    }

    $('#exampleModal').on('hidden.bs.modal', function () {
        // something
        const select    = document.getElementById('leave_reason')
        const pw        = document.getElementById('input_modal_pw')
        select[0].selected  = true
        pw.value            = ''
    })
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    // document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("detailAddress").value= '';
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
    function ajax_leaveMember(){
        const reason = document.getElementById('leave_reason').value
        url = '/member/' + reason
        opt = {
            method: 'DELETE'
        }
        fetch(url,opt)
            .then(function (resp){return resp.text()})
            .then(function (text){
                console.log('삭제 결과 : ' + text)
                if(Number(text) !== 1){
                    alert('삭제 실패 ')
                }
                else{
                    alert('탈퇴 완료')
                    location.href = '/'
                }
            })
    }
    function ajax_loginPwCheck(){
        const pw = document.getElementById('input_modal_pw').value
        url = '/member/check/' + pw
        opt = {
            method: 'GET'
        }
        fetch(url,opt)
            .then(function (resp){return resp.text()})
            .then(function (text){
                if(Number(text) !== 1){
                    alert('비밀번호가 틀립니다.')
                }
                else{
                    ajax_leaveMember()
                }
            })
    }
</script>
</body>
</html>