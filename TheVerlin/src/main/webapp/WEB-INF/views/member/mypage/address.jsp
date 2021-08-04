<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<div class="main">
	<div>
        <h4 class="h4">ADDRESS</h4>
        <table class="address-table table border text-center">
            <thead>
                <tr>
                    <th class="address-table-th-1" scope="col"><input type="checkbox" id="toggle"></th>
                    <th class="address-table-th-2" scope="col">주소록 고정</th>
                    <th class="address-table-th-3" scope="col">배송지명</th>
                    <th class="address-table-th-4" scope="col">수령인</th>
                    <th class="address-table-th-5" scope="col">일반전화</th>
                    <th class="address-table-th-6" scope="col">휴대전화</th>
                    <th scope="col">주소</th>
                    <th class="address-table-th-8" scope="col">수정</th>
                </tr>
            </thead>
            <tbody id="list">
            </tbody>
        </table>

        <div class="address-button d-flex justify-content-between">
            <button class="address-button-del-address" type="button" id="deleteBtn" >선택 주소록 삭제</button>
            <button class="address-button-reg-address" type="button" onclick="location.href='${cpath }/member/address_register'">배송지 등록</button>
        </div>

<%--        <a href="${cpath }/member/address_register"><button id="address_button">배송지등록</button></a>--%>
        <div>
            <p class="tip-text-title ml-2 mt-5">배송주소록</p>
            <hr>
            <p class="tip-text-content ml-2">
                배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.<br>
                자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.
            </p>
        </div>
    </div>
</div>
<script>
    window.onload = function (){
        ajax_listAddress()
    }
    document.getElementById('toggle').onclick = function (){
        const checkboxlist = document.querySelectorAll('input[type="checkbox"]')
        if(document.getElementById('toggle').checked === true)
            checkboxlist.forEach(el => {
                el.checked = true;
            })
        else
            checkboxlist.forEach(el => {
                el.checked = false;
            })
    }
    document.getElementById('deleteBtn').addEventListener('click',function (){
        const checkboxlist = document.querySelectorAll('input[type="checkbox"]')
        console.log('check , ' + checkboxlist)
        console.log(checkboxlist)
        for(let i = 1 ; i < checkboxlist.length ; i++){
            if(checkboxlist[i].checked === true){
                // console.log(checkboxlist[i].id)
                ajax_removeAdress(checkboxlist[i].id)
            }
        }
    })
</script>

<script>
    function ajax_listAddress(){
        url = 'address/list/'
        opt = {
            method: 'GET'
        }
        fetch(url,opt)
            .then(function (resp){return resp.json()})
            .then(function (json){
                console.log(json)
                const tbody = document.getElementById('list')
                tbody.innerHTML=''
                json.forEach(el => {
                    const tr        = document.createElement('tr')
                    const td1       = document.createElement('td')
                    const chekcbox  = document.createElement('input')
                    chekcbox.type   = 'checkbox'
                    chekcbox.id     = el.address_UID
                    td1.appendChild(chekcbox)

                    const td2       = document.createElement('td')
                    const button    = document.createElement('button')
                    button.id       = el.address_UID
                    button.onclick  = function (){
                        if(this.classList.contains('address-button-fix-off')){
                            this.classList.remove('address-button-fix-off')
                            this.classList.add('address-button-fix-on')
                            this.innerText = '해제'
                            ajax_fixAddress(this.id,'y')
                        }
                        else{
                            this.classList.remove('address-button-fix-on')
                            this.classList.add('address-button-fix-off')
                            this.innerText = '고정'
                            ajax_fixAddress(this.id,'n')
                        }
                    }
                    if(el.address_FIX === 'n'){
                        button.innerText    = '고정'
                        button.classList.add('address-button-fix-off')
                    }
                    else{
                        button.innerText = '해제'
                        button.classList.add('address-button-fix-on')
                    }
                    td2.appendChild(button)
                    const td3       = document.createElement('td')
                    td3.innerText = el.address_NAME

                    const td4       = document.createElement('td')
                    td4.innerText = el.address_RECIPIENT

                    const td5       = document.createElement('td')
                    td5.innerText = el.address_HPHONE

                    const td6       = document.createElement('td')
                    td6.innerText = el.address_MPHONE

                    const td7       = document.createElement('td')
                    td7.innerText = el.address_INFO + ' ' + (el.address_DETAIL == null ? '' : el.address_DETAIL)

                    const td8       = document.createElement('td')
                    const a = document.createElement('a')
                    a.href = '${cpath}/member/address_modify?idx=' + el.address_UID
                    const modifybtn = document.createElement('button')
                    modifybtn.classList.add('address-modify-button')
                    modifybtn.innerText = '수정'
                    a.appendChild(modifybtn)
                    td8.appendChild(a)

                    tr.appendChild(td1)
                    tr.appendChild(td2)
                    tr.appendChild(td3)
                    tr.appendChild(td4)
                    tr.appendChild(td5)
                    tr.appendChild(td6)
                    tr.appendChild(td7)
                    tr.appendChild(td8)
                    tbody.appendChild(tr)
                })
            })
    }
    function ajax_removeAdress(idx){
        url = 'address/remove/' + idx
        opt = {
            method: 'GET'
        }
        fetch(url,opt)
            .then(function (resp){return resp.text()})
            .then(function (text){
                console.log('삭제 결과 : ' + text)
                if(Number(text) !== 1){
                    alert('삭제 실패 ')
                }
                ajax_listAddress()
            })
    }
    function ajax_fixAddress(idx, state){
        url = 'address/fix/' + idx +'/' + state
        opt = {
            method: 'GET'
        }
        fetch(url, opt)
            .then(function (resp) {
                return resp.text()
            })
            .then(function (text) {
                if (Number(text) !== 1) {
                    alert('수정 실패 ')
                }
            })
    }
</script>
</body>
</html>