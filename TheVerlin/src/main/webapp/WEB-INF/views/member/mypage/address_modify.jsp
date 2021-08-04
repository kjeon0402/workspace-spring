<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<div class="d-flex align-items-center flex-column">

    <div class="default-wrap-size mb-5">
        <%-- 헤더 공백처리     --%>
        <div class="header-empty-space"></div>
        <form method="post" name="formAddress">
            <input type="hidden" name="idx" id="idx">
            <div>
                <h4 class="h4 mb-3">ADDRESS</h4>
                <table class="table table-bordered address-table" >
                    <tr>
                        <td class="addressModify-td-width">배송지명</td>
                        <td><input type="text" id="address_name" name="address_name" maxlength="10" class="input-width-m"></td>
                    </tr>
                    <tr>
                        <td class="addressModify-td-width">수취인</td>
                        <td><input type="text" id="address_recipient" name="address_recipient" maxlength="10" class="input-width-m"></td>
                    </tr>
                    <tr>
                        <td class="addressModify-td-width">주소</td>
                        <td class="d-flex flex-column flex">
                            <div class="mb-2">
                                <input id="postcode"  name="address_post" type="text" readonly class="input-width-s">
                                <input class="bg-white c636363" onclick="execDaumPostcode()" type="button" value="우편번호 >">
                            </div>
                            <div class="mb-2">
                                <input id="address" name="address_info" type="text" readonly class="input-width-l" placeholder="기본주소">
                            </div>
                            <div class="mb-2">
                                <input id="detailAddress" name="address_detail" type="text" class="input-width-l" placeholder="나머지주소(선택 입력 가능)">
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td class="addressModify-td-width">일반전화</td>
                        <td>
                            <select id="hp0" name="hp0" class="input-width-s">
                                <option value="02">02</option>
                                <option value="031">031</option>
                                <option value="032">032</option>
                                <option value="033">033</option>
                                <option value="041">041</option>
                                <option value="042">042</option>
                                <option value="043">043</option>
                                <option value="044">044</option>
                                <option value="051">051</option>
                                <option value="052">052</option>
                                <option value="053">053</option>
                                <option value="054">054</option>
                                <option value="055">055</option>
                                <option value="061">061</option>
                                <option value="062">062</option>
                                <option value="063">063</option>
                                <option value="064">064</option>
                                <option value="0502">0502</option>
                                <option value="0503">0503</option>
                                <option value="0504">0504</option>
                                <option value="0505">0505</option>
                                <option value="0506">0506</option>
                                <option value="0507">0507</option>
                                <option value="070">070</option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                                <option value="0508">0508</option>
                            </select>
                            -<input id="hp1" name="hp1" type="text" maxlength="4" class="input-width-s">
                            -<input id="hp2" name="hp2" type="text" maxlength="4" class="input-width-s">
                        </td>
                    </tr>
                    <tr>
                        <td class="addressModify-td-width">휴대전화<i class="text-danger">*</i></td>
                        <td>
                            <select id="mp0" name="mp0"  class="input-width-s">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            -<input class="input-width-s" id="mp1" name="mp1" type="text" maxlength="4">
                            -<input class="input-width-s" id="mp2" name="mp2" type="text" maxlength="4">
                        </td>
                    </tr>
                </table>
                <div class="d-flex flex-row-reverse">
                    <p>
                        <input type="submit" value="수정" class="address-register-button-reg">
                        <input type="button" value="취소" class="address-register-button-candle" onclick="CandleBtnClick()">
                    </p>
                </div>
                <div>
                    <p class="tip-text-title ml-2">배송주소록 유의사항</p>
                    <hr>
                    <p class="tip-text-content ml-2">
                        배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.<br>
                        자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.
                    </p>
                </div>
            </div>
        </form>
    </div>
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
</script>
<script>
    window.onload = function (){
        document.getElementById('address_name').value       = '${Address.ADDRESS_NAME}'
        document.getElementById('address_recipient').value  = '${Address.ADDRESS_RECIPIENT}'
        document.getElementById('postcode').value           = '${Address.ADDRESS_POST}'
        document.getElementById('address').value            = '${Address.ADDRESS_INFO}'
        document.getElementById('detailAddress').value      = '${Address.ADDRESS_DETAIL}'
        displayPhone('mp0','mp1','mp2','${Address.ADDRESS_MPHONE}')
        displayPhone('hp0','hp1','hp2','${Address.ADDRESS_HPHONE}')
    }
</script>
<script>
    function CandleBtnClick(){
        location.href = '${cpath}/member/address'
    }
</script>
<script>
    window.onsubmit = function (event){
        const form = document.formAddress
        if( form.address_name.value === ''){
            alert('배송지명을 입력해 주세요')
            form.address_name.focus()
            return false
        }
        if( form.address_recipient.value === ''){
            alert('수취인을 입력해 주세요')
            form.address_recipient.focus()
            return false
        }
        if( form.address_post.value === '' ||
            form.address_info.value === ''){
            alert('주소를 입력해 주세요')
            return false
        }
        if( form.mp1.value === '' ||
            form.mp2.value === ''){
            alert('휴대전화를 입력해 주세요')
            return false
        }

        const HomePhone         = form.hp0.value + '-' + form.hp1.value + '-' + form.hp2.value
        const MobilePhone       = form.mp0.value + '-' + form.mp1.value + '-' + form.mp2.value
        console.log(HomePhone)
        console.log(MobilePhone)

        const RegHomePhone      = /^\d{2,3}-\d{3,4}-\d{4}$/
        const RegMobilePhone    = /^\d{3}-\d{3,4}-\d{4}$/

        if( form.hp1.value !== '' || form.hp2.value !== ''){
            if(!RegHomePhone.test(HomePhone)){
                alert('잘못된 일반전화 번호입니다.')
                return false
            }
        }
        if(!RegMobilePhone.test(MobilePhone)){
            alert('잘못된 휴대전화 번호입니다.')
            return false
        }
        form.submit()
    }
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
</body>
</html>