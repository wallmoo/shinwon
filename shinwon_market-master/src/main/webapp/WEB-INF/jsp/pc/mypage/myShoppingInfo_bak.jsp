<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
    
    <%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
    
    <!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <dl class="loc">
                <dt class="blind">현재 카테고리 경로</dt>
                <dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
                <dd><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do"><span>마이페이지</span></a></dd>
                <dd class="l"><a href="javascript:void(0)"><span>주문상세조회</span></a></dd>
            </dl>
            
            <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
            
            <form id="frm" name="frm">
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	            <input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }" />
	            <input type="hidden" id="searchCancelBack" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
	            <input type="hidden" id="searchState" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
	        </form>

            <div id="body"><!-- #body -->

                <h3 class="title">주문상세조회</h3>

                <p>
                    <span class="message notice-b">
                        교환/반품 신청은 배송완료 이후에만 가능하며, 교환/반품을 원하시면 1:1문의를 통해 문의해 주시기 바랍니다.
                    </span>
                    <a href="<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do" class="btn_st0 btn_blk small"><span>1:1문의 바로가기</span></a>
                </p>

                <table class="table-a table-col mt10"><!-- table-a -->
                <caption>주문번호, 주문일로 구성된 주문상세정보 테이블입니다.</caption>
                <colgroup>
                    <col style="width: 120px;" />
                    <col style="width: auto;" />
                    <col style="width: 120px;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span>주문번호</span></th>
                        <td>
                            <c:out value="${orderPayInfo.ORD_MST_CD }" />&nbsp;
                            <c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y' }">
                            	<a href="javascript:;" id="orderCancel" class="btn_st0 btn_white small26">
					            	<span>주문취소</span>
                            	</a>
                            </c:if>
                            <c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN ne 'Y' and orderPayInfo.ORD_MST_CNL_YN ne 'Y' }">
                            	<c:if test="${orderState.SEND_READY_CNT gt 0 or orderState.SEND_CNT gt 0}">
	                				<a href="javascript:;" id="orderCancelRequest" class="btn_st0 btn_white small26"><span>취소요청</span></a>
	                			</c:if>
	                		</c:if>
	                		
	                		<%-- 클린킹인 경우, 예약취소 버튼 --%>
							<c:if test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
								<%-- 예약상담 신청인 경우  --%>
								<c:if test="${orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_CLEANKING_REQUEST}">
									<a href="javascript:;" id="orderCleankingCancel" class="btn_st0 btn_white small26">
										예약취소
									</a>
								</c:if>
								
								<%-- 예약상담확정인 경우  --%>
								<c:if test="${orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_CLEANKING_CONFIRM}">
									<a href="javascript:;" id="orderCancelRequest" class="btn_st0 btn_white small26"><span>취소요청</span></a>
								</c:if>
							</c:if>
							
							<c:if test="${orderPayInfo.ORD_MST_CNL_YN eq 'Y' }">
								<span>취소요청</span>
	                		</c:if>	
                        </td>
                        <th scope="row">
                        	<c:choose>
		                	<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
								<span>상담예약일</span>
				            </c:when>
				            <c:otherwise>
				            	<span>주문일</span>
				            </c:otherwise>
				            </c:choose>
                        </th>
                        <td><ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></td>
                    </tr>
                </tbody>
                </table><!-- // table-a -->

                <h4 class="title">
                    	주문상품정보
                    <p class="desc dotum">
                        * 운송장 번호를 클릭 하시면 상품의 배송상태를 확인 하실 수 있습니다.
                    </p>
                </h4>

                <table class="table-product"><!-- table-product -->
                <caption>상품정보, 판매가, 수량, 주문금액, 배송정보, 진행현황으로 구성된 주문상품정보 목록입니다.</caption>
                <colgroup>
                    <col style="width: 3%;" />
                    <col style="width: auto;" />
                    <col style="width: 11.5%;" />
                    <col style="width: 5.5%;" />
                    <col style="width: 11.5%;" />
                    <col style="width: 11%;" />
                    <col style="width: 15%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><input type="checkbox" id="selectAll" class="selectAll" title="모두선택" /></th>
                        <th scope="col"><span>상품정보</span></th>
                        <th scope="col"><span>판매가</span></th>
                        <th scope="col"><span>수량</span></th>
                        <th scope="col"><span>주문금액</span></th>
                        <th scope="col"><span>배송정보</span></th>
                        <th scope="col"><span>진행현황</span></th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="row" items="${orderProductList}">
	                <tr>
	                	<td class="check"><input type="checkbox" class="ORD_PRD_IDXs" name="ORD_PRD_IDXs" value="<c:out value="${row.ORD_PRD_IDX}" />" title="${row.PRD_MST_NM} 상품 선택" data-ord_prd_state="${row.ORD_PRD_ORD_STATE }"/></td>
	                    <td class="product">
	                        <div class="item">
	                            <div class="thumb">
	                            	<a
										href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');">
										<img src="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>"
										class="thumb84" alt="${row.PRD_IMAGE_ALT}" />
									</a>	
	                            </div>
	                            <div class="core">
	                                <p class="subject">
	                                <%-- <c:if test="${not empty row.ORD_PRD_ORG_IDX}" > 
							        	<img src="<c:out value="${cdnDomain }"/>/pc/img/ico/ico_reply.png" alt="교환" style="width:17px;" />
							        </c:if> --%>
	                                    <a
											href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');">
											<c:out value="${row.PRD_MST_NM}" />
										</a>
	                                </p>
	                                <c:if test="${empty row.ORD_PRD_ORG_IDX}" >
		                                <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
											<div class="option dotum">
												옵션 :
												<c:if test="${not empty row.optionList}">
													<c:out value="${row.OPT_DTL_NM}" />
													<c:if test="${not empty row.subPrdList}">
														&nbsp;/&nbsp;
													</c:if>
												</c:if>
												
												<%-- 선택옵션 상품 리스트 --%>
												<c:if test="${not empty row.subPrdList}">
													<c:forEach var="subPrd" items="${row.subPrdList}" varStatus="i">
														${subPrd.OPT_DTL_NM}
														(
																			<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
																				+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
																			</c:if>
																		<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
														${i.last ? '' : '/&nbsp;'}	
													</c:forEach>
												</c:if>
												
												<c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y' }">
													<%-- 배송준비중 전까지만 옵션 변경 가능 --%>
													<c:if test="${row.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && row.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
														<a href="javascript:;"
															class="btn_st0 btn_white xxsmall js-option-change"> <span>변경</span>
														</a>
													</c:if>
												</c:if>
											</div>
										</c:if>
									</c:if>
	                            </div>
	                        </div>
	                    </td>
	                    <td class="price">
	                        <p><span><fmt:formatNumber value="${row.ORD_PRD_PRD_PRC + row.ORD_PRD_OPT_ADD_PRC}" type="number" /></span>원</p>
	                        <%-- <c:if test="${row.SUM_SUB_OPTION_ADD_PRC gt 0}">
								<p>
									<span>옵션추가금:<fmt:formatNumber value="${row.SUM_SUB_OPTION_ADD_PRC}" type="number" /></span>원
								</p>
							</c:if> --%>
	                    </td>
	                    <td class="amount"><fmt:formatNumber value="${row.ORD_PRD_ORD_CNT}" type="number" /></td>
	                    <td class="price">
	                        <p><span><fmt:formatNumber value="${row.ORD_PRD_ORD_PRC + row.SUM_SUB_OPTION_ADD_PRC}" type="number" /></span>원</p>
	                    </td>
	                    <td class="ship">
                    		<c:choose>
                           		<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_NORMAL_CD }">
                           			<c:if test="${row.ORD_PRD_VDR_IDX eq -1 }">
                           				<P>프라이스킹배송</P>
                           			</c:if>
                           			<c:if test="${row.ORD_PRD_VDR_IDX ne -1 }">
                           				<P>파트너배송</P>
                           			</c:if>
                           		</c:when>
                           		<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
                           			<P>겟잇나우</P>
                           			<%-- <p><a href="javascript:goGetItNowTicketSend('${row.ORD_ORD_MST_CD}');" class="btn_st0 btn_white xsmall"><span>교환권발송</span></a></p> --%>
                           		</c:when>
                           		<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
                           			<P>클린킹</P>
                           		</c:when>
                           		<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD }">
                           			<P>장기할부</P>
                           		</c:when>
                           	</c:choose>
	                    </td>
	                    <td class="step">
                            <p><c:out value="${row.ORD_PRD_ORD_STATE_NM }"/></p>
                            <c:if test="${not empty row.ORD_PRD_IVC_NO }">
                               	<c:choose>
                               		<c:when test="${row.ORD_PRD_DLV_TYPE eq Code.DLV_TYPE_GET_IT_NOW}">
                               			<%-- <p><c:out value="${row.ORD_PRD_IVC_NO }" /></p> --%>
                               		</c:when>
                               		<c:otherwise>
                               			<p>
                               				<a href="javascript:goDeliveryView('<c:out value="${row.DLV_CPN_URL }"/><c:out value="${row.ORD_PRD_IVC_NO }" />');" class="ship-info">[<c:out value="${row.DLV_CPN_NM }" />/<c:out value="${row.ORD_PRD_IVC_NO }" />]</a>
                               			</p>
                               		</c:otherwise>
                               	</c:choose>
                    		</c:if>
                            
                            <c:if test="${ row.ORD_PRD_ORD_STATE eq Code.OST_SEND}">
                            	<p class="ship-info">출하일 : <ui:formatDate value="${row.SEND_START_DT}" pattern="yyyy.MM.dd"/></p>
                            </c:if>
                            
                            <%-- 마스터 & 선택옵션까지 모두 배송완료인 경우에만 구매확정 가능 --%>
                            <c:if test="${ row.ORD_PRD_ORD_STATE eq Code.OST_SEND_END and row.SWAP_IGNORE_SUB_OPTION_CNT eq row.SEND_END_SUB_OPTION_CNT}">
                            	<p class="ship-info">인도일 : <ui:formatDate value="${row.SEND_END_DT}" pattern="yyyy.MM.dd"/></p>
                            	<p class="mt10"><a href="javascript:orderFix();" class="btn_st0 btn_rd small26"><span>구매확정</span></a></p>
                            </c:if>
                        </td>
	                </tr>
	                <tr class="option-change">
						<td colspan="7"><input type="hidden"
							id="org_option_${row.ORD_PRD_IDX }" value="${row.ORD_PRD_OPT_DTL_IDX}" />
						<%-- 기존 옵션 idx --%>
							<div class="option-change-wrap">
								<h5>상품옵션변경</h5>
								<div class="section-option">
									<%--필수옵션 옵션 리스트 --%>
									<c:if test="${not empty row.optionList}">
										<label for="option_${row.ORD_PRD_IDX }">${row.optionList[0].PRD_OPT_NM}</label>
										<select id="option_${row.ORD_PRD_IDX }" class="sel_chg">
											<c:forEach var="option" items="${row.optionList}">
												<option value="${option.OPT_DTL_IDX}"
													<c:if test="${option.OPT_DTL_IDX eq row.ORD_PRD_OPT_DTL_IDX}">selected="selected"</c:if>>
													${option.OPT_DTL_NM }
													<c:choose>
														<c:when test="${option.OPT_DTL_ADD_PRC gt 0}">
														(+<fmt:formatNumber value="${option.OPT_DTL_ADD_PRC}" type="number" />) /
														</c:when>
														<c:when test="${option.OPT_DTL_ADD_PRC lt 0}">
														(<fmt:formatNumber value="${option.OPT_DTL_ADD_PRC}" type="number" />) /
														</c:when>
													</c:choose> 재고 :
													<fmt:formatNumber value="${option.OPT_DTL_STK_CNT}"
														type="number" />
												</option>
											</c:forEach>
										</select>
										<c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y' }">
											<%-- 배송준비중 전까지만 옵션 변경 가능 --%>
											<a
											href="javascript:goOptionModify('<c:out value="${row.ORD_PRD_IDX}"/>');"
											class="btn_st0 btn_white small"><span>옵션변경</span></a>
										</c:if>			
									</c:if>
								</div>
					
								<%-- 선택옵션 상품 리스트 --%>
								<c:if test="${not empty row.subPrdList}">
									<div class="option-list">
										<ul class="ct">
											<c:forEach var="subPrd" items="${row.subPrdList}">
												<li><input type="hidden"
													id="org_option_${subPrd.ORD_PRD_IDX }"
													value="${subPrd.OPT_DTL_IDX}" />
												<%-- 기존 옵션 idx --%> <label class="tit"
													for="option_${subPrd.ORD_PRD_IDX }">${subPrd.subOptionList[0].PRD_OPT_NM}</label>
													<select id="option_${subPrd.ORD_PRD_IDX }" class="sel_chg">
														<c:forEach var="option" items="${subPrd.subOptionList}">
															<option value="${option.OPT_DTL_IDX}"
																<c:if test="${option.OPT_DTL_IDX eq subPrd.OPT_DTL_IDX}">selected="selected"</c:if>>
																${option.OPT_DTL_NM }
																<c:choose>
																	<c:when test="${option.OPT_DTL_ADD_PRC gt 0}">
																	(+<fmt:formatNumber value="${option.OPT_DTL_ADD_PRC}" type="number" />원) /
																	</c:when>
																	<c:when test="${option.OPT_DTL_ADD_PRC lt 0}">
																	(<fmt:formatNumber value="${option.OPT_DTL_ADD_PRC}" type="number" />원) /
																	</c:when>
																</c:choose> 재고 :
																<fmt:formatNumber value="${option.OPT_DTL_STK_CNT}"
																	type="number" />
															</option>
														</c:forEach>
												</select> 
														<%-- 수량 변경 불가능한 경우 --%>
														${subPrd.ORD_PRD_ORD_CNT }개
													<c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y' }">
														<%-- 배송준비중 전까지만 옵션 변경 가능 --%>
														<a href="javascript:goOptionModify('<c:out value="${subPrd.ORD_PRD_IDX}"/>');"
														class="btn_st1 btn_white small"><span>변경</span></a>
													</c:if>	
												</li>
											</c:forEach>
										</ul>
									</div>
								</c:if>
							</div></td>
					</tr>
	                </c:forEach>
                </tbody>
                </table><!-- // table-product -->

                <div class="section-button ar mt10"><!-- section-button -->
                	<c:choose>
                		<c:when test="${orderState.PARTIAL_BACK_ING_YN eq 'Y' and repayYn gt 0 }">
                			<a href="javascript:goRepay();" class="btn_st2 btn_rd large">
	               				<span>재주문</span>
	               			</a>
                		</c:when>
                		<c:otherwise>
	                		<c:if test="${empty orderPayInfo.ORD_MST_PRE_CD}"><%-- 재주문은 교환/반품 불가 --%>
		                		<c:if test="${orderState.SEND_END_CNT gt 0 }">
		                			<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
		                				<a href="javascript:;" id="orderChange" class="btn_st2 btn_blk large"><span>교환신청</span></a>
		                			</c:if>
		                		</c:if>
		                		<c:if test="${orderState.FRONT_WHOLE_BACK_POSSIBLE_YN eq 'Y' }"><%-- 모든 상품이 배송완료인 경우에만 반품신청 가능 --%>
		                			<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
		                				<a href="javascript:;" id="orderBack" class="btn_st2 btn_blk large"><span>반품신청</span></a>
		                			</c:if>
		                		</c:if>
		                	</c:if>
                		</c:otherwise>
                	</c:choose>
                </div><!-- // section-button -->
                
                <c:if test="${not empty requestedGiftList}">
					<h4 class="title">사은품 정보</h4>
					
					<div class="free-gift"><!-- free-gift -->
		                <ul class="ct item-list">
		                	<c:forEach var="gift" items="${requestedGiftList}" varStatus="i">
			                    <li class="item">
			                        <div class="module">
			                            <strong class="dotum title">[<c:out value="${gift.GFT_MST_NAME}"/>]</strong>
			                            <span class="thumb">
			                            	<c:if test="${gift.GFT_MST_PRD_TYPE eq 'P' }">
				                           		<%-- 상품 이미지 --%>
				                           		<img src="<c:out value="${cdnDomain }${gift.PRODUCT_THUM_IMG}"/>" class="thumb150" alt="<c:out value="${gift.PRD_IMAGE_ALT}"/>" />
				                           	</c:if>
				                           	<c:if test="${gift.GFT_MST_PRD_TYPE ne 'P' }">
				                           		<%-- 파일 등록 --%>
				                           		<img src="<c:out value="${cdnDomain }${gift.CMM_FLE_ATT_PATH}${gift.CMM_FLE_SYS_NM}"/>" class="thumb150" alt="<c:out value="${gift.CMN_FLE_ALT_TXT}"/>" />
				                           	</c:if>
			                            </span>
			                        </div>
			                    </li>
		                    </c:forEach>
		                </ul>
		            </div><!-- // free-gift -->
				</c:if>

				<c:choose>
					<c:when test="${not empty cancelInfoList}">
						<h4 class="title">취소정보</h4>
						<c:forEach var="row" items="${cancelInfoList }">
							<table class="table-c table-col"><!-- table-c -->
			                <caption>사유, 상세사유로 구성된 취소정보 테이블입니다.</caption>
			                <colgroup>
			                    <col style="width: 140px;" />
			                    <col style="width: auto;" />
			                </colgroup>
			                <tbody>
			                	<tr>
			                        <th scope="row">상품정보</th>
			                        <td>
			                            	<c:out value="${row.PRD_INFO }"/>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="row">사유</th>
			                        <td>
			                            	<c:out value="${row.REASON_IDX_NM }"/>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="row">상세사유</th>
			                        <td>
			                            	<c:out value="${row.ORD_PRD_DSC }" escapeXml="false"/>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="row">접수일</th>
			                        <td>
			                            	<ui:formatDate value="${row.ORD_PRD_REG_DT}" pattern="yyyy.MM.dd"/>
			                        </td>
			                    </tr>
			                </tbody>
			                </table><!-- // table-c -->
						</c:forEach>
					</c:when>
					<c:when test="${not empty backInfoList }">
						<h4 class="title">반품정보</h4>
						<c:forEach var="row" items="${backInfoList }">
							<table class="table-c table-col"><!-- table-c -->
			                <caption>사유, 상세사유로 구성된 반품정보 테이블입니다.</caption>
			                <colgroup>
			                    <col style="width: 140px;" />
			                    <col style="width: auto;" />
			                </colgroup>
			                <tbody>
			                	<tr>
			                        <th scope="row">상품정보</th>
			                        <td>
			                            	<c:out value="${row.PRD_INFO }"/>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="row">사유</th>
			                        <td>
			                            	<c:out value="${row.REASON_IDX_NM }"/>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="row">상세사유</th>
			                        <td>
			                            	<c:out value="${row.ORD_PRD_DSC }" escapeXml="false"/>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="row">접수일</th>
			                        <td>
			                            	<ui:formatDate value="${row.ORD_PRD_REG_DT}" pattern="yyyy.MM.dd"/>
			                        </td>
			                    </tr>
			                </tbody>
			                </table><!-- // table-c -->
						</c:forEach>
					</c:when>
				</c:choose>
				
				<%-- 교환이력 있는 경우  --%>
				<c:if test="${not empty swapInfoList }">
					<h4 class="title">교환정보</h4>
					
					<c:forEach var="row" items="${swapInfoList }">
						<table class="table-c table-col"><!-- table-c -->
		                <caption>사유, 상세사유로 구성된 교환정보 테이블입니다.</caption>
		                <colgroup>
		                    <col style="width: 140px;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <tbody>
		                	<tr>
		                        <th scope="row">상품정보</th>
		                        <td>
		                            	<c:out value="${row.PRD_INFO }"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">사유</th>
		                        <td>
		                            	<c:out value="${row.REASON_IDX_NM }"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">상세사유</th>
		                        <td>
		                            	<c:out value="${row.ORD_PRD_DSC }" escapeXml="false"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">접수일</th>
		                        <td>
		                            	<ui:formatDate value="${row.ORD_PRD_REG_DT}" pattern="yyyy.MM.dd"/>
		                        </td>
		                    </tr>
		                </tbody>
		                </table><!-- // table-c -->
					</c:forEach>
				</c:if>

				<c:if test="${not empty orderPayInfo.ORD_MST_RFD_CD and (orderState.EXCEPT_SWAP_TOTAL_CNT eq orderState.CANCEL_CNT or orderState.EXCEPT_SWAP_TOTAL_CNT eq orderState.CANCEL_END_CNT or orderState.EXCEPT_SWAP_TOTAL_CNT eq orderState.REFUND_END_CNT)}">
					<h4 class="title">환불계좌정보</h4>

	                <table class="table-c table-col"><!-- table-c -->
	                <caption>환불방식, 환불은행, 계좌번호, 예금주명으로 구성된 환불계좌정보 테이블입니다.</caption>
	                <colgroup>
	                    <col style="width: 140px;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row">환불방식</th>
	                        <td>무통장입금</td>
	                    </tr>
	                    <tr>
	                        <th scope="row">환불은행</th>
	                        <td><c:out value="${orderPayInfo.ORD_MST_RFD_NM}"/></td>
	                    </tr>
	                    <tr>
	                        <th scope="row">계좌번호</th>
	                        <td><c:out value="${orderPayInfo.ORD_MST_RFD_ACT}"/></td>
	                    </tr>
	                    <tr>
	                        <th scope="row">예금주명</th>
	                        <td><c:out value="${orderPayInfo.ORD_MST_RFD_HDR}"/></td>
	                    </tr>
	                </tbody>
	                </table><!-- // table-c -->
				</c:if>
				
				<c:choose>
               	<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
	            </c:when>
	            <c:otherwise>
	            	<h4 class="title">결제정보</h4>
	            	
	            	<div class="ct order-price-wrap"><!-- order-price-wrap -->
	                    <div class="price-list"><!-- price-list -->
	                        <table class="table-c table-col">
	                        <caption>총 주문상품금액, 총 배송비, 총 할인금액으로 구성된 결제금액정보 테이블입니다.</caption>
	                        <colgroup>
	                            <col style="width: 140px;" />
	                            <col style="width: 135px;" />
	                            <col style="width: auto;" />
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th scope="row">총 주문상품금액</th>
	                                <td colspan="2" class="price order-total">
	                                	<c:choose>
		                            		<c:when test="${not empty orderPayInfo.ESM_MST_IDX }">
		                            			<strong>-</strong>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<strong><fmt:formatNumber value="${orderProductList[0].SUM_PRODUCT_PRICE}" type="number"/></strong>원
		                            		</c:otherwise>
		                            	</c:choose>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th scope="row">총 배송비</th>
	                                <td colspan="2" class="price">
	                                    <strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_DLV_CAG}" type="number"/></strong>원
	                                    <c:if test="${orderProductList[0].SUM_DLV_ADD_CHARGE gt 0}">
	                                    	<br/>(추가배송비 : <fmt:formatNumber value="${orderProductList[0].SUM_DLV_ADD_CHARGE}" type="number"/>원)
	                                    </c:if>
	                                </td>
	                            </tr>
	                            <%-- 기업/비회원/클린킹 주문은 할인금액 안나온다. --%>
	                            <c:choose>
									<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD
															or empty userInfo
															or userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE
									}">
									</c:when>
									<c:otherwise>
										<tr>
			                                <th scope="row" rowspan="6">총 할인금액</th>
			                                <td colspan="2" class="price">
			                                    <strong><fmt:formatNumber value="${orderProductList[0].SUM_INSTANT_CPN_ORDER_PRICE + orderPayInfo.ORD_MST_DC_MLG + orderPayInfo.ORD_MST_DC_CPN + orderPayInfo.ORD_MST_DC_OCB_PIT}" type="number"/></strong>원
			                                </td>
			                            </tr>
			                            <tr>
			                                <td class="tit">상품즉시할인</td>
			                                <td class="price">
			                                    <strong><fmt:formatNumber value="${orderProductList[0].SUM_INSTANT_CPN_ORDER_PRICE}" type="number"/></strong>원
			                                </td>
			                            </tr> 
			                            
			                            <c:set var="c_prd_cpn_prc" value="0"/>
			                       		<c:set var="c_dlv_cpn_prc" value="0"/>
			                           	<c:if test="${not empty orderCouponList }">
			                           		<c:forEach var="row" items="${orderCouponList}">
			                           			<c:if test="${row.CPN_MST_GBN ne 'F' }"><%-- 배송비 쿠폰 아닌 경우 --%>
			                           				<c:set var="c_prd_cpn_prc" value="${row.SUM_ORD_CPN_DC_AMT}"/>
			                           			</c:if>
			                           			<c:if test="${row.CPN_MST_GBN eq 'F' }"><%-- 배송비 쿠폰인 경우 --%>
			                           				<c:set var="c_dlv_cpn_prc" value="${row.SUM_ORD_CPN_DC_AMT}"/>
			                           			</c:if>
			                           		</c:forEach>
			                           	</c:if>
			                            
			                            <tr>
			                                <td class="tit">상품쿠폰할인</td>
			                                <td class="price">
			                                    <strong><fmt:formatNumber value="${c_prd_cpn_prc}" type="number"/></strong>원
			                                </td>
			                            </tr> 
			                            <tr>
			                                <td class="tit">배송비쿠폰할인</td>
			                                <td class="price">
			                                    <strong><fmt:formatNumber value="${c_dlv_cpn_prc}" type="number"/></strong>원
			                                </td>   
			                            </tr> 
			                            <tr>
			                                <td class="tit">포인트사용</td>
			                                <td class="price">
			                                    <strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG}" type="number"/></strong>P
			                                </td>
			                            </tr> 
			                            <tr>
			                                <td class="tit">OK캐쉬백포인트사용</td>
			                                <td class="price">
			                                    <strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_OCB_PIT}" type="number"/></strong>포인트
			                                </td>
			                            </tr>
									</c:otherwise>
								</c:choose>
	                        </tbody>
	                        </table>
	                    </div><!-- // price-list -->
	
	                    <div class="price-total"><!-- price-list -->
	                        <table class="table-c table-col">
	                        <caption>총 결제금액, 결제 방법, 이메일 주소로 구성된 주문고객정보 입력 테이블입니다.</caption>
	                        <colgroup>
	                            <col style="width: 140px;" />
	                            <col style="width: auto;" />
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th scope="row">총 결제금액</th>
	                                <td class="price order-total">
	                                    <strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/></strong>원
	                                    <c:if test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
					            		<p>
						            		<span style="color:#fd1f27">(실제 월 청구예상금액<br/><span id="span_expected_lng_prc"><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC/orderPayInfo.ORD_MST_LNG_DIV}" type="number" pattern="###,###"/></span>원 x ${orderPayInfo.ORD_MST_LNG_DIV}개월)</span>
						            	</p>
					            	</c:if>
	                                </td>
	                            </tr>
	                            
	                            <c:choose>
				                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD}"><%-- 신용카드 --%>
				                    	<tr>
			                                <th scope="row" rowspan="2">결제 방법</th>
			                                <td>신용카드</td>
			                            </tr>
			                            <tr>
			                                <td class="detail">
							                    <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO }" /></p>
												<p><c:out value="${orderPayInfo.PAY_MST_KICC_ACQUIRER_NM }" /> ( <c:out value="${fn:substring(orderPayInfo.PAY_MST_KICC_CARD_NO,0,4) }" />-<c:out value="${fn:substring(orderPayInfo.PAY_MST_KICC_CARD_NO,4,8) }" />-****-**** )</p>
												<p>
												<c:choose>
												    <c:when test="${orderPayInfo.PAY_MST_KICC_INSTALL_PERIOD eq '00' }">
													     일시불
												    </c:when>
												    <c:otherwise>
													<c:if test="${orderPayInfo.PAY_MST_KICC_NOINT eq '02' }">
														무이자
													</c:if>
													할부
													<fmt:formatNumber value="${orderPayInfo.PAY_MST_KICC_INSTALL_PERIOD}" type="number" pattern="0" />
													개월
												    </c:otherwise>
												</c:choose>
												</p>
			                                </td>
			                            </tr>
				                    </c:when>
				                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY }"><%-- 카카오페이 --%>
				                    	<tr>
			                                <th scope="row" rowspan="2">결제 방법</th>
			                                <td>신용카드</td>
			                            </tr>
			                            <tr>
			                                <td class="detail">
							                    <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KAKAO_AUTHCODE }" /></p>
												<p><c:out value="${orderPayInfo.PAY_MST_KAKAO_CARDNAME }" /> ( <c:out value="${orderPayInfo.MASKING_KAKAO_CARD_NO}" /> )</p>
												<p>
												<c:choose>
												    <c:when test="${orderPayInfo.PAY_MST_KAKAO_CARDQUOTA eq '00' }">
													     일시불
												    </c:when>
												    <c:otherwise>
													할부
													<fmt:formatNumber value="${orderPayInfo.PAY_MST_KAKAO_CARDQUOTA}" type="number" pattern="0" />
													개월
												    </c:otherwise>
												</c:choose>
												</p>
			                                </td>
			                            </tr>
				                    </c:when>
				                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_PAYNOW }"><%-- 페이나우 --%>
				                    	<tr>
			                                <th scope="row" rowspan="2">결제 방법</th>
			                                <td>신용카드</td>
			                            </tr>
			                            <tr>
			                                <td class="detail">
							                    <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_FINANCEAUTHNUM }" /></p>
												<p><c:out value="${orderPayInfo.PAY_MST_FINANCENAME }" /> ( <c:out value="${fn:substring(orderPayInfo.PAY_MST_CARDNUM,0,4) }" />-<c:out value="${fn:substring(orderPayInfo.PAY_MST_CARDNUM,4,8) }" />-****-**** )</p>
												<p>
												<c:choose>
												    <c:when test="${orderPayInfo.PAY_MST_CARDINSTALLMONTH eq '00' }">
													     일시불
												    </c:when>
												    <c:otherwise>
													할부
													<fmt:formatNumber value="${orderPayInfo.PAY_MST_CARDINSTALLMONTH}" type="number" pattern="0" />
													개월
												    </c:otherwise>
												</c:choose>
												</p>
			                                </td>
			                            </tr>
				                    </c:when>
				                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW}"><%-- 무통장 or 에스크로 --%>
				                    	<tr>
			                                <th scope="row" rowspan="2">결제 방법</th>
			                                <td>${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT ? '가상계좌' : '에스크로' }</td>
			                            </tr>
			                            <tr>
			                                <td class="detail">
			                                    <c:choose>
						                            <c:when test="${orderPayInfo.ORD_MST_PAY_DT eq '00000000000000' }"><%-- 결제일시가 없는 경우 입금미확인 --%>
						                                <p><span class="warning">입금미확인</span></p>
						                                <p>입금계좌 : [<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" />] <c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO }" /></p>
						                                <p>입금만료일 : <ui:formatDate value="${orderPayInfo.PAY_MST_KICC_EXPIRE_DATE}" pattern="yyyy.MM.dd HH:mm:ss"/></p>
						                            </c:when>
						                            <c:otherwise>
						                            	<p><span class="warning">입금완료</span></p>
						                                <p>입금계좌 : [<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" />] <c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO }" /></p>
						                                <p>입금만료일 : <ui:formatDate value="${orderPayInfo.PAY_MST_KICC_EXPIRE_DATE}" pattern="yyyy.MM.dd HH:mm:ss"/></p>
						                                <p>입금자명 : <c:out value="${orderPayInfo.ORD_MST_DPS_NM }" /></p>
						                            </c:otherwise>
						                        </c:choose>
			                                </td>
			                            </tr>
				                    </c:when>
				                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}"><%-- 실시간 계좌이체 --%>
				                    	<tr>
			                                <th scope="row" rowspan="2">결제 방법</th>
			                                <td>실시간계좌이체</td>
			                            </tr>
			                            <tr>
			                                <td class="detail">
				                                <p><c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" /></p>
				                                <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO }" /></p>
			                                </td>
			                            </tr>
				                    </c:when>
				                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE}"><%-- 전액 포인트/쿠폰/크라운 결제 --%>
				                    	<tr>
			                                <th scope="row" rowspan="2">결제 방법</th>
			                                <td>포인트</td>
			                            </tr>
			                            <tr>
			                                <td class="detail">
			                                    <p>포인트</p>
			                                </td>
			                            </tr>
				                    </c:when>
	                            </c:choose>
	                            
	                        </tbody>
	                        </table>
	                    </div><!-- // price-list -->
	                </div><!-- // order-price-wrap -->
	                
	                <c:choose>
	                	<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
							<p class="message notice mt10">
				                클린킹 상품은 온라인 상담예약만 가능합니다.<br />
				                서비스 관련 문의는 <strong class="warning">클린킹 고객센터 080-400-8000</strong>으로 연락주시기 바랍니다.
				            </p>
			            </c:when>
			            <c:otherwise>
			            	<c:if test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE}"><%-- 일반회원만 적립혜택 정보 보여준다. --%>
				            	<p class="dotum mt10">
				                    * 무통장 입금으로 주문하신 경우, 입금 기한까지 입금하지 않으시면 주문이 자동으로 취소되오니 입금 기한까지 꼭 입금을 해주시기 바랍니다.
				                </p>
				
				                <h4 class="title">적립혜택정보</h4>
				
				                <table class="table-c table-col"><!-- table-c -->
				                <caption>적립 예정 포인트, 적립 예정 OK캐쉬백으로 구성된 주문고객정보 입력 테이블입니다.</caption>
				                <colgroup>
				                    <col style="width: 140px;" />
				                    <col style="width: auto;" />
				                </colgroup>
				                <tbody>
				                    <tr>
				                        <th scope="row"><span>적립 예정 포인트</span></th>
				                        <td class="price">
				                            <strong><fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_MIL}" type="number"/></strong> P
				                            <p class="desc">
				                                <strong>상품후기 작성</strong>시 적립(상품후기 미작성 시 배송완료일로부터 7일 이후에 자동 <strong>구매확정</strong>시 적립)
				                            </p>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><span>적립 예정 OK캐쉬백</span></th>
				                        <td class="price">
				                            <strong><fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_OCB}" type="number"/></strong> 포인트 
				                            <c:if test="${orderPayInfo.TOT_ORD_SAV_OCB gt 0}">
				                            	(<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 0, 4) }"/>-<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 4, 8) }"/>-****-****)
				                            </c:if>
				                            <p class="desc">
				                               	전 상품 모두 <strong>구매확정</strong>시 적립
				                            </p>
				                            
				                        </td>
				                    </tr>
				                </tbody>
				                </table><!-- table-c -->
			                </c:if>
			            </c:otherwise>
	                </c:choose>
	            </c:otherwise>
	            </c:choose>
				
                <c:choose>
					<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
						<h4 class="title">겟잇나우 픽업정보 확인</h4>
	
			            <table class="table-c table-col table-view mt10"><!-- table-c -->
			            <caption>방문매장, 방문예정일, 방문예정시간, 전화번호, 주소, 배송유의사항으로 구성된 겟잇나우 픽업정보 테이블입니다.</caption>
			            <colgroup>
			                <col style="width: 140px;" />
			                <col style="width: auto;" />
			                <col style="width: 140px;" />
			                <col style="width: auto;" />
			            </colgroup>
			            <tbody>
			                <tr>
			                    <th scope="row">방문매장</th>
			                    <td colspan="3">
		                        	<c:out value="${getItNowShopInfo.SHP_MST_NM }"/>  
		                        	<span class="desc dotum">
			                        	영업시간 :
			                        	평일 -
			                        	<c:choose>
			                        		<c:when test="${getItNowShopInfo.SHP_MST_WEK_DAY_GBN eq 'H'}">
			                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ST_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ST_MM }"/>
			                        			~
			                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ED_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ED_MM }"/>
			                        		</c:when>
			                        		<c:otherwise>
			                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_TXT }"/>
			                        		</c:otherwise>
			                        	</c:choose>
			                        	주말 -
			                        	<c:choose>
			                        		<c:when test="${getItNowShopInfo.SHP_MST_WEK_END_GBN eq 'H'}">
			                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ST_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ST_MM }"/>
			                        			~
			                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ED_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ED_MM }"/>
			                        		</c:when>
			                        		<c:otherwise>
			                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_TXT }"/>
			                        		</c:otherwise>
			                        	</c:choose>
			                        	 / 
			                        	 연락처 : 
			                        	 <c:out value="${getItNowShopInfo.SHP_MST_TEL }"/>
			                        </span>
			                        <a href="javascript:getItNowShopInfoPopup('${getItNowShopInfo.SHP_MST_IDX }');" class="btn_st0 btn_blk777 small"><span>매장위치 확인</span></a>
			                    </td>
			                </tr>
			                <tr>
			                    <th scope="row">방문예정일</th>
			                    <td><ui:formatDate pattern="yyyy.MM.dd" value="${getItNowShopInfo.ORD_GET_PKU_DT }"/></td>
			                    <th scope="row">방문예정시간</th>
			                    <td><c:out value="${getItNowShopInfo.ORD_GET_PKU_HH }"/></td>
			                </tr>
			                <tr>
			                    <th scope="row">수령인 정보</th>
			                    <td colspan="3">
			                       	 <span id="spanOrdGetNm"><c:out value="${getItNowShopInfo.ORD_GET_NM }"/></span> / 
			                       	 <span id="spanOrdGetTel"><c:out value="${getItNowShopInfo.ORD_GET_TEL1 }"/>-<c:out value="${getItNowShopInfo.ORD_GET_TEL2 }"/>-<c:out value="${getItNowShopInfo.ORD_GET_TEL3 }"/></span> 
			                        
			                        <c:if test="${orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_PAY or orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_SEND_READY }">
			                        	<a href="javascript:goGetItNowTicketSend('${orderPayInfo.ORD_MST_CD }');" class="btn_st0 btn_blk777 small"><span>수령인 정보 수정</span></a>
			                        	<a href="javascript:goGetItNowTicketSend('${orderPayInfo.ORD_MST_CD }');" class="btn_st0 btn_blk small"><span>교환권 발송</span></a>
			                        </c:if>
			                    </td>
			                </tr>
			                <tr>
			                    <th scope="row">주의사항</th>
			                    <td colspan="3">
			                        <ul class="list list-a dotum desc">
			                            <li>수령인에게 주문정보가 문자로 발송됩니다. (상품 가격은 노출되지 않습니다.)</li>
			                            <li>상품준비 완료 문자를 받으신 후 매장에 방문해 주세요.</li>
			                            <li><span class="warning">매장 방문 시 문자메시지와 신분증을 꼭 지참해 주세요.</span></li>
			                        </ul>
			                    </td>
			                </tr>
			            </tbody>
			            </table><!-- // table-c -->
					</c:when>
					<c:otherwise>
						<h4 class="title">
	                    	배송지 정보
	                    	<c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y'}">
	                    		<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
			                		<a href="javascript:goDeliveryModify();" class="btn_st0 btn_blk small"><span>배송지 정보 수정</span></a>
			                	</c:if>
			                </c:if>
		                </h4>
		
		                <table class="table-c table-col table-view mt10"><!-- table-c -->
		                <caption>받으시는 분, 휴대폰 번호, 배송유의사항으로 구성된 배송지 정보 테이블입니다.</caption>
		                <colgroup>
		                    <col style="width: 110px;" />
		                    <col style="width: auto;" />
		                    <col style="width: 110px;" />
		                    <col style="width: auto;" />
		                    <col style="width: 110px;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="row">받으시는 분</th>
		                        <td><span id="span_dlv_nm"><c:out value="${orderDeliveryInfo.ORD_DLV_NM }" /></span></td>
		                        <th scope="row">휴대폰 번호</th>
		                        <td><span  id="span_hp"><c:out value="${orderDeliveryInfo.ORD_DLV_HP1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }" /></span></td>
		                        <th scope="row"><span>전화번호</span></th>
		                        <td><span  id="span_tel"><c:out value="${orderDeliveryInfo.ORD_DLV_TEL1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }" /></span></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">주소</th>
		                        <td colspan="5">
		                            <p>
		                                <span class="blind">도로명 주소</span>
		                                <span id="span_dro">
			                           	 	[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }" />] <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }" />
			                        	</span>
		                            </p>
		                            <p>
		                                <span class="blind">지번 주소</span>
		                                <span id="span_jbn">
			                        		[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }" />] <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR2 }" />
			                        	</span>
		                            </p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">배송유의사항</th>
		                        <td colspan="5">
		                            <span id="span_desc"><c:out value="${orderDeliveryInfo.ORD_DLV_MSG }" /></span>
		                        </td>
		                    </tr>
		                </tbody>
		                </table><!-- // table-c -->
		
		                <h4 class="title">주문 고객 정보</h4>
		
		                <table class="table-c table-col"><!-- table-c -->
		                <caption>주문하시는 분, 휴대폰 번호, 이메일 주소로 구성된 주문고객정보 테이블입니다.</caption>
		                <colgroup>
		                    <col style="width: 110px;" />
		                    <col style="width: auto;" />
		                    <col style="width: 110px;" />
		                    <col style="width: auto;" />
		                    <col style="width: 110px;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="row"><span>주문하시는 분</span></th>
		                        <td><c:out value="${orderPayInfo.ORD_MST_ORD_NM }" /></td>
		                        <th scope="row"><span>휴대폰 번호</span></th>
		                        <td><c:out value="${orderPayInfo.ORD_MST_HP1 }" />-<c:out value="${orderPayInfo.ORD_MST_HP2 }" />-<c:out value="${orderPayInfo.ORD_MST_HP3 }" /></td>
		                        <th scope="row">이메일 주소</th>
		                        <td><c:out value="${orderPayInfo.ORD_MST_MAIL }" /></td>
		                    </tr>
		                </tbody>
		                </table><!-- table-c -->
					</c:otherwise>
				</c:choose>	

				<c:choose>
               	<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
	            </c:when>
	            <c:otherwise>
	            
					<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' }"><%-- 결제일시가 없는 경우 입금미확인 --%>
	                <h4 class="title">증빙서류 발급</h4>
	
	                <div class="frame-b evidence-take"><!-- evidence-take -->
	                    <span>결제하신 결제수단에 따라 해당 증빙서류를 발급 받으실 수 있습니다.</span>
	                    
	                    <c:choose>
							<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD}"><%-- 신용카드 --%>
								<a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '01');" class="btn_st0 btn_white small"><span>신용카드 전표</span></a>
							</c:when>
							<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY }"><%-- 카카오페이 --%>
								<a href="javascript:printKakaoReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />');" class="btn_st0 btn_white small"><span>신용카드 전표</span></a>
							</c:when>
							<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_PAYNOW }"><%-- 페이나우 --%>
								<a href="javascript:printCardReceipt();" class="btn_st0 btn_white small"><span>신용카드 전표</span></a>
							</c:when>
							<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW}"><%-- 무통장 or 에스크로 --%>
								<c:if test="${orderPayInfo.ORD_MST_CSH_RCP eq 'Y' }">
									<a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '03');" class="btn_st0 btn_white small"><span>현금 영수증</span></a>
								</c:if>
							</c:when>
							<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}"><%-- 실시간 계좌이체 --%>
								<c:if test="${orderPayInfo.ORD_MST_CSH_RCP eq 'Y' }">
									<a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '02');" class="btn_st0 btn_white small"><span>현금 영수증</span></a>
								</c:if>
							</c:when>
						</c:choose>
	                    
	                    
	                    <c:if test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT }">
	                   		<c:if test="${orderPayInfo.ORD_MST_CSH_RCP ne 'Y' }">
	                   			<c:choose>
	                   				<c:when test="${empty orderPayInfo.TAX_IVC_IDX }">
	                   					<a href="javascript:taxInvoceFormPop('<c:out value="${orderPayInfo.ORD_MST_CD }"/>');" class="btn_st0 btn_white small"><span>세금계산서 발행 신청</span></a>
	                   				</c:when>
	                   				<c:otherwise>
	                   					<%-- <c:choose>
	                   						<c:when test="${orderPayInfo.TAX_IVC_STATE eq 'Y' }">
	                   							발행완료
	                   						</c:when>
	                   						<c:otherwise>
	                   							신청완료
	                   						</c:otherwise>
	                   					</c:choose> --%>
	                   				</c:otherwise>
	                   			</c:choose>
	                   		</c:if>
	                   	</c:if>
	                    
	                </div><!-- // evidence-take -->
	                </c:if>
                
                </c:otherwise>
                </c:choose>
                
                <%-- 회원 비회원 경로 구분 --%>
		        <c:if test="${sessionUser.ROLE_USER eq 'order_guest'}">   
		        	<c:set var="order_url" value="gestDeliveryList.do"/>
		        	<c:set var="cancel_url" value="gestOrderCancelBackList.do"/>
		        </c:if>
		        <c:if test="${sessionUser.ROLE_USER eq 'user'}">   
		        	<c:set var="order_url" value="myShoppingList.do"/>
		        	<c:set var="cancel_url" value="myOrderCancelBackList.do"/>
		        </c:if>

                <div class="section-button mt50"><!-- section-button -->
                	<c:choose>
                  		<c:when test="${commandMap.searchCancelBack eq 'Y' }">
                  			<a href="javascript:goOrderList('<c:out value="${cancel_url}"/>');" class="btn_st2 btn_rd xlarge"><span>취소/교환/반품조회 목록</span></a>
                  		</c:when>
                  		<c:otherwise>
                  			<a href="javascript:goOrderList('<c:out value="${order_url}"/>');" class="btn_st2 btn_rd xlarge"><span>주문/배송조회 목록</span></a>
                  		</c:otherwise>
                  	</c:choose>
                </div><!-- // section-button -->

            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
	<%-- 취소/교환/반품 폼 --%>
	<form id="orderStateForm" name="orderStateForm" method="post" action=""> 
		<input type="hidden" name="ORD_MST_CD"/>
        <input type="hidden" name="ORD_PRD_ORD_STATE"/>
        <input type="hidden" name="ORD_PRD_IDX" value=""/>
        <input type="hidden" name="ORD_PRD_IDX_ARR" value=""/>
	</form>
	
	<%-- kicc 영수증 출력용 폼 --%>
	<form name="kiccReceiptForm" method="get" action=""> 
		<input type="hidden" name="controlNo"/>
        <input type="hidden" name="payment"/>
	</form>
	
	<%-- 배송지 정보 수정 팝업 폼 --%>
	<form name="deliveryForm" method="post" action="">
		<input type="hidden" name="ORD_MST_CD"/>
	</form>
	
	<%-- 겟잇나우 교환권 발송 팝업 폼 --%>
	<form name="getItNowForm" method="post" action="">
		<input type="hidden" name="ORD_MST_CD"/>
	</form>
	
	<%--세금계산서 신청 폼 --%>
	<form id="taxIvcForm" name="taxIvcForm" method="post" action=""> 
		<input type="hidden" name="ORD_MST_CD"/>
	</form>

	<form name="paymentform" id="paymentform" method="post"></form>
	
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
</section>
<!--// #wrap E -->
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<script>
$(function() {
	var CST_PLATFORM = "<c:out value="${commandMap.CST_PLATFORM }" />";
	var $frm = $("#frm");
	
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
	$(document).on("change",".ORD_PRD_IDXs",function(){		
		//전체체크 해제
		if(!$(this).is(":checked")){
			$("#selectAll").prop("checked", false);
		}
	});
	
	//재결제 페이지 이동
	goRepay = function(){
        
        $('#paymentform').empty();
		
        if(confirm("재주문하시겠습니까?")){
        	$.ajax
            ({
                async : false,
                type : "POST",
                data : {
                			"ORD_MST_CD" : "${commandMap.ORD_MST_CD }"
                		  },
                url : "<c:out value="${serverSslDomain}" />/pc/mypage/repayPrepareAjax.do",
                success : function (data) 
                { 
    				switch (data.result) {
    				case 1:
    					$('#paymentform').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
    					$('#paymentform').append("<input type=\"hidden\" name=\"PRE_ORD_MST_CD\" value=\""+ data.PRE_ORD_MST_CD +"\">");
    					$('#paymentform').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do').submit();
    					break;
    				default :
    					alert(data.resultMsg);
    					break;
    				}
                },
                error : function (err)
                {
                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
                    window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
                }
    		});
        }
	};
	
	// 목록 페이지 이동
	goOrderList = function(url){
         $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/"+url, "target":"_self", "method":"post"}).submit();
	};
	
    // 상품상세 팝업페이지 호출
    goProductView = function (prdCd)
    {
    	window.open("<c:out value="${frontDomain}" />/pc/product/product.do?prdMstCd="+prdCd, "_blank");
    	//goProductDetail("<c:out value="${frontDomain}" />", prdCd);
    };
    
    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
    	goSearchDelivery(url);
    };
    
    // 주문취소 버튼 클릭 이벤트
    $(document).on("click", "#orderCancel", function () {
        
        var state = "<c:out value="${Code.OST_CANCEL }" />";
    	var orderCd = "<c:out value="${commandMap.ORD_MST_CD }" />";
    	
       	window.open("","orderCancelPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=1024,height=700,scrollbars=yes');
       	document.orderStateForm.action = "<c:out value="${serverSslDomain}"/>/pc/mypage/orderCancelPopup.do";
       	document.orderStateForm.ORD_MST_CD.value = orderCd;
       	document.orderStateForm.ORD_PRD_IDX.value = "";
       	document.orderStateForm.ORD_PRD_IDX_ARR.value = "";
       	document.orderStateForm.ORD_PRD_ORD_STATE.value = state;
       	document.orderStateForm.target = "orderCancelPop";
       	document.orderStateForm.submit();
        
        //popup("<c:out value="${frontDomain}" />/pc/mypage/orderCancelPopup.do?ORD_PRD_ORD_STATE="+state+"&ORD_MST_CD="+orderCd, "1024", "700", "yes", "orderCancelBack");

    });
    
 	// 클린킹 주문취소 버튼 클릭 이벤트
    $(document).on("click", "#orderCleankingCancel", function () {
        
        var state = "<c:out value="${Code.OST_CLEANKING_CANCEL }" />";
    	var orderCd = "<c:out value="${commandMap.ORD_MST_CD }" />";
    	
       	window.open("","orderCancelPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=1024,height=700,scrollbars=yes');
       	document.orderStateForm.action = "<c:out value="${serverSslDomain}"/>/pc/mypage/orderCancelPopup.do";
       	document.orderStateForm.ORD_MST_CD.value = orderCd;
       	document.orderStateForm.ORD_PRD_IDX.value = "";
       	document.orderStateForm.ORD_PRD_IDX_ARR.value = "";
       	document.orderStateForm.ORD_PRD_ORD_STATE.value = state;
       	document.orderStateForm.target = "orderCancelPop";
       	document.orderStateForm.submit();
        
        //popup("<c:out value="${frontDomain}" />/pc/mypage/orderCancelPopup.do?ORD_PRD_ORD_STATE="+state+"&ORD_MST_CD="+orderCd, "1024", "700", "yes", "orderCancelBack");

    });
    
    // 반품 버튼 클릭 이벤트
    $(document).on("click", "#orderBack", function () {
    	
    	/* 전체상품이 배송완료 / 구매확정인 경우 반품접수 가능 */
    	<c:if test="${orderState.FRONT_WHOLE_BACK_POSSIBLE_YN ne 'Y' }">
    		alert("반품 신청은 전체 상품이 배송완료 상태에서만 가능합니다.");
    		return;
    	</c:if>
        
    	if($("input[name=ORD_PRD_IDXs]:checked").length == 0){
    		alert("상품을 선택해주세요.");
    		return;
    	}
    	
    	var ordPrdIdxArr = [];
		$.each($("input[name=ORD_PRD_IDXs]:checked"), function(){
			ordPrdIdxArr[ordPrdIdxArr.length] = $(this).val();
		});
		
		var state = "<c:out value="${Code.OST_BACK }" />";
    	var orderCd = "<c:out value="${commandMap.ORD_MST_CD }" />";
    	
       	document.orderStateForm.action = "<c:out value="${serverSslDomain}"/>/pc/mypage/orderBackPopup.do";
       	document.orderStateForm.ORD_MST_CD.value = orderCd;
       	document.orderStateForm.ORD_PRD_IDX.value = "";
       	document.orderStateForm.ORD_PRD_IDX_ARR.value = ordPrdIdxArr;
       	document.orderStateForm.ORD_PRD_ORD_STATE.value = state;
       	document.orderStateForm.target = "orderBackPop";
       	
    	$.ajax({
    		type: "post",
    		url : "<c:out value="${serverSslDomain}"/>/pc/mypage/backAvailableCheckAjax.do",
    		data : $("#orderStateForm").serialize(),
    		dataType : "json",
    		async : false,
    		success : function(data){    			
    			// 0 이상 : 성공
    			if(data.result > 0){
    				window.open("","orderBackPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=1024,height=700,scrollbars=yes');
    				document.orderStateForm.submit();
    			}else{
    				alert(data.resultMsg);
    			}
    		},
    		error : function(error){
    			alert(error);
    		}
    	});
    	
        //popup("<c:out value="${frontDomain}" />/pc/mypage/returnOrderProductRegistPopup.do?ORD_PRD_ORD_STATE="+state+"&ORD_MST_CD="+orderCd, "800", "600", "yes", "orderCancelBack");

    });
    
 	// 취소요청
    $(document).on("click", "#orderCancelRequest", function () {
    	if(confirm("취소요청하시겠습니까?")){
    		$.ajax({
        		type: "post",
        		url : "<c:out value="${serverSslDomain}"/>/pc/mypage/orderCancelRequestAjax.do",
        		data : $("#frm").serialize(),
        		dataType : "json",
        		async : false,
        		success : function(data){   
        			alert(data.resultMsg);
        			// 0 이상 : 성공
        			if(data.result > 0){
        				// 버튼 삭제
        				$("#orderCancelRequest").remove();
        			}
        		},
        		error : function(error){
        			alert(error);
        		}
        	});
    	}
    });
    
	// 교환신청 버튼 클릭 이벤트
    $(document).on("click", "#orderChange", function () {
    	
    	if($("input[name=ORD_PRD_IDXs]:checked").length > 1){
    		alert("교환신청은 단일 상품만 가능합니다.");
    		return;
    	}
    	
    	if($("input[name=ORD_PRD_IDXs]:checked").length == 0){
    		alert("상품을 선택해주세요.");
    		return;
    	}
    	
    	var ordPrdState = $("input[name=ORD_PRD_IDXs]:checked").data("ord_prd_state"); //주문상태
    	var ordPrdIdx = $("input[name=ORD_PRD_IDXs]:checked").val();	//주문상품 idx
    	
    	if(ordPrdState != "${Code.OST_SEND_END}"){
    		alert("교환신청은 배송완료 상태의 상품만 가능합니다.");
    		return;
    	}
    	
    	var orderCd = "<c:out value="${commandMap.ORD_MST_CD }" />";
    	
    	document.orderStateForm.action = "<c:out value="${serverSslDomain}"/>/pc/mypage/changeOrderProductRegistPopup.do";
       	document.orderStateForm.ORD_MST_CD.value = orderCd;
       	document.orderStateForm.ORD_PRD_IDX.value = ordPrdIdx;
       	document.orderStateForm.ORD_PRD_IDX_ARR.value = "";
       	document.orderStateForm.ORD_PRD_ORD_STATE.value = "";
       	document.orderStateForm.target = "orderChangeProductPop";
        
    	if(ordPrdIdx != "")
        {
    		$.ajax({
        		type: "post",
        		url : "<c:out value="${serverSslDomain}"/>/pc/mypage/swapAvailableCheckAjax.do",
        		data : {"ORD_MST_CD": orderCd , "ORD_PRD_IDX" : ordPrdIdx},
        		dataType : "json",
        		async : false,
        		success : function(data){    			
        			// 0 이상 : 성공
        			if(data.result > 0){
        				window.open("","orderChangeProductPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=1024,height=700,scrollbars=yes');
        				document.orderStateForm.submit();
        			}else{
        				alert(data.resultMsg);
        			}
        		},
        		error : function(error){
        			alert(error);
        		}
        	});
        }
    	else
        {
            alert("[교환접수]선택된 주문상품 번호가 없습니다.");
            
        }
    	
    	//popup("<c:out value="${serverSslDomain}" />/pc/mypage/changeOrderProductRegistPopup.do?ORD_MST_CD="+orderCd+"&ORD_PRD_IDX="+ordPrdIdx, "800", "600", "yes", "orderChangeProduct");
    });
	
    // 신용카드영수증 출력
    printCardReceipt = function ()
    {
        var LGD_MID = "<c:out value="${orderPayInfo.PAY_MST_MID }" />";
    	var LGD_TID = "<c:out value="${orderPayInfo.PAY_MST_TID }" />";
    	var LGD_HASHDATA = "<c:out value="${commandMap.LGD_HASHDATA }" />";	//"<c:out value="${orderPayInfo.PAY_MST_HASHDATA }" />";

    	showReceiptByTID(LGD_MID, LGD_TID, LGD_HASHDATA);
    };

    // 현금영수증 출력
    printCashReceipt = function (type)
    {
        var LGD_MID = "<c:out value="${orderPayInfo.PAY_MST_MID }" />";
        var LGD_OID = "<c:out value="${orderPayInfo.PAY_MST_OID }" />";
        var LGD_SEQNO = "<c:out value="${orderPayInfo.PAY_MST_CASSEQNO }" />";
        var CST_PLATFORM = "<c:out value="${commandMap.CST_PLATFORM }" />";
        
        showCashReceipts(LGD_MID, LGD_OID, LGD_SEQNO, type, CST_PLATFORM);
    }; 
    
    /*
	카드 영수증 팝업 출력(카카오페이)
	@param tid: 거래 아이디
	*/
    printKakaoReceipt = function (tid)
   	{
		var status =
		"toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540";
		var url = "https://mms.cnspay.co.kr/trans/retrieveIssueLoader.do?TID="+tid+"&type=0";
		window.open(url,"popupIssue",status);
	}
	
	// KICC 거래내역  영수증 팝업
    printKiccReceipt = function (controlNo, payment)
    {
    	var url = "http://testoffice.easypay.co.kr/receipt/ReceiptBranch.jsp";
    	if(CST_PLATFORM != "test"){
    		url = "https://office.easypay.co.kr/receipt/ReceiptBranch.jsp"; 
    	}
    	window.open("","MEMB_POP_RECEIPT", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=450,height=700');
    	document.kiccReceiptForm.action = url;
    	document.kiccReceiptForm.controlNo.value = controlNo;
    	document.kiccReceiptForm.payment.value = payment;
    	document.kiccReceiptForm.target = "MEMB_POP_RECEIPT";
    	document.kiccReceiptForm.submit();
    };
    
	 // 배송지 수정 팝업
    goDeliveryModify = function(){
    	var ORD_MST_CD = "${orderPayInfo.ORD_MST_CD}";
    	window.open("","deliveryModifyPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=550,scrollbars=yes');
    	document.deliveryForm.action = "<c:out value="${serverSslDomain}"/>/pc/cart/deliveryModifyPopup.do";
    	document.deliveryForm.ORD_MST_CD.value = ORD_MST_CD;
    	document.deliveryForm.target = "deliveryModifyPop";
    	document.deliveryForm.submit();
    }
	 
	// 겟잇나우 교환권 발송 팝업
    goGetItNowTicketSend = function(ordMstCd){
    	window.open("","getItNowTicketPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=650,scrollbars=yes');
    	document.getItNowForm.action = "<c:out value="${serverSslDomain}"/>/pc/cart/getItNowTicketPopup.do";
    	document.getItNowForm.ORD_MST_CD.value = ordMstCd;
    	document.getItNowForm.target = "getItNowTicketPop";
    	document.getItNowForm.submit();
    }
	
	// 세금계산서 신청 팝업
    taxInvoceFormPop = function (orderCd)
    {
    	window.open("","taxInvoceFormPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=700,scrollbars=yes');
    	document.taxIvcForm.action =  "<c:out value="${serverSslDomain}"/>/pc/mypage/taxInvoiceFormPopup.do";
    	document.taxIvcForm.ORD_MST_CD.value = orderCd;
    	document.taxIvcForm.target = "taxInvoceFormPop";
    	document.taxIvcForm.submit();
    };
});

//옵션 변경
function goOptionModify(ord_prd_idx){
	var orgOption = $("#org_option_"+ord_prd_idx).val();
	var $option = $("#option_"+ord_prd_idx);
	var toChangeOptionIdx = $("#option_"+ord_prd_idx).val();
	var OPTION_MODIFY_YN = "Y"; //옵션 변경 여부
	var $optionCnt = $("#inp_amount_"+ord_prd_idx).val();//선택옵션인 경우에만 존재함! 주문 후에는 수량 변경 불가이므로 없다.
	
	if($optionCnt == undefined){
		$optionCnt = "";
	}
	
	if($option.val() == ""){
		alert("옵션을 선택하세요.");
		$option.focus();
		return;
	}
	
	if(orgOption == toChangeOptionIdx){
		alert("기존 옵션과 동일한 옵션입니다.");
		return;
	}
		
	$.ajax({
		type: "post",
		url : "<c:out value="${serverSslDomain}"/>/pc/mypage/productOptionCntModifyAjax.do",
		data : 
		{
			ORD_MST_CD : "${orderPayInfo.ORD_MST_CD}"
			, ORD_PRD_OPT_DTL_IDX : toChangeOptionIdx
			, ORD_PRD_ORD_CNT : $optionCnt
			, ORD_PRD_IDX : ord_prd_idx
			, OPTION_MODIFY_YN : OPTION_MODIFY_YN
		},
		dataType : "json",
		async : false,
		success : function(data){    			
			// 0 이상 : 성공
			alert(data.resultMsg);
		
			if(data.result > 0){
				location.reload(true);
			}
		},
		error : function(error){
			alert(error);
		}
	});
}

//매장위치확인 팝업
function getItNowShopInfoPopup(shpMstIdx){
	window.open("<c:out value="${serverSslDomain}"/>/pc/cart/getItNowShopInfoPopup.do?SHP_MST_IDX="+shpMstIdx,"getItNowShopInfoPopup", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=500,height=550,scrollbars=yes');
}

//구매확정 버튼 클릭 이벤트
function orderFix(){
    if (confirm("상품후기를 작성하시면 자동 구매확정됩니다.\n상품후기 작성페이지로 이동하시겠습니까?"))
    {
    	location.href = "<c:out value="${frontDomain}" />/pc/mypage/myWritableProductCommentList.do";
    }
}

//]]>
</script>

</body>
</html>