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
                <h3 class="title"><span>주문정보</span></h3>
            </div><!-- // push-guide -->

	        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	            <colgroup>
	                <col style="width: 10%;" />
	                <col style="width: auto;" />
	                <col style="width: 10%;" />
	                <col style="width: auto;" />
	                <col style="width: 10%;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <tbody>
	                <tr>
						<th>주문번호</th>
						<td><c:out value="${orderInfo.ORD_MST_CD}"/></td>
						<th>주문일시</th>
						<td><ui:formatDate value="${orderInfo.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
						<th>주문경로</th>
						<td><c:out value="${orderInfo.ORD_MST_ORD_TYPE eq 'P' ? 'PC' : 'MOBILE'}"/></td>
					</tr>
					<tr>
						<th>주문자명/아이디</th>
						<td>
						    <c:out value="${orderInfo.ORD_MST_ORD_NM}"/>
						    <c:if test="${orderInfo.ORD_MST_ORD_ID ne '_GUEST_'}"> /
						    	<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${orderInfo.ORD_MST_ORD_ID }" />');" title="새 창 으로 열립니다.">
						    		<c:out value="${orderInfo.ORD_MST_ORD_ID}"/>
						    	</a>
						    	[<c:out value="${orderInfo.MEM_MST_GB_NM}"/>]
						    </c:if>
						    <c:if test="${orderInfo.ORD_MST_ORD_ID eq '_GUEST_'}"> [비회원]</c:if>
						</td>
						<th>휴대전화</th>
						<td>
						    <c:out value="${orderInfo.ORD_MST_HP}"/>
						</td>
						<th>이메일</th>
						<td><c:out value="${orderInfo.ORD_MST_MAIL}"/></td>
					</tr>
	            </tbody>
	        </table><!-- // table -->

		    <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>주문상품정보</span></h3>
            </div><!-- // push-guide -->
            										
            <div class="grid section-button-search">
            
            	<c:if test="${empty commandMap.ADM_MST_SUB_IDX and CST_PLATFORM eq 'test' }">
					<%-- 입금대기->결제완료 (테스트용) --%>
					<c:if test="${orderState.TOTAL_CNT eq orderState.PAY_READY_CNT}">
						<a id="btn_pay" href="javascript:void(0)" class="button button-a"  ><span>입금대기->결제완료(테스트용)</span></a>
					</c:if>
				</c:if>
            
            	<%-- 반품접수 가능 상품이 있을 경우 버튼 보여주기 --%>
				<c:if test="${not empty order_back_y_list}">
					<a id="btn_back" href="javascript:void(0)" class="button button-a"  ><span>반품접수</span></a>
				</c:if>
				
				<%-- 교환접수 가능 상품이 있을 경우 버튼 보여주기 --%>
				<c:if test="${not empty order_swap_y_list}">
					<a id="btn_swap" href="javascript:void(0)" class="button button-a"  ><span>교환접수</span></a>
				</c:if>
				
				<%-- 주문취소 가능 상품이 있을 경우 버튼 보여주기 --%>
				<c:if test="${not empty order_cancel_y_list}">
					<a id="btn_cancel" href="javascript:void(0)" class="button button-a"  ><span>주문취소</span></a>
				</c:if>

			</div>

            <form id="frm" name="frm">
	            <input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/>
				<input type="hidden" id="ORD_PRD_ORD_STATE" name="ORD_PRD_ORD_STATE" value=""/>
				<input type="hidden" id="ORD_PRD_IDX_ARR" name="ORD_PRD_IDX_ARR" value=""/>
				<input type="hidden" id="sendEndSmYn" name="sendEndSmYn" value=""/><%-- 임의 배송완료 처리 여부 --%>
				<input type="hidden" name="closeYn" value="N"/>
				<input type="hidden" id="PARTIAL_ORDER_CONFIRM_YN" name="PARTIAL_ORDER_CONFIRM_YN" value="N"/>

	        	<table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: auto;" />
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
	                        <th>
	                            상품유형<br/>
	                            <input type="checkbox" id="selectAll" class="selectAll" title="모두선택" />
	                        </th>
                            <th>이미지</th>
							<th>상품/옵션정보</th>
							<th>상품가격</th>
							<th>수량</th>
							<th>배송비</th>
							<th>배송구분</th>
							<th>송장번호</th>
							<th>브랜드</th>
							<th>주문상태</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach items="${orderProductList}" var="data" varStatus="i">
						<c:set var="C_STATE" value="${data.ORD_PRD_ORD_STATE}"/>
						<tr>
							<td>
								<c:out value="${data.PRD_MST_TYPE eq 'G' ? '일반' : '패키지'}" />
	                            <c:if test="${data.ORD_PRD_ORD_STATE ne Code.OST_CANCEL_END }">
		                            <br/><input type="checkbox" class="ORD_PRD_IDXs" name="ORD_PRD_IDXs" id="ORD_PRD_IDXs" value="${data.ORD_PRD_IDX}" title="${data.PRD_MST_NM} 상품 선택" data-ord_prd_state="${data.ORD_PRD_ORD_STATE }" data-prd_mst_nm="${data.PRD_MST_NM}" data-vdr_mst_nm="${data.VDR_MST_NM}"/>
	                            </c:if>
							</td>
                            <td><span class="thumbnail_img"><img src="${cdnDomain}${data.PRODUCT_THUM_IMG}"/></span></td>
		                    <td class="subject" style="text-align:left;">
		                        <p>
							        <!-- 기간계상품이면서 결제완료 상태인 경우 검색 가능 -->
							        <c:set var="C_ERP_CD" value=""/>
							        <c:choose>
										<c:when test="${data.ORD_PRD_OPT_DTL_IDX gt 0}">
											<c:if test="${not empty data.OPT_DTL_ERP_CD}">
												<c:set var="C_ERP_CD" value="${data.OPT_DTL_ERP_CD}"/>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${not empty data.PRD_MST_ERP_CD}">
												<c:set var="C_ERP_CD" value="${data.OPT_DTL_ERP_CD}"/>
											</c:if>
										</c:otherwise>
									</c:choose>

							        <c:if test="${not empty data.ORD_PRD_ORG_IDX}" >
							        	<img src="<c:out value="${serverDomain}"/>/am/img/ico_reply.png" alt="교환" style="width:17px;" />
							        </c:if>

							        <c:choose>
							        	<c:when test="${not empty C_ERP_CD}">
						        			<a href="javascript:goErpPrdDetail('<c:out value="${C_ERP_CD }" />');" class="underline"  title="새 창 으로 열립니다.">
				                                <span class="name"><c:out value="${C_ERP_CD }" /></span>
			                                </a>
							        		<br/>
							        	</c:when>
							        </c:choose>

	                                <c:choose>
						    			<c:when test="${data.ORD_PRD_SLT_YN eq 'N' }"><%-- 마스터 or 필수옵션인 경우 --%>
						    				<a href="javascript:goProductView('<c:out value="${data.ORD_PRD_MST_CD }" />');" class="underline"  title="새 창 으로 열립니다.">
				                                <span class="name block">${data.PRD_MST_NM }</span>
			                                </a>
						    				<%-- <a href="javascript:goProductView('${data.ORD_PRD_MST_CD }');">
												<span class="desc block">${data.ORD_PRD_MST_CD }</span>
											</a> --%>
											<span class="desc block">COLOR : ${data.ORD_PRD_COLOR_NM } / SIZE : ${data.ORD_PRD_SIZE_NM }</span>
											<c:if test="${data.ORD_PRD_OPT_DTL_IDX gt 0 }"><%-- 필수옵션인 경우 --%>
												<span class="desc block">(옵션)<c:out value="${data.OPT_DTL_NM }" /></span>
											</c:if>
						    			</c:when>
						    			<c:when test="${data.ORD_PRD_SLT_YN ne 'N' }"><%-- 선택옵션인 경우 --%>
						    				<span class="desc block">(옵션)<c:out value="${data.OPT_DTL_NM }" /></span>
						    			</c:when>
						    		</c:choose>


									<c:if test="${data.ORD_PRD_OPT_DTL_IDX gt 0}" >
										<%-- <span class="size"><c:out value="${data.OPT_DTL_NM }" /></span> --%>
										<!--  입금대기/결제완료 상태인 경우 옵션 변경 가능 (겟잇나우는 제외) -->
										<c:if test="${empty commandMap.ADM_MST_SUB_IDX }"><%-- 입점업체 관리자는 제외하고 버튼 생성 --%>
											<c:if test="${empty orderInfo.ORD_GET_SHP_MST_IDX}">
				                                <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_PAY or data.ORD_PRD_ORD_STATE eq Code.OST_PAY_READY }">
				                                	<%--<a href="javascript:changeProductOptionPopup('${data.ORD_PRD_IDX}');" class="button button-a xsmall"  title="새 창 으로 열립니다."><span>옵션변경</span></a> --%>
				                                </c:if>
				                            </c:if>
			                            </c:if>
									</c:if>

		                        </p>

		                        <c:if test="${empty commandMap.ADM_MST_SUB_IDX }"><%-- 입점업체 관리자는 제외하고 버튼 생성 --%>
			                        <%-- 결제완료 or 입금대기인 경우 / 또는 교환상품준비중 상태인 경우 상품교체,주문확정 가능 --%>
			                        <c:if test="${orderState.FRONT_WHOLE_CANCEL_PLE_YN eq 'Y' or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_TARGET_COLLECT_END }">
		                        		<c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_TARGET_COLLECT_END}"><%-- 교환상품 준비중인 경우에는 개별 주문확정 --%>
		                        			<a href="javascript:orderStateModify('<c:out value="${Code.OST_SEND_READY}"/>','<c:out value="${data.ORD_PRD_IDX}"/>');" class="button button-a xsmall"  title="새 창 으로 열립니다."><span>주문확정</span></a>
		                        		</c:if>
		                        		<%-- 겟잇나우/클린킹 제외 --%>
										<c:if test="${orderInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD and orderInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}">
											<p><a href="javascript:goChangePrd('<c:out value="${data.ORD_PRD_IDX }"/>');" class="button button-a xsmall"  title="새 창 으로 열립니다."><span>상품교체</span></a></p>
										</c:if>
			                        	<p id="changePrdArea_${data.ORD_PRD_IDX }"></p>
			                        </c:if>
		                        </c:if>

		                    </td>
							<td>
	                            <fmt:formatNumber value="${data.ORD_PRD_PRD_PRC}" type="number"/>
	                            <c:if test="${not empty data.ORD_PRD_OPT_ADD_PRC and data.ORD_PRD_OPT_ADD_PRC ne 0}"><%-- 옵션 추가금이 있는 경우 --%>
	                                <br/>(<c:out value="${data.ORD_PRD_OPT_ADD_PRC gt 0 ? '+' : ''}"/><fmt:formatNumber value="${data.ORD_PRD_OPT_ADD_PRC}" type="number"/>)
	                            </c:if>
	                        </td>
							<td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>

							<c:choose>
								<c:when test="${data.ORD_PRD_DLV_BND_YN eq 'Y' and data.VDR_ROWNUM eq 1}">
		                          	<td rowspan="${data.VDR_IDX_CNT}">
		                          		<fmt:formatNumber value="${data.ORD_PRD_DLV_BND_CAG}" type="number"/>
		                     	  	</td>
		                        </c:when>
		                        <c:when test="${data.ORD_PRD_DLV_BND_YN ne 'Y'}">
		                          	<td>
		                          		<fmt:formatNumber value="${data.ORD_PRD_DLV_CAG}" type="number"/>
		                     	  	</td>
		                        </c:when>
	                        </c:choose>

							<td>
								<c:choose>
									<c:when test="${data.ORD_PRD_ORD_STATE eq Code.OST_PAY or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_TARGET_COLLECT_END}">
										<c:choose>
											<c:when test="${empty data.ORD_PRD_DLV_TYPE }">
												<select id="ORD_PRD_DLV_TYPE_${data.ORD_PRD_IDX}" name="ORD_PRD_DLV_TYPE_${data.ORD_PRD_IDX}" class="select select_dlv_type" data-ord_prd_idx="${data.ORD_PRD_IDX }">
					                                <option value="">선택</option>
								                    <c:if test="${not empty codes.DLV_TYPE }">
								                         <c:forEach var="row" items="${codes.DLV_TYPE }">
								                         	<%-- 겟잇나우/입점업체/클린킹은 나오지 않는다. --%>
								                         	<c:if test="${row.CMN_COM_IDX ne Code.DLV_TYPE_GET_IT_NOW and row.CMN_COM_IDX ne Code.DLV_TYPE_PARTNER and row.CMN_COM_IDX ne Code.DLV_TYPE_SERVICE }">
								                         		<option value="<c:out value="${row.CMN_COM_IDX }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
								                         	</c:if>
								                         </c:forEach>
								                    </c:if>
								                </select>

								                <select id="ORD_PRD_SYS_SGS_${data.ORD_PRD_IDX}" name="ORD_PRD_SYS_SGS_${data.ORD_PRD_IDX}" class="select select_sgs_sys" data-ord_prd_idx="${data.ORD_PRD_IDX }" style="display: none; margin-top: 5px;">
								                	<option value="G">A 택배</option>
								                	<option value="Y">B 택배</option>
								                </select>

											</c:when>
											<c:otherwise>
												<%-- 입점/겟잇나우/클린킹인 경우 --%>
												<input type="hidden" id="ORD_PRD_DLV_TYPE_${data.ORD_PRD_IDX}" name="ORD_PRD_DLV_TYPE_${data.ORD_PRD_IDX}" value="<c:out value="${data.ORD_PRD_DLV_TYPE }"/>"/>
												<c:out value="${data.ORD_PRD_DLV_TYPE_NM }"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:out value="${data.ORD_PRD_DLV_TYPE_NM }"/>

									</c:otherwise>
								</c:choose>
							</td>

							<td>
								<%-- 입점 배송만 송장 입력 가능(입점만) --%>
								<c:choose>
									<c:when test="${CST_PLATFORM eq 'test' }">
										<c:choose>
											<%-- <c:when test="${data.ORD_PRD_DLV_TYPE eq Code.DLV_TYPE_PARTNER and data.ORD_PRD_ORD_STATE eq Code.OST_SEND_READY and empty data.ORD_PRD_IVC_NO}"> --%>
											<c:when test="${(data.ORD_PRD_ORD_STATE eq Code.OST_SEND_READY or data.ORD_PRD_ORD_STATE eq Code.OST_SEND_HOLD)
															 and empty data.ORD_PRD_IVC_NO}">
												<p class="reset">
													<select class="select" id="ORD_DLV_CPN_IDX_${data.ORD_PRD_IDX}" name="ORD_DLV_CPN_IDX_${data.ORD_PRD_IDX}" style="max-width: 90%;">
													    <option value="">택배사선택</option>
													    <c:forEach var="item" items="${dlvCpnList}" varStatus="i">
													    	<option value="${item.DLV_CPN_IDX}">${item.DLV_CPN_NM}</option>
													    </c:forEach>
													</select>
												</p>
												<p class="reset mt5" style="margin-top: 5px;">
													<input type="text" class="text" id="ORD_PRD_IVC_NO_${data.ORD_PRD_IDX}" value="" maxlength="30" style="width:110px;"/>
												</p>
												<p class="reset mt5" style="margin-top: 5px;">
													<a href="javascript:invoiceNoProc('${data.ORD_PRD_IDX}');" class="button button-a xsmall"  title=""><span>저장</span></a>
												</p>
											</c:when>
											<c:otherwise>
												<c:if test="${not empty data.ORD_PRD_IVC_NO}">
													<c:out value="${data.DLV_CPN_NM}"/><br/>
<%-- 													<a href="javascript:goDeliveryView('<c:out value="${data.DLV_CPN_URL }" /><c:out value="${data.ORD_PRD_IVC_NO }" />');" class="underline" target="_blank"><strong><c:out value="${data.ORD_PRD_IVC_NO }" /></strong></a> --%>
													<a href="<c:out value="${data.DLV_CPN_URL }" /><c:out value="${data.ORD_PRD_IVC_NO }" />" class="underline" target="_blank"><strong><c:out value="${data.ORD_PRD_IVC_NO }" /></strong></a>
												</c:if>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${data.ORD_PRD_DLV_TYPE eq Code.DLV_TYPE_PARTNER and data.ORD_PRD_ORD_STATE eq Code.OST_SEND_READY and empty data.ORD_PRD_IVC_NO}">
											<%-- <c:when test="${data.ORD_PRD_ORD_STATE eq Code.OST_SEND_READY and empty data.ORD_PRD_IVC_NO}"> --%>
												<p class="reset">
													<select class="select" id="ORD_DLV_CPN_IDX_${data.ORD_PRD_IDX}" name="ORD_DLV_CPN_IDX_${data.ORD_PRD_IDX}" style="max-width: 90%;">
													    <option value="">택배사선택</option>
													    <c:forEach var="item" items="${dlvCpnList}" varStatus="i">
													    	<option value="${item.DLV_CPN_IDX}">${item.DLV_CPN_NM}</option>
													    </c:forEach>
													</select>
												</p>
												<p class="reset mt5" style="margin-top: 5px;">
													<input type="text" class="text" id="ORD_PRD_IVC_NO_${data.ORD_PRD_IDX}" value="" maxlength="30" style="width:110px;"/>
												</p>
												<p class="reset mt5" style="margin-top: 5px;">
													<a href="javascript:invoiceNoProc('${data.ORD_PRD_IDX}');" class="button button-a xsmall"  title=""><span>저장</span></a>
												</p>
											</c:when>
											<c:otherwise>
												<c:if test="${not empty data.ORD_PRD_IVC_NO}">
													<c:out value="${data.DLV_CPN_NM}"/><br/>
<%-- 													<a href="javascript:goDeliveryView('<c:out value="${data.DLV_CPN_URL }" /><c:out value="${data.ORD_PRD_IVC_NO }" />');" class="underline"><strong><c:out value="${data.ORD_PRD_IVC_NO }" /></strong></a> --%>
													<a href="<c:out value="${data.DLV_CPN_URL }" /><c:out value="${data.ORD_PRD_IVC_NO }" />" class="underline" target="_blank"><strong><c:out value="${data.ORD_PRD_IVC_NO }" /></strong></a>
												</c:if>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</td>

							<%-- <td>
								<c:out value="${data.ORD_PRD_SLP_NO}"/>
							</td>
							<td>
								<c:out value="${data.CHN_DTL_NM}"/>
							</td> --%>
							<td>
								<c:out value="${data.VDR_MST_NM}"/>
							</td>
							<td>
							    <p>
							    	<!-- 주문상태 -->
							    	<c:out value="${data.ORD_PRD_ORD_STATE_NM}"/>
							    </p>
						        <p>
						        	<a href="javascript:orderHistoryPopup('${data.ORD_PRD_IDX}');" class="button button-a xsmall" title="새 창 으로 열립니다.">
						        	<span>진행내역</span></a>
						        </p>

								<%-- 일반택배발송/매장수령에 따른 메시지 구분 --%>
						        <c:if test="${orderInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD }">
						        	<c:set var="send_ready">배송</c:set>
						        	<c:set var="send_end">배송완료</c:set>
						        </c:if>
						        <c:if test="${orderInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
						        	<c:set var="dlv_name">상품</c:set>
						        	<c:set var="send_end">매장수령</c:set>
						        </c:if>
						        
						        <%-- 결제 완료 상품은 배송준비중/상품준비중 처리 가능 --%>
						        <c:if test="${ data.ORD_PRD_ORD_STATE eq Code.OST_PAY }">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SEND_READY}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="${send_ready }준비중 처리하시겠습니까?">
						        	<span>${send_ready }준비중처리</span></a></p>
						        </c:if>
						        
						        <%-- 배송준비중 상품은 배송보류 처리 가능(매장수령시는 제외) --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_PAY and orderInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD }">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SEND_HOLD}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="배송보류 처리하시겠습니까?">
						        	<span>배송보류처리</span></a></p>
						        </c:if>
						        
						        <%-- 배송중/상품준비중 상품은 배송완료/매장수령 처리 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SEND }">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SEND_END}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="${send_end } 처리하시겠습니까?">
						        	<span>${send_end }처리</span></a></p>
						        </c:if>
						        
						        <%-- 배송완료/교환취소/교환불가/교환완료 상품은 구매확정처리 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_END 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_CLIENT_CANCEL 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_CANCEL 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_SEND_END }">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_FIX}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="구매확정 처리하시겠습니까?">
						        	<span>구매확정처리</span></a></p>
						        </c:if>
						        
						        <%-- ======================== 취소 관련 주문상태 START ======================== --%>
						        <%-- 취소접수/취소완료 -> 취소상세정보 버튼 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_CANCEL or data.ORD_PRD_ORD_STATE eq Code.OST_CANCEL_END }">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderCancelDetail" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SEND_HOLD}" data-ord_prd_idx="${data.ORD_PRD_IDX}">
						        	<span>상세정보</span></a></p>
						        </c:if>
						        <%-- 취소접수 상품은 취소완료 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_CANCEL }">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_CANCEL_END}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="취소완료 처리하시겠습니까?">
						        	<span>취소완료</span></a></p>
						        </c:if>
						        <%-- ======================== 취소 관련 주문상태 END ======================== --%>
						        
								<%-- ======================== 교환 관련 주문상태 START ======================== --%>
								<%-- --- OST_SWAP_APPROVED 상태는 사용하지 않고 OST_SWAP 상태와 동일하게 취급함 --- --%>
								<%-- 교환접수/교환대기중/교환승인/교환배송중/교환완료/교환불가/교환취소 -> 교환상세정보 버튼 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_COLLECT_CALL 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_COLLECT_END 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_SEND 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_END 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_CANCEL 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_CLIENT_CANCEL }">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderSwapDetail" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SEND_HOLD}" data-ord_prd_idx="${data.ORD_PRD_IDX}">
						        	<span>상세정보</span></a></p>
						        </c:if>
								
						        <%-- 교환접수/교환대기중 상품은 교환접수취소 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP
						        			 or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_APPROVED
						        			 or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_COLLECT_CALL}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SWAP_CLIENT_CANCEL}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="교환접수건을 취소 처리하시겠습니까?">
						        	<span>교환접수취소</span></a></p>
						        </c:if>
						        
						        <%-- 교환접수 상품은 교환접수승인 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_APPROVED}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SWAP_COLLECT_CALL}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="교환접수건 확인하셨습니까?">
						        	<span>교환접수승인</span></a></p>
						        </c:if>
						        
						        <%-- 교환대기중 상품은 교환회수완료 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_COLLECT_CALL}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SWAP_COLLECT_END}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="반품상품을 받으셨습니까?">
						        	<span>교환회수완료</span></a></p>
						        </c:if>
						        
						        <%-- 교환회수완료 상품은 교환상품배송 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_COLLECT_END}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SWAP_SEND}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="교환상품을 배송하시겠습니까?">
						        	<span>교환상품배송</span></a></p>
						        </c:if>
						        
						        <%-- 교환배송중상태를 제외하고 교환불가 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP
						        			 or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_APPROVED
						        			 or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_COLLECT_CALL
						        			 or data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_COLLECT_END}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SWAP_CANCEL}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="교환불가 처리하시겠습니까?">
						        	<span>교환불가</span></a></p>
						        </c:if>
						        
						        <%-- 교환배송중(교환상품준비중 - 신규 상품) 상품은 교환완료 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SWAP_TARGET_COLLECT_END}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SWAP_SEND_END}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="교환완료 처리하시겠습니까?">
						        	<span>교환완료</span></a></p>
						        </c:if>
								<%-- ======================== 교환 관련 주문상태 END ======================== --%>
								
								
								<%-- ======================== 반품 관련 주문상태 START ======================== --%>
								<%-- 반품접수/반품대기중/반품승인/반품완료/반품불가/반품취소 -> 반품상세정보 버튼 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_BACK
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_BACK_APPROVED 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_BACK_COLLECT_END 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_BACK_END 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_BACK_CANCEL 
						        			or data.ORD_PRD_ORD_STATE eq Code.OST_BACK_CLIENT_CANCEL }">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderBackDetail" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_SEND_HOLD}" data-ord_prd_idx="${data.ORD_PRD_IDX}">
						        	<span>상세정보</span></a></p>
						        </c:if>
								
								<%-- 반품접수/반품대기중 상품은 반품접수취소(고객이 취소) 가능 --%>
								<c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_BACK}">
									<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_BACK_CLIENT_CANCEL}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="반품접수건을 취소 처리하시겠습니까?">
						        	<span>반품접수취소</span></a></p>
						        </c:if>
								
								<%-- 반품접수 상품은 반품접수승인(반품대기중 상태로 변경) 가능 --%>
								<c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_BACK}">
									<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_BACK_APPROVED}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="반품접수건 확인하셨습니까?">
						        	<span>반품접수승인</span></a></p>
						        </c:if>

						        <%-- 반품대기중 상품은 반품회수완료(반품승인) 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_BACK_APPROVED}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_BACK_COLLECT_END}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="반품상품을 받으셨습니까?">
						        	<span>반품회수완료(반품승인)</span></a></p>
						        </c:if>

						        <%-- 반품회수완료(반품승인) 상품은 반품완료 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_BACK_COLLECT_END}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_BACK_END}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="반품완료 처리하시겠습니까?">
						        	<span>반품완료</span></a></p>
						        </c:if>
						        <%--  부분반품완료상태를 제외하고 반품불가 가능 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_BACK
						        			 or data.ORD_PRD_ORD_STATE eq Code.OST_BACK_APPROVED
						        			 or data.ORD_PRD_ORD_STATE eq Code.OST_BACK_COLLECT_END}">
						        	<p><a href="javascript:void(0)" class="button button-a xsmall orderStateModify" title="새 창 으로 열립니다."
						        		data-code="${Code.OST_BACK_CANCEL}" data-ord_prd_idx="${data.ORD_PRD_IDX}" data-msg="반품불가 처리하시겠습니까?">
						        	<span>반품불가</span></a></p>
						        </c:if>
						        <%-- ======================== 반품 관련 주문상태 END ======================== --%>
							    
						        <%-- 배송완료 상품을 관리자가 구매확정 처리할 수 있도록 추가 --%>
						        <c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_SEND_END}">
						       	 	<p><a href="javascript:orderStateModify('${Code.OST_FIX}','<c:out value="${data.ORD_PRD_IDX}"/>');" class="button button-a xsmall" ><span>구매확정처리</span></a></p>
						        </c:if>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${not empty orderGiftList }">
						<c:forEach var="item" items="${orderGiftList}">
						<tr>
							<td>사은품</td>
							<td><c:out value="${item.GFT_MST_NAME}"/><br/><c:out value="${item.GFT_REQ_OPTION}"/></td>
							<td>0</td>
							<td>1</td>
							<td>0</td>
							<td colspan="9"></td>
						</tr>
						</c:forEach>
					</c:if>
	                </tbody>
	            </table><!-- // table -->
		    </form>

			<c:if test="${not empty orderPayInfo.ORD_MST_RFD_CD and orderState.SEND_END_CNT eq 0}">
				<div class="push-guide instant"><!-- push-guide -->
	                <i class="icon"><!-- icon --></i>
	                <h3 class="title"><span>환불계좌 정보</span></h3>
	            </div><!-- // push-guide -->

	            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 10%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
				    		<th>환불은행</th>
				    		<td style="text-align: left;">${orderPayInfo.ORD_MST_RFD_NM }</td>
				    	</tr>
				    	<tr>
				    		<th>계좌번호</th>
				    		<td style="text-align: left;">${orderPayInfo.ORD_MST_RFD_ACT }</td>
				    	</tr>
				    	<tr>
				    		<th>예금주명</th>
				    		<td style="text-align: left;">${orderPayInfo.ORD_MST_RFD_HDR }</td>
				    	</tr>
		            </tbody>
		        </table><!-- // table -->
			</c:if>

			<c:if test="${not empty orderDeliveryInfo }">
				<div class="push-guide instant"><!-- push-guide -->
	                <i class="icon"><!-- icon --></i>
	                <h3 class="title"><span>배송지정보(<em class="strong">*</em>필수입력)</span></h3>
	            </div><!-- // push-guide -->
	            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
	                <%--입금대기, 결제완료, 배송준비중 상태까지만 배송지 저장 버튼 제공 --%>
					<c:if test="${orderState.WHOLE_CANCEL_PLE_YN eq 'Y' or orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_CLEANKING_REQUEST}">
						<a href="javascript:goDeliveryModify();" class="button button-a"><span>배송지저장</span></a>
					</c:if>
	            </div><!-- // 검색 하단 버튼 -->

	            <form id="ordDlvForm" name="ordDlvForm">
					<input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/>
					<input type="hidden" id="ORD_DLV_ZIP_CDE6" name="ORD_DLV_ZIP_CDE6" value=""/>

		            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
			            <colgroup>
			                <col style="width: 10%;" />
			                <col style="width: auto;" />
			            </colgroup>
			            <tbody>
			                <tr>			                	
								<th>수령인 <em class="strong">*</em></th>
								<td>
									<input type="text" class="text short" id="ORD_DLV_NM" name="ORD_DLV_NM" value="<c:out value="${orderDeliveryInfo.ORD_DLV_NM}"/>" maxlength="15"/>
								</td>
								<th style="width:100px;">휴대폰번호 <em class="strong">*</em></th>
								<td>
									<select id="ORD_DLV_HP1" name="ORD_DLV_HP1" class="select small">
                                      		<option value="">선택</option>
						                    <c:if test="${not empty codes.HP_CODE }">
						                         <c:forEach var="row" items="${codes.HP_CODE }">
						                             <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${orderDeliveryInfo.ORD_DLV_HP1 eq row.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
						                         </c:forEach>
						                     </c:if>
					                </select>
				                    -
				                    <input type="text" id="ORD_DLV_HP2" name="ORD_DLV_HP2" class="text short number" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }"/>"/>
				                    -
				                    <input type="text" id="ORD_DLV_HP3" name="ORD_DLV_HP3" class="text short number" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }"/>"/>
								</td>
								<th style="width:100px;">전화번호</th>
								<td>
									<select id="ORD_DLV_TEL1" name="ORD_DLV_TEL1" class="select small">
                                      		<option value="">선택</option>
						                    <c:if test="${not empty codes.TEL_CODE }">
						                         <c:forEach var="row" items="${codes.TEL_CODE }">
						                             <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${orderDeliveryInfo.ORD_DLV_TEL1 eq row.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
						                         </c:forEach>
						                     </c:if>
					                </select>
				                    -
				                    <input type="text" id="ORD_DLV_TEL2" name="ORD_DLV_TEL2" class="text short number" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }"/>"/>
				                    -
				                    <input type="text" id="ORD_DLV_TEL3" name="ORD_DLV_TEL3" class="text short number" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }"/>"/>
								</td>
							</tr>
							<tr>
								<th>배송지 주소 <em class="strong">*</em></th>
								<td colspan="5" class="form-addr">
									<input type="text" id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" class="text" maxlength="5" value="<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }"/>"/>
									<%-- <input type="text" id="ORD_DLV_ZIP_CDE6_1" name="ORD_DLV_ZIP_CDE6_1" class="text short number" maxlength="3" value="<c:out value="${fn:substring(orderDeliveryInfo.ORD_DLV_ZIP_CDE6,0,3)}"/>"/>
									-
									<input type="text" id="ORD_DLV_ZIP_CDE6_2" name="ORD_DLV_ZIP_CDE6_2" class="text short number" maxlength="3" value="<c:out value="${fn:substring(orderDeliveryInfo.ORD_DLV_ZIP_CDE6,3,6)}"/>"/> --%>
									<a href="javascript:;" id="zipCheck" class="button button-a small"><span>우편번호 찾기</span></a><br/>
									<input type="text" style="width:250px;" id="ORD_DLV_DRO_ADR1" name="ORD_DLV_DRO_ADR1" class="text" maxlength="100" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }"/>"/>
									<input type="text" style="width:250px;" id="ORD_DLV_JBN_ADR1" name="ORD_DLV_JBN_ADR1" class="text" maxlength="100" value="<c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }"/>"/>
									<%-- <input type="text" id="ORD_DLV_JBN_ADR2" name="ORD_DLV_JBN_ADR2" class="text" maxlength="100" value="<c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR2 }"/>"/> --%>
									<br/>
									<input type="text" id="ORD_DLV_DRO_ADR2" name="ORD_DLV_DRO_ADR2" class="text" maxlength="100" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }"/>"/><br/>
									<span id="guide" style="color:#999;display:none"></span>
								</td>
								
							</tr>
							<tr>
								<th>배송메모</th>
								<td colspan="5">
									<input type="text" id="ORD_DLV_MSG" name="ORD_DLV_MSG" class="text long" maxlength="60" value="<c:out value="${orderDeliveryInfo.ORD_DLV_MSG }"/>"/>
								</td>
							</tr>
			            </tbody>
			        </table><!-- // table -->
				</form>

				<div id="popAddrSearch" class="pop-address-search-wrapper" style="display:none;top:0px;right:71px">
	                <form name="formAPIDiv" id="formAPIDiv" method="post" onsubmit="return false;">
	                    <input type="hidden" id="confmKey" name="confmKey" value="TESTJUSOGOKR" style="width:400px"/>
	                    <input type="hidden" id="currentPage" name="currentPage"  value="1" style="width:100px"/>
	                    <input type="hidden" id="countPerPage" name="countPerPage" value="5" style="width:100px"/>
	                    <input type="hidden" name="countPageTot" value=""/>
	                    <div class="pop-address-search-form pop-address-search-layer3">
	                        <div class="pop-address-header">
	                            <a class="close" href="#" onClick="document.getElementById('popAddrSearch').style.display='none'; return false;">x</a>
	                            <h1 style="text-align:center; font-size:20px">우편번호 검색</h1>
	                        </div>
	                        <div class="pop-address-body">
	                            <fieldset class="pop-address-field">
	                                <legend>도로명주소 검색</legend>
	                                <span class="pop-addr-wrap">
	                                    <div class="pop-keyword">
	                                        <input type="text" id="keyword" align="center" name="keyword" onkeypress="enterSearchDiv();" style="width:70%" title="검색어 입력" placeholder= "도로명주소, 건물명 또는 지번 입력">
	                                       <%--   <a href="javascript:searchDivButton();" title="검색"><span class="blind"><img src="<c:out value="${cdnDomain}" />/pc/img/lay/ico_sh.gif" alt=""></span></a>  --%>
	                                         <!-- <a href="javascript:searchDivButton();" class="button button-b"><span>검색</span></a> -->
	                                        <input type="button" class="button button-a primary" style='cursor:pointer;' id=""  onclick="javascript:searchDivButton();" value="검색">
	                                    </div>
	                                </span>
	                            </fieldset>
	                            <h4 class="title"><span>해당되는 주소를 선택해주세요.</span></h4>
	                            <table class="table-col table-b data-col" align="center">
	                                <caption>검색 결과</caption>
	                                <colgroup>
	                                    <col style="width:90px">
	                                    <col style="width: 380px">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <th scope="col">우편번호</th>
	                                        <th scope="col">도로명주소</th>
	                                    </tr>
	                                </thead>
	                                <tbody  id="listDiv"></tbody> <!-- 주소검색한 목록 출력 -->
	                            </table>
	                            <div class="paginate" id="pageApiDiv"></div>    <!-- 주소 검색한 목록 페이지 -->
	                            <div id="totalCntDiv"></div>
	                        </div>
	                    </div>
	                </form>
	            </div><!-- //우편번호 검색 레이어팝업 -->
			</c:if>

			<!-- 겟잇나우 주문인 경우 -->
			<c:if test="${not empty orderInfo.ORD_GET_SHP_MST_IDX }">
				<div class="push-guide instant"><!-- push-guide -->
	                <i class="icon"><!-- icon --></i>
	                <h3 class="title"><span>픽업정보(<em class="strong">*</em>필수입력)</span></h3>
	            </div><!-- // push-guide -->

	            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
	                <%--입금대기, 결제완료, 배송준비중 상태까지만 배송지 저장 버튼 제공 --%>
					<c:if test="${orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_PAY or orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_SEND_READY }">
						<a href="javascript:sendExchangeTicketPopup();" class="button button-a"><span>픽업정보 수정</span></a>
					</c:if>
	            </div><!-- // 검색 하단 버튼 -->

	            <form id="ordGetForm" name="ordGetForm">
					<input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/>

		            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
			            <colgroup>
			                <col style="width: 10%;" />
			                <col style="width: auto;" />
			                <col style="width: 10%;" />
			                <col style="width: auto;" />
			            </colgroup>
			            <tbody>
			                <tr>
								<th>수령인 <em class="strong">*</em></th>
								<td>
									<%-- <input type="text" class="text" id="ORD_GET_NM" name="ORD_GET_NM" value="<c:out value="${orderInfo.ORD_GET_NM}"/>" maxlength="15"/> --%>
									<c:out value="${orderInfo.ORD_GET_NM}"/>
								</td>
								<th style="width:100px;">휴대폰번호 <em class="strong">*</em></th>
								<td>${orderInfo.ORD_GET_TEL1}-${orderInfo.ORD_GET_TEL2}"-${orderInfo.ORD_GET_TEL3}</td>
							</tr>
							<tr>
								<th>주문자와의 관계</th>
								<td>
					                <c:if test="${not empty codes.GET_IT_NOW_RECEIVER_CD }">
				                         <c:forEach var="row" items="${codes.GET_IT_NOW_RECEIVER_CD }">
				                         	<c:if test="${orderInfo.ORD_GET_RLT eq row.CMN_COM_ETC1 }">
				                         		<c:out value="${row.CMN_COM_NM }"/>
				                         	</c:if>
				                         </c:forEach>
				                     </c:if>
								</td>
								<th>상품수령매장</th>
								<td>
									<c:out value="${orderInfo.SHP_MST_NM}"/>
								</td>
							</tr>
			            </tbody>
			        </table><!-- // table -->
				</form>
	    	</c:if>

	    	<div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>결제정보</span></h3>
            </div><!-- // push-guide -->
			
			<c:set var="discount">
				${orderPayInfo.ORD_MST_DC_CPN + orderPayInfo.ORD_MST_DC_OCB_PIT + pointInfo.ALL_POINT}
			</c:set>
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
	                <col style="width: auto;" />
	            </colgroup>
	            <thead>
					<tr>
						<th>결제일시</th>
						<th>결제수단</th>
						<th>승인/계좌번호(MID)</th>
						<th>주문금액</th>
						<th>할인금액</th>
						<th>배송비</th>
						<th>결제금액</th>
						<th>적립예정<br/>통합포인트</th>
					</tr>
				</thead>
	            <tbody>
	                <tr>
			    		<td>
			    			<c:choose>
                           		<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CLEANKING}">
                           			<ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy-MM-dd HH:mm:ss"/>
                           		</c:when>
                           		<c:otherwise>
                           			<c:if test="${orderPayInfo.ORD_MST_PAY_DT eq '00000000000000' }">
	                            		-
	                            	</c:if>
	                            	<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' }">
	                            		<ui:formatDate value="${orderPayInfo.PAY_MST_PAYDATE}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                            	</c:if>
                           		</c:otherwise>
                           	</c:choose>
			    		</td>
		    			<c:if test="${orderInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD || orderInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD}">
			    			<td>신용카드</td>
				            <td style="text-align:left;">
								<p><c:out value="${orderPayInfo.PAY_MST_FINANCENAME}"/> (${orderPayInfo.PAY_MST_PG_CARDNUM})</p>
								<p>
									<c:choose>
	                                    <c:when test="${orderPayInfo.PAY_MST_KICC_INSTALL_PERIOD eq '00' }">일시불</c:when>
	                                    <c:otherwise>
	                                    	<fmt:formatNumber value="${orderPayInfo.PAY_MST_KICC_INSTALL_PERIOD }" type="number"/>개월 할부
	                                    </c:otherwise>
	                                </c:choose>
								</p>
								<p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO}"/></p>
								<p>
									PAYZONE 거래번호 : <c:out value="${orderPayInfo.PAY_MST_TID}"/><br/>
									<!-- 가맹점 거래번호 : ????? -->
								</p>
							</td>
				        </c:if>
			            <c:if test="${orderInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}">
				            <td>계좌이체</td>
				            <td style="text-align:left;">
								<p>[<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM}"/>]<c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO}"/></p>
								<p>
									PAYZONE 거래번호 : <c:out value="${orderPayInfo.PAY_MST_TID}"/><br/>
									<!-- 가맹점 거래번호 : ????? -->
								</p>
							</td>
				        </c:if>
			            <c:if test="${orderInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT || orderInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW}">
			            	<td>가상계좌(무통장)</td>
			                <c:choose>
			                    <c:when test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000'}">
						            <td style="text-align:left;">
										<p>[<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM}"/>]<c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO}"/></p>
										<p>입금자명 : <c:out value="${orderPayInfo.ORD_MST_DPS_NM}"/></p>
										<p>
											PAYZONE 거래번호 : <c:out value="${orderPayInfo.PAY_MST_TID}"/><br/>
											<!-- 가맹점 거래번호 : ????? -->
										</p>
									</td>
			                    </c:when>
			                    <c:otherwise>
			                    	<td style="text-align:left;">
										<p>[<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM}"/>]<c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO}"/></p>
										<p>입금만료일 : <ui:formatDate value="${orderPayInfo.PAY_MST_KICC_EXPIRE_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
										<p>입금자명 : <c:out value="${orderPayInfo.ORD_MST_DPS_NM}"/></p>
										<p>
											PAYZONE 거래번호 : <c:out value="${orderPayInfo.PAY_MST_TID}"/><br/>
											<!-- 가맹점 거래번호 : ????? -->
										</p>
									</td>
			                    </c:otherwise>
			                </c:choose>
				        </c:if>
				        <c:if test="${orderInfo.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY}">
					        <td>카카오페이</td>
					        <td style="text-align:left;">
				                <p>[카카오페이 결제]</p>
				                <p><c:out value="${orderPayInfo.PAY_MST_KAKAO_CARDNAME}"/> ( <c:out value="${fn:substring(orderPayInfo.PAY_MST_KAKAO_CARDBIN,0,4) }" />-<c:out value="${fn:substring(orderPayInfo.PAY_MST_KAKAO_CARDBIN,4,8) }" />-****-**** )</p>
								<p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KAKAO_AUTHCODE}"/></p>
								<p>TID : <c:out value="${orderPayInfo.PAY_MST_TID}"/></p>
								<p>결제일시 : <ui:formatDate value="${orderPayInfo.PAY_MST_PAYDATE}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
							</td>
				        </c:if>
				        <c:if test="${orderInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE}">
			                <td>포인트</td>
			                <td>
			                	-
			                </td>
				        </c:if>
				        <%-- <c:if test="${orderInfo.ORD_MST_PAY_TYPE eq Code.PAY_CLEANKING}">
			                <td>클린킹</td>
			                <td>
			                	-
			                </td>
				        </c:if> --%>
				        <td>
				        	<fmt:formatNumber value="${orderPayInfo.TOT_ORD_PRD_PRD_PRC}" type="number"/>
				        </td>
				        <td>
				        	-<fmt:formatNumber value="${orderPayInfo.TOT_ORD_IST_CPN_PRC - discount}" type="number"/>
				        </td>
				        <td>
				        	<fmt:formatNumber value="${orderPayInfo.ORD_MST_DLV_CAG}" type="number"/>
				        	<c:if test="${ORD_DLV_ADD_CHARGE gt 0 }">
				        		<br/>(추가배송비 : <fmt:formatNumber value="${ORD_DLV_ADD_CHARGE}" type="number"/>)
				        	</c:if>
				        </td>
				        <td>
				        	<fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>
				        </td>
				        <td>
				        	<fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_MIL}" type="number"/>
				        </td>
			    	</tr>
	            </tbody>
	        </table><!-- // table -->

	        <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>할인정보</span></h3>
            </div><!-- // push-guide -->

            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	            <colgroup>
					<col style="width: 20%;" />
					<col style="width: auto;" />
					<col style="width: 20%;" />
				</colgroup>
	            <thead>
					<tr>
						<th>구분</th>
						<th>번호/명</th>
						<th>금액</th>
					</tr>
				</thead>
	            <tbody>
	            	<c:set var="coupon_sum">0</c:set>
                    <c:choose>
                        <c:when test="${not empty orderCouponList }">
                            <c:forEach var="row" items="${orderCouponList }" varStatus="i">
                        		<tr>
                        			<td>할인쿠폰</td>
                        			<td>${row.CPN_MST_TITLE }</td>
                        			<td>
			                           <fmt:formatNumber value="${row.SUM_ORD_CPN_DC_AMT}" type="number"/>
			                           <c:set var="coupon_sum">${coupon_sum + row.SUM_ORD_CPN_DC_AMT }</c:set>
			                      	</td>
			                    </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                        	<tr>
                        		<td>할인쿠폰</td>
		                      	<td>-</td>
		                      	<td>0</td>
		                  	</tr>
                        </c:otherwise>
                   	</c:choose>
                   	<tr>
                       <td>프로모션할인</td>
                       <td>${promotionCouponInfo.CPN_MST_TITLE == null ? '-' : promotionCouponInfo.CPN_MST_TITLE }</td>
                       <td><fmt:formatNumber value="${pointInfo.PROMOTION}" type="number"/></td>
                   	</tr>
			    	<tr>
			    		<td>통합포인트</td>
			    		<td>-</td>
			    		<td><fmt:formatNumber value="${pointInfo.TOT_POINT}" type="number"/></td>
			    	</tr>
                    <tr>
			    		<td>E포인트</td>
			    		<td>-</td>
			    		<td><fmt:formatNumber value="${pointInfo.E_POINT }" type="number"/></td>
			    	</tr>
			    	<tr>
                        <td>임직원 할인금액</td>
                        <td>-</td>
                        <td><fmt:formatNumber value="${pointInfo.SW_POINT }" type="number"/></td>
                    </tr>
                    <tr>
                        <td>제휴사 할인금액</td>
                        <td>-</td>
                        <td>
                        	<fmt:formatNumber value="${orderPayInfo.TOT_ORD_PRD_PRD_PRC - orderPayInfo.ORD_MST_PAY_PRC - coupon_sum - pointInfo.ALL_POINT }" type="number"/>
                        </td>
                    </tr>
			    	<tr>
			    		<td colspan="2" style="background:#eee;">합계</td>
			    		<td><fmt:formatNumber value="${discount}" type="number"/></td>
			    	</tr>
	            </tbody>
	        </table><!-- // table -->

            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>매장수수료정보</span></h3>
            </div><!-- // push-guide -->

            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	            <colgroup>
                    <col style="width: 20%;" />
					<col style="width: auto;" />
					<col style="width: 20%;" />
				</colgroup>
	            <thead>
					<tr>
						<th>매장명</th>
						<th>상품명</th>
						<th>예상수수료</th>
					</tr>
				</thead>
	            <tbody>
	                <tr>
			    		<td>현대(아)가산</td>
			    		<td>이태리 블루 라운드 니트(PWUCI8009)</td>
			    		<td>10,000</td>
			    	</tr>
			    	<tr>
			    		<td>롯데김포공항</td>
			    		<td>앙고라 체크 밸트 더블 롱 코트(SWHAZ2628)</td>
			    		<td>10,000</td>
			    	</tr>
			    	<tr>
			    		<td>롯데본점</td>
			    		<td>이태리 블루 라운드 니트(PWUCI8009)</td>
			    		<td>10,000</td>
			    	</tr>
			    	<tr>
			    		<td colspan="2" style="background:#eee;">합계</td>
			    		<td>30,000</td>
			    	</tr>
	            </tbody>
	        </table><!-- // table -->

        </div>
    </div>
</div>

<form id="invoiceNoform" name="invoiceNoform">
	<input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/>
	<input type="hidden" id="ORD_PRD_IDX" name="ORD_PRD_IDX" value=""/>
	<input type="hidden" id="ORD_DLV_CPN_IDX" name="ORD_DLV_CPN_IDX" value=""/>
	<input type="hidden" id="ORD_PRD_IVC_NO" name="ORD_PRD_IVC_NO" value=""/>
	<input type="hidden" id="ORD_DLV_CPN_NM" name="ORD_DLV_CPN_NM" value=""/>
</form>

<form id="prdFrm" name="prdFrm">
	<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value=""/>
	<input type="hidden" id="searchPrdMstErpCd" name="searchPrdMstErpCd" value=""/>
</form>

<%-- 상품 교체용 폼 --%>
<form id="changePrdFrm" name="changePrdFrm">
	<input type="hidden" name="searchType" value="D"/>
	<input type="hidden" name="searchOrdPrdIdx" value=""/>
</form>
<link rel="stylesheet" type="text/css" href="<c:out value="${serverDomain}" />/am/css/postAddr.css">
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.blockUI.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/postAddr.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ORD_DLV_ZIP_CDE5').value = data.zonecode;
                document.getElementById("ORD_DLV_DRO_ADR1").value = roadAddr;
                document.getElementById("ORD_DLV_JBN_ADR1").value = data.jibunAddress;
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script type="text/javascript">
$(function () {

	var ord_mst_cd = "${orderInfo.ORD_MST_CD}";
	var $ordDlvForm = $("#ordDlvForm");
	var $ordGetForm = $("#ordGetForm");
	var $invoiceNoform = $("#invoiceNoform");
	var $frm = $("#frm");
	var $changePrdFrm = $("#changePrdFrm");

	$(document).on("click",".selectAll",function(){
		if($(this).is(":checked")){
			$(".ORD_PRD_IDXs").each(function(){
				if(!$(this).prop("disabled")){
					$(this).prop("checked", true);
				}
			});
		}else{
			$(".ORD_PRD_IDXs").each(function(){
				if(!$(this).prop("disabled")){
					$(this).prop("checked", false);
				}
			});
		}
	});

	// 체크박스 변경시
	//$.checkBoxSelect("checkAll", "checkRow");
	$(document).on("change",".ORD_PRD_IDXs",function(){
       //전체체크 해제
		if(!$(this).is(":checked")){
			$("#selectAll").prop("checked", false);
		}
	});
	
	// 다음 우편번호 팝업
	$(document).on("click","#zipCheck",function(){
    	sample4_execDaumPostcode();
    });
	
	// 상품 상세페이지 이동
	goProductView = function (prdMstCd){
		var $prdFrm = $("#prdFrm");
		$("#PRD_MST_CD").val(prdMstCd);
		$prdFrm.attr({"action":"${serverDomain}/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
	};

 	//erp 상품 상세페이지 팝업
	goErpPrdDetail = function (erpMstCd){
		var $prdFrm = $("#prdFrm");
		$("#searchPrdMstErpCd").val(erpMstCd);
		popup('',"1100","800","no","_ErpMstPrdDetailPopup");
		$prdFrm.attr({"action":"${serverDomain}/am/product/legacyErpProductDetailPopup.do", "target":"popup_ErpMstPrdDetailPopup", "method":"post"}).submit();
	};

	// 상품검색
	goChangePrd = function(ordPrdIdx){
		popup('',"1100","900","no","_ProductEsmPopup");
  		$changePrdFrm.find("input[name=searchOrdPrdIdx]").val(ordPrdIdx);
  		$changePrdFrm.attr({"action":"${serverDomain}/am/product/searchProductEsmPopup.do", "target":"popup_ProductEsmPopup", "method":"post"}).submit();
	};

	//상품팝업 상품선택시 호출되는 메소드
	fnResultProduct = function(params){
  		var bCheck = true;
  		if( bCheck ){
      	//배열재정의
      		var arrayObj = new Array();
  			var obj;
  			var totPrice = 0;

  			var ordPrdIdx = "";
  			var htmlStr = "변경상품<br/>"
	  		$.each(params, function(index,item){
	  			ordPrdIdx = item.ORD_PRD_IDX;
	      		htmlStr += "상품코드 : " + item.PRD_MST_CD + "<br/>";
	      		htmlStr += "ERP 상품코드 : " + item.PRD_MST_ERP_CD + "<br/>";
	      		htmlStr += "상품명 : " + item.PRD_MST_NM + "<br/>";
	      		htmlStr += "옵션명 : " + item.OPT_DTL_NM + "<br/>";
	      		//htmlStr += "입점상품여부 : " + item.PRD_MST_VDR_YN + "<br/>";
	
	      		htmlStr += "<input type=\"hidden\" name=\"REPLACE_PRD_MST_CD_"+ ordPrdIdx +"\" value=\""+ item.PRD_MST_CD +"\" />";
	      		htmlStr += "<input type=\"hidden\" name=\"REPLACE_PRD_MST_ERP_CD_"+ ordPrdIdx +"\" value=\""+ item.PRD_MST_ERP_CD +"\" />";
	      		htmlStr += "<input type=\"hidden\" name=\"REPLACE_OPT_DTL_IDX_"+ ordPrdIdx +"\" value=\""+ item.OPT_DTL_IDX +"\" />";
	      		htmlStr += "<input type=\"hidden\" name=\"REPLACE_PRD_MST_VDR_YN_"+ ordPrdIdx +"\" value=\""+ item.PRD_MST_VDR_YN +"\" />";
	      	});

  		$("#changePrdArea_"+ordPrdIdx).html(htmlStr);
		return true;
		}
	};

	//주문상태 변경내역 팝업
	orderHistoryPopup = function (idx){
		popup("${serverDomain}/am/order/orderHistoryPopup.do?ORD_MST_CD=" + ord_mst_cd + "&ORD_PRD_IDX=" + idx, "800", "500", "yes", 2);
	};
	// 배송조회 팝업페이지 호출
	goDeliveryView = function (url){
   	//goSearchDelivery(url);
       popup(url, "550", "700", "yes", "deliveryView");
	};
	// 회원정보 상세 팝업페이지 호출
	goView = function (memMstWebId){
   		goMemberViewPopup("${serverDomain}", memMstWebId);
	};
	 // 우편번호 찾기 클릭 이벤트
	$(document).on("click","#zipCheck",function(){
		window.open("${serverDomain}/am/common/commonZipCodePopup.do","commonCodePopup","width=550,height=650,scrollbars=yes,target=_blank");
	});
	// 우편번호 callback 함수
	zipcodeCallback = function (zip,doroAddr,jibunAddr){
		$('#ORD_DLV_ZIP_CDE5').val(zip);
		$('#ORD_DLV_DRO_ADR1').val(doroAddr);
		$('#ORD_DLV_JBN_ADR1').val(jibunAddr);
	};

	// 주문상태변경 
	$(document).on("click",".orderStateModify",function(){
		let orderState = $(this).data('code');
		let ordPrdIdx = $(this).data('ord_prd_idx');
		let msg = $(this).data('msg');
	
		if(confirm(msg)){
	   		$("#ORD_PRD_ORD_STATE").val(orderState);
	   		$("#ORD_PRD_IDX").val("");
	   		$("#ORD_PRD_IDX_ARR").val(ordPrdIdx);
	   		$("#sendEndSmYn").val("N");
	   		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderList/orderStateModify.do", "target":"_self", "method":"post"}).submit();
	   		blockScreen();
	   	}
	})
	   	
	// 송장번호 update
	invoiceNoProc = function(ordPrdIdx){
		var $ORD_DLV_CPN_IDX = $("#ORD_DLV_CPN_IDX_"+ordPrdIdx);
		var $ORD_PRD_IVC_NO = $("#ORD_PRD_IVC_NO_"+ordPrdIdx);

		// 변경상태 체크
		if($ORD_DLV_CPN_IDX.val()==""){
			alert("택배사를 선택해 주십시오");
			$ORD_DLV_CPN_IDX.focus();
			return;
		}

       // 송장번호 체크
		if($.trim($ORD_PRD_IVC_NO.val())==""){
			alert("송장번호를 입력해 주십시오");
			$ORD_PRD_IVC_NO.focus();
			return;
		}

		if(confirm("저장 하시겠습니까?")){
   			$("#ORD_PRD_IDX").val(ordPrdIdx);
   			$("#ORD_DLV_CPN_IDX").val($ORD_DLV_CPN_IDX.val());
   			$("#ORD_DLV_CPN_NM").val($("#ORD_DLV_CPN_IDX_"+ordPrdIdx+" option:selected").text());
   			$("#ORD_PRD_IVC_NO").val($.trim($ORD_PRD_IVC_NO.val()));
           	$invoiceNoform.attr({"action":"${serverDomain}/am/order/orderList/invoiceNoProc.do", "target":"_self", "method":"post"}).submit();
			blockScreen();
		}
	};
   
	//옵션변경 팝업
	changeProductOptionPopup = function (ov) {
		popup("<c:out value="${serverDomain}"/>/am/order/changeProductOptionPopup.do?ORD_MST_CD=<c:out value="${orderInfo.ORD_MST_CD}"/>&ORD_PRD_IDX="+ov, "600", "400", "yes",2);
	};

   // 배송지 저장
   <c:if test="${orderState.WHOLE_CANCEL_PLE_YN eq 'Y'}">
	    goDeliveryModify = function(){

	    	// 폼체크
	        $ordDlvForm.validate({
	            rules: {
	            	ORD_DLV_NM : { required:true },  				  // 수령인
	            	ORD_DLV_HP1 : { required:true },  				  // 휴대폰번호1
	            	ORD_DLV_HP2 : { required:true },  				  // 휴대폰번호2
	            	ORD_DLV_HP3 : { required:true },  				  // 휴대폰번호3
	            	ORD_DLV_ZIP_CDE5 : { required:true },  				  // 신우편번호
	            	ORD_DLV_DRO_ADR1 : { required:true },  				  // 신주소1
	            	ORD_DLV_DRO_ADR2 : { required:true },  				  // 신주소2
	            	ORD_DLV_JBN_ADR1 : { required:true }  				  // 구주소1
	            },
	            messages: {
	            	ORD_DLV_NM : { required:"수령인은 필수입력 사항입니다." },  				  // 수령인
	            	ORD_DLV_HP1 : { required:"휴대폰번호는 필수입력 사항입니다." },  				  // 휴대폰번호1
	            	ORD_DLV_HP2 : { required:"휴대폰번호는 필수입력 사항입니다." },  				  // 휴대폰번호2
	            	ORD_DLV_HP3 : { required:"휴대폰번호는 필수입력 사항입니다." },  				  // 휴대폰번호3
	            	ORD_DLV_ZIP_CDE5 : { required:"신우편번호는 필수입력 사항입니다." },  				  // 신우편번호
	            	ORD_DLV_DRO_ADR1 : { required:"주소는 필수입력 사항입니다." },  				  // 신주소1
	            	ORD_DLV_DRO_ADR2 : { required:"주소는 필수입력 사항입니다." },  				  // 신주소2
	            	ORD_DLV_JBN_ADR1 : { required:"주소는 필수입력 사항입니다." }  				  // 구주소1
	            }
	        });

	    	if($ordDlvForm.valid()){
	    		if(confirm("저장하시겠습니까?")){
	    			//$("#ORD_DLV_ZIP_CDE6").val($("#ORD_DLV_ZIP_CDE6_1").val() + "" +$("#ORD_DLV_ZIP_CDE6_2").val());

		    		$ordDlvForm.attr({"action":"${serverDomain}/am/order/orderList/orderDeliveryModify.do", "target":"_self", "method":"post"}).submit();
		    		blockScreen();
	    		}
	    	}
	    }
	</c:if>

	<c:if test="${not empty orderInfo.ORD_GET_SHP_MST_IDX}">
	    // 픽업정보 저장
		goGetItNowInfoModify = function(){

   			// 폼체크
			$ordGetForm.validate({
				rules: {
	           		ORD_GET_NM : 	{ required:true },  				  	// 수령인
	           		ORD_GET_TEL1 : 	{ required:true },  				  	// 휴대폰번호1
	           		ORD_GET_TEL2 : 	{ required:true },  				  	// 휴대폰번호2
	           		ORD_GET_TEL3 : 	{ required:true }  				  		// 휴대폰번호3
				},
				messages: {
	           		ORD_GET_NM : 	{ required:"수령인은 필수입력 사항입니다." },  		// 수령인
	           		ORD_GET_TEL1 : 	{ required:"휴대폰번호는 필수입력 사항입니다." }, 	// 휴대폰번호1
	           		ORD_GET_TEL2 : 	{ required:"휴대폰번호는 필수입력 사항입니다." },   	// 휴대폰번호2
	           		ORD_GET_TEL3 : 	{ required:"휴대폰번호는 필수입력 사항입니다." } 	// 휴대폰번호3
	           }
			});

		   	if($ordGetForm.valid()){
		   		if(confirm("저장하시겠습니까?")){
		    		$ordGetForm.attr({"action":"${serverDomain}/am/order/orderList/orderGetItNowInfoModify.do", "target":"_self", "method":"post"}).submit();
		    		blockScreen();
		   		}
		   	}
		}
	</c:if>

	function blockScreen(){
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

	/*우편번호찾기 > 주소 선택 후 콜백 */
	function openApiDivCallBack(roadFullAddr,roadAddrPart1,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList){
		document.ordDlvForm.ORD_DLV_ZIP_CDE5.value = zipNo ;
		document.ordDlvForm.ORD_DLV_DRO_ADR1.value = roadAddrPart1 + roadAddrPart2 ;
		document.ordDlvForm.ORD_DLV_DRO_ADR2.value = "" ;
		document.ordDlvForm.ORD_DLV_JBN_ADR1.value = jibunAddr;
		document.getElementById('popAddrSearch').style.display='none';  //div 닫기
		//검색 후 해당 주소를 선택 -> div 닫음
	}
	
	// 입금대기 -> 결제완료(테스트용)
	$('#btn_pay').click(function() {
		let orderState = ${Code.OST_PAY};
		let idxs = new Array();
		$('input[name="ORD_PRD_IDXs"]').each(function() {
			idxs.push($(this).val()); 
		})
		let msg = "결제완료 처리하시겠습니까?";
		if(confirm(msg)){
	   		$("#ORD_PRD_ORD_STATE").val(orderState);
	   		$("#ORD_PRD_IDX").val("");
	   		$("#ORD_PRD_IDX_ARR").val(idxs.join(","));
	   		$("#sendEndSmYn").val("N");
	   		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderList/orderStateModify.do", "target":"_self", "method":"post"}).submit();
	   		blockScreen();
	   	}
	});
	
	// 팝업창 초기값
	var popupWidth = 800;
	var popupHeight = 550;
	
	//주문취소 팝업
	orderCancelPopup = function (orderState, idx) {
		popup("${serverDomain}/am/order/orderCancelPopup.do?ORD_MST_CD=" + ord_mst_cd
				+ "&STATE="+orderState+"&arrORD_PRD_IDXs="+idx, popupWidth, popupHeight, "yes",2);
	};
	
	// 주문취소 버튼 클릭시
	$('#btn_cancel').click(function() {
		orderState = "${Code.OST_CANCEL }";
		let order_cancel_y_list = '${order_cancel_y_list}';
		let idxs = new Array();
		let vdr_mst_nm = '';
		let chk = true;
		$('input[name="ORD_PRD_IDXs"]:checked').each(function() {
			if(order_cancel_y_list.indexOf($(this).val()) >= 0){
				idxs.push($(this).val()); 
			}else{
				alert('선택된 상품 중 취소가 불가능한 상품이 있습니다.(' + $(this).data('prd_mst_nm') + ')');
				chk = false;
				return;
			}
		})
		if(chk && idxs.length == 0){
			alert("선택된 상품이 없습니다.");
			chk = false;
			return;
		}else if("${orderProductList[0].ORD_PRD_ORD_STATE}" == "${Code.OST_PAY_READY}"
				&& $('input[name="ORD_PRD_IDXs"]:checked').length != $('input[name="ORD_PRD_IDXs"]').length){
			alert("입금대기 상태에서는 전체 취소만 가능합니다. 취소하시려면 상품을 모두 선택해주세요.");
			return;
		}
		if(chk){
			orderCancelPopup(orderState, idxs.join(","));
		}
	});
	
	// 취소상세 버튼 클릭시
	$('.orderCancelDetail').click(function() {
		orderCancelPopup(-1, $(this).data("ord_prd_idx"));
	})
	
	// 교환접수 버튼 클릭시
	$('#btn_swap').click(function() {
		let order_swap_y_list = '${order_swap_y_list}';
		let idxs = new Array();
		let vdr_mst_nm = '';
		let chk = true;
		$('input[name="ORD_PRD_IDXs"]:checked').each(function() {
			if(order_swap_y_list.indexOf($(this).val()) >= 0){
				idxs.push($(this).val()); 
			}else{
				alert('선택된 상품 중 교환이 불가능한 상품이 있습니다.(' + $(this).data('prd_mst_nm') + ')');
				chk = false;
				return;
			}
		})
		if(chk && idxs.length == 0){
			alert("선택된 상품이 없습니다.");
			chk = false;
			return;
		}
		if(chk){
			changeOrderProductPop('${Code.OST_SWAP }', idxs.join(","));
		}
	});
	
	// 교환상품 접수/관리 팝업
	changeOrderProductPop = function (orderState, idx) {
		let url = "${serverDomain}/am/order/changeOrderProductPopup.do?ORD_MST_CD="
    		+ ord_mst_cd + "&STATE=" + orderState + "&arrORD_PRD_IDXs=" + idx;
		popup(url, popupWidth, popupHeight, "yes",2);
	};
	
	// 교환상세 버튼 클릭시
	$('.orderSwapDetail').click(function() {
		changeOrderProductPop(-1, $(this).data("ord_prd_idx"));
	});
	
	// 반품접수/상세 팝업
	orderBackPopup = function (orderState, idx) {  
	    let url = "${serverDomain}/am/order/orderBackPopup.do?ORD_MST_CD="
	    		+ ord_mst_cd + "&STATE=" + orderState + "&arrORD_PRD_IDXs=" + idx;
	    popup(url, popupWidth, popupHeight, "yes",2);
	};

	// 반품접수 버튼 클릭시
	$('#btn_back').click(function() {
		let order_back_y_list = '${order_back_y_list}';
		let idxs = new Array();
		let vdr_mst_nm = '';
		let chk = true;
		$('input[name="ORD_PRD_IDXs"]:checked').each(function() {
			if(order_back_y_list.indexOf($(this).val()) >= 0){
				idxs.push($(this).val()); 
				if(vdr_mst_nm == '') {
					vdr_mst_nm = $(this).data('vdr_mst_nm');
				}else{
					if(vdr_mst_nm != $(this).data('vdr_mst_nm')){
						alert('같은 판매자의 상품만 동시에 반품접수가 가능합니다. 상품을 다시 확인해주세요.');
						chk = false;
						return;
					}
				}
			}else{
				alert('선택된 상품 중 반품접수가 불가능한 상품이 있습니다.(' + $(this).data('prd_mst_nm') + ')');
				chk = false;
				return;
			}
		})
		if(chk && idxs.length == 0){
			alert("선택된 상품이 없습니다.");
			chk = false;
			return;
		}
		if(chk){
			orderBackPopup('${Code.OST_BACK }', idxs.join(","));
		}
	});
	
	// 반품상세 버튼 클릭시
	$('.orderBackDetail').click(function() {
		orderBackPopup(-1, $(this).data("ord_prd_idx"));
	})
}) 

</script>
</body>
</html>
