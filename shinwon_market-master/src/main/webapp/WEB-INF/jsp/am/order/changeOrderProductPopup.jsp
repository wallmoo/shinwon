<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">

            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>${title }</span></h3>
            </div><!-- // push-guide -->

            <form name="frm" id="frm">
				<!-- 기존상품 정보 시작 -->
				<input type="hidden" name="ORD_PRD_ORG_IDX" value="<c:out value="${commandMap.ORD_PRD_IDX}"/>"/><!-- 기존상품 ORD_PRD_IDX -->
				<input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/><!-- 주문번호 -->
				<input type="hidden" name="ORD_PRD_MST_CD" value="<c:out value=""/>"/><!-- 주문상품 ORD_PRD_MST_CD -->
				<input type="hidden" name="ORD_MST_ORD_NM" value="<c:out value="${orderInfo.ORD_MST_ORD_NM}"/>"/><!-- 주문자 이름 -->
				<input type="hidden" name="ORD_MST_MAIL" value="<c:out value="${orderInfo.ORD_MST_MAIL}"/>"/><!-- 주문자 email -->
				<input type="hidden" name="ORD_MST_ORD_ID" value="<c:out value="${orderInfo.ORD_MST_ORD_ID}"/>"/><!-- 주문자 아이디 -->

	        	<h4 class="title"><span>교환상품</span></h4>

		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 10%;" />
                        <col style="width: 15%;" />
						<col style="width: auto%;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
		            </colgroup>
		            <thead>
						<tr>
							<th><span>상품유형</span></th>
                            <th><span>이미지</span></th>
							<th><span>상품/옵션정보</span></th>
							<th><span>수량</span></th>
							<th><span>교환사이즈</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${changeOrderProductInfo }" var="product">
						<tr>
							<td style="text-align:center;"><c:out value="${product.PRD_MST_TYPE eq 'G' ? '일반' : '패키지'}" /></td>
                            <td><span class="thumbnail_img"><img src="${cdnDomain}${product.PRODUCT_THUM_IMG}"></span></td>
							<td style="text-align:left;">
								<c:choose>
									<c:when test="${product.ORD_PRD_OPT_DTL_IDX gt 0}">
										<c:if test="${not empty product.OPT_DTL_ERP_CD}">
											<span class="name"><c:out value="${product.OPT_DTL_ERP_CD}"/></span>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if test="${not empty product.PRD_MST_ERP_CD}">
											<span class="name"><c:out value="${product.PRD_MST_ERP_CD}"/></span>
										</c:if>
									</c:otherwise>
								</c:choose>
                                <span class="block name">${product.PRD_MST_NM }</span>
                                <span class="block desc">(${product.ORD_PRD_MST_CD })</span>
                                <span class="block size">${product.OPT_DTL_NM }</span>
							</td>
							<td style="text-align:center;"><fmt:formatNumber value="${product.ORD_PRD_ORD_CNT}" type="number"/></td>
							<td>
                                <c:if test="${commandMap.STATE eq Code.OST_SWAP }">
                                <select class="select" name="ORD_PRD_SIZE">
                                	<c:forEach var="data" items="${product.sizeList}">
										<option value="${data.CMN_COM_IDX}" ${data.CMN_COM_IDX eq product.ORD_PRD_SIZE ? 'selected' : ''}>${data.CMN_COM_NM}</option>
									</c:forEach>
                                </select>
                                </c:if>
                                <c:if test="${commandMap.STATE ne Code.OST_SWAP }">
                                	<c:set var="ok"></c:set>
                                	<c:forEach var="data" items="${product.sizeList}">
										<c:if test="${data.CMN_COM_IDX eq product.ORD_PRD_SIZE and ok ne 'ok'}">
											${data.CMN_COM_NM}
											<c:set var="ok">ok</c:set>
										</c:if>
									</c:forEach>
                                </c:if>
                            </td>
						</tr>
						</c:forEach>
					</tbody>
	        	</table><!-- // table -->

	    		<h4 class="title"><span>교환사유</span></h4>

		    	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 30%;" />
						<col style="width: auto;" />
		            </colgroup>
					<tbody>
						<tr>
							<th><span>사유</span></th>
							<td style="text-align : left;">
								<c:if test="${commandMap.STATE eq Code.OST_SWAP }">
			                        <select id="SELECT_REASON" name="SELECT_REASON" class="select large">
										<option value="">교환사유를 선택해 주세요.</option>
										<c:forEach var="data" items="${codes.ORDER_CANCEL_RETURN_REASON}">
											<option value="<c:out value="${data.CMN_COM_IDX }" />"><c:out value="${data.CMN_COM_NM }" /></option>
										</c:forEach>
									</select>
								</c:if>
								<c:if test="${commandMap.STATE ne Code.OST_SWAP }">
									${backInfo.BACK_REASON }
								</c:if>
							</td>
						</tr>
						<tr>
							<th><span>상세사유</span></th>
							<td style="text-align : left;">
								<c:if test="${commandMap.STATE eq Code.OST_SWAP }">
									<textarea class="textarea xlarge" name="ORD_PRD_DSC" id="ORD_PRD_DSC" rows="5" col="30" placeholder="200자 이내로 입력하세요" maxlength="200"></textarea>
								</c:if>
								<c:if test="${commandMap.STATE ne Code.OST_SWAP }">
									${backInfo.BACK_REASON_DSC }
								</c:if>
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->

                <h4 class="title"><span>교환정보</span></h4>

                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>

		    	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
						<col style="width: auto;" />
		            </colgroup>
					<tbody>
						<tr>
							<th><span>교환방법</span></th>
							<td>
								<c:if test="${commandMap.STATE ne Code.OST_SWAP }"><c:set var="editable">disabled</c:set></c:if>
		                        <input type="radio" name="changeProduct" id="changeProduct1" ${editable } value="A" ${backInfo.dlv_pay_way_A }>
                                <label for="changeProduct1">자동 수거</label>
                                <input type="radio" name="changeProduct" id="changeProduct2" ${editable } value="B" ${backInfo.dlv_pay_way_B }>
                                <label for="changeProduct2">직접 발송</label>
                                <input type="radio" name="changeProduct" id="changeProduct3" ${editable } value="C" ${backInfo.dlv_pay_way_C }>
                                <label for="changeProduct3">이미 발송</label>
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->

                <!-- 자동수거 -->
                <table cellspacing="0" class="table-row table-a mt10 autoDelivery" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
						<col style="width: auto;" />
                        <col style="width: 15%;" />
						<col style="width: auto;" />
                        <col style="width: 15%;" />
						<col style="width: auto;" />
		            </colgroup>
                    <thead>
                        <tr>
                            <th style="background:#e7e7e7"><span>반품 수거지</span></th>
                            <td colspan="5" style="background:#e7e7e7">
                                <div class="grid section-button-search text-right"><!-- 검색 하단 버튼 -->
                                	<c:if test="${commandMap.STATE eq Code.OST_SWAP }">
                	                	<a href="#none" class="button button-a changeBtn address_info2"><span>수거지 변경</span></a>
                	                </c:if>
                				</div>
                            </td>
                        </tr>
                    </thead>
					<tbody>
                        <tr>
                        	<c:if test="${commandMap.STATE eq Code.OST_SWAP }">
								<th><span>수령인<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<input type="text" name="P_ORD_DLV_NM" value="${postInfo.ORD_DLV_NM}" placeholder="수령인 입력">
			                    </td>
	                            <th style="width:38px;"><span>휴대폰<i class="require"><em>필수입력</em></i></span></th>
								<td>
			                        <input type="text" name="P_ORD_DLV_HP1" value="${postInfo.ORD_DLV_HP1}" maxlength=3 style="width:33px;">-
			                        <input type="text" name="P_ORD_DLV_HP2" value="${postInfo.ORD_DLV_HP2}" maxlength=4 style="width:38px;">-
			                        <input type="text" name="P_ORD_DLV_HP3" value="${postInfo.ORD_DLV_HP3}" maxlength=4 style="width:38px;">
								</td>
	                            <th style="width:38px;"><span>전화번호</span></th>
								<td>
	                                <input type="text" name="P_ORD_DLV_TEL1" value="${postInfo.ORD_DLV_TEL1}" maxlength=3 style="width:33px;">-
			                        <input type="text" name="P_ORD_DLV_TEL2" value="${postInfo.ORD_DLV_TEL2}" maxlength=4 style="width:38px;">-
			                        <input type="text" name="P_ORD_DLV_TEL3" value="${postInfo.ORD_DLV_TEL3}" maxlength=4 style="width:38px;">
								</td>
							</c:if>
							<c:if test="${commandMap.STATE ne Code.OST_SWAP }">
								<th><span>수령인<i class="require"><em>필수입력</em></i></span></th>
								<td>${postInfo.ORD_DLV_NM}</td>
	                            <th style="width:38px;"><span>휴대폰<i class="require"><em>필수입력</em></i></span></th>
								<td>${postInfo.ORD_DLV_HP1}-${postInfo.ORD_DLV_HP2}-${postInfo.ORD_DLV_HP3}</td>
	                            <th style="width:38px;"><span>전화번호</span></th>
								<td>${postInfo.ORD_DLV_TEL1}-${postInfo.ORD_DLV_TEL2}-${postInfo.ORD_DLV_TEL3}</td>
								
								<input type="hidden" name="P_ORD_DLV_NM" value="${postInfo.ORD_DLV_NM}">
								<input type="hidden" name="P_ORD_DLV_HP1" value="${postInfo.ORD_DLV_HP1}">
		                        <input type="hidden" name="P_ORD_DLV_HP2" value="${postInfo.ORD_DLV_HP2}">
		                        <input type="hidden" name="P_ORD_DLV_HP3" value="${postInfo.ORD_DLV_HP3}">
		                        <input type="hidden" name="P_ORD_DLV_TEL1" value="${postInfo.ORD_DLV_TEL1}">
		                        <input type="hidden" name="P_ORD_DLV_TEL2" value="${postInfo.ORD_DLV_TEL2}">
		                        <input type="hidden" name="P_ORD_DLV_TEL3" value="${postInfo.ORD_DLV_TEL3}">
							</c:if>
						</tr>
                        <tr>
                        	<c:if test="${commandMap.STATE eq Code.OST_SWAP }">
								<th><span>배송지 주소<i class="require"><em>필수입력</em></i></span></th>
								<td colspan="5" class="address_info_wrapper2">
	                            <span class="block">
								<input type="text" name="P_ORD_DLV_ZIP_CDE5" value="${postInfo.ORD_DLV_ZIP_CDE5}" placeholder="우편번호 입력" class="postcode2">
								</span>
								<span class="block">
								<input type="text" name="P_ORD_DLV_DRO_ADR1" value="${postInfo.ORD_DLV_DRO_ADR1}" placeholder="도로명 주소 입력" class="road_addr2" style="width:600px;">
								</span>
								<span class="block">
								<input type="text" name="P_ORD_DLV_JBN_ADR1" value="${postInfo.ORD_DLV_JBN_ADR1}" placeholder="지번 입력" class="jibun_addr2" style="width:600px;">
								</span>
								<span class="block">
								<input type="text" name="P_ORD_DLV_DRO_ADR2" value="${postInfo.ORD_DLV_DRO_ADR2}" placeholder="이하 입력" class="etc_addr2" style="width:600px;">
								</span>
								</td>
							</c:if>
							<c:if test="${commandMap.STATE ne Code.OST_SWAP }">
								<th><span>배송지 주소<i class="require"><em>필수입력</em></i></span></th>
								<td colspan="5" class="address_info_wrapper2">
		                            <span class="block">${postInfo.ORD_DLV_ZIP_CDE5}</span>
									<span class="block">${postInfo.ORD_DLV_DRO_ADR1}</span>
									<span class="block">${postInfo.ORD_DLV_JBN_ADR1}</span>
									<span class="block">${postInfo.ORD_DLV_DRO_ADR2}</span>
								</td>
								<input type="hidden" name="P_ORD_DLV_ZIP_CDE5" value="${postInfo.ORD_DLV_ZIP_CDE5}">
								<input type="hidden" name="P_ORD_DLV_DRO_ADR1" value="${postInfo.ORD_DLV_DRO_ADR1}">
								<input type="hidden" name="P_ORD_DLV_JBN_ADR1" value="${postInfo.ORD_DLV_JBN_ADR1}">
								<input type="hidden" name="P_ORD_DLV_DRO_ADR2" value="${postInfo.ORD_DLV_DRO_ADR2}">
							</c:if>
						</tr>
                        <tr>
							<th><span>배송메모</span></th>
							<td colspan="5">
								<c:if test="${commandMap.STATE eq Code.OST_SWAP }">
									<input type="text" name="P_ORD_DLV_MSG" value="${postInfo.ORD_DLV_MSG}" placeholder="배송메모 입력" style="width:600px;">
								</c:if>
								<c:if test="${commandMap.STATE ne Code.OST_SWAP }">
									${postInfo.ORD_DLV_MSG}
								</c:if>
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->
                <%-- //자동수거 --%>

                <!-- 직접 발송, 이미 발송 -->
                <table cellspacing="0" class="table-row table-a mt10 deliveryTbl" style="margin-bottom: 0; display:none;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
						<col style="width: auto;" />
		            </colgroup>
                    <thead>
                        <tr>
                            <th style="background:#e7e7e7"><span class="deliveryTit">반품지 정보</span></th>
                            <td colspan="5" style="background:#e7e7e7">
                                <div class="grid section-button-search text-right"><!-- 검색 하단 버튼 -->
                                	<c:if test="${commandMap.STATE eq Code.OST_SWAP }">
                	                	<a href="#none" class="button button-a changeBtn"><span>수거지 변경</span></a>
                	                </c:if>
                				</div>
                            </td>
                        </tr>
                    </thead>
					<tbody>
                        <tr class="selfDelivery">
							<th><span>판매자 정보</span></th>
							<td>신원 / 서울 마포구 독막로 328(도화동) / 1661-2585</td>
						</tr>
                        <tr>
							<th><span>택배사/송장번호</span></th>
							<td colspan="5">
                                <select class="select" name=ORD_PKU_DLV_CPN_IDX>
                                	<c:forEach var="data" items="${dlvCpnList}">
										<option value="<c:out value="${data.DLV_CPN_IDX }" />"><c:out value="${data.DLV_CPN_NM }" /></option>
									</c:forEach>
                                </select>
                                <input type="text" class="text" name="ORD_PRD_PKU_IVC_NO">
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->
                <%-- //직접 발송, 이미 발송--%>

                <table cellspacing="0" class="table-row table-a mt10" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
						<col style="width: auto;" />
                        <col style="width: 15%;" />
						<col style="width: auto;" />
                        <col style="width: 15%;" />
						<col style="width: auto;" />
		            </colgroup>
                    <thead>
                        <tr>
                            <th style="background:#e7e7e7"><span>교환 배송지</span></th>
                            <td colspan="5" style="background:#e7e7e7">
                                <div class="grid section-button-search text-right"><!-- 검색 하단 버튼 -->
                                	<c:if test="${commandMap.STATE eq Code.OST_SWAP }">
                	                	<a href="" class="button button-a address_info"><span>배송지 변경</span></a>
                	                </c:if>
                				</div>
                            </td>
                        </tr>
                    </thead>
					<tbody>
						<tr>
							<th><span>수령인<i class="require"><em>필수입력</em></i></span></th>
							<td>
		                        <input type="text" name="ORD_DLV_NM" value="${postInfo.ORD_DLV_NM}" placeholder="수령인 입력"> 
							</td>
                            <th><span>휴대폰<i class="require"><em>필수입력</em></i></span></th>
							<td>
		                        <input type="text" name="ORD_DLV_HP1" value="${postInfo.ORD_DLV_HP1}" maxlength=3 style="width:33px;">-
		                        <input type="text" name="ORD_DLV_HP2" value="${postInfo.ORD_DLV_HP2}" maxlength=4 style="width:38px;">-
		                        <input type="text" name="ORD_DLV_HP3" value="${postInfo.ORD_DLV_HP3}" maxlength=4 style="width:38px;">
							</td>
                            <th><span>전화번호</span></th>
							<td>
                                <input type="text" name="ORD_DLV_TEL1" value="${postInfo.ORD_DLV_TEL1}" maxlength=3 style="width:33px;">-
		                        <input type="text" name="ORD_DLV_TEL2" value="${postInfo.ORD_DLV_TEL2}" maxlength=4 style="width:38px;">-
		                        <input type="text" name="ORD_DLV_TEL3" value="${postInfo.ORD_DLV_TEL3}" maxlength=4 style="width:38px;">
							</td>
						</tr>
                        <tr>
							<th><span>배송지 주소<i class="require"><em>필수입력</em></i></span></th>
							<td colspan="5" class="address_info_wrapper">
							<span class="block">
							<input type="text" name="ORD_DLV_ZIP_CDE5" value="${postInfo.ORD_DLV_ZIP_CDE5}" placeholder="우편번호 입력" class="postcode">
							</span>
							<span class="block">
							<input type="text" name="ORD_DLV_DRO_ADR1" value="${postInfo.ORD_DLV_DRO_ADR1}" placeholder="도로명 주소 입력" class="road_addr" style="width:600px;">
							</span>
							<span class="block">
							<input type="text" name="ORD_DLV_JBN_ADR1" value="${postInfo.ORD_DLV_JBN_ADR1}" placeholder="지번 입력" class="jibun_addr" style="width:600px;">
							</span>
							<span class="block">
							<input type="text" name="ORD_DLV_DRO_ADR2" value="${postInfo.ORD_DLV_DRO_ADR2}" placeholder="이하 입력" class="etc_addr" style="width:600px;">
							</span>
							</td>
						</tr>
                        <tr>
							<th><span>배송메모</span></th>
							<td colspan="5">
								<input type="text" name="ORD_DLV_MSG" value="${postInfo.ORD_DLV_MSG}" placeholder="배송메모 입력" style="width:600px;">
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->

                <h4 class="title"><span>교환 배송비</span></h4>

                <table cellspacing="0" class="table-row table-a mt10" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 20%;" />
						<col style="width: auto;" />
                        <col style="width: 20%;" />
						<col style="width: auto;" />
		            </colgroup>
					<tbody>
						<tr>
							<th><span>귀책자</span></th>
							<td id="fault">구매자 책임</td>
							<th><span>고객부담 택배비</span></th>
							<td>
		                        <input type="text" id="customerDelevery" name="ORD_PRD_DLV_ADD_CAG" class="text large"> 원
							</td>
						</tr>
                        <tr id="returnDeleveryPayTypeSelector">
							<th><span>택배비 결제방법</span></th>
							<td colspan="3">
                                <div>
                                    <input type="radio" name="DLV_PAY_WAY" id="delivery1" value="D" data-fee="5000">
                                    <label for="delivery1">동봉(5,000원)</label>
                                    <input type="radio" name="DLV_PAY_WAY" id="delivery2" value="S" data-fee="2500">
                                    <label for="delivery2">선불+2,500원</label>
                                    <input type="radio" name="DLV_PAY_WAY" id="delivery3" value="T" data-fee="5000">
                                    <label for="delivery3">계좌이체(5,000원)</label>
                                    <input type="radio" name="DLV_PAY_WAY" id="delivery4" value="E" data-fee="0">
                                    <label for="delivery4">기타면제</label>
                                </div>
		                        <input type="text" name="DLV_PAY_WAY_MEMO" class="text xlarge mt10">
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->
		    </form>

		    <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
            		<a href="javascript:self.close();" id="goList" class="button button-a"><span>취소</span></a>
                </div>
            </div><!-- // section-button -->
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.blockUI.js"></script>
<script type="text/javascript">
$(function(){
	
	$(document).on("change", "#SELECT_REASON", function(){
	   	 var userFaultFlag = $('#SELECT_REASON option:selected').attr('class')=='userFault'?true:false;
	   	 if(userFaultFlag){
	   		 $('#fault').text('구매자 책임');
	   		 $('#returnDeleveryPayTypeSelector').show();
	   		 $('#customerDelevery').val('');
	   		 $('#customerDelevery').removeAttr('readonly','readonly');
	   	 }
	   	 else{
	   		 $('#fault').text('판매자 책임');
	   		 $('#returnDeleveryPayTypeSelector').hide();
	   		 $('#customerDelevery').val('0');
	   		 $('#customerDelevery').attr('readonly','readonly');
	   	 }
    });
	
	$(document).on("click", "[name=DLV_PAY_WAY]", function(){
    	$('#customerDelevery').val($(this).data('fee'));
    });

	// 저장
    $(document).on("click", "#goRegist", function () {
    	var saveMsg = "";
		//교환접수인 경우 사유 체크
    	if("${commandMap.STATE}" == "${Code.OST_SWAP}"){
    		saveMsg = "교환 접수 하시겠습니까?";
            if($.trim($("#SELECT_REASON").val())==""){
                alert("사유를 선택해 주십시오");
                $("#SELECT_REASON").focus();
                return;
            }
    	}else{
    		saveMsg = "저장하시겠습니까?";
    	}
    	
        var $frm = $("#frm");
        if (confirm(saveMsg)) {
            $("#frm").attr({"action":"${serverDomain}/am/order/orderList/changeOrderProductProc.do", 
            	"target":"_self", "method":"post"}).submit();
            $.blockUI({
        		message: "처리중입니다...",
        		css: {
                 border: 'none',
                 padding: '15px',
                 backgroundColor: '#000',
                 '-webkit-border-radius': '10px',
                 '-moz-border-radius': '10px',
                 opacity: .5,
                 color: '#fff'
            	}
        	});
        }
    });

    $(document).on("click", "input[name=changeProduct]", function () {
     if($(this).val() == "A"){
        $(".deliveryTbl").hide();
        $(".autoDelivery").show();
    }else if($(this).val() == "B"){
        $(".deliveryTbl").show();
        $(".selfDelivery").show();
        $(".autoDelivery").hide();
        $(".deliveryTit").text('반품지 정보');
     }
     else{
         $(".deliveryTbl").show();
         $(".autoDelivery").hide();
         $(".selfDelivery").hide();
         $(".deliveryTit").text('발송정보');
     }
  });

});

</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode($pTargetElem) {
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
	
	            $('.postcode').val(data.zonecode);
	            $('.road_addr').val(fullRoadAddr);
	            $('.jibun_addr').val(data.jibunAddress);
	            $('.etc_addr').val('');
	        
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('MEM_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
	            //document.getElementById('MEM_DLV_DRO_ADR1').value = fullRoadAddr;
	            //document.getElementById('MEM_DLV_JBN_ADR1').value = data.jibunAddress;
				
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
	
	function execDaumPostcode2($pTargetElem) {
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
	
	            $('.postcode2').val(data.zonecode);
	            $('.road_addr2').val(fullRoadAddr);
	            $('.jibun_addr2').val(data.jibunAddress);
	            $('.etc_addr2').val('');
	        
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('MEM_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
	            //document.getElementById('MEM_DLV_DRO_ADR1').value = fullRoadAddr;
	            //document.getElementById('MEM_DLV_JBN_ADR1').value = data.jibunAddress;
				
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
	
	$('.address_info').on('click', function(){
		var $targetElem = $(this).closest('.address_info_wrapper');
		execDaumPostcode($targetElem);
	});
	
	$('.address_info2').on('click', function(){
		var $targetElem = $(this).closest('.address_info_wrapper2');
		execDaumPostcode2($targetElem);
	});
</script>
</body>
</html>
