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
                <h3 class="title"><span><c:out value="${title}"/></span></h3> 
            </div><!-- // push-guide -->
			<hr>
            <form id="frm" name="frm">
			    <input type="hidden" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD}"/>"/>
			    <input type="hidden" id="ORD_PRD_ORD_STATE" name="ORD_PRD_ORD_STATE" value="<c:out value="${commandMap.STATE}"/>"/>
			    <input type="hidden" id="ORD_PRD_IDX_ARR" name="ORD_PRD_IDX_ARR" value="${commandMap.arrORD_PRD_IDXs }"/>
		        <input type="hidden" name="ORD_PRD_IDX" value=""/>
		        <input type="hidden" name="ORD_PG_TYPE" value="LG"/>

	        	<h4 class="title"><span>주문상품정보</span></h4>
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <c:if test="${commandMap.STATE eq Code.OST_BACK }">
							<col style="width: 4%;" />
						</c:if>
						<col style="width: 8%;" />
						<col style="width: 10%;" />
						<col style="width: auto;" />
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
								<td>
									${data.ORD_PRD_DLV_TYPE_NM }
								</td>
								<td>
									<c:out value="${data.VDR_MST_NM}"/>
								</td>
								<td class="ord_state_nm" data-ord_state="${data.ORD_PRD_ORD_STATE}">
							    	${data.ORD_PRD_ORD_STATE_NM}
								</td>
							</tr>
						</c:forEach>
					</c:if>					
				</tbody>
		        </table><!-- // table -->

		    	<h4 class="title"><span>결제정보</span></h4><%-- ${orderPayInfo} --%>
		    	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
                           <col style="width: auto;" />
		            </colgroup>
		            <thead>
						<tr>
							<th>주문금액</th>
							<th>할인쿠폰</th>
							<th>프로모션할인</th>
							<th>통합포인트</th>
							<th>E포인트</th>
							<th>임직원 할인금액</th>
							<th>배송비</th>
							<th>결제금액</th>
							<th>결제수단</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_ORD_PRC}" type="number"/></td>
							<td><fmt:formatNumber value="${orderPayInfo.ORD_PRD_DC_CPN}" type="number"/></td>
							<td><fmt:formatNumber value="${orderPointInfo.PROMOTION}" type="number"/></td>
							<td><fmt:formatNumber value="${orderPointInfo.TOT_POINT}" type="number"/></td>
							<td><fmt:formatNumber value="${orderPointInfo.E_POINT}" type="number"/></td>
							<td><fmt:formatNumber value="${orderPointInfo.SW_POINT}" type="number"/></td>
							<td><fmt:formatNumber value="${orderPayInfo.ORD_PRD_DLV_CAG}" type="number"/></td>
							<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/></td>
							<td><c:out value="${orderPayInfo.ORD_MST_PAY_TYPE_NM}"/></td>
						</tr>
					</tbody>
		        </table><!-- // table -->
		        
				<!-- 취소접수인 경우에는 사유 선택 화면, 취소완료인 경우에는 취소 사유를 보여준다. -->
				<h4 class="title"><span><em class="strong">취소사유</em></span></h4>
		    	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
						<col style="width: auto;" />
		            </colgroup>
					<tbody>
						<tr>
							<th><span>사유 <em class="strong">*</em></span></th>
							<td style="text-align : left;">
								<c:if test="${commandMap.STATE eq Code.OST_CANCEL }">
									<select id="SELECT_REASON" name="SELECT_REASON" class="select large">
				                        <option value="">선택하세요</option>
				                        <c:if test="${not empty codes.ORDER_CANCEL_REASON }">
				                            <c:forEach var="row" items="${codes.ORDER_CANCEL_REASON }">
				                                <option value="${row.CMN_COM_IDX }" class="<c:if test="${ '구매자귀책' eq row.CMN_COM_ETC1 }">userFault</c:if>">${row.CMN_COM_NM }</option>
				                            </c:forEach>
				                        </c:if>
				                    </select>
							    </c:if>
							    <c:if test="${commandMap.STATE ne Code.OST_CANCEL }">
							    	${backInfo.BACK_REASON }
							    </c:if>
							</td>
						</tr>
						<tr>
							<th><span>상세사유</span></th>
							<td>
								<c:if test="${commandMap.STATE eq Code.OST_CANCEL }">
									<textarea name="ORD_PRD_DSC" id="ORD_PRD_DSC" cols="30" rows="10"></textarea>
								</c:if>
								<c:if test="${commandMap.STATE ne Code.OST_CANCEL }">
							    	${backInfo.BACK_REASON_DSC }
							    </c:if>
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
											<%-- 환불계좌 수정은 주문취소시에는 결제완료/배송준비중 상태에서만 뜨고, 반품접수, 반품완료인 경우에는 항상 뜬다. --%>
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
	
    // 저장
    save = function(){
		var saveMsg = "";
		//취소접수인 경우 사유 체크
    	if("${commandMap.STATE}" == "${Code.OST_CANCEL}"){
    		saveMsg = $('.ord_state_nm').eq(0).text().trim() + " 상태입니다. 주문 취소 하시겠습니까?";
            if($.trim($("#SELECT_REASON").val())==""){
                alert("사유를 선택해 주십시오");
                $("#SELECT_REASON").focus();
                return;
            }
    	}else{
    		saveMsg = "저장하시겠습니까?";
    	}

    	<!-- 입금대기인 주문 제외 -->
    	<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000'}">
    		<c:if test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW }">
		    	if($.trim($("#ORD_MST_RFD_CD").val())=="") {
	                alert("환불은행을 선택해 주십시오");
	                $("#ORD_MST_RFD_CD").focus();
	                return;
		        }
		    	if($.trim($("#ORD_MST_RFD_ACT").val())==""){
	                alert("계좌번호를 입력해 주십시오");
	                $("#ORD_MST_RFD_ACT").focus();
	                return;
	            }
		    	if($.trim($("#ORD_MST_RFD_HDR").val())==""){
	                alert("예금주명을 입력해 주십시오");
	                $("#ORD_MST_RFD_HDR").focus();
	                return;
	            }	
		    </c:if>
    	</c:if>

    	if(confirm(saveMsg)){
            var $frm = $("#frm");
            if("${commandMap.STATE}" == "${Code.OST_CANCEL}"){
            	$frm.attr({"action":"${serverDomain}/am/order/orderList/orderStateModify.do",
            		"target":"_self", "method":"post"}).submit();
            }else{
            	// 메모 기능 확인 필요
            }
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
    
	function opener_fn(result){
		console.log(result);
	}
});
</script>
<%@ include file="/WEB-INF/jsp/pc/include/zipcode.jsp" %>
</body>
</html>
