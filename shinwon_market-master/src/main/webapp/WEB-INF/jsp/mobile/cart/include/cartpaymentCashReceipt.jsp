<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<li id="divCashReceipt_${c_cash_receipt_no }">
    <div class="tit">
        	현금영수증
    </div>
    <div class="field">
        <p>
            <input type="radio" id="cashReceipt1_${c_cash_receipt_no }" name="cashReceipt" class="radio" value="3">
            <label for="cashReceipt1_${c_cash_receipt_no }">개인소득공제</label>
        </p>
        <p class="entry phone private-cash-receipt" style="display: none;">
            <label class="sel_box_st0">
                <select class="select cashR cashR3" id="cash_hp_${c_cash_receipt_no }" name="cash_auth_value_hp1" title="휴대폰 번호 앞자리">
                    <option value="">선택</option>
                    <c:forEach var="hpRow" items="${hpCodeList }">
						<option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
					</c:forEach>
                </select>
            </label> -
            <input type="number" name="cash_auth_value_hp2" class="text small cashR cashR3 number" maxlength="4" title="휴대폰 번호 중간자리"> -
            <input type="number" name="cash_auth_value_hp3" class="text small cashR cashR3 number"  maxlength="4" title="휴대폰 번호 끝자리">
        </p>
        
        <p>
            <input type="radio" id="cashReceipt2_${c_cash_receipt_no }" name="cashReceipt" class="radio" value="4">
            <label for="cashReceipt2_${c_cash_receipt_no }">사업자지출증빙</label>
        </p>
        <p class="entry licensee company-cash-receipt" style="display: none;">
            <strong>사업자번호</strong>
            <input type="number" name="cash_auth_value_company1" class="text small cashR cashR4 number" maxlength="3" title="사업자번호 첫째자리"> -
            <input type="number" name="cash_auth_value_company2" class="text small cashR cashR4 number" maxlength="2" title="사업자번호 둘째자리"> -
            <input type="number" name="cash_auth_value_company3" class="text small cashR cashR4 number" maxlength="5" title="사업자번호 셋째자리">
        </p>
        
        <p>
            <input type="radio" id="cashReceipt3_${c_cash_receipt_no }" name="cashReceipt" class="radio" value="N">
            <label for="cashReceipt3_${c_cash_receipt_no }">신청안함</label>
        </p>
    </div>
</li>
<li class="guide">
    <ul class="list primary">
        <li>정보통신망 이용촉진 및 정보보호에 관한 법률 제정으로 인해 주민등록번호 사용이 제한됩니다.</li>
        <li>사업자, 현금영수증카드, 휴대폰번호가 유효하지 않으면 발급되지 않습니다.</li>
        <li>사업자증빙을 원하시는 경우에는 사업자지출증빙으로 신청해 주시기 바랍니다.</li>
    </ul>
</li>