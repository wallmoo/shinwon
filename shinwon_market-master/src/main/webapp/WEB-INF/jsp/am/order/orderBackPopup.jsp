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
                <!-- 타이틀은 반품접수 또는 반품 상세 -->
                <h3 class="title"><span><c:out value="${title}"/></span></h3> 
            </div><!-- // push-guide -->
			<hr>
            <form id="frm" name="frm">
			    <input type="hidden" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD}"/>"/>
			    <input type="hidden" id="ORD_PRD_ORD_STATE" name="ORD_PRD_ORD_STATE" value="<c:out value="${commandMap.STATE}"/>"/>
			    <input type="hidden" id="ORD_PRD_IDX_ARR" name="ORD_PRD_IDX_ARR" value=""/>
		        <input type="hidden" name="ORD_PRD_IDX" value="${commandMap.ORD_PRD_IDX }"/>
		        <input type="hidden" name="ORD_PG_TYPE" value="LG"/>

	        	<h4 class="title"><span>반품상품</span></h4>
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
						<col style="width: 8%;" />
						<col style="width: auto%;" />
						<col style="width: auto%;" />
						<col style="width: 7%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
		            </colgroup>
		            <thead>
						<tr>
							<th>상품유형</th>
	                        <th>이미지</th>
							<th>상품/옵션정보</th>
							<th>상품가격</th>
							<th>수량</th>
							<th>배송비</th>
							<th>배송구분</th>
							<th>브랜드</th>
							<th>주문상태</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${list != null }">
						<c:forEach items="${list}" var="data" varStatus="i">
							<tr>
								<td>
									<c:out value="${data.PRD_MST_TYPE eq 'G' ? '일반' : '패키지'}" />
									<input type="hidden" name="ORD_PRD_IDXs" value="${data.ORD_PRD_IDX}" />
								</td>
	                            <td><span class="thumbnail_img"><img src="${cdnDomain}${data.PRODUCT_THUM_IMG}"/></span></td>
			                    <td class="subject" style="text-align:left;">
			                        <p>
			                        	<c:choose>
											<c:when test="${data.ORD_PRD_OPT_DTL_IDX gt 0}">
												<c:if test="${not empty data.OPT_DTL_ERP_CD}">
													<span class="block name"><c:out value="${data.OPT_DTL_ERP_CD}"/></span>
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${not empty data.PRD_MST_ERP_CD}">
													<span class="block name"><c:out value="${data.PRD_MST_ERP_CD}"/></span>
												</c:if>
											</c:otherwise>
										</c:choose>
	
		                                <span class="block name"><c:out value="${data.ORD_PRD_MST_CD }" /></span>
		                                <span class="block desc"><c:out value="${data.PRD_MST_NM }" /></span>
		                                <c:if test="${data.ORD_PRD_OPT_DTL_IDX gt 0}" >
											<span class="block size"><c:out value="${data.OPT_DTL_NM }" /></span>
										</c:if>
			                        </p>
			                    </td>
								<td><fmt:formatNumber value="${data.ORD_PRD_PRD_PRC}" type="number"/></td>
								<td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>
	
								<c:choose>
									<c:when test="${data.ORD_PRD_DLV_BND_YN eq 'Y' and data.VDR_ROWNUM eq 1}">
			                          	<td rowspan="${data.VDR_IDX_CNT}">
			                          		<fmt:formatNumber value="${data.ORD_PRD_DLV_BND_CAG + data.ORD_PRD_DLV_ADD_CAG}" type="number"/>
			                     	  	</td>
			                        </c:when>
			                        <c:when test="${data.ORD_PRD_DLV_BND_YN ne 'Y'}">
			                          	<td>
			                          		<fmt:formatNumber value="${data.ORD_PRD_DLV_CAG + data.ORD_PRD_DLV_ADD_CAG}" type="number"/>
			                     	  	</td>
			                        </c:when>
		                        </c:choose>
								<td>${data.ORD_PRD_DLV_TYPE_NM }</td>
								<td><c:out value="${data.VDR_MST_NM}"/></td>
								<td><c:out value="${data.ORD_PRD_ORD_STATE_NM}"/></td>
							</tr>
						</c:forEach>
					</c:if>					
					</tbody>
		        </table><!-- // table -->

				<!-- 반품접수인 경우에는 사유 선택 화면, 반품완료인 경우에는 반품 사유를 보여준다. -->
	    		<h4 class="title"><span>반품사유</span></h4>
		    	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
						<col style="width: auto;" />
		            </colgroup>
					<tbody>
						<tr>
							<th><span>사유</span></th>
							<td style="text-align : left;">
								<c:if test="${commandMap.STATE ne Code.OST_BACK}">
									${backInfo.BACK_REASON }
			                    </c:if>
			                    <c:if test="${commandMap.STATE eq Code.OST_BACK}">
			                    	<select id="SELECT_REASON" name="SELECT_REASON" class="select large">
				                        <option value="">선택하세요</option>
				                        <c:if test="${not empty codes.ORDER_CANCEL_RETURN_REASON }">
				                            <c:forEach var="row" items="${codes.ORDER_CANCEL_RETURN_REASON }">
				                                <option value="${row.CMN_COM_IDX }" class="<c:if test="${ '구매자귀책' eq row.CMN_COM_ETC1 }">userFault</c:if>">${row.CMN_COM_NM }</option>
				                            </c:forEach>
				                        </c:if>
			                    	</select>
			                    </c:if>
							</td>
						</tr>
						<tr>
							<th><span>상세사유</span></th>
							<td style="text-align : left;">
								<c:if test="${commandMap.STATE ne Code.OST_BACK}">
									${backInfo.BACK_REASON_DSC }
								</c:if>
								<c:if test="${commandMap.STATE eq Code.OST_BACK}">
									<textarea name="ORD_PRD_DSC" id="ORD_PRD_DSC" cols="30" rows="10"></textarea>
								</c:if>
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->				        				       
		        
                <h4 class="title"><span>반품정보</span></h4>
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
                            <th><span>반품방법</span></th>
							<td>
		                        <input type="radio" name="changeProduct" id="changeProduct1" value="A" ${backInfo.dlv_pay_way_A }>
                                <label for="changeProduct1">자동 수거</label>
                                <input type="radio" name="changeProduct" id="changeProduct2" value="B" ${backInfo.dlv_pay_way_B }>
                                <label for="changeProduct2">직접 발송</label>
                                <input type="radio" name="changeProduct" id="changeProduct3" value="C" ${backInfo.dlv_pay_way_C }>
                                <label for="changeProduct3">이미 발송</label>
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->	
		        	
                <!-- 자동수거 선택시 -->
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
                                	<c:if test="${commandMap.STATE eq Code.OST_BACK or commandMap.STATE eq Code.OST_BACK_APPROVED}">
                	                	<a href="#none" class="button button-a changeBtn search-zipcode"><span>수거지 변경</span></a>
                	                </c:if>
                				</div>
                            </td>
                        </tr>
                    </thead>
					<tbody>
                        <tr>
							<th><span>수령인<i class="require"><em>필수입력</em></i></span></th>
							<td>${deliveryInfo.ORD_DLV_NM }</td>
                            <th><span>휴대폰<i class="require"><em>필수입력</em></i></span></th>
							<td>${deliveryInfo.ORD_DLV_HP }</td>
                            <th><span>전화번호</span></th>
							<td>${deliveryInfo.ORD_DLV_TEL }</td>
						</tr>
                        <tr>
							<th><span>배송지 주소<i class="require"><em>필수입력</em></i></span></th>
							<td colspan="5">
                                    [${deliveryInfo.ORD_DLV_ZIP_CDE5 }] ${deliveryInfo.ORD_DLV_DRO_ADR1 }
							</td>
						</tr>
                        <tr>
							<th><span>배송메모</span></th>
							<td colspan="5">${deliveryInfo.ORD_DLV_MSG }</td>
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
                	                <!-- <a href="#none" class="button button-a changeBtn"><span>수거지 변경</span></a> -->
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
                                <select id="" class="select w284" title="택배사" name="ORD_PKU_DLV_CPN_IDX">
									<option selected="selected" value="">택배사 선택</option>
									<c:forEach var="data" items="${dlvCpnList}">
										<option value="${data.DLV_CPN_IDX }">${data.DLV_CPN_NM }</option>
									</c:forEach>
								</select>
                                <input type="text" class="text">
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->
		        
                <%-- //직접 발송, 이미 발송--%>		
                <h4 class="title"><span>반품 배송비</span></h4>		
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
		                        <input type="text" class="text large" id="customerDelevery"> 원
							</td>
						</tr>
                        <tr id="returnDeleveryPayTypeSelector">
							<th><span>택배비 결제방법</span></th>
							<td colspan="3">
                                <div>
                                    <input type="radio" name="delivery" id="delivery1">
                                    <label for="delivery1">동봉(2,500원)</label>
                                    <input type="radio" name="delivery" id="delivery2">
                                    <label for="delivery2">선불</label>
                                    <input type="radio" name="delivery" id="delivery3">
                                    <label for="delivery3">계좌이체(2,500원)</label>
                                    <input type="radio" name="delivery" id="delivery4">
                                    <label for="delivery4">기타면제</label>
                                </div>
		                        <input type="text" class="text xlarge mt10" id="returnDeleveryPayTypeText" name="returnDeleveryPayTypeText">
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->

				<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000'}"><!-- 입금대기인 주문 제외 -->
					<h4 class="title"><span>환불정보</span></h4>
					<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
			            <colgroup>
							<col style="width: 20%;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
						</colgroup>
						<thead>
							<tr>
								<th>결제수단</th>
								<th>환불 받을 금액</th>
								<th>환불방법</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<!-- 2020.06.11 부분취소는 환불받을 금액이 상품구매금액과 동일하다. 배송비를 제외한 상품구매금액만 환불한다-->
								<c:choose>
									<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD || orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD }">
										<td>신용카드</td>
										<%-- <td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>원</td> --%>
										<td><fmt:formatNumber value="${orderPayInfo.ORD_PRD_ORD_PRC}" type="number"/>원</td>
										<td>신용카드 승인취소(<c:out value="${orderPayInfo.PAY_MST_KICC_ACQUIRER_NM }"/>)</td>
									</c:when>
									<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY }">
										<td>카카오페이</td>
										<%-- <td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>원</td> --%>
										<td><fmt:formatNumber value="${orderPayInfo.ORD_PRD_ORD_PRC}" type="number"/>원</td>
										<td>신용카드 승인취소(<c:out value="${orderPayInfo.PAY_MST_KAKAO_CARDNAME }"/>)</td>
									</c:when>
									<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT }">
										<td>계좌이체<br/>(PG입금 계좌)</td>
										<%-- <td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>원</td> --%>
										<td><fmt:formatNumber value="${orderPayInfo.ORD_PRD_ORD_PRC}" type="number"/>원</td>
										<td>계좌이체 승인취소(<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }"/>)</td>
									</c:when>
									<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW }">
										<td>PG입금불가능한 계좌<br/>OR<br/>가상계좌(무통장)</td>
										<%-- <td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>원</td> --%>
										<td><fmt:formatNumber value="${orderPayInfo.ORD_PRD_ORD_PRC}" type="number"/>원</td>
										<td style="text-align: left;">
											<table class="core">
												<colgroup>
													<col style="width: 20%;" />
													<col style="width: auto;" />
												</colgroup>
												<thead>
													<tr>
														<th>환불방식</th>
														<td style="text-align: left;">
															<%-- <span style="margin-left: 10px;">무통장입금</span> --%>
															<span style="margin-left: 10px;">${orderPayInfo.ORD_MST_PAY_TYPE_NM }</span>
														</td>
													</tr>
													<tr>
														<th>환불은행</th>
														<td style="text-align: left;">
															<span style="margin-left: 10px;">
																<select class="select" name="ORD_MST_RFD_CD" id="ORD_MST_RFD_CD">
				                                                	<option value="">선택</option>
																	<c:forEach var="item" items="${codes.KICC_BANK_CD }">
																		<option value="${item.CMN_COM_ETC1 }" <c:if test="${item.CMN_COM_ETC1 eq orderPayInfo.ORD_MST_RFD_CD }">selected="selected"</c:if>>${item.CMN_COM_NM }</option>
																	</c:forEach>
				                                                </select>
															</span>
														</td>
													</tr>
													<tr>
														<th>계좌번호</th>
														<td style="text-align: left;">
															<span style="margin-left: 10px;">
																<input type="text" id="ORD_MST_RFD_ACT" name="ORD_MST_RFD_ACT" value="<c:out value="${orderPayInfo.ORD_MST_RFD_ACT }"/>"/>
															</span>
														</td>
													</tr>
													<tr>
														<th>예금주명</th>
														<td style="text-align: left;">
															<span style="margin-left: 10px;">
																<input type="text" id="ORD_MST_RFD_HDR" name="ORD_MST_RFD_HDR" value="<c:out value="${orderPayInfo.ORD_MST_RFD_HDR }"/>"/>
															</span>
														</td>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
											<span style="color: red;">*관리팀에서 현금 환불 후 [환불관리]에서 환불상태를 변경해주셔야 합니다.</span>
										</td>
									</c:when>
									<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE }">
										<td>포인트</td>
										<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG}" type="number"/>원</td>
										<td>포인트 환원</td>
									</c:when>
								</c:choose>
							</tr>
						</tbody>
			        </table><!-- // table -->
				</c:if>
		    </form>

		    <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="javascript:save();" class="button button-b primary"><span>저장</span></a>
                    <a href="javascript:self.close();" id="goList" class="button button-a"><span>취소</span></a>
                </div>
            </div><!-- // section-button -->
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
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
    
    $(document).on("click", "[name=delivery]", function(){
    	var deleveryFee = 0;
    	var id = $(this).attr('id');
    	switch (id) {
		case 'delivery1':
			deleveryFee = 5000;
			break;
		case 'delivery2':
			deleveryFee = 2500;
			break;
		case 'delivery3':
			deleveryFee = 5000;
			break;
		case 'delivery4':
			deleveryFee = 0;
			break;
		default:
			break;
		}
    	$('#customerDelevery').val(deleveryFee);
    });
    // 저장
    save = function(){
    	var isReasonCheck = true;
    	if("${commandMap.STATE}" == "${Code.OST_BACK}"){//반품접수인 경우
    		var ordPrdIdxArr = [];

    		$.each($("input[name=ORD_PRD_IDXs]"), function(){
    			ordPrdIdxArr[ordPrdIdxArr.length] = $(this).val();
    		});

			if(ordPrdIdxArr.length == 0){
				alert("상품을 선택해주십시오.");
				return;
			}
		}else if("${commandMap.STATE}" != "${Code.OST_BACK}"){//반품완료인 경우
			isReasonCheck = false;
		}

    	if(isReasonCheck){ // 사유 체크
            if($.trim($("#SELECT_REASON").val())==""){
                alert("사유를 선택해 주십시오");
                $("#SELECT_REASON").focus();
                return;
            }
    	}

    	<!-- 입금대기인 주문 제외 -->
    	<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000'}">
    		<c:if test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW }">
		    	if($.trim($("#ORD_MST_RFD_CD").val())=="") {
		                alert("환불은행을 선택해 주십시오");
		                $("#ORD_MST_RFD_CD").focus();
		                return;
		         }
	
		    	if($.trim($("#ORD_MST_RFD_ACT").val())=="")
	            {
	                alert("계좌번호를 입력해 주십시오");
	                $("#ORD_MST_RFD_ACT").focus();
	                return;
	            }
	
		    	if($.trim($("#ORD_MST_RFD_HDR").val())=="")
	            {
	                alert("예금주명을 입력해 주십시오");
	                $("#ORD_MST_RFD_HDR").focus();
	                return;
	            }	
		    </c:if>
    	</c:if>

    	if(confirm("저장 하시겠습니까?"))
        {
    		$("#ORD_PRD_IDX_ARR").val(ordPrdIdxArr);
            var $frm = $("#frm");
            $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderList/orderStateModify.do", "target":"_self", "method":"post"}).submit();
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
    };

    $('input[name="changeProduct"]').change(function () {
		if($(this).val() == "A"){
	        $(".deliveryTbl").hide();
	        $(".autoDelivery").show();
	    }else if($(this).val() == "B"){
	        $(".deliveryTbl").show();
	        $(".selfDelivery").show();
	        $(".autoDelivery").hide();
	        $(".deliveryTit").text('반품지 정보');
		}else{
	         $(".deliveryTbl").show();
	         $(".autoDelivery").hide();
	         $(".selfDelivery").hide();
	         $(".deliveryTit").text('발송정보');
		}
	});
    $('input[name="changeProduct"]:checked').trigger('change');
    
	function opener_fn(result){
		console.log(result);
	}
});
</script>
<%@ include file="/WEB-INF/jsp/pc/include/zipcode.jsp" %>
</body>
</html>
