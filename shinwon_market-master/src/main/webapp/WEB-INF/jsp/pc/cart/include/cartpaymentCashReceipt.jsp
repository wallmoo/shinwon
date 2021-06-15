<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="module">
	<h5 class="col tit"><label for="cashReceipt1">현금영수증</label></h5>
	<div class="col apply" id="divCashReceipt_${c_cash_receipt_no }">
	    <p class="desc dotum">
			정보통신망 이용촉진 및 정보보호에 관한 법률 제정으로 인해 주민등록번호 사용이 제한됩니다.
	    </p>

	    <label for="cashReceipt1_${c_cash_receipt_no }" class=" ml0 cashReceiptLabel" data-input_val="3">
		<input type="radio" name="cashReceipt" id="cashReceipt1_${c_cash_receipt_no }" value="3"/>
			개인소득공제
	    </label>
	    <label for="cashReceipt2_${c_cash_receipt_no }" class=" cashReceiptLabel" data-input_val="4">
		<input type="radio" name="cashReceipt" id="cashReceipt2_${c_cash_receipt_no }" value="4"/>
			사업자지출증빙
	    </label>
	    <label for="cashReceipt3_${c_cash_receipt_no }" class=" cashReceiptLabel" data-input_val="N">
		<input type="radio" name="cashReceipt" id="cashReceipt3_${c_cash_receipt_no }" value="N"/>
			신청안함
	    </label>

	    <hr />

	    <div class="frame-a private-cash-receipt" style="display: none;">
			휴대폰
			<select id="cash_hp_${c_cash_receipt_no }" name="cash_auth_value_hp1" class="sel_chg cashR cashR3" title="휴대폰 번호 앞자리">
				<option value="">선택</option>
			    <c:if test="${not empty hpCodeList }">
				 <c:forEach var="hpRow" items="${hpCodeList }">
				     <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
				 </c:forEach>
			    </c:if>
			</select>
			   -
			   <input type="text" name="cash_auth_value_hp2" class="text small cashR cashR3 number" title="휴대폰 번호 중간자리" maxlength="4" value=""/>
			   -
			   <input type="text" name="cash_auth_value_hp3" class="text small cashR cashR3 number" title="휴대폰 번호 뒷자리" maxlength="4" value=""/>	
	    </div>

	    <div class="frame-a company-cash-receipt" style="display: none;">
			사업자번호
		<input type="text" name="cash_auth_value_company1" class="text small cashR cashR4 number" title="사업자번호 1~3번째 숫자" maxlength="3"/> -
		<input type="text" name="cash_auth_value_company2" class="text small cashR cashR4 number" title="사업자번호 4~6번째 숫자" maxlength="2"/> -
		<input type="text" name="cash_auth_value_company3" class="text small cashR cashR4 number" title="사업자번호 7~11번째 자리" maxlength="5"/>
	    </div>

	    <p class="message notice-b mt10">
		사업자, 현금영수증카드, 휴대폰번호가 유효하지 않으면 발급되지 않습니다.
	    </p>
	    <p class="message notice-b">
		사업자증빙을 원하시는 경우에는 사업자지출증빙으로 신청해 주시기 바랍니다.
	    </p>
	</div>
</div>
