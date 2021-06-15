<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 임시적용, 실적용X -->
<style>
.dim{display:block}
.layer{display:block;top:50%;left:50%;margin:-320px 0 0 -455px}
</style>
<!--//임시적용, 실적용X -->
<script type="text/javascript" src="/nas/cdn/pc/js/com.js"></script>

			<div class="sub_content">
				<div class="dim"></div>
				<div id="layer_delivery_change" class="layer type03" style="top:50%;left:50%;margin:-320px 0 0 -455px">
					<div class="layer_header">
						<h2>배송지 정보 변경</h2>
					</div>
					<div class="layer_content">
						<div class="stab_wrap delivery_wp">
							<ul class="stab delivery">
								<li class="on"><a class="dlv_btn" data-id="sameOrderDelivery"href="javascript:void(0);">주문자 정보와 동일</a></li>
								<li><a class="dlv_btn" data-id="recentDelivery" href="javascript:void(0);">최근 배송지</a></li>
								<li><a class="dlv_btn" data-id="myAddressBook"href="javascript:void(0);">나의 주소록</a></li>
								<li><a class="dlv_btn" data-id="newDelivery" href="javascript:void(0);">새로운 주소</a></li>
							</ul>
								
							<div class="tab_cont s_tab" id="sameOrderDelivery" style="display:block;">
								<form id="sameDeliveryForm" name="sameDeliveryForm">
									<div class="table_wrap">
										<p class="required_txt"><span>필수입력사항</span></p>
										<table class="tb_row">
											<caption>최근 배송지 정보 : 받으시는 분, 주소, 휴대폰 /전화번호, 판매자명 출력 표입니다.</caption>
											<colgroup>
												<col style="width:190px;">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">
														<span class="required">
															<em class="blind">필수 정보</em>
														</span> 받으시는 분
													</th>
													<td>
														<input type="text" data-target_dlv_id="ORD_DLV_NM" placeholder="이름 입력 " class="w100p same_dlv_0" value="<c:out value="${orderDeliveryInfo.ORD_DLV_NM }"/>"/>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<span class="required">
															<em class="blind">필수 정보</em>
														</span> 휴대폰 번호
													</th>
													<td>
														<span class="select">
															<select data-target_dlv_id="ORD_DLV_HP1" class="w132 same_dlv_0" >
																<c:if test="${not empty hpCodeList }">
																	<option value="">선택</option>
																	<c:forEach var="hpRow" items="${hpCodeList }">
																		<option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
																	</c:forEach>
																</c:if>
															</select>
														</span>
														<span class="hyphen">-</span>
														<input type="text" class="w132 same_dlv_0" data-target_dlv_id="ORD_DLV_HP2" placeholder="번호 입력"  maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }"/>"/>
														<span class="hyphen">-</span>
														<input type="text" class="w132 same_dlv_0" data-target_dlv_id="ORD_DLV_HP3" placeholder="번호 입력"  maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }"/>"/>
													</td>
												</tr>
												<tr>
													<th scope="row">전화번호</th>
													<td>
														<span class="select">
															<select data-target_dlv_id="ORD_DLV_TEL1" class="w132 same_dlv_0">
																<c:if test="${not empty telCodeList }">
																	<option value="">선택</option>
																	<c:forEach var="telRow" items="${telCodeList }">
																		<option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_TEL1 }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
																	</c:forEach>
																</c:if>
															</select>
														</span>
														<span class="hyphen">-</span>
														<input type="text" class="w132 same_dlv_0" data-target_dlv_id="ORD_DLV_TEL2" placeholder="번호 입력"  maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }"/>"/>
														<span class="hyphen">-</span>
														<input type="text" class="w132 same_dlv_0" data-target_dlv_id="ORD_DLV_TEL3" placeholder="번호 입력"  maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }"/>"/>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<span class="required">
															<em class="blind">필수 정보</em>
														</span> 주소
													</th>
													<td>
														<span class="block">
															<input type="text" data-target_dlv_id="ORD_DLV_ZIP_CDE5" placeholder="우편번호 입력" class="w305 same_dlv_0" maxlength="5" value="<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }"/>"/>
															<button id="zipCheck1" type="button" class="btn_large type03 ml8">우편번호 찾기</button>
														</span>
														<span class="block">
															<input type="text" data-target_dlv_id="ORD_DLV_DRO_ADR1" placeholder="도로명 주소 입력" class="w100p same_dlv_0" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }"/>"/>
														</span>
														<span class="block">
															<input type="text" data-target_dlv_id="ORD_DLV_JBN_ADR1" placeholder="지번 입력" class="w100p same_dlv_0" value="<c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }"/>"/>
														</span>
														<span class="block">
															<input type="text" data-target_dlv_id="ORD_DLV_DRO_ADR2" placeholder="이하 입력" class="w100p same_dlv_0" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }"/>"/>
														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</form>
								<div class="btn_wrap inr_btn">
									<a button class="btn_large ok" href="javascript:applyDlv('same');">선택 주소 사용</a>
								</div>
							</div>
							
							<div class="tab_cont s_tab" id="recentDelivery" style="display:none;">
								<ul class="ul_dot">
									<li>최근 배송지 중 주문에 사용할 배송지 정보를 선택해 주세요 (최대 5개까지 제공)</li>
								</ul>
								<div class="table_wrap inr_table">
									<table class="tb_col">
										<caption>최근 배송지 정보 : 받으시는 분, 주소, 휴대폰 /전화번호, 판매자명 출력 표입니다.</caption>
										<colgroup>
											<col style="width:140px;">
											<col>
											<col style="width:190px;">
											<col style="width:80px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">받으시는 분</th>
												<th scope="col">주소</th>
												<th scope="col">휴대폰/전화번호</th>
												<th scope="col">선택</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${not empty recentDlvList}">
													<c:forEach var="row" items="${recentDlvList}" varStatus="i" >
														<input type="hidden" data-target_dlv_id="ORD_DLV_NM" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_NM }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_ZIP_CDE5" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_ZIP_CDE5 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_DRO_ADR1 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_DRO_ADR2 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_JBN_ADR1 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_JBN_ADR2 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_HP1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP1 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_HP2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP2 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_HP3" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP3 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_TEL1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL1 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_TEL2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL2 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_TEL3" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL3 }"/>"/>
														<tr>
															<td><c:out value="${row.ORD_DLV_NM }"/></td>
															<td class="left">
																<ul class="txt_list">
																	<li>[<c:out value="${row.ORD_DLV_ZIP_CDE5 }"/>]</li>
																	<li><c:out value="${row.ORD_DLV_DRO_ADR1 }"/><c:out value="${row.ORD_DLV_DRO_ADR2 }"/></li>
																	<li><c:out value="${row.ORD_DLV_JBN_ADR1 }"/><c:out value="${row.ORD_DLV_JBN_ADR2 }"/></li>
																</ul>
															</td>
															<td class="left">
																<ul class="txt_list">
																	<li><c:out value="${row.ORD_DLV_HP1 }"/>-<c:out value="${row.ORD_DLV_HP1 }"/>-<c:out value="${row.ORD_DLV_HP1 }"/></li>
																	<li><c:out value="${row.ORD_DLV_TEL1 }"/>-<c:out value="${row.ORD_DLV_TEL1 }"/>-<c:out value="${row.ORD_DLV_TEL1 }"/></li>
																</ul>
															</td>
															<td>
																<input type="radio" id="recentDlvRadio_${i.index }" name="recent_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if>>
																<label for="recentDlvRadio_${i.index }" class="only"><span class="icon"></span><span class="blind">선택</span></label>
															</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
		                                                <td colspan="4">최근 배송지가 없습니다.</td>
		                                            </tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
								<c:if test="${not empty recentDlvList}">
								<div class="btn_wrap inr_btn">
									<button class="btn_large ok" onclick="applyDlv('recent')">선택 주소 사용</button>
								</div>
								</c:if>
							</div>
							
							<div class="tab_cont s_tab" id="myAddressBook" style="display:none;">
								<ul class="ul_dot">
									<li>배송을 원하는 주소를 선택하시면 주문서에 자동 입력됩니다.</li>
									<li>나의 주소록에는 최대 10개 까지 주소 등록이 가능하며, <strong class="black">마이페이지 > 배송지관리</strong>에서 등록/수정 가능합니다.</li>
								</ul>
								<div class="table_wrap inr_table">
									<table class="tb_col">
										<caption>주소 정보 : 받으시는 분, 주소, 휴대폰 /전화번호, 판매자명 출력 표입니다.</caption>
										<colgroup>
											<col style="width:140px;">
											<col>
											<col style="width:190px;">
											<col style="width:80px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">받으시는 분</th>
												<th scope="col">주소</th>
												<th scope="col">휴대폰/전화번호</th>
												<th scope="col">선택</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${not empty myDlvList}">
													<c:forEach var="row" items="${myDlvList}" varStatus="i" >
														<input type="hidden" data-target_dlv_id="ORD_DLV_NM" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_RCV_NM }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_ZIP_CDE5" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_DRO_ADR1 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_DRO_ADR2 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_JBN_ADR1 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_JBN_ADR2 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_HP1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP1 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_HP2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP2 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_HP3" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP3 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_TEL1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL1 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_TEL2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL2 }"/>"/>
														<input type="hidden" data-target_dlv_id="ORD_DLV_TEL3" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL3 }"/>"/>
														<tr>
															<td><c:out value="${row.MEM_DLV_NM }"/></td>
															<td class="left">
																<ul class="txt_list">
																	<li>[<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>]</li>
																	<li><c:out value="${row.MEM_DLV_DRO_ADR1 }"/><c:out value="${row.MEM_DLV_DRO_ADR2 }"/></li>
																	<li><c:out value="${row.MEM_DLV_JBN_ADR1 }"/><c:out value="${row.MEM_DLV_JBN_ADR2 }"/></li>
																</ul>
															</td>
															<td class="left">
																<ul class="txt_list">
																	<li><c:out value="${row.MEM_DLV_HP1 }"/>-<c:out value="${row.MEM_DLV_HP2 }"/>-<c:out value="${row.MEM_DLV_HP3 }"/></li>
																	<li><c:out value="${row.MEM_DLV_TEL1 }"/>-<c:out value="${row.MEM_DLV_TEL2 }"/>-<c:out value="${row.MEM_DLV_TEL3 }"/></li>
																</ul>
															</td>
															<td>
																<input type="radio" id="myDlvRadio_${i.index }" name="my_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if>>
																<label for="myDlvRadio_${i.index }" class="only"><span class="icon"></span><span class="blind">선택</span></label>
															</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
		                                                <td colspan="4">나의 주소록이 없습니다.</td>
		                                            </tr>
												</c:otherwise>
											</c:choose>	
										</tbody>
									</table>
								</div>
								<c:if test="${not empty myDlvList}">
								<div class="btn_wrap inr_btn">
									<button type="button" onclick="location.href ='<c:out value="${frontDomain }" />/pc/mypage/myDeliveList.do'" class="btn_large">추가 배송지 등록</button>
									<button type="button" onclick="applyDlv('my');" class="btn_large ok">선택 주소 사용</button>
								</div>
								</c:if>
							</div>
							
							<div class="tab_cont s_tab" id="newDelivery" style="display:none;">
								<form id="dlvFrm" name="dlvFrm">
									<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD }"/>"/>
									
									<div class="table_wrap">
										<p class="required_txt"><span>필수입력사항</span></p>
										<table class="tb_row">
											<caption>최근 배송지 정보 : 받으시는 분, 주소, 휴대폰 /전화번호, 판매자명 출력 표입니다.</caption>
											<colgroup>
												<col style="width:190px;">
												<col>
											</colgroup>
											<tbody id="tbodyAddr">
												<tr>
													<th scope="row">
														<span class="required">
															<em class="blind">필수 정보</em>
														</span> 받으시는 분
													</th>
													<td>
														<input type="text" id="ORD_DLV_NM" name="ORD_DLV_NM" placeholder="이름 입력 " class="w100p" value="">
													</td>
												</tr>
												<tr>
													<th scope="row">
														<span class="required">
															<em class="blind">필수 정보</em>
														</span> 휴대폰 번호
													</th>
													<td>
														<span class="select">
															<select id="ORD_DLV_HP1" name="ORD_DLV_HP1" class="w132" >
																<c:if test="${not empty hpCodeList}">
																	<option value="">선택</option>
																	<c:forEach var="hpRow" items="${hpCodeList }">
																		<option value='<c:out value="${hpRow.CMN_COM_NM }" />' <c:if test="${hpRow.CMN_COM_NM eq row.MEM_DLV_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }" /></option>
																	</c:forEach>
																</c:if>
															</select>
														</span>
														<span class="hyphen">-</span>
														<input type="text" class="w132" id="ORD_DLV_HP2" name="ORD_DLV_HP2" placeholder="번호 입력"  maxlength="4" value="">
														<span class="hyphen">-</span>
														<input type="text" class="w132" id="ORD_DLV_HP3" name="ORD_DLV_HP3" placeholder="번호 입력"  maxlength="4" value="">
													</td>
												</tr>
												<tr>
													<th scope="row">전화번호</th>
													<td>
														<span class="select">
															<select id="ORD_DLV_TEL1" name="ORD_DLV_TEL1" class="w132">
																<c:if test="${not empty telCodeList }">
																	<option value="">선택</option>
																	<c:forEach var="telRow" items="${telCodeList }">
																		<option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_TEL1 }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
																	</c:forEach>
																</c:if>
															</select>
														</span>
														<span class="hyphen">-</span>
														<input type="text" class="w132" id="ORD_DLV_TEL2" name="ORD_DLV_TEL2" placeholder="번호 입력"  maxlength="4" value="">
														<span class="hyphen">-</span>
														<input type="text" class="w132" id="ORD_DLV_TEL3" name="ORD_DLV_TEL3" placeholder="번호 입력"  maxlength="4" value="">
													</td>
												</tr>
												<tr>
													<th scope="row">
														<span class="required">
															<em class="blind">필수 정보</em>
														</span> 주소
													</th>
													<td>
														<span class="block">
															<input type="text" id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" placeholder="우편번호 입력" class="w305" maxlength="5" value="">
															<button id="zipCheck2" type="button" class="btn_large type03 ml8">우편번호 찾기</button>
														</span>
														<span class="block">
															<input type="text" id="ORD_DLV_DRO_ADR1" name="ORD_DLV_DRO_ADR1" placeholder="도로명 주소 입력" class="w100p" value="">
														</span>
														<span class="block">
															<input type="text" id="ORD_DLV_JBN_ADR1" name="ORD_DLV_JBN_ADR1" placeholder="지번 입력" class="w100p" value="">
														</span>
														<span class="block">
															<input type="text" id="ORD_DLV_DRO_ADR2" name="ORD_DLV_DRO_ADR2" placeholder="이하 입력" class="w100p" value="">
														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="btn_wrap inr_btn">
										<a button class="btn_large ok" href="javascript:goSubmit();">저장</a>
									</div>
								</form>
							</div>
						</div>
					</div>
					<a href="javascript:void(0)" class="btn_layer_close"  onclick="hideModalFn();">레이어 닫기</a>
				</div>
			</div>
		
	<!--// Content -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('ORD_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('ORD_DLV_DRO_ADR1').value = fullRoadAddr;
	            document.getElementById('ORD_DLV_JBN_ADR1').value = data.jibunAddress;
				
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            /*
	            if(data.autoRoadAddress) {
	                //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                console.log('(예상 도로명 주소 : ' + expRoadAddr + ')')
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById('guide').innerHTML = ;
	                console.log('(예상 지번 주소 : ' + expJibunAddr + ')')
	
	            } else {
	                document.getElementById('guide').innerHTML = '';
	            }
	            */
	        }
	    }).open();
	}
	
	$(document).on("click","#zipCheck1",execDaumPostcode);
	$(document).on("click","#zipCheck2",execDaumPostcode);
</script>
<script>
	//폼체크
	$("#dlvFrm").validate({
        rules: {
        	//ORD_DLV_TEL1:{required:true},	
        	ORD_DLV_TEL2:{number:true, maxlength:4}, 
        	ORD_DLV_TEL3:{number:true, maxlength:4}, 
        	ORD_DLV_HP1:{required:{depends:function(){
                if($("#ORD_DLV_HP2").val() != "" || $("#ORD_DLV_HP3").val() != ""){
               	 return true;
                }else{
               	 return false;
                }	 
	        }}},
	        ORD_DLV_HP2:{required:{depends:function(){
                 if($("#ORD_DLV_HP1").val() != "" || $("#ORD_DLV_HP3").val() != ""){
                	 return true;
                 }else{
                	 return false;
                 }	 
 	        }}, number:true, minlength:3, maxlength:4}, 
 	       ORD_DLV_HP3:{required:{depends:function(){
               if($("#ORD_DLV_HP1").val() != "" || $("#ORD_DLV_HP2").val() != ""){
              	 return true;
               }else{
              	 return false;
               }	 
	        }}, number:true, minlength:4, maxlength:4},
        	ORD_DLV_ZIP_CDE5:{required:true, number:true}, // 우편번호
        	ORD_DLV_DRO_ADR1:{required:true}, // 도로명 본주소
        	ORD_DLV_DRO_ADR2:{required:true}, // 도로명 상세주소
        	ORD_DLV_JBN_ADR1:{required:true} // 지번 본주소
        },
        messages :{
        	//ORD_DLV_TEL1: {required:"수령자 전화 번호 첫자리를 입력해주십시오."},
        	ORD_DLV_TEL2: {required:"수령자 전화 번호 중간자리를 입력해주십시오." , maxlength:"[수령자 전화 번호 중간자리]최대 4글자입니다."},
        	ORD_DLV_TEL3: {required:"수령자 전화 번호 끝자리를 입력해주십시오." , maxlength:"[수령자 전화 번호 끝자리]최대 4글자입니다."},
            ORD_DLV_HP1: {required:"수령자 휴대폰 번호 첫자리를 입력해주십시오."},
        	ORD_DLV_HP2: {required:"수령자 휴대폰 번호 중간자리를 입력해주십시오." ,minlength:"[수령자 휴대폰 번호 중간자리]최소 3글자 이상입니다." , maxlength:"[수령자 휴대폰 번호 중간자리]최대 4글자입니다."},
        	ORD_DLV_HP3: {required:"수령자 휴대폰 번호 끝자리를 입력해주십시오." ,minlength:"[수령자 휴대폰 번호 끝자리]최소 4글자 이상입니다." , maxlength:"[수령자 휴대폰 번호 끝자리]최대 4글자입니다."},
        	ORD_DLV_ZIP_CDE5: {required:"[우편번호]필수 정보입니다."},
        	ORD_DLV_DRO_ADR1: {required:"[도로명주소]필수 정보입니다."},
        	ORD_DLV_DRO_ADR2: {required:"[도로명 상세주소]필수 정보입니다."},
        	ORD_DLV_JBN_ADR1: {required:"[지번주소]필수 정보입니다."}
        }
      	//,ignore: ":hidden"
        ,onkeyup:false
	    ,onclick:false
	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
	    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
	    	   //alert('[' + caption + '] ' + errorList[0].message);
	    	   var errorOobjId = $(errorList[0].element).attr('id');
	    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
	    	   caption = caption.replace('*','').replace(/\s/gi,'');
	    	   if(caption != null && caption != "") 
	    	   {
	    	       alert('[' + caption + '] ' + errorList[0].message);
	    	   }
	    	   else
	    	   {
	    	       alert(errorList[0].message);
	    	   }
	    	   $(errorList[0].element).focus();
	       }
	   }
    });
	
	//레이어 닫기
	function hideModalFn(){
		$("#deliveryModifyPop").hide();
		$(".dim").hide();				
	}
	
	//선택한 배송지 적용
	function applyDlv(dlv_type){
		
		if(dlv_type == "same"){
			var radio_idx = "0";
		}else{
			var radio_idx = $("input[name="+ dlv_type +"_dlv_radio]:checked").val();
		}
		
		$("."+ dlv_type +"_dlv_"+radio_idx).each(function(i, item){
			var target_dlv_id = $(this).data("target_dlv_id");
			$("#"+target_dlv_id).val($(this).val());
			if($("#"+target_dlv_id).is("select")){
// 				var param = $(this).val() == '' ? 'reset' : 'chg';
// 				com.sel_chg($("#"+target_dlv_id), param);
				var param = $(this).val()
				$("#"+target_dlv_id).each(function(param){
					if($(this).val().indexOf(param)){
						$(this).prop("selected", true);
					}
				})
			}
		});
		
		goSubmit();
		
// 		$("#div_"+ dlv_type +"_dlv_list").hide();
// 		$("#ul_dlv_btn").addClass("not");
// 		$(".dlv_btn").parent("li").removeClass("active");
	};
	
	// 배송지 수정
	goSubmit = function(){
		if($("#dlvFrm").valid()){
			if(confirm("배송지 정보를 수정하시겠습니까?")){
				var ORD_MST_CD = "${commandMap.ORD_MST_CD}"; //주문번호
				var ORD_DLV_ZIP_CDE5 = $("#ORD_DLV_ZIP_CDE5").val(); //새로운 우편번호
				
				$.ajax({
					type:"post",
					url : "<c:out value="${serverSslDomain}" />/pc/cart/orderDeliveryModifyProcAjax.do",
					data : $("#dlvFrm").serialize(),
					dataType : "json",
					async : false,
					success : function(data){
						//result가 0이상인 경우에만 성공
						if(data.result > 0){
							alert("수정되었습니다.");
							
							var dlv_nm = $("#ORD_DLV_NM").val();
							var hp = $("#ORD_DLV_HP1").val() + "-" + $("#ORD_DLV_HP2").val() + "-" + $("#ORD_DLV_HP3").val();
							var tel = $("#ORD_DLV_TEL1").val() + "-" + $("#ORD_DLV_TEL2").val() + "-" + $("#ORD_DLV_TEL3").val();
							var dro = "["+ ORD_DLV_ZIP_CDE5 + "] "+ $("#ORD_DLV_DRO_ADR1").val() + ", " + $("#ORD_DLV_DRO_ADR2").val() + "<br>";
							var jbn = "["+ ORD_DLV_ZIP_CDE5 + "] "+ $("#ORD_DLV_JBN_ADR1").val() + ", " + $("#ORD_DLV_DRO_ADR2").val();
							var desc = $("#ORD_DLV_MSG").val();
							
							$("#td_dlv_nm").html(dlv_nm);
							$("#td_hp").html(hp);
							$("#td_tel").html(tel);
							$("#td_dro").html(dro);
							$("#td_jbn").html(jbn);
							$("#td_desc").html(desc);
							
							hideModalFn();
						}else{
							alert(data.resultMsg);
						}
					},
					error : function(err){
						alert("오류가 발생하였습니다.\n[" + err.status + "]");
					}
				});
			}
		}
	};
	
	//새로운 주소 체크시
	clearInputValue = function(){
		$("#tbodyAddr").find("input").val("");
		$("#tbodyAddr").find("select").val("");
	}
	
	//배송지 변경 탭 이벤트
	$('.dlv_btn').on('click', function() {
		var tabid = $(this).data().id;
		changeTabClickUi(tabid);
	});
	
	changeTabClickUi = function(id){
		if(id == "newDelivery"){
			clearInputValue();
		}
		
		$(".tab_cont.s_tab").css("display", "none");
		$(".stab.delivery").children().removeClass("on");
		$("#"+id).css("display", "block");
		$("a[data-id='"+id+"']").parent().addClass("on");
	}

</script>
