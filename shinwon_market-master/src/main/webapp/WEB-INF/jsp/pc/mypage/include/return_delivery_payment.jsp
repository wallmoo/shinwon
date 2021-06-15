<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				<div class="table_wrap userFault_showing mb95" style="display:none;">
					<table class="tb_row tb_small">
						<caption>결제 수단 : 결제 수단 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" rowspan="2">결제 수단</th>
								<td>
									<input type="radio" id="delivery_charge" name="payment" checked="checked" value='B'>
									<label for="delivery_charge" class="mr30"><span class="icon"></span>배송비 결제</label>
									<input type="radio" id="use_coupons" name="payment" value='C'>
									<label for="use_coupons" class="mr30"><span class="icon"></span>쿠폰 사용</label>
								</td>
							</tr>
							<tr class="delivery_charge_wp">
								<td>
									<div id="delivery_pay" class="delivery_payment_wp">
										<input type="radio" id="credit_card" name="delivery_payment" value='C' data-id="C">
										<label for="credit_card" class="mr30"><span class="icon"></span>신용카드</label>
										<input type="radio" id="virtual_account" name="delivery_payment" value='Y' data-id="Y">
										<label for="virtual_account" class="mr30"><span class="icon"></span>가상계좌(무통장입금)</label>
										<input type="radio" id="account_transfer" name="delivery_payment" value='R' data-id="Y">
										<label for="account_transfer" class="mr30"><span class="icon"></span>실시간계좌이체</label>
										<input type="radio" id="phone_banking" name="delivery_payment" value='H' data-id="H">
										<label for="phone_banking" class="mr30"><span class="icon"></span>휴대폰결제</label>
										<input type="radio" id="simple_payment" name="delivery_payment" value='S' data-id="S">
										<label for="simple_payment" class="mr30"><span class="icon"></span>간편결제</label>
									</div>
									<div class="use_coupons_wp">
									<c:if test="${fn:length(changeCouponList) ne 0 }">
									<span class="select">
										<select id="" class="w284" title="배송비 쿠폰" name="useCoupon">
											<c:forEach var="data" items="${changeCouponList}">
												<option value="${data.CPN_MEM_IDX }">${data.CPN_MST_TITLE }</option>
											</c:forEach>
										</select>
									</span>
									</c:if>
									<c:if test="${fn:length(changeCouponList) eq 0}"><p>사용 가능한 배송비 쿠폰이 없습니다.</p></c:if>
									</div>
								</td>
							</tr>
							
							<tr id="delivery_pay_wp" class="delivery_payment_wp" style="display:none;">
								<td colspan="2">
									<div class="payment_type">
										<!-- 신용카드 -->
										<div class="pbx p0" id="payment_C" >
											<span class="select">
												<select id="card_gbn" class="w230" title="카드">
													<option selected="selected" value="">카드 선택</option>
													<c:if test="${cardTempList != null }">		
														<c:forEach var="data" items="${cardTempList }">
															<option value="${data.value}">${data.name}</option>																			
														</c:forEach>																																
													</c:if>	
												</select>
											</span>
											<span class="select">
												<select id="card_installment" class="w230" title="할부">
													<option selected="selected" value="">할부 선택</option>
													<option value="1">일시불</option>
													<option value="2">2개월(무)</option>
													<option value="3">3개월(무)</option>
													<option value="4">4개월(무)</option>
													<option value="5">5개월(무)</option>
													<option value="6">6개월</option>
													<option value="7">7개월</option>
												</select>
											</span>
										</div>
										<!-- 가상계좌(무통장입금) -->
										<div class="pbx p1" id="payment_Y" >
											<ul class="pbx_list">
												<li>
													<div class="tit clearboth">
														<strong>현금영수증</strong>
														<div class="cash_receipt_rdo">
															<input type="radio" id="individual" name="cash_receipt" data-contents="individual_contents">
															<label for="individual" class="mr30"><span class="icon"></span>개인 소득공제용</label>
															<input type="radio" id="business" name="cash_receipt" data-contents="business_contents">
															<label for="business" class="mr30"><span class="icon"></span>사업자 지출증빙용</label>
															<input type="radio" id="unissued" name="cash_receipt" data-contents="unissued_contents">
															<label for="unissued" class="mr30"><span class="icon"></span>미발행</label>
														</div>
													</div>
													<div class="cash_receipt_view" id="cash_receipt_view">
														<!-- 개인 소득공제용 -->
														<div class="cbx cash_receipt" id="individual_contents">
															<span class="select">
																<select id="" class="w284 receipt_type_select">
																	<option value="1" selected="selected" data-type="type1">휴대폰번호</option>
																	<option value="2" data-type="type2">현금영수증카드번호</option>
																</select>
															</span>
															<div class="receipt_type on" id="" data-type="type1">
																<span class="select">
																	<select id="" class="w156" title="첫번째자리 번호">
																		<option selected="selected">010</option>
																		<option>010</option>
																		<option>010</option>
																		<option>010</option>
																		<option>010</option>
																	</select>
																</span>
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w156">
															</div>
															<div class="receipt_type" id="" data-type="type2">
																<input type="text" name="" placeholder="번호 입력" title="첫번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="네번째자리 번호 입력" class="w156">
															</div>
														</div>
														<!-- 사업자 지출증빙용 -->
														<div class="cbx cash_receipt" id="business_contents">
															<span class="select">
																<select id="" class="w284 receipt_type_select">
																	<option value="1"  selected="selected" data-type="type1">사업자번호</option>
																	<option value="2" data-type="type2">현금영수증카드번호</option>
																</select>
															</span>
															<div class="receipt_type on" data-type="type1">
																<input type="text" name="" placeholder="번호 입력" title="첫번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w156">
															</div>
															<div class="receipt_type" data-type="type2">
																<input type="text" name="" placeholder="번호 입력" title="첫번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w156">
																<span class="hyphen">-</span>
																<input type="text" name="" placeholder="번호 입력" title="네번째자리 번호 입력" class="w156">
															</div>
														</div>
														<!-- 미발행 -->
														<div class="cbx" id="unissued_contents"><p class="t_dot">미발행을 선택하신 경우에도 현금영수증이 자진 발급됩니다.</p></div>
													</div>
												</li>
												<!-- <li>
													<div class="tit clearboth"><strong>환불계좌정보</strong></div>
													<div class="form virtual_account_form clearboth">
														<span class="select">
															<select id="" class="w230" title="은행 선택">
																<option>은행 선택</option>
															</select>
														</span>
														<input type="number" name="" class="inp_acc w350" title="계좌번호 입력" placeholder="하이픈(-)없이 계좌번호 숫자만 입력">
														<input type="text" name="" class="inp_name w280" title="예금주명 입력" placeholder="예금주명 입력">
														<button class="btn order view">계좌 확인</button>
													</div>
												</li> -->
											</ul>
										</div>
										
										<!-- 실시간계좌이체 -->
										<!-- 
										<div class="pbx p2" id="payment_R" >
											<ul class="pbx_list">
												<li>
													<div class="tit clearboth">
														<strong>현금영수증</strong>
														<div class="cash_receipt_rdo">
															<input type="radio" id="individual2" name="cash_receipt">
															<label for="individual2" class="mr30"><span class="icon"></span>개인 소득공제용</label>
															<input type="radio" id="business2" name="cash_receipt">
															<label for="business2" class="mr30"><span class="icon"></span>사업자 지출증빙용</label>
															<input type="radio" id="unissued3" name="cash_receipt">
															<label for="unissued3" class="mr30"><span class="icon"></span>미발행</label>
														</div>
													</div>
													<div class="cash_receipt_view">
														개인 소득공제용
														<div class="cbx">
															<span class="select">
																<select id="" class="w284">
																	<option selected="selected">휴대폰번호</option>
																</select>
															</span>
															<span class="select">
																<select id="" class="w156" title="첫번째자리 번호">
																	<option selected="selected">010</option>
																	<option>010</option>
																	<option>010</option>
																	<option>010</option>
																	<option>010</option>
																</select>
															</span>
															<span class="hyphen">-</span>
															<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w156">
															<span class="hyphen">-</span>
															<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w156">
														</div>
														사업자 지출증빙용
														<div class="cbx">
															<span class="select">
																<select id="" class="w284">
																	<option selected="selected">사업자번호</option>
																</select>
															</span>
															<input type="text" name="" placeholder="번호 입력" title="첫번째자리 번호 입력" class="w156">
															<span class="hyphen">-</span>
															<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w156">
															<span class="hyphen">-</span>
															<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w156">
														</div>
														미발행
														<div class="cbx"><p class="t_dot">미발행을 선택하신 경우에도 현금영수증이 자진 발급됩니다.</p></div>
													</div>
												</li>
											</ul>
										</div> -->
										
										<!-- 간편결제 -->
										<div class="pbx p4" id="payment_S" >
											<input type="radio" id="rdo_simple1" name="rdo_simple">
											<label for="rdo_simple1" class="mr30"><span class="icon"></span><span class="simple sp1">Paynow</span></label>
											<input type="radio" id="rdo_simple2" name="rdo_simple">
											<label for="rdo_simple2" class="mr30"><span class="icon"></span><span class="simple sp2">LG페이</span></label>
											<input type="radio" id="rdo_simple3" name="rdo_simple">
											<label for="rdo_simple3" class="mr30"><span class="icon"></span><span class="simple sp3">SAMSUNG PAY</span></label>
											<input type="radio" id="rdo_simple4" name="rdo_simple">
											<label for="rdo_simple4" class="mr30"><span class="icon"></span><span class="simple sp4">PAYCO</span></label>
											<input type="radio" id="rdo_simple5" name="rdo_simple">
											<label for="rdo_simple5" class="mr30"><span class="icon"></span><span class="simple sp5">SSGPAY</span></label>
											<input type="radio" id="rdo_simple6" name="rdo_simple">
											<label for="rdo_simple6" class="mr30"><span class="icon"></span><span class="simple sp6">L.pay</span></label>
											<input type="radio" id="rdo_simple7" name="rdo_simple">
											<label for="rdo_simple7"><span class="icon"></span><span class="simple sp7">KAKAO PAY</span></label>
										</div>
									</div><!-- //payment_type -->
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<script type="text/javascript">
					$(function() {
						
						// 쿠폰 셀렉트박스 초기화
					    $(".use_coupons_wp").hide();
						
					  	// 배송비 결제 or 쿠폰사용 클릭시 이벤트
						$('input[name="payment"]').change(function() {
							if($(this).val() == "C"){
								$(".use_coupons_wp").show();
								$('#delivery_pay').hide();
								$('#delivery_pay_wp').hide();
							}else{
								$('#delivery_pay').show();
								payment_showing();
								$(".use_coupons_wp").hide();
							}
						})
						
						// 배송비 결제 방법 클릭시 이벤트
						$('input[name="delivery_payment"]').change(function() {
							payment_showing();
						})
						
						function payment_showing() {
							$('#delivery_pay_wp').show();
							let selectedId = "payment_" + $('input[name="delivery_payment"]:checked').data('id');
							$('div[id^="payment_"]').each(function() {
								if($(this).attr('id') == selectedId){
									$(this).show();
								}else{
									$(this).hide();
								}
							})
							if($('input[name="delivery_payment"]:checked').attr('id') == "phone_banking"){
								$('#delivery_pay_wp').hide();
							}else{
								$('#delivery_pay_wp').show();
							}
						}
						
						// 현금영수증 발급 방법 라디오버튼 이벤트
						$('input[name="cash_receipt"]').change(function() {
							$('#cash_receipt_view').show();
							let selectedContents = $(this).data('contents');
							$('div[id$="_contents"]').each(function() {
								if(selectedContents == $(this).attr('id')){
									$(this).show();
								}else{
									$(this).hide();
								}
							})
						})
						
						// 현금영수증 번호 구분 셀렉트박스 이벤트 
						$('.receipt_type_select').change(function() {
							let selectedType = $(this).find('option:selected').data('type');
							$(this).parent().parent().find('div.receipt_type').each(function() {
								if(selectedType == $(this).data('type')){
									$(this).addClass("on");
								}else{
									$(this).removeClass("on");
								}
							})
						})
						
					}) // $(function() End
				
					var payment_validation = function(){
						// 반품배송비 결제 방법 구분
				        let dlv_pay_type = "";
				        let payment = $('input[name="payment"]:checked').val();
				        let userFaultFlag = $('#SELECT_REASON option:selected').attr('class')=='userFault'?true:false;
						
				        if(userFaultFlag && payment == "B"){
					        if($('input[name="delivery_payment"]:checked').length == 0) {
					        	alert('결제 수단을 선택해 주세요');
					        	return false;
					        }
					        
					        let payment_method = $('input[name="delivery_payment"]:checked').val();
					        // 신용카드 선택시
					        if(payment_method == "C"){
					        	dlv_pay_type = "${Code.DLV_ADD_CAG_GBN_CARD}";
					        	if($('#card_gbn').val() == ""){
					        		alert("결제하실 카드를 선택해주세요.");
					        		return false;
					        	}else if($('#card_installment').val() == ""){
					        		alert("할부개월수를 선택해주세요.");
					        		return false;
					        	}
					        	
					        // 무통장입금 또는 실시간 계좌이체 선택시
					        }else if(payment_method == "Y" || payment_method == "R"){
					        	if(payment_method == "Y"){
					        		dlv_pay_type = "${Code.DLV_ADD_CAG_GBN_MUTONGJANG}";
					        	}else{
					        		dlv_pay_type = "${Code.DLV_ADD_CAG_GBN_TRANSFER}";
					        	}
					        	
					        	if($('input[name="cash_receipt"]:checked').length == 0){
					        		alert("현금영수증 발행 여부를 선택해주세요.");
					        		return;
					        	}else{
					        		let tagId = $('input[name="cash_receipt"]:checked').data('contents');
					        		let valid = true;
					       			$('#' + tagId).find('div.receipt_type.on input').each(function() {
										if($(this).val() == ""){
											alert("현금영수증 번호를 입력해주세요.");
											$(this).focus();
											valid = false;
											return false;
										}
									})
									if(!valid){
										return false;
									}
					        	}
					        	
					        /* // 실시간 계좌이체 선택시
					        }else if(payment_method == "R"){ */
					        	
					        // 휴대폰 결제 선택시
					        }else if(payment_method == "H"){
					        	dlv_pay_type = "${Code.DLV_ADD_CAG_GBN_PHONE}";
					        	
					        // 간편결제 선택시
					        }else if(payment_method == "S"){
					        	dlv_pay_type = "${Code.DLV_ADD_CAG_GBN_SIMPLE}";
					        	if($('input[name="rdo_simple"]:checked').length == 0){
					        		alert("간편결제 방법을 선택해주세요.");
					        		return false;
					        	}
					        }
				        }else if(userFaultFlag && payment == "C"){
				        	if("${fn:length(changeCouponList)}" == "0"){
				        		alert('사용 가능한 무료교환 쿠폰이 없습니다. 배송비 결제가 필요합니다.');
				        		return false;
				        	}
				        	dlv_pay_type = "${Code.DLV_ADD_CAG_GBN_COUPON}";
				        }
				        
				        if(userFaultFlag){
				        	dlv_pay_type = "${Code.DLV_ADD_CAG_GBN_SELLER}";
				        }
				        $('#ORD_PRD_DLV_ADD_CAG_GBN').val(dlv_pay_type);
				        return true;
					}
				</script>