<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- #container S -->
    <article id="container" class="container" data-role="content">
        <!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>주문상세조회</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="order-number"><!-- order-number -->
            <span class="large">주문번호 <span class="warning"><c:out value="${orderPayInfo.ORD_MST_CD }" /></span> / <ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></span>
        </div><!-- // order-number -->
        
        <c:choose>
	        <c:when test="${orderState.PARTIAL_BACK_ING_YN eq 'Y' and repayYn gt 0 }">
	        	<div class="section-button mt10"><!-- section-button -->
		            <a href="javascript:goRepay();" class="button full primary"><span>재주문</span></a>
		        </div><!-- // section-button -->
		        
		        <hr class="hr-a mt30">
	        </c:when>
	        <c:otherwise>
	        	<hr class="hr-a">
	        </c:otherwise>
        </c:choose>
        
        <form id="frm" name="frm">
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
            <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
            <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
            <input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }" />
            <input type="hidden" id="searchCancelBack" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
            <input type="hidden" id="searchState" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
        </form>

        <div class="order-detail accordion product" data-role="collapsible-set"><!-- product -->
            <div class="section" data-role="collapsible" data-collapsed="false">
                <h3>
                    <strong>주문상품정보</strong> (<c:out value="${fn:length(orderProductList) }"/>)
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <div class="cart-list-wrap"><!-- cart-list-wrap -->
                        <ul class="cart-list"><!-- cart-list -->
                        	<c:forEach var="row" items="${orderProductList}">
                        		<li class="col"><!-- row -->
                        			<input type="checkbox" class="checkbox ORD_PRD_IDXs" name="ORD_PRD_IDXs" value="<c:out value="${row.ORD_PRD_IDX}" />" title="${row.PRD_MST_NM} 상품 선택" data-ord_prd_state="${row.ORD_PRD_ORD_STATE }"/>
	                                <div class="item">
	                                    <a href="javascript:;" class="link">
	                                        <span class="thumb"><img data-original="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="${row.PRD_IMAGE_ALT}" /></span>
	                                        <span class="subject"><c:out value="${row.PRD_MST_NM}" /></span>
	                                    </a>
	                                    
	                                    <c:if test="${empty row.ORD_PRD_ORG_IDX}" >
			                                <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
												<div class="option">
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
															<div class="ct amount">
																<a href="#optionChange_${row.ORD_PRD_IDX }"
																	class="button small js-toggler"> <span>변경</span>
																</a>
															</div>
														</c:if>
													</c:if>
												</div>
											</c:if>
										</c:if>
	                                    
	                                    <c:if test="${not empty row.optionList || not empty row.subPrdList}">
	                                    <div id="#optionChange_${row.ORD_PRD_IDX }" class="option-change toggle">
	                                    	<input type="hidden" id="org_option_${row.ORD_PRD_IDX }" value="${row.ORD_PRD_OPT_DTL_IDX}" />
	                                        <h4>상품옵션변경</h4>
	                                        <ul>
	                                        	<%--필수옵션 옵션 리스트 --%>
												<c:if test="${not empty row.optionList}">
													<li>
		                                                <strong><label for="option_${row.ORD_PRD_IDX }">${row.optionList[0].PRD_OPT_NM}</label></strong>
		                                                <p>
				                                            <label for="option_${row.ORD_PRD_IDX }" class="sel_box_st0">
				                                                <select id="option_${row.ORD_PRD_IDX }" class="select">
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
															</label>
		                                                </p>
		                                                <c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y' }">
		                                                	<%-- 배송준비중 전까지만 옵션 변경 가능 --%>
		                                                	 <p class="text-right">
		                                                	 	<a
																href="javascript:goOptionModify('<c:out value="${row.ORD_PRD_IDX}"/>');"
																class="button small"><span>변경</span></a>
		                                                	 </p>
														</c:if>	
		                                            </li>
												</c:if>
												<%-- 선택옵션 상품 리스트 --%>
												<c:if test="${not empty row.subPrdList}">	
													<c:forEach var="subPrd" items="${row.subPrdList}">
														<input type="hidden" id="org_option_${subPrd.ORD_PRD_IDX }" value="${subPrd.OPT_DTL_IDX}" />
														<li>
			                                                <strong><label for="option_${subPrd.ORD_PRD_IDX }">설치형태</label></strong>
			                                                <p>
					                                            <label for="option_${subPrd.ORD_PRD_IDX }" class="sel_box_st0">
					                                                <select id="option_${subPrd.ORD_PRD_IDX }" class="select">
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
				                                                </label>
			                                                </p>
			                                                <p class="text-right">
			                                                	<%-- 수량 변경 불가능한 경우 --%>
																${subPrd.ORD_PRD_ORD_CNT }개
																<c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y' }">
																<%-- 배송준비중 전까지만 옵션 변경 가능 --%>
																</c:if>
			                                                    <a href="javascript:goOptionModify('<c:out value="${subPrd.ORD_PRD_IDX}"/>');" class="button small"><span>변경</span></a>
			                                                </p>
			                                            </li>
													</c:forEach>
												</c:if>
	                                        </ul>
	                                    </div>
	                                    </c:if>
	                                    
	                                    <p class="price-after">
	                                        <fmt:formatNumber value="${row.ORD_PRD_ORD_CNT}" type="number" />개 / 
	                                        <span class="blind">판매가</span><fmt:formatNumber value="${row.ORD_PRD_ORD_PRC + row.SUM_SUB_OPTION_ADD_PRC}" type="number" />원
	                                    </p>
	                                    <c:choose>
			                           		<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_NORMAL_CD }">
			                           			<c:if test="${row.ORD_PRD_VDR_IDX eq -1 }">
			                           				<P class="ship-office">프라이스킹배송</P>
			                           			</c:if>
			                           			<c:if test="${row.ORD_PRD_VDR_IDX ne -1 }">
			                           				<P class="ship-office">파트너배송</P>
			                           			</c:if>
			                           		</c:when>
			                           		<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
			                           			<P class="ship-office">겟잇나우</P>
			                           			<%-- <p><a href="javascript:goGetItNowTicketSend('${row.ORD_ORD_MST_CD}');" class="btn_st0 btn_white xsmall"><span>교환권발송</span></a></p> --%>
			                           		</c:when>
			                           		<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
			                           			<P class="ship-office">클린킹</P>
			                           		</c:when>
			                           		<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD }">
			                           			<P class="ship-office">장기할부</P>
			                           		</c:when>
			                           	</c:choose>
	                                </div>
	                                <div class="ct condition">
	                                    <div class="fl">
	                                        <c:out value="${row.ORD_PRD_ORD_STATE_NM }"/>
	                                        <c:if test="${not empty row.ORD_PRD_IVC_NO }">
				                               	<c:choose>
				                               		<c:when test="${row.ORD_PRD_DLV_TYPE eq Code.DLV_TYPE_GET_IT_NOW}">
				                               			<%-- <p><c:out value="${row.ORD_PRD_IVC_NO }" /></p> --%>
				                               		</c:when>
				                               		<c:otherwise>
				                               			[<a href="javascript:goDeliveryView('<c:out value="${row.DLV_CPN_URL }"/><c:out value="${row.ORD_PRD_IVC_NO }" />');" class="warning" target="_blank">[<c:out value="${row.DLV_CPN_NM }" />/<c:out value="${row.ORD_PRD_IVC_NO }" />]</a>]
				                               		</c:otherwise>
				                               	</c:choose>
				                    		</c:if>
				                    		<c:if test="${ row.ORD_PRD_ORD_STATE eq Code.OST_SEND}">
				                    			[<span class="warning">출하일 : <ui:formatDate value="${row.SEND_START_DT}" pattern="yyyy.MM.dd"/></span>]
				                    		</c:if>
				                    		<%-- 마스터 & 선택옵션까지 모두 배송완료인 경우에만 구매확정 가능 --%>
                            				<c:if test="${ row.ORD_PRD_ORD_STATE eq Code.OST_SEND_END and row.SWAP_IGNORE_SUB_OPTION_CNT eq row.SEND_END_SUB_OPTION_CNT}">
                            					[<span class="warning">인도일 : <ui:formatDate value="${row.SEND_END_DT}" pattern="yyyy.MM.dd"/></span>]
                            				</c:if>
	                                    </div>
	                                    <%-- 마스터 & 선택옵션까지 모두 배송완료인 경우에만 구매확정 가능 --%>
                           				<c:if test="${ row.ORD_PRD_ORD_STATE eq Code.OST_SEND_END and row.SWAP_IGNORE_SUB_OPTION_CNT eq row.SEND_END_SUB_OPTION_CNT}">
                           					<div class="fr">
		                                        <a href="javascript:orderFix();" class="button small"><span>구매확정</span></a>
		                                    </div>
                           				</c:if>
	                                </div>
	                            </li><!-- // row -->
                        	</c:forEach>
                        </ul><!-- // cart-list -->
                    </div><!-- // cart-list-wrap -->
                </div>
            </div>
        </div><!-- // product -->
        
        <c:choose>
			<c:when test="${not empty cancelInfoList}">
				<div class="order-detail accordion case" data-role="collapsible-set"><!-- case -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>취소정보</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                    	<c:forEach var="row" items="${cancelInfoList }">
		                    		<li>
			                            <div class="tit">상품정보</div>
			                            <div class="field">
			                                <c:out value="${row.PRD_INFO }"/>
			                            </div>
			                        </li>
		                    		<li>
			                            <div class="tit">사유</div>
			                            <div class="field">
			                                <c:out value="${row.REASON_IDX_NM }"/>
			                            </div>
			                        </li>
			                        <li>
			                            <div class="tit">상세사유</div>
			                            <div class="field">
			                                <c:out value="${row.ORD_PRD_DSC }" escapeXml="false"/>
			                            </div>
			                        </li>
			                        <li>
			                            <div class="tit">접수일</div>
			                            <div class="field">
			                                <ui:formatDate value="${row.ORD_PRD_REG_DT}" pattern="yyyy.MM.dd"/>
			                            </div>
			                        </li>
		                    	</c:forEach>
		                    </ul>
		                </div>      
		            </div>
		        </div><!-- // case -->
			</c:when>
			<c:when test="${not empty backInfoList }">
				<div class="order-detail accordion case" data-role="collapsible-set"><!-- case -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>반품정보</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                    	<c:forEach var="row" items="${backInfoList }">
		                    		<li>
			                            <div class="tit">상품정보</div>
			                            <div class="field">
			                                <c:out value="${row.PRD_INFO }"/>
			                            </div>
			                        </li>
		                    		<li>
			                            <div class="tit">사유</div>
			                            <div class="field">
			                                <c:out value="${row.REASON_IDX_NM }"/>
			                            </div>
			                        </li>
			                        <li>
			                            <div class="tit">상세사유</div>
			                            <div class="field">
			                                <c:out value="${row.ORD_PRD_DSC }" escapeXml="false"/>
			                            </div>
			                        </li>
			                        <li>
			                            <div class="tit">접수일</div>
			                            <div class="field">
			                                <ui:formatDate value="${row.ORD_PRD_REG_DT}" pattern="yyyy.MM.dd"/>
			                            </div>
			                        </li>
		                    	</c:forEach>
		                    </ul>
		                </div>      
		            </div>
		        </div><!-- // case -->
			</c:when>
		</c:choose>
		
		<%-- 교환이력 있는 경우  --%>
		<c:if test="${not empty swapInfoList }">
			<div class="order-detail accordion case" data-role="collapsible-set"><!-- case -->
	            <div class="section" data-role="collapsible" data-collapsed="false">
	                <h3>
	                    <strong>교환정보</strong>
	                    <i><!-- icon --></i>
	                </h3>
	
	                <div class="toggle-box">
	                    <ul class="form-a view">
	                    	<c:forEach var="row" items="${swapInfoList }">
	                    		<li>
		                            <div class="tit">교환상품</div>
		                            <div class="field">
		                                <c:out value="${row.PRD_INFO }"/>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">사유</div>
		                            <div class="field">
		                                <c:out value="${row.REASON_IDX_NM }"/>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">상세사유</div>
		                            <div class="field">
		                                <c:out value="${row.ORD_PRD_DSC }" escapeXml="false"/>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">접수일</div>
		                            <div class="field">
		                                <ui:formatDate value="${row.ORD_PRD_REG_DT}" pattern="yyyy.MM.dd"/>
		                            </div>
		                        </li>
	                    	</c:forEach>
	                    </ul>
	                </div>      
	            </div>
	        </div><!-- // case -->
		</c:if>
		
		<c:if test="${not empty orderPayInfo.ORD_MST_RFD_CD and (orderState.EXCEPT_SWAP_TOTAL_CNT eq orderState.CANCEL_CNT or orderState.EXCEPT_SWAP_TOTAL_CNT eq orderState.CANCEL_END_CNT or orderState.EXCEPT_SWAP_TOTAL_CNT eq orderState.REFUND_END_CNT)}">
			<div class="order-detail accordion bank" data-role="collapsible-set"><!-- free-gift -->
	            <div class="section" data-role="collapsible" data-collapsed="false">
	                <h3>
	                    <strong>환불계좌</strong>
	                    <i><!-- icon --></i>
	                </h3>
	
	                <div class="toggle-box">
	                    <ul class="form-a view">
	                        <li>
	                            <div class="tit">환불방식</div>
	                            <div class="field">
	                                	무통장입금
	                            </div>
	                        </li>
	                        <li>
	                            <div class="tit">환불은행</div>
	                            <div class="field">
	                                <c:out value="${orderPayInfo.ORD_MST_RFD_NM}"/>
	                            </div>
	                        </li>
	                        <li>
	                            <div class="tit">계좌번호</div>
	                            <div class="field">
	                                <c:out value="${orderPayInfo.ORD_MST_RFD_ACT}"/>
	                            </div>
	                        </li>
	                        <li>
	                            <div class="tit">예금주명</div>
	                            <div class="field">
	                                <c:out value="${orderPayInfo.ORD_MST_RFD_HDR}"/>
	                            </div>
	                        </li>
	                    </ul>
	                </div>       
	            </div>
	        </div><!-- // bank -->
		</c:if>
			
				
        <c:if test="${not empty requestedGiftList}">
	        <div class="order-detail accordion free-gift" data-role="collapsible-set"><!-- free-gift -->
	            <div class="section" data-role="collapsible" data-collapsed="false">
	                <h3>
	                    <strong>사은품정보</strong>
	                    (<c:out value="${fn:length(requestedGiftList)}"/>)
	                    <i><!-- icon --></i>
	                </h3>
	
	                <div class="toggle-box">
	                    <ul class="free-gift-list"><!-- free-gift-list -->
	                    	<c:forEach var="gift" items="${requestedGiftList}" varStatus="i">	
	                    		<li class="ct col">
		                            <span class="thumb">
		                            	<c:if test="${gift.GFT_MST_PRD_TYPE eq 'P' }">
			                           		<%-- 상품 이미지 --%>
			                           		<img data-original="<c:out value="${cdnDomain }${gift.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="${gift.PRD_IMAGE_ALT}" />
			                           	</c:if>
			                           	<c:if test="${gift.GFT_MST_PRD_TYPE ne 'P' }">
				                           	<%-- 파일 등록 --%>
				                           	<img data-original="<c:out value="${cdnDomain }${gift.CMM_FLE_ATT_PATH}${gift.CMM_FLE_SYS_NM}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="<c:out value="${gift.CMN_FLE_ALT_TXT}"/>" />
				                         </c:if>
		                            </span>
		                            <div class="core">
		                                <strong class="subject"><c:out value="${gift.GFT_MST_NAME}"/></strong>
		                            </div>
		                        </li>
	                    	</c:forEach>
	                    </ul><!-- // free-gift-list --> 
	                </div>      
	            </div>
	        </div><!-- // free-gift -->
        </c:if>

		<c:choose>
       		<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
            </c:when>
            <c:otherwise>
            	<div class="order-detail accordion payment" data-role="collapsible-set"><!-- payment -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>결제정보</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                        <li>
		                            <div class="tit">총 주문상품금액</div>
		                            <div class="field text-right">
		                            	<c:choose>
		                            		<c:when test="${not empty orderPayInfo.ESM_MST_IDX }">
		                            			<strong>-</strong>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<strong><fmt:formatNumber value="${orderProductList[0].SUM_PRODUCT_PRICE}" type="number"/></strong>원
		                            		</c:otherwise>
		                            	</c:choose>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">총 배송비</div>
		                            <div class="field text-right">
		                                <strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_DLV_CAG}" type="number"/></strong>원
		                                <c:if test="${orderProductList[0].SUM_DLV_ADD_CHARGE gt 0}">
	                                    	<br/>(추가배송비 : <fmt:formatNumber value="${orderProductList[0].SUM_DLV_ADD_CHARGE}" type="number"/>원)
	                                    </c:if>
		                            </div>
		                        </li>
		                        <%-- 기업/비회원/클린킹 주문은 할인금액 안나온다. --%>
		                            <c:choose>
										<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD
																or empty userInfo
																or userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE
										}">
										</c:when>
										<c:otherwise>
											<li>
					                            <div class="tit">총 할인금액</div>
					                            <div class="field text-right">
					                                <strong><fmt:formatNumber value="${orderProductList[0].SUM_INSTANT_CPN_ORDER_PRICE + orderPayInfo.ORD_MST_DC_MLG + orderPayInfo.ORD_MST_DC_CPN + orderPayInfo.ORD_MST_DC_OCB_PIT}" type="number"/></strong>원
					                            </div>
					                        </li>
					                        <li class="detail">
					                            <div class="tit">상품즉시할인</div>
					                            <div class="field text-right">
					                                <fmt:formatNumber value="${orderProductList[0].SUM_INSTANT_CPN_ORDER_PRICE}" type="number"/>원
					                            </div>
					                        </li>
					                        
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
					                           	
					                        <li class="detail">
					                            <div class="tit">상품쿠폰할인</div>
					                            <div class="field text-right">
					                                <fmt:formatNumber value="${c_prd_cpn_prc}" type="number"/>원
					                            </div>
					                        </li>
					                        <li class="detail">
					                            <div class="tit">배송비쿠폰할인</div>
					                            <div class="field text-right">
					                                <fmt:formatNumber value="${c_dlv_cpn_prc}" type="number"/>원
					                            </div>
					                        </li>
					                        <li class="detail">
					                            <div class="tit">포인트사용</div>
					                            <div class="field text-right">
					                                <fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG}" type="number"/>P
					                            </div>
					                        </li>
					                        <li class="detail">
					                            <div class="tit">OK캐쉬백포인트사용</div>
					                            <div class="field text-right">
					                                <fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_OCB_PIT}" type="number"/> 포인트
					                            </div>
					                        </li>
										</c:otherwise>
									</c:choose>
		                        <li>
		                            <div class="tit">총  결제금액</div>
		                            <div class="field text-right">
		                                <span class="warning large"><strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/></strong>원</span>
		                                <c:if test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
		                                	<span class="monthly small">(실제 월 청구금액 <span id="span_expected_lng_prc"><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC/orderPayInfo.ORD_MST_LNG_DIV}" type="number" pattern="###,###"/></span>원)</span>
		                            	</c:if>
		                            </div>
		                        </li>
		                        <c:choose>
				                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD}"><%-- 신용카드 --%>
				                    	<li class="way">
				                            <div class="tit">신용카드</div>
				                            <div class="field">
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
				                            </div>
				                        </li>
					                </c:when>
					                <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY }"><%-- 카카오페이 --%>
					                	<li class="way">
				                            <div class="tit">카카오페이</div>
				                            <div class="field">
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
				                            </div>
				                        </li>    
					                </c:when>
					                <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW}"><%-- 무통장 or 에스크로 --%>
					                	<li class="way">
				                            <div class="tit">페이나우</div>
				                            <div class="field">
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
				                            </div>
				                        </li>
					                </c:when>
					                <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}"><%-- 실시간 계좌이체 --%>
					                	<li class="way">
				                            <div class="tit">실시간계좌이체</div>
				                            <div class="field">
				                            	<p><c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" /></p>
				                                <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO }" /></p>
				                            </div>
				                        </li>
					                </c:when>
					                <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE}"><%-- 전액 포인트/쿠폰/크라운 결제 --%>
					                	<li class="way">
				                            <div class="tit">포인트</div>
				                            <div class="field">
				                            	<p>포인트</p>
				                            </div>
				                        </li>
					                </c:when>
					            </c:choose>
		                    </ul>
		                    
		                    <c:choose>
			                	<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
									<div class="padder cleanking">
				                        <p class="warning">
				                            <span class="warning">
				                                클린킹 주문은 주문상품에 대한 최초 결제된 금액만 표시됩니다. 클린서비스 시 발생된 추가금액은 표시되지 않습니다.<br />
				                                서비스 관련 문의는 클린킹 <strong>고객센터 080-400-8000</strong> 로 연락주시기 바랍니다.
				                            </span>
				                        </p>
				                    </div>
					            </c:when>
					            <c:otherwise>
					            	<div class="frame-a">
				                        <p class="primary">
				                            	무통장 입금으로 주문하신 경우, 입금 기한까지 입금하지 않으시면 주문이 자동으로 취소되오니 입금 기한까지 꼭 입금을 해주시기 바랍니다.
				                        </p>
				                    </div>
					            </c:otherwise>
			                </c:choose>
		                </div>      
		            </div>
		        </div><!-- // payment -->
            </c:otherwise>
        </c:choose>

		<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }">
			<c:if test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE}"><%-- 일반회원만 적립혜택 정보 보여준다. --%>
			<div class="order-detail accordion point" data-role="collapsible-set"><!-- point -->
	            <div class="section" data-role="collapsible" data-collapsed="false">
	                <h3>
	                    <strong>적립/혜택정보</strong>
	                    <i><!-- icon --></i>
	                </h3>
	
	                <div class="toggle-box">
	                    <ul class="form-a view">
	                        <li>
	                            <div class="tit">적립 예정 포인트</div>
	                            <div class="field text-right">
	                                <strong><fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_MIL}" type="number"/></strong> P
	                            </div>
	                        </li>
	                        <li class="detail">
	                            <p>
	                                	상품후기 작성 시 적립
	                            </p>
	                            <p class="mt10">
	                                (상품후기 미작성 시 배송완료일로부터 7일 이후에 자동 구매확정 시 적립)
	                            </p>
	                        </li>
	                        <li>
	                            <div class="tit">적립 예정 OK캐쉬백</div>
	                            <div class="field text-right">
	                                <strong><fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_OCB}" type="number"/></strong> 포인트 
	                            </div>
	                        </li>
	                        <li class="detail">
	                        	<c:if test="${orderPayInfo.TOT_ORD_SAV_OCB gt 0}">
	                            <p>
	                                <c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 0, 4) }"/>-<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 4, 8) }"/>-****-****
	                            </p>
	                            </c:if>
	                            <p class="mt10">
	                                (전 상품 모두 구매확정시 적립)
	                            </p>
	                        </li>
	                    </ul>
	                </div>      
	            </div>
	        </div><!-- // point -->
	        </c:if>
		</c:if>

		<c:choose>
			<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
				<div class="order-detail accordion pickup" data-role="collapsible-set"><!-- payment -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>겟잇나우 픽업정보</strong>
		                    <strong class="warning"><c:out value="${getItNowShopInfo.SHP_MST_NM }"/></strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                        <li>
		                            <div class="tit">방문매장</div>
		                            <div class="field">
		                                <p>
		                                    <a href="javascript:;"><strong class="primary"><c:out value="${getItNowShopInfo.SHP_MST_NM }"/></strong></a>
		                                </p>
		                                <p class="mt10">
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
					                        	<br/>
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
		                                </p>
		                                <p class="mt10">
		                                    	연락처 : <c:out value="${getItNowShopInfo.SHP_MST_TEL }"/>
		                                </p>
		                                <p class="mt10">
		                                    <a href="javascript:getItNowShopInfoPopup('${getItNowShopInfo.SHP_MST_IDX }');" class="button small"><span>매장위치확인</span></a>
		                                </p>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">방문예정일</div>
		                            <div class="field">
		                                <strong><ui:formatDate pattern="yyyy.MM.dd" value="${getItNowShopInfo.ORD_GET_PKU_DT }"/></strong>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">방문예정시간</div>
		                            <div class="field">
		                                <strong><c:out value="${getItNowShopInfo.ORD_GET_PKU_HH }"/></strong>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">수령인정보</div>
		                            <div class="field">
		                                <p>
	                                    	<span id="spanOrdGetNm"><c:out value="${getItNowShopInfo.ORD_GET_NM }"/></span><br />
		                                    <span id="spanOrdGetTel"><c:out value="${getItNowShopInfo.ORD_GET_TEL1 }"/>-<c:out value="${getItNowShopInfo.ORD_GET_TEL2 }"/>-<c:out value="${getItNowShopInfo.ORD_GET_TEL3 }"/></span>
		                                </p>
		                                <c:if test="${orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_PAY or orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_SEND_READY }">
			                                <p>
			                                    <a href="javascript:goGetItNowTicketSend('${orderPayInfo.ORD_MST_CD }');" class="button small"><span>수령인정보 수정</span></a>
			                                </p>
		                            	</c:if>
		                            </div>
		                        </li>
		                    </ul>
		
		                    <div class="padder mt20">
		                        <ul class="list primary">
		                            <li>수령인에게 주문정보가 문자로 발송됩니다. (상품 가격은 노출되지 않습니다.)</li>
		                            <li>상품준비 완료 문자를 받으신 후 매장에 방문해 주세요</li>
		                            <li><span class="warning">매장 방문 시 문자메시지와 신분증을 꼭 지참해 주세요.</span></li>
		                        </ul>
		                    </div>
		
		                    <div class="section-button mb20"><!-- section-button -->
		                        <a href="javascript:goGetItNowTicketSend('${orderPayInfo.ORD_MST_CD }');" class="button full"><span>교환권 발송 </span></a>
		                    </div><!-- // section-button -->
		                </div>      
		            </div>
		        </div><!-- // payment -->
			</c:when>
			<c:otherwise>
				<div class="order-detail accordion ship-address" data-role="collapsible-set"><!-- ship-address -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>배송정보</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                        <li>
		                            <div class="tit">받으시는 분</div>
		                            <div class="field">
		                                <span id="span_dlv_nm"><c:out value="${orderDeliveryInfo.ORD_DLV_NM }" /></span>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">휴대폰 번호</div>
		                            <div class="field">
		                                <span  id="span_hp"><c:out value="${orderDeliveryInfo.ORD_DLV_HP1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }" /></span>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">전화번호</div>
		                            <div class="field">
		                                <span  id="span_tel"><c:out value="${orderDeliveryInfo.ORD_DLV_TEL1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }" /></span>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">주소</div>
		                            <div class="field">
		                                <p>
		                                    <span class="blind">우편번호</span>
		                                    <span id="span_zipcd">[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }" />]</span>
		                                </p>
		                                <p>
		                                    <span class="blind">도로명 주소</span>
		                                    <span id="span_dro"><c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }" /></span>
		                                </p>
		                                <p>
		                                    <span class="blind">지번주소</span>
		                                    <span id="span_jbn"><c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR2 }" /></span>
		                                </p>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">배송유의사항</div>
		                            <div class="field">
		                                <span id="span_desc"><c:out value="${orderDeliveryInfo.ORD_DLV_MSG }" /></span>
		                            </div>
		                        </li>
		                    </ul>
		                    <c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y'}">
		                    	<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
				                    <div class="section-button"><!-- section-button -->
				                        <a href="javascript:goDeliveryModify();" class="button full primary _pg_link"><span>배송지 정보 수정</span></a>
				                    </div><!-- // section-button -->
			                    </c:if>
		                    </c:if>
		                </div>      
		            </div>
		        </div><!-- // ship-address -->
			</c:otherwise>
		</c:choose>
		
		<%---------------------------------------------------------------- 매장위치 확인 팝업 시작 ------------------------------------------------%>
        <section id="shopInfo" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #shopInfo -->
        </section><!-- // #shopInfo -->
        <%---------------------------------------------------------------- 매장위치 확인 팝업 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 배송지 정보 수정 팝업 시작 ------------------------------------------------%>
        <section id="shipModify" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #shipModify -->
        <form id="dlvFrm" name="dlvFrm">
			<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD }"/>"/>
        	<dl class="ui-content">
			   <dt>
			       <h2>배송지 정보 수정</h2>
			       <a href="javascript:$.com.util.layPop('close', $('#shipModify'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
			   </dt>
			   <dd class="dd_con_d">
			
			       <div class="ship-address">
			       	   <c:if test="${not empty sessionUser.MEM_MST_MEM_ID }">
				           <div class="apply"><!-- apply -->
				               <a href="#addressLately" class="button small address-view"><span>최근 배송지</span></a>
				               <a href="#addressMy" class="button small address-view"><span>나의 주소록</span></a>
				               <a href="javascript:;" id="resetDlvInfo" class="button small"><span>새로운 주소</span></a>
				           </div><!-- // apply -->
						</c:if>
						
			           <div id="addressLately" class="address-info address-list recent-address-list"><!-- address-info -->
			               <p>
			                   <strong>최근 배송지 중 주문에 사용할 배송지 정보를 선택해 주세요</strong>
			               </p>
			               <p class="desc">
			                   <span class="small">(최대 5개 까지 제공)</span>
			               </p>
			
			               <table>
			               <caption>받으시는 분, 주소/휴대폰/전화번호, 선택으로 구성된 최근 배송지 목록입니다.</caption>
			               <colgroup>
			                   <col style="width: 25%;" />
			                   <col style="width: auto;" />
			                   <col style="width: 10%;" />
			               </colgroup>
			               <thead>
			                   <tr>
			                       <th scope="col">받으시는 분</th>
			                       <th scope="col">주소/휴대폰/전화번호</th>
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
						                       <td class="text-left">
						                           <p><span class="blind">우편번호</span>[<c:out value="${row.ORD_DLV_ZIP_CDE5 }"/>]</p>
						                           <p><span class="blind">도로명 주소</span><c:out value="${row.ORD_DLV_DRO_ADR1 }"/><c:out value="${row.ORD_DLV_DRO_ADR2 }"/></p>
						                           <p><span class="blind">지번 주소</span><c:out value="${row.ORD_DLV_JBN_ADR1 }"/><c:out value="${row.ORD_DLV_JBN_ADR2 }"/></p>
						                           <p>
						                               <span class="blind">휴대폰</span><c:out value="${row.ORD_DLV_HP1 }"/>-<c:out value="${row.ORD_DLV_HP2 }"/>-<c:out value="${row.ORD_DLV_HP3 }"/> / 
						                               <c:if test="${not empty row.ORD_DLV_TEL1 }">
						                               <span class="blind">전화번호</span><c:out value="${row.ORD_DLV_TEL1 }"/>-<c:out value="${row.ORD_DLV_TEL2 }"/>-<c:out value="${row.ORD_DLV_TEL3 }"/>
						                               </c:if>
						                           </p>
						                       </td>
						                       <td>
						                           <input type="radio" id="recentDlvRadio_${i.index }" name="recent_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if> title="<c:out value="${row.ORD_DLV_NM }"/> 배송지" />
						                       </td>
						                   </tr>
			                   			</c:forEach>
			                   		</c:when>
			                   		<c:otherwise>
			                   			<tr>
					                       <td colspan="3">
					                           <p class="no-more">
					                               	최근 배송지가 없습니다.
					                           </p>
					                       </td>
					                   </tr>
			                   		</c:otherwise>
			                   	</c:choose>
			               </tbody>
			               </table>
			
			               <c:if test="${not empty recentDlvList}">
				               <div class="action">
				                   <a href="javascript:applyDlv('recent');" class="button primary"><span>선택 주소 사용</span></a>
				               </div>
				            </c:if>
			           </div><!-- // address-info -->
			
			           <div id="addressMy" class="address-info address-list my-address-list"><!-- address-info -->
			               <p>
			                   <strong>배송을 원하는 주소를 선택하시면 주문서에 자동 입력됩니다.<br />
			                   나의 주소록에는 최대 10개 까지 주소 등록이 가능하며, 마이페이지 &gt; 배송지관리에서 등록/수정 가능합니다.</strong>
			               </p>
			
			               <table>
			               <caption>받으시는 분, 주소/휴대폰/전화번호, 선택으로 구성된 최근 배송지 목록입니다.</caption>
			               <colgroup>
			                   <col style="width: 25%;" />
			                   <col style="width: auto;" />
			                   <col style="width: 10%;" />
			               </colgroup>
			               <thead>
			                   <tr>
			                       <th scope="col">받으시는 분</th>
			                       <th scope="col">주소/휴대폰/전화번호</th>
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
						                       <td><c:out value="${row.MEM_DLV_RCV_NM }"/></td>
						                       <td class="text-left">
						                           <p><span class="blind">우편번호</span>[[<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>]</p>
						                           <p><span class="blind">도로명 주소</span><c:out value="${row.MEM_DLV_DRO_ADR1 }"/><c:out value="${row.MEM_DLV_DRO_ADR2 }"/></p>
						                           <p><span class="blind">지번 주소</span><c:out value="${row.MEM_DLV_JBN_ADR1 }"/><c:out value="${row.MEM_DLV_JBN_ADR2 }"/></p>
						                           <p>
						                               <span class="blind">휴대폰</span><c:out value="${row.MEM_DLV_HP1 }"/>-<c:out value="${row.MEM_DLV_HP2 }"/>-<c:out value="${row.MEM_DLV_HP3 }"/> / 
						                               <span class="blind">전화번호</span>
						                               <c:if test="${not empty row.MEM_DLV_TEL1 }">
						                               		<c:out value="${row.MEM_DLV_TEL1 }"/>-<c:out value="${row.MEM_DLV_TEL2 }"/>-<c:out value="${row.MEM_DLV_TEL3 }"/>
						                               </c:if>
						                           </p>
						                       </td>
						                       <td>
						                           <input type="radio" id="myDlvRadio_${i.index }" name="my_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if> title="<c:out value="${row.MEM_DLV_NM }"/> 배송지" />
						                       </td>
						                   </tr>
			                   			</c:forEach>
			                   		</c:when>
			                  			<c:otherwise>	
			                  				<tr>
					                       <td colspan="3">
					                           <p class="no-more">
					                              	주소록이 없습니다.
					                           </p>
					                       </td>
					                   </tr>
			               			</c:otherwise>
			                    </c:choose>
			               </tbody>
			               </table>
			
			               <c:if test="${not empty myDlvList}">
				                <div class="action">
				                    <a href="javascript:applyDlv('my');" class="button primary"><span>선택 주소 사용</span></a>
				                </div>
			                </c:if>
			           </div><!-- // address-info -->
			
			           <div class="address-info address-form in"><!-- address-info -->
			               <ul class="form-a dlvForm">
			                   <li class="name">
			                       <div class="tit">
			                           <label for="ORD_DLV_NM">받으시는 분<span class="essential"><em class="blind">필수입력</em></span></label>
			                       </div>
			                       <div class="field">
			                           <input type="text" id="ORD_DLV_NM" name="ORD_DLV_NM" class="text small" title="받으시는 분" maxlength="20" value="<c:out value="${orderDeliveryInfo.ORD_DLV_NM }"/>"/>
			                       </div>
			                   </li>
			                   <li class="tel">
			                       <div class="tit">
			                           <label for="ORD_DLV_HP1">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
			                       </div>
			                       <div class="field">
			                           <label for="ORD_DLV_HP1" class="sel_box_st0">
			                               <select id="ORD_DLV_HP1" name="ORD_DLV_HP1" class="select" title="휴대폰 번호 앞자리">
			                                   <option value="">선택</option>
							                    <c:if test="${not empty hpCodeList }">
							                         <c:forEach var="hpRow" items="${hpCodeList }">
							                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
							                         </c:forEach>
							                     </c:if>
			                               </select>
			                           </label>
			                           -
					                   <input type="number" id="ORD_DLV_HP2" name="ORD_DLV_HP2" class="text small number" title="휴대폰 번호 중간자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }"/>"/>
					                   -
					                   <input type="number" id="ORD_DLV_HP3" name="ORD_DLV_HP3" class="text small number" title="휴대폰 번호 뒷자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }"/>"/>
			                       </div>
			                   </li>
			                   <li class="tel">
			                       <div class="tit">
			                           <label for="ORD_DLV_TEL1">전화번호</label>
			                       </div>
			                       <div class="field">
			                           <label for="ORD_DLV_TEL1" class="sel_box_st0">
			                               <select id="ORD_DLV_TEL1" class="select" name="ORD_DLV_TEL1" title="전화 번호 앞자리">
			                                   <option value="">선택</option>
							                    <c:if test="${not empty telCodeList }">
							                         <c:forEach var="telRow" items="${telCodeList }">
							                             <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_TEL1 }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
							                         </c:forEach>
							                     </c:if>
			                               </select>
			                           </label>
			                           -
					                   <input type="number" id="ORD_DLV_TEL2" name="ORD_DLV_TEL2" class="text small number" title="전화 번호 중간자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }"/>"/>
					                   -
					                   <input type="number" id="ORD_DLV_TEL3" name="ORD_DLV_TEL3" class="text small number" title="전화 번호 뒷자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }"/>"/>
			                       </div>
			                   </li>
			                   <li class="address">
			                       <div class="tit">
			                           <label for="ORD_DLV_ZIP_CDE5">주소<span class="essential"><em class="blind">필수입력</em></span></label>
			                       </div>
			                       <div class="field">
			                           <p class="zip">
			                               <input type="text" id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" class="text" title="우편번호" maxlength="5" value="<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }"/>" readonly="readonly">
			                               <!-- <a href="javascript:;" class="button small search-zipcode"
			                                data-post1_id="ORD_DLV_ZIP_CDE6_1"
					                    	data-post2_id="ORD_DLV_ZIP_CDE6_2"
					                    	data-addr1_id="ORD_DLV_JBN_ADR1"
					                    	data-addr2_id="ORD_DLV_JBN_ADR2"
					                    	data-new_post_id="ORD_DLV_ZIP_CDE5"
					                    	data-new_addr1_id="ORD_DLV_DRO_ADR1"
					                    	data-new_addr2_id="ORD_DLV_DRO_ADR2"
					                    	data-opener_fn="getAddDlvCharge"
			                               ><span>우편번호 찾기</span></a> -->
			                               <a href="javascript:$.com.util.layPop('open', $('#layZipcode'), true);" id="zipCheck" class="button small"><span>우편번호 찾기</span></a>
			                           </p>
			                           <p>
			                           		<input type="text" name="ORD_DLV_DRO_ADR1" id="ORD_DLV_DRO_ADR1" class="text" title="도로명 주소" placeholder="도로명 주소" readonly="readonly" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }"/>"/>
			                           </p>
			                           <p>
			                               <input type="text" name="ORD_DLV_JBN_ADR1" id="ORD_DLV_JBN_ADR1" class="text" title="지번 주소" placeholder="지번 주소" <%-- readonly="readonly" --%> value="<c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }"/>"/>
			                           </p>
			                           <p>
			                           	   <input type="text" name="ORD_DLV_DRO_ADR2" id="ORD_DLV_DRO_ADR2" class="text" title="이하 주소" placeholder="이하 주소" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }"/>"/>
			                           </p>
			                       </div>
			                   </li>
			                    <%-- [BEGIN] 우편번호 api 스크립트 --%>
								<%-- <%@ include file="/WEB-INF/jsp/mobile/include/zipcode.jsp" %>--%>
								<%-- [END] 우편번호 api 스크립트 --%>
			                   <li class="message">
			                       <div class="tit">
			                           <label for="ORD_DLV_MSG">배송유의사항</label>
			                       </div>
			                       <div class="field">
			                           <p>
			                           		<label for="dlvMessage" class="sel_box_st0" title="배송 메세지 선택">
					                       	   	<select id="dlvMessage" class="select" title="배송 메세지 선택">
			                                        <option value="">메세지를 선택해주세요.</option>
			                                        <c:if test="${not empty dlvMsgList }">
					                                    <c:forEach var="row" items="${dlvMsgList }">
					                                        <option value="<c:out value="${row.CMN_COM_NM }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
					                                    </c:forEach>
					                                    <option value="0">매세지 직접입력</option>
					                                </c:if>
			                                    </select>
		                                    </label>
			                           		<input type="text" class="text" id="ORD_DLV_MSG" name="ORD_DLV_MSG" maxlength="60" placeholder="최대 60자 이내 입력가능" value="<c:out value="${orderDeliveryInfo.ORD_DLV_MSG }"/>" <c:if test="${empty orderDeliveryInfo.ORD_DLV_MSG }">style="display:none;"</c:if>/>
			                           </p>
			                           <p class="desc">
			                               	택배기사님께 전달하는 메시지는 배송상황 및 요청내용에 따라 반영되지 않을 수 있습니다. 
			                           </p>
			                       </div>
			                   </li>
			               </ul>
			               
			               <div class="section-button mb20"><!-- section-button -->
			                   <a href="javascript:goDlvSubmit();" class="button warning"><span>확인</span></a>
			                   <a href="javascript:$.com.util.layPop('close', $('#shipModify'));" class="button primary"><span>취소</span></a>
			               </div><!-- // section-button -->
			                            
			           </div><!-- // address-info -->
			        </div>
			    </dd>
			</dl>
		</form>
        </section><!-- // #shipModify -->
        <%---------------------------------------------------------------- 배송지 정보 수정 팝업 끝 ------------------------------------------------%>
	
		<%---------------------------------------------------------------- 겟잇나우 수령인 정보 수정 팝업 시작 ------------------------------------------------%>
		<section id="couponDispatch" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #couponDispatch -->
			<form id="getDlvFrm" name="getDlvFrm" method="post">
			<input type="hidden" name="ORD_MST_CD" value="<c:out value="${getItNowShopInfo.ORD_MST_CD}"/>"/>
			<input type="hidden" name="ORD_MST_ORD_NM" value="<c:out value="${getItNowShopInfo.ORD_MST_ORD_NM}"/>"/>
			<input type="hidden" name="ORD_MST_ORD_DT" value="<c:out value="${getItNowShopInfo.ORD_MST_ORD_DT}"/>"/>
			<input type="hidden" name="SHP_MST_NM" value="<c:out value="${getItNowShopInfo.SHP_MST_NM}"/>"/>
			<input type="hidden" name="SHP_MST_TEL" value="<c:out value="${getItNowShopInfo.SHP_MST_TEL}"/>"/>
			<input type="hidden" name="ORD_GET_TIK" value="<c:out value="${getItNowShopInfo.ORD_GET_TIK}"/>"/>
			
            <dl class="ui-content">
                <dt>
                    <h2>교환권발송</h2>
                    <a href="javascript:$.com.util.layPop('close', $('#couponDispatch'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
                </dt>
                <dd class="dd_con_d">

                    <div class="padder mt20">
                        <ul class="list primary">
                            <li>교환권은 최대 2회까지만 발송할 수 있습니다.</li>
                            <li>문자메시지에 상품가격은 노출되지 않습니다.</li>
                        </ul>
                        <p class="mt20">
                            <strong class="warning large">남은 발송 횟수 <span id="spanRemainSmsCnt"><c:out value="${getItNowShopInfo.ORD_GET_SMS_CNT}"/></span>/2회</strong>
                        </p>
                    </div>

                    <div class="coupon-dispatch mt10"><!-- coupon-dispatch -->
                        <h3>보내시는 분</h3>
                        <div class="padder">
                            <ul>
                                <li><span class="blind">보내시는 분 성명</span><c:out value="${getItNowShopInfo.ORD_MST_ORD_NM }"/></li>
                                <li><span class="blind">보내시는 분 연락처</span><c:out value="${getItNowShopInfo.ORD_MST_HP1 }"/>-<c:out value="${getItNowShopInfo.ORD_MST_HP2 }"/>-<c:out value="${getItNowShopInfo.ORD_MST_HP3 }"/></li>
                            </ul>
                        </div>
                    </div><!-- // coupon-dispatch -->

                    <div class="coupon-dispatch"><!-- coupon-dispatch -->
                        <h3>받으시는 분</h3>
                        <div class="action">
                        	<input id="ORD_GET_GBN_0" class="radio" type="radio" name="ORD_GET_GBN" value="0" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '0'}">checked="checked"</c:if> style="display: none;"/><%-- 본인수령 --%>
                    		<input id="ORD_GET_GBN_1" class="radio" type="radio" name="ORD_GET_GBN" value="1" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '1'}">checked="checked"</c:if> style="display: none;"/><%-- 타인수령 --%>
                            <a href="javascript:chageGetGbn('0');" id="ORD_GET_GBN_BTN_0" class="button ${getItNowShopInfo.ORD_GET_GBN eq '0' ? 'warning' : ''} small"><span>본인수령</span></a>
                            <a href="javascript:chageGetGbn('1');" id="ORD_GET_GBN_BTN_1" class="button ${getItNowShopInfo.ORD_GET_GBN eq '1' ? 'warning' : ''} small"><span>타인수령</span></a>
                        </div>
                        <div class="padder">
                            <ul>
                            	<li id="p_ordGetRlt" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '0'}">style="display: none;"</c:if>>
                                    <label for="ORD_GET_RLT" class="sel_box_st0">
                                        <select id="ORD_GET_RLT" name="ORD_GET_RLT" class="select" title="주문하신 분과의 관계">
                                            <option value="">주문자와의 관계</option>
				                             <c:if test="${not empty getItNowReceiverList }">
					                              <c:forEach var="row" items="${getItNowReceiverList }">
					                                  <option value="<c:out value="${row.CMN_COM_ETC1 }"/>" <c:if test="${getItNowShopInfo.ORD_GET_RLT eq row.CMN_COM_ETC1}">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
					                              </c:forEach>
				                              </c:if>
                                        </select>
                                    </label>
                                </li>
                                <li>
                                    <label for="ORD_GET_NM" class="blind">받으시는 분 성명</label>
                                    <input type="text" id="ORD_GET_NM" name="ORD_GET_NM" class="text" maxlength="15" value="${getItNowShopInfo.ORD_GET_NM }">
                                </li>
                                <li class="tel">
                                    <label for="ORD_GET_TEL1" class="sel_box_st0">
                                        <select id="ORD_GET_TEL1" name="ORD_GET_TEL1" class="select" title="받으시는 분 휴대폰 번호 앞자리">
                                            <option value="">선택</option>
										    <c:if test="${not empty hpCodeList }">
											 <c:forEach var="hpRow" items="${hpCodeList }">
											     <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${getItNowShopInfo.ORD_GET_TEL1 eq hpRow.CMN_COM_NM}">selected="selected"</c:if> ><c:out value="${hpRow.CMN_COM_NM }"/></option>
											 </c:forEach>
										     </c:if>
                                        </select>
                                    </label> -
                                    <input type="number" class="text" id="ORD_GET_TEL2" name="ORD_GET_TEL2" maxlength="4" title="받으시는 분 휴대폰 번호 중간자리" value="${getItNowShopInfo.ORD_GET_TEL2 }"/> -
                                    <input type="number" class="text" id="ORD_GET_TEL3" name="ORD_GET_TEL3" maxlength="4" title="받으시는 분 휴대폰 번호 끝자리" value="${getItNowShopInfo.ORD_GET_TEL3 }"/>
                                </li>
                            </ul><!-- // 본인 수령 -->
                        </div>
                    </div><!-- // coupon-dispatch -->

                    <div class="coupon-dispatch"><!-- coupon-dispatch -->
                    	<%-- 대표 상품명 설정 --%>
			            <c:if test="${ fn:length(orderProductList) gt 1 }">
			            	<input type="hidden" name="PRD_NM" value="${orderProductList[0].PRD_MST_NM} 외 ${ fn:length(orderProductList) - 1 }건"/>
			            </c:if>
			            <c:if test="${ fn:length(orderProductList) eq 1 }">
			            	<input type="hidden" name="PRD_NM" value="${orderProductList[0].PRD_MST_NM}"/>
			            </c:if>
                        <h3>주문상품</h3>
                        <div class="cart-list-wrap"><!-- cart-list-wrap -->
                            <ul class="cart-list"><!-- cart-list -->
                            	<c:forEach var="row" items="${orderProductList}" varStatus="i">
                            		<li class="col"><!-- row -->
	                                    <div class="item">
	                                        <a href="javascript:;" class="link">
	                                            <span class="thumb"><img data-original="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="${row.PRD_IMAGE_ALT}" /></span>
	                                            <span class="subject"><c:out value="${row.PRD_MST_NM}" /></span>
	                                        </a>
	                                        <c:if test="${empty row.ORD_PRD_ORG_IDX}" >
				                                <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
													<div class="option">
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
													</div>
												</c:if>
											</c:if>
	                                        <div class="amount">
	                                            <fmt:formatNumber value="${row.ORD_PRD_ORD_CNT}" type="number" />개
	                                        </div>
	                                    </div>
	                                </li><!-- // row -->
                            	</c:forEach>
                            </ul><!-- // cart-list -->
                        </div><!-- // cart-list-wrap -->
                    </div><!-- // coupon-dispatch -->
					
					<c:if test="${orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_PAY or orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_SEND_READY }">
                      	<div class="section-button mb20"><!-- section-button -->
                        	<a href="javascript:sendGetItNowTicket();" class="button warning full"><span>교환권발송</span></a>
                    	</div><!-- // section-button -->
                    </c:if>
                </dd>
            </dl>
            </form>
        </section><!-- // #couponDispatch -->
        <%---------------------------------------------------------------- 겟잇나우 수령인 정보 수정 팝업 끝 ------------------------------------------------%>

        <div class="order-detail accordion orderer" data-role="collapsible-set"><!-- orderer -->
            <div class="section" data-role="collapsible" data-collapsed="false">
                <h3>
                    <strong>주문고객정보</strong>
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <ul class="form-a view">
                        <li>
                            <div class="tit">주문하시는 분</div>
                            <div class="field">
                                <c:out value="${orderPayInfo.ORD_MST_ORD_NM }" />
                            </div>
                        </li>
                        <li>
                            <div class="tit">휴대폰번호</div>
                            <div class="field">
                                <c:out value="${orderPayInfo.ORD_MST_HP1 }" />-<c:out value="${orderPayInfo.ORD_MST_HP2 }" />-<c:out value="${orderPayInfo.ORD_MST_HP3 }" />
                            </div>
                        </li>
                        <li>
                            <div class="tit">이메일 주소</div>
                            <div class="field">
                                <c:out value="${orderPayInfo.ORD_MST_MAIL }" />
                            </div>
                        </li>
                    </ul>
                </div>      
            </div>
        </div><!-- // orderer -->

        <div class="padder mt20">
            <p class="primary">
                교환/반품 신청은 배송완료 이후에만 가능하며, 교환/반품을 원하시면 <a href="javascript:;" class="primary">1:1문의</a>를 통해 문의해 주시기 바랍니다. 
            </p>
        </div>
		
		<c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y' }">
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:;" id="orderCancel" class="button full warning">
	            	<span>주문취소</span>
	            </a>
	        </div><!-- // section-button -->
        </c:if>
        
        <c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN ne 'Y' and orderPayInfo.ORD_MST_CNL_YN ne 'Y' }">
        	<c:if test="${orderState.SEND_READY_CNT gt 0 or orderState.SEND_CNT gt 0}">
	        	<div class="section-button"><!-- section-button -->
		            <a href="javascript:;" id="orderCancelRequest" class="button full warning"><span>취소요청</span></a>
		        </div><!-- // section-button -->
	        </c:if>
        </c:if>
        
        <%-- 클린킹인 경우, 예약취소 버튼 --%>
		<c:if test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
			<%-- 예약상담 신청인 경우  --%>
			<c:if test="${orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_CLEANKING_REQUEST}">
	        	<div class="section-button"><!-- section-button -->
					<a href="javascript:;" id="orderCleankingCancel" class="button full warning"><span>예약취소</span></a>
		        </div><!-- // section-button -->
			</c:if>
			
			<%-- 예약상담확정인 경우  --%>
			<c:if test="${orderProductList[0].ORD_PRD_ORD_STATE eq Code.OST_CLEANKING_CONFIRM}">
	        	<div class="section-button"><!-- section-button -->
					<a href="javascript:;" id="orderCancelRequest" class="button full warning"><span>취소요청</span></a>
		        </div><!-- // section-button -->
			</c:if>
		</c:if>
		
		<c:if test="${orderPayInfo.ORD_MST_CNL_YN eq 'Y' }">
			<div class="padder mt20">
            	<p class="primary">
				<span>취소요청</span>
				</p>
	        </div>
        </c:if>

		<c:set var="c_swap_available_yn" value="N"/>
		<c:set var="c_back_available_yn" value="N"/>
        <c:choose>
       		<c:when test="${orderState.PARTIAL_BACK_ING_YN eq 'Y' and repayYn gt 0 }">
       			<c:set var="c_swap_available_yn" value="N"/>
				<c:set var="c_back_available_yn" value="N"/>
       		</c:when>
       		<c:otherwise>
       		<c:if test="${orderState.SEND_END_CNT gt 0 }">
       			<c:set var="c_swap_available_yn" value="Y"/>
       		</c:if>
       		<c:if test="${orderState.FRONT_WHOLE_BACK_POSSIBLE_YN eq 'Y' }"><%-- 모든 상품이 배송완료인 경우에만 반품신청 가능 --%>
				<c:set var="c_back_available_yn" value="Y"/>
       		</c:if>
       		</c:otherwise>
       	</c:choose>       	
        
        <c:if test="${empty orderPayInfo.ORD_MST_PRE_CD}"><%-- 재주문은 교환/반품 불가 --%>
	        <c:choose>
	        	<c:when test="${c_swap_available_yn eq 'Y' and c_back_available_yn eq 'Y'}">
	        		<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
		        		<div class="padder section-button"><!-- section-button -->
				            <div class="ui-grid-a">
				                <div class="ui-block-a">
				                     <a href="javascript:;" id="orderChange" class="button primary full"><span>교환신청</span></a>
				                </div>
				                <div class="ui-block-b">
				                     <a href="javascript:;" id="orderBack" class="button primary full"><span>반품신청</span></a>
				                </div>
				            </div>
				        </div><!-- // section-button -->
			        </c:if>
	        	</c:when>
	        	<c:when test="${c_swap_available_yn eq 'Y'}">
	        		<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
		        		<div class="section-button"><!-- section-button -->
				            <a href="javascript:;" id="orderChange" class="button full primary"><span>교환신청</span></a>
				        </div><!-- // section-button -->
			        </c:if>
	        	</c:when>
	        	<c:when test="${c_back_available_yn eq 'Y'}">
	        		<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
		        		<div class="section-button"><!-- section-button -->
				            <a href="javascript:;" id="orderBack" class="button full primary"><span>반품신청</span></a>
				        </div><!-- // section-button -->
			        </c:if>
	        	</c:when>
	        </c:choose>
        </c:if>
            
    </article>
	<!--// #container E -->
	
	<%-- 취소/교환/반품 폼 --%>
	<form id="orderStateForm" name="orderStateForm" method="post" action=""> 
		<input type="hidden" name="ORD_MST_CD"/>
        <input type="hidden" name="ORD_PRD_ORD_STATE"/>
        <input type="hidden" name="ORD_PRD_IDX" value=""/>
        <input type="hidden" name="ORD_PRD_IDX_ARR" value=""/>
        
        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
        <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
        <input type="hidden" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
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
	
	<form name="paymentform" id="paymentform" method="post"></form>

	<%-- 우편번호 레이어 --%>
	<%@ include file="/WEB-INF/jsp/mobile/common/zipcode/zipcodeLayer.jsp" %>
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	
</section>
<!--// #wrap E -->

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
                url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/repayPrepareAjax.do",
                success : function (data) 
                { 
    				switch (data.result) {
    				case 1:
    					$('#paymentform').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
    					$('#paymentform').append("<input type=\"hidden\" name=\"PRE_ORD_MST_CD\" value=\""+ data.PRE_ORD_MST_CD +"\">");
    					$('#paymentform').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do', 'target' : '_self'}).submit();
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
         $frm.attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/mypage/"+url, "target":"_self", "method":"post"}).submit();
	};
	
    // 상품상세 팝업페이지 호출
    goProductView = function (prdCd)
    {
    	window.open("<c:out value="${mobileDomain}" />/mobile/product/product.do?prdMstCd="+prdCd, "_blank");
    	//goProductDetail("<c:out value="${mobileDomain}" />", prdCd);
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

    	document.orderStateForm.action = "<c:out value="${mobileSslDomain}"/>/mobile/mypage/orderCancelPopup.do";
       	document.orderStateForm.ORD_MST_CD.value = orderCd;
       	document.orderStateForm.ORD_PRD_IDX.value = "";
       	document.orderStateForm.ORD_PRD_IDX_ARR.value = "";
       	document.orderStateForm.ORD_PRD_ORD_STATE.value = state;
       	document.orderStateForm.target = "_self";
       	document.orderStateForm.submit();
        
        //popup("<c:out value="${mobileDomain}" />/mobile/mypage/orderCancelPopup.do?ORD_PRD_ORD_STATE="+state+"&ORD_MST_CD="+orderCd, "1024", "700", "yes", "orderCancelBack");

    });
    
	 // 클린킹 주문취소 버튼 클릭 이벤트
    $(document).on("click", "#orderCleankingCancel", function () {
        
        var state = "<c:out value="${Code.OST_CLEANKING_CANCEL }" />";
    	var orderCd = "<c:out value="${commandMap.ORD_MST_CD }" />";

    	document.orderStateForm.action = "<c:out value="${mobileSslDomain}"/>/mobile/mypage/orderCancelPopup.do";
       	document.orderStateForm.ORD_MST_CD.value = orderCd;
       	document.orderStateForm.ORD_PRD_IDX.value = "";
       	document.orderStateForm.ORD_PRD_IDX_ARR.value = "";
       	document.orderStateForm.ORD_PRD_ORD_STATE.value = state;
       	document.orderStateForm.target = "_self";
       	document.orderStateForm.submit();
        
        //popup("<c:out value="${mobileDomain}" />/mobile/mypage/orderCancelPopup.do?ORD_PRD_ORD_STATE="+state+"&ORD_MST_CD="+orderCd, "1024", "700", "yes", "orderCancelBack");

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
    	
       	document.orderStateForm.action = "<c:out value="${mobileSslDomain}"/>/mobile/mypage/orderBackPopup.do";
       	document.orderStateForm.ORD_MST_CD.value = orderCd;
       	document.orderStateForm.ORD_PRD_IDX.value = "";
       	document.orderStateForm.ORD_PRD_IDX_ARR.value = ordPrdIdxArr;
       	document.orderStateForm.ORD_PRD_ORD_STATE.value = state;
       	document.orderStateForm.target = "_self";
       	
    	$.ajax({
    		type: "post",
    		url : "<c:out value="${mobileSslDomain}"/>/mobile/mypage/backAvailableCheckAjax.do",
    		data : $("#orderStateForm").serialize(),
    		dataType : "json",
    		async : false,
    		success : function(data){    			
    			// 0 이상 : 성공
    			if(data.result > 0){
    				document.orderStateForm.submit();
    			}else{
    				alert(data.resultMsg);
    			}
    		},
    		error : function(error){
    			alert(error);
    		}
    	});
    	
        //popup("<c:out value="${mobileDomain}" />/mobile/mypage/returnOrderProductRegistPopup.do?ORD_PRD_ORD_STATE="+state+"&ORD_MST_CD="+orderCd, "800", "600", "yes", "orderCancelBack");

    });
    
	 // 취소요청
    $(document).on("click", "#orderCancelRequest", function () {
    	if(confirm("취소요청하시겠습니까?")){
    		$.ajax({
        		type: "post",
        		url : "<c:out value="${mobileSslDomain}"/>/mobile/mypage/orderCancelRequestAjax.do",
        		data : $("#frm").serialize(),
        		dataType : "json",
        		async : false,
        		success : function(data){   
        			alert(data.resultMsg);
        			// 0 이상 : 성공
        			if(data.result > 0){
        				// 버튼 삭제
        				$("#orderCancelRequest").parent().remove();
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
    	
    	document.orderStateForm.action = "<c:out value="${mobileSslDomain}"/>/mobile/mypage/changeOrderProductRegistPopup.do";
       	document.orderStateForm.ORD_MST_CD.value = orderCd;
       	document.orderStateForm.ORD_PRD_IDX.value = ordPrdIdx;
       	document.orderStateForm.ORD_PRD_IDX_ARR.value = "";
       	document.orderStateForm.ORD_PRD_ORD_STATE.value = "";
       	document.orderStateForm.target = "_self";
        
    	if(ordPrdIdx != "")
        {
    		$.ajax({
        		type: "post",
        		url : "<c:out value="${mobileSslDomain}"/>/mobile/mypage/swapAvailableCheckAjax.do",
        		data : {"ORD_MST_CD": orderCd , "ORD_PRD_IDX" : ordPrdIdx},
        		dataType : "json",
        		async : false,
        		success : function(data){    			
        			// 0 이상 : 성공
        			if(data.result > 0){
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
    	
    	//popup("<c:out value="${mobileSslDomain}" />/mobile/mypage/changeOrderProductRegistPopup.do?ORD_MST_CD="+orderCd+"&ORD_PRD_IDX="+ordPrdIdx, "800", "600", "yes", "orderChangeProduct");
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
    	//var ORD_MST_CD = "${commandMap.ORD_MST_CD}";
    	//$("#shipModify").load("<c:out value="${mobileSslDomain}"/>/mobile/cart/deliveryModifyPopup.do?ORD_MST_CD="+ORD_MST_CD, function(){
    		$.com.util.layPop('open', $('#shipModify'), true);
    	//});
    }
	 
	// 겟잇나우 교환권 발송 팝업
    goGetItNowTicketSend = function(ordMstCd){
    	/* window.open("","getItNowTicketPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=650,scrollbars=yes');
    	document.getItNowForm.action = "<c:out value="${mobileSslDomain}"/>/mobile/cart/getItNowTicketPopup.do";
    	document.getItNowForm.ORD_MST_CD.value = ordMstCd;
    	document.getItNowForm.target = "getItNowTicketPop";
    	document.getItNowForm.submit(); */
    	$.com.util.layPop('open', $('#couponDispatch'), true);
    }
	
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
		url : "<c:out value="${mobileSslDomain}"/>/mobile/mypage/productOptionCntModifyAjax.do",
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
	$("#shopInfo").load("<c:out value="${mobileSslDomain}"/>/mobile/cart/getItNowShopInfoPopup.do?SHP_MST_IDX="+shpMstIdx, function(){
		$.com.util.layPop('open', $('#shopInfo'), true);
	});
}

//구매확정 버튼 클릭 이벤트
function orderFix(){
    if (confirm("상품후기를 작성하시면 자동 구매확정됩니다.\n상품후기 작성페이지로 이동하시겠습니까?"))
    {
    	location.href = "<c:out value="${mobileDomain}" />/mobile/mypage/myWritableProductCommentList.do";
    }
}

//]]>
</script>

<%---------------------------------------------------------------- 배송지 정보 수정 팝업 script 시작 ------------------------------------------------%>
<script type="text/javascript">
$(function(){
	// 우편번호 callback 함수
	zipcodeCallback = function (zip,doroAddr,jibunAddr)
	{
		$('#ORD_DLV_ZIP_CDE5').val(zip);
		$('#ORD_DLV_DRO_ADR1').val(doroAddr);
		$('#ORD_DLV_JBN_ADR1').val(jibunAddr);
	};
	
	//새로운 주소 체크시
	$(document).on("click","#resetDlvInfo",function(){
		var ordDlvMessage = $("#ORD_DLV_MSG").val();		
		$(".dlvForm").find("input").val("");
		$(".dlvForm").find("select").val("").change();
		$("#ORD_DLV_MSG").val(ordDlvMessage);
	});
	
	//배송 메세지 선택시
	$(document).on("change","#dlvMessage",function(){
		var thisValue = $(this).val();		
		if(thisValue === "0"){//직접입력
			$("#ORD_DLV_MSG").show();
			$("#ORD_DLV_MSG").val("");
		}else{
			$("#ORD_DLV_MSG").val(thisValue);
			$("#ORD_DLV_MSG").hide();
		}
	});
	
	 // 폼체크
    $("#dlvFrm").validate({
        rules: {
            ORD_DLV_HP1:{required:true},	// 핸드폰번호 앞자리
        	ORD_DLV_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
        	ORD_DLV_HP3:{required:true, number:true, minlength:4 , maxlength:4}, // 핸드폰번호 뒷자리
        	ORD_DLV_TEL1:{required:{depends:function(){
                if($("#ORD_DLV_TEL2").val() != "" || $("#ORD_DLV_TEL3").val() != ""){
               	 return true;
                }else{
               	 return false;
                }	 
	        }}},
        	ORD_DLV_TEL2:{required:{depends:function(){
                 if($("#ORD_DLV_TEL1").val() != "" || $("#ORD_DLV_TEL3").val() != ""){
                	 return true;
                 }else{
                	 return false;
                 }	 
 	        }}, number:true, maxlength:4}, 
 	       ORD_DLV_TEL3:{required:{depends:function(){
               if($("#ORD_DLV_TEL1").val() != "" || $("#ORD_DLV_TEL2").val() != ""){
              	 return true;
               }else{
              	 return false;
               }	 
	        }}, number:true, maxlength:4},
        	ORD_DLV_ZIP_CDE5:{required:true, number:true}, // 우편번호
        	ORD_DLV_DRO_ADR1:{required:true}, // 도로명 본주소
        	ORD_DLV_DRO_ADR2:{required:true}, // 도로명 상세주소
        	ORD_DLV_JBN_ADR1:{required:true} // 지번 본주소
        },
        messages :{
            ORD_DLV_HP1: {required:"수령자 휴대폰 번호 첫자리를 입력해주십시오."},
        	ORD_DLV_HP2: {required:"수령자 휴대폰 번호 중간자리를 입력해주십시오." ,minlength:"[수령자 휴대폰 번호 중간자리]최소 3글자 이상입니다." , maxlength:"[수령자 휴대폰 번호 중간자리]최대 4글자입니다."},
        	ORD_DLV_HP3: {required:"수령자 휴대폰 번호 끝자리를 입력해주십시오." ,minlength:"[수령자 휴대폰 번호 끝자리]최소 4글자 이상입니다." , maxlength:"[수령자 휴대폰 번호 끝자리]최대 4글자입니다."},
        	ORD_DLV_TEL1: {required:"수령자 전화 번호 첫자리를 입력해주십시오."},
        	ORD_DLV_TEL2: {required:"수령자 전화 번호 중간자리를 입력해주십시오." , maxlength:"[수령자 전화 번호 중간자리]최대 4글자입니다."},
        	ORD_DLV_TEL3: {required:"수령자 전화 번호 끝자리를 입력해주십시오." , maxlength:"[수령자 전화 번호 끝자리]최대 4글자입니다."},
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
	 
	// 배송지 수정
	goDlvSubmit = function(){
		if($("#dlvFrm").valid()){
			if(confirm("배송지 정보를 수정하시겠습니까?")){
				var ORD_MST_CD = "${commandMap.ORD_MST_CD}"; //주문번호
				var ORD_DLV_ZIP_CDE5 = $("#ORD_DLV_ZIP_CDE5").val(); //새로운 우편번호
				
				$.ajax({
					type:"post",
					url : "<c:out value="${mobileSslDomain}" />/mobile/cart/orderDeliveryModifyProcAjax.do",
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
							var zipcd = "["+ ORD_DLV_ZIP_CDE5 + "]";
							var dro = $("#ORD_DLV_DRO_ADR1").val() + ", " + $("#ORD_DLV_DRO_ADR2").val();
							var jbn = $("#ORD_DLV_JBN_ADR1").val() + ", " + $("#ORD_DLV_DRO_ADR2").val();
							var desc = $("#ORD_DLV_MSG").val();
							
							$("#span_dlv_nm").html(dlv_nm);
							$("#span_hp").html(hp);
							$("#span_tel").html(tel);
							$("#span_zipcd").html(zipcd);
							$("#span_dro").html(dro);
							$("#span_jbn").html(jbn);
							$("#span_desc").html(desc);
							
							$.com.util.layPop('close', $('#shipModify'));
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
});

//선택한 배송지 적용
function applyDlv(dlv_type){
	var radio_idx = $("input[name="+ dlv_type +"_dlv_radio]:checked").val();
	
	$("."+ dlv_type +"_dlv_"+radio_idx).each(function(i, item){
		var target_dlv_id = $(this).data("target_dlv_id");
		$("#"+target_dlv_id).val($(this).val()).change();
	});
	
	$("."+dlv_type+"-address-list").removeClass("in");
}
</script>
<%---------------------------------------------------------------- 배송지 정보 수정 팝업 script 끝 ------------------------------------------------%>

<%---------------------------------------------------------------- 겟잇나우 수령인 정보 수정 팝업 script 시작 ------------------------------------------------%>
<script>
//수령정보 선택시
function chageGetGbn(idx){
	$("#ORD_GET_GBN_"+idx).prop("checked",true);
	$("#ORD_GET_GBN_BTN_"+idx).siblings().removeClass("warning");
	$("#ORD_GET_GBN_BTN_"+idx).addClass("warning");
	
	if(idx == '0'){
		$("#ORD_GET_NM").val("${getItNowShopInfo.ORD_MST_ORD_NM}");
		$("#ORD_GET_TEL1").val("${getItNowShopInfo.ORD_MST_HP1}");
		$("#ORD_GET_TEL2").val("${getItNowShopInfo.ORD_MST_HP2}");
		$("#ORD_GET_TEL3").val("${getItNowShopInfo.ORD_MST_HP3}");
		
		$("#ORD_GET_RLT").val("");
		$("#p_ordGetRlt").hide();
	}else{
		$("#ORD_GET_NM").val("${getItNowShopInfo.ORD_GET_NM}");
		$("#ORD_GET_TEL1").val("${getItNowShopInfo.ORD_GET_TEL1}");
		$("#ORD_GET_TEL2").val("${getItNowShopInfo.ORD_GET_TEL2}");
		$("#ORD_GET_TEL3").val("${getItNowShopInfo.ORD_GET_TEL3}");
		
		$("#ORD_GET_RLT").val("${getItNowShopInfo.ORD_GET_RLT}");
		$("#p_ordGetRlt").show();
	}
}

//교환권 발송하기
function sendGetItNowTicket(){
	
	if($("#ORD_GET_NM").val() == ""){
   		alert("인수자명을 입력하세요.");
   		$("#ORD_GET_NM").focus();
   		return;
   	}
	
	if($("#ORD_GET_TEL1").val() == ""){
   		alert("인수자 휴대폰 번호 첫째자리를 입력하세요.");
   		$("#ORD_GET_TEL1").focus();
   		return;
   	}
	
	if($("#ORD_GET_TEL2").val() == ""){
   		alert("인수자 휴대폰 번호 둘째자리를 입력하세요.");
   		$("#ORD_GET_TEL1").focus();
   		return;
   	}
	
	if($("#ORD_GET_TEL3").val() == ""){
   		alert("인수자 휴대폰 번호 셋째자리를 입력하세요.");
   		$("#ORD_GET_TEL3").focus();
   		return;
   	}
	
	if($("input[name=ORD_GET_GBN]:checked").val() == "1"){
		if($("#ORD_GET_RLT").val() == ""){
	   		alert("주문자와의 관계를 선택해주세요.");
	   		$("#ORD_GET_RLT").focus();
	   		return;
	   	}
	}
	
	if(confirm("발송하시겠습니까?")){
		var ORD_GET_NM = $("#ORD_GET_NM").val();
		var ORD_GET_TEL = $("#ORD_GET_TEL1").val() +"-"+ $("#ORD_GET_TEL2").val() +"-"+ $("#ORD_GET_TEL3").val();
		
		$.ajax({
			async : false,
			type : "POST",
			data : $("#getDlvFrm").serialize(),
			url : "<c:out value="${mobileSslDomain}" />/mobile/cart/sendGetItNowTicketAjax.do",
			success : function(data) {
				//result 1 성공 그외 실패
				alert(data.resultMsg);
				
				if(data.result > 0){
					$("#spanOrdGetNm").html(ORD_GET_NM);
					$("#spanOrdGetTel").html(ORD_GET_TEL);
					$("#spanRemainSmsCnt").html(data.ORD_GET_SMS_CNT);
					
					$.com.util.layPop('close', $('#couponDispatch'));
				}
			},
			error : function(err) {
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
				window.jquery
						|| console
								.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	}
}
</script>
<%---------------------------------------------------------------- 겟잇나우 수령인 정보 수정 팝업 script 끝 ------------------------------------------------%>

</body>
</html>