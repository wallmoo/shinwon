<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<li class="col"><!-- row -->
   <input type="checkbox" class="checkbox crt_idx crt_idx_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> crt_idx_${c_dlv_type2}</c:if>" 
   			title="${cart.PRD_MST_NM} 상품 선택" id="crtCheckBox_${cart.MEM_CRT_IDX}" checked="checked" data-dlv_type="${c_dlv_type}"
   			value="<c:out value="${cart.MEM_CRT_IDX}"/>"
   			>
   <div class="item">
       <a href="javascript:goProductView('<c:out value="${cart.PRD_MST_CD }" />');" class="link">
           <span class="thumb"><img data-original="<c:out value="${cdnDomain }${cart.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="${cart.PRD_IMAGE_ALT}" /></span>
           <span class="subject"><c:out value="${cart.PRD_MST_NM}" /></span>
        </a>
        
        
		<div class="option">
			<c:if test="${not empty cart.optionList or not empty cart.subPrdList}">
				<p>
				옵션 :
				<c:if test="${not empty cart.optionList}">
					<c:out value="${cart.OPT_DTL_NM}" />&nbsp;
					<c:if test="${not empty cart.subPrdList}">
						/&nbsp;
					</c:if>
				</c:if>
				
				<%-- 선택옵션 상품 리스트 --%>
				<c:if test="${not empty cart.subPrdList}">
					<c:forEach var="subPrd" items="${cart.subPrdList}" varStatus="i">
						${subPrd.OPT_DTL_NM}
						(
									<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
										+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
									</c:if>
								<fmt:formatNumber value="${subPrd.MEM_CRT_CNT}" type="number" />개 )
						${i.last ? '' : '/&nbsp;'}	
					</c:forEach>
				</c:if>
				</p>
			</c:if>	
		</div>
		
        
        <div class="ct amount">
            <div class="fl">
            	<c:if test="${not empty cart.optionList or not empty cart.subPrdList}">
            		<c:if test="${cart.MEM_CRT_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우 배송 아닌 경우만 변경 가능--%>
                		<a href="#optionChange_${cart.MEM_CRT_IDX }" class="button small js-toggler"><span>변경</span></a>
                	</c:if>
                </c:if>
            </div>
            <div class="fr">
            	<c:choose>
					<c:when test="${cart.MEM_CRT_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우 배송 아닌 경우만 변경 가능--%>
						<label for="memCrtCnt_${cart.MEM_CRT_IDX}" class="sel_box_st0">
		                    <select id="memCrtCnt_${cart.MEM_CRT_IDX}" name="inp_amount" class="select memCrtCnt" data-mem_crt_idx="${cart.MEM_CRT_IDX }">
		                    	<c:forEach begin="1" end="99" step="1" varStatus="cnt">
		                    		<option value="${cnt.index}" <c:if test="${cart.MEM_CRT_CNT eq cnt.index}">selected="selected"</c:if>>${cnt.index}</option>
		                    	</c:forEach>
		                    </select>
		                </label>
            		</c:when>
            		<c:otherwise>
						<c:out value="${cart.MEM_CRT_CNT}"/>개
					</c:otherwise>
				</c:choose>
            </div>
        </div>
        
        <c:if test="${not empty cart.optionList || not empty cart.subPrdList}">
        <div id="optionChange_${cart.MEM_CRT_IDX }" class="option-change toggle">
        	<input type="hidden" id="org_option_${cart.MEM_CRT_IDX }" value="${cart.OPT_DTL_IDX}" /><%-- 기존 옵션 idx --%>
            <h4>상품옵션변경</h4>
            <ul>
            	<%--필수옵션 옵션 리스트 --%>
            	<c:if test="${not empty cart.optionList}">
            		<li>
	                    <strong><label for="option_${cart.MEM_CRT_IDX }">${cart.optionList[0].PRD_OPT_NM}</label></strong>
	                    <p>
							<label for="option_${cart.MEM_CRT_IDX }" class="sel_box_st0">
		                        <select id="option_${cart.MEM_CRT_IDX }" class="select">
		                        	<c:forEach var="option" items="${cart.optionList}">
		                        		 <option value="${option.OPT_DTL_IDX}" <c:if test="${option.OPT_DTL_IDX eq cart.OPT_DTL_IDX}">selected="selected"</c:if>>
		                        		 	${option.OPT_DTL_NM }
		                        		 	<c:choose>
												<c:when test="${option.OPT_DTL_ADD_PRC gt 0}">
												(+<fmt:formatNumber value="${option.OPT_DTL_ADD_PRC}" type="number" />) /
												</c:when>
												<c:when test="${option.OPT_DTL_ADD_PRC lt 0}">
												(<fmt:formatNumber value="${option.OPT_DTL_ADD_PRC}" type="number" />) /
												</c:when>
											</c:choose>
		                        		 	재고:<fmt:formatNumber value="${option.OPT_DTL_STK_CNT}" type="number" />
		                        		 </option>
		                        	</c:forEach>
		                        </select>
		                    </label>
	                    </p>
	                    <p class="text-right">
	                        <a href="javascript:goOptionModify('<c:out value="${cart.MEM_CRT_IDX}"/>');" class="button small"><span>변경</span></a>
	                    </p>
	                </li>
            	</c:if>
                
                <%-- 선택옵션 상품 리스트 --%>
				<c:if test="${not empty cart.subPrdList}">
					<c:forEach var="subPrd" items="${cart.subPrdList}">
						<input type="hidden" id="org_option_${subPrd.MEM_CRT_IDX }" value="${subPrd.OPT_DTL_IDX}" /><%-- 기존 옵션 idx --%>
						<li>
	                    <strong><label for="option_${subPrd.MEM_CRT_IDX }">${subPrd.subOptionList[0].PRD_OPT_NM}</label></strong>
	                    <p>
							<label for="option_${subPrd.MEM_CRT_IDX }" class="sel_box_st0">
		                        <select id="option_${subPrd.MEM_CRT_IDX }" class="select">
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
	                    	<c:if test="${subPrd.PRD_OPT_CNT_YN eq 'Y'}"><%-- 수량 변경 가능한 경우 --%>
                                <label for="inp_amount_${subPrd.MEM_CRT_IDX }" class="sel_box_st0">
                                    <select id="inp_amount_${subPrd.MEM_CRT_IDX }" class="select">
	                                    <c:forEach begin="1" end="99" step="1" varStatus="cnt">
				                    		<option value="${cnt.index}" <c:if test="${subPrd.MEM_CRT_CNT eq cnt.index}">selected="selected"</c:if>>${cnt.index}</option>
				                    	</c:forEach>
			                        </select>
			                    </label>
							</c:if>		
							<c:if test="${subPrd.PRD_OPT_CNT_YN ne 'Y'}"><%-- 수량 변경 불가능한 경우 --%>
								${subPrd.MEM_CRT_CNT }개
							</c:if>
	                        <a href="javascript:goOptionModify('<c:out value="${subPrd.MEM_CRT_IDX}"/>');" class="button small"><span>변경</span></a>
	                    </p>
	                </li>	
					</c:forEach>
				</c:if>
            </ul>
        </div>
        </c:if>
        
        <c:if test="${cart.INSTANT_CPN_ORDER_PRICE gt 0}"><%-- 즉시할인가 있는 경우 --%>
        	<p class="price-before">
	            <span class="blind">소비자가</span><strong><fmt:formatNumber value="${cart.PRODUCT_PRICE*cart.MEM_CRT_CNT}" type="number" /></strong>원
	        </p>
        </c:if>
        <p class="price-after">
            <span class="blind">판매가</span><strong><fmt:formatNumber value="${cart.CUSTOMER_ORDER_PRICE}" type="number" /></strong>원
            <c:if test="${cart.INSTANT_CPN_ORDER_PRICE gt 0}"><%-- 즉시할인가 있는 경우 --%>
            	<a href="#priceSale_${cart.MEM_CRT_IDX }" class="js-toggler up-down"><i><span class="blind">즉시할인 금액 <em>열기</em></span></i></a>
            </c:if>
        </p>
        
        <c:if test="${cart.INSTANT_CPN_ORDER_PRICE gt 0}"><%-- 즉시할인가 있는 경우 --%>
	        <div id="priceSale_${cart.MEM_CRT_IDX }" class="price-sale toggle">
	            <span class="tit">즉시할인</span>
	            <span class="price"><strong><fmt:formatNumber value="${cart.INSTANT_CPN_ORDER_PRICE}" type="number" /></strong>원</span>
	        </div>
        </c:if>
        
        <c:choose>
			<c:when test="${c_dlv_type eq 'service'}">	
				<div class="sale-info">
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${not empty cart.cardPromotionList}">
			        <div class="sale-info">
			            <span class="label label-a">청구할인</span>
			            <strong>
			            	<c:forEach var="cardPro" items="${cart.cardPromotionList }" varStatus="cardProStatus">
								<c:out value="${cardPro.SIMPLE_CARD_NM}"/>
								${cardProStatus.last ? '' : ',' }
							</c:forEach>
			            </strong>
			            <a href="#discountPayment_${cart.MEM_CRT_IDX }" class="js-toggler up-down"><span class="blind">카드할인 정보 <em>열기</em></span></a>
			        </div>
			        <div id="discountPayment_${cart.MEM_CRT_IDX }" class="sale-info-detail toggle">
			            <h4>카드할인정보</h4>
			            
			            <c:forEach var="cardPro" items="${cart.cardPromotionList }" varStatus="cardProStatus">
			            	<h5>${cardPro.CARD_NM }</h5>
			            	<p>
				                - <fmt:formatNumber value="${cardPro.PMT_CRD_SML_PRC}" type="number" />만원 이상 결제 시
				                <c:if test="${cardPro.PMT_CRD_SAL_GBN eq 'R' }">
		                       		${cardPro.PMT_CRD_SAL_PRC }%
		                       	</c:if>
		                       	<c:if test="${cardPro.PMT_CRD_SAL_GBN eq 'M' }">
		                       		<fmt:formatNumber value="${cardPro.PMT_CRD_SAL_PRC}" type="number" />만원
		                       	</c:if>
		                     	할인 
		                     	/ 최대 <fmt:formatNumber value="${cardPro.PMT_CRD_MXM_PRC}" type="number" />만원
		                            	
				            </p>
						</c:forEach>
			        </div>
		        </c:if>
		        
		        <div class="sale-info">
		            <span class="label mileage"><span class="blind">포인트</span></span>
		            <strong>
						적립 +<fmt:formatNumber value="${cart.RESERVE_MILEAGE}" type="number" />원
					</strong>
		        </div>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${c_dlv_type eq 'service'}">	
			</c:when>
			<c:otherwise>
				<c:choose><%-- 배송구분별로 내용이 달라진다. --%>
					<c:when test="${cart.MEM_CRT_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우 배송 --%>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${cart.DLV_BUNDLE_YN eq 'Y'}">
								<p class="price-ship">
						            <c:choose>
										<c:when
											test="${cart.FREE_DLV_CHARGE_YN eq 'Y' or cart.FIN_DLV_CHARGE eq 0 }">
											<span>무료배송</span>
											<span>(도서,산간제외)</span>
										</c:when>
										<c:when test="${cart.FREE_DLV_CHARGE_YN ne 'Y'}">
											<span><fmt:formatNumber value="${cart.DLV_CHARGE}" type="number" />원</span>
											<span>(도서,산간제외)<br /> <fmt:formatNumber
													value="${cart.VDR_MST_DLV_PRICE}" type="number" />원이상 무료배송
											</span>
										</c:when>
									</c:choose>
						        </p>
							</c:when>
							<c:when test="${cart.DLV_BUNDLE_YN eq 'N'}">
								<p class="price-ship">
									<c:if test="${cart.FREE_DLV_CHARGE_YN eq 'Y'}">
										<span>무료배송</span>
										<span>(도서,산간제외)</span>
									</c:if>
									<c:if test="${cart.FREE_DLV_CHARGE_YN ne 'Y'}">
										<c:if test="${cart.FIN_DLV_CHARGE eq 0 }">
											<span>무료배송</span>
										</c:if>
										<c:if test="${cart.FIN_DLV_CHARGE gt 0 }">
											<span><fmt:formatNumber value="${cart.FIN_DLV_CHARGE}" type="number" />원</span>
											<span>(도서,산간제외)<br /> <fmt:formatNumber
													value="${cart.VDR_MST_DLV_PRICE}" type="number" />원이상 무료배송
											</span>
										</c:if>
									</c:if>
								</p>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		
        <div class="action">
            <a href="javascript:payment(<c:out value="${cart.MEM_CRT_IDX}"/>, '${c_dlv_type}');" id="directPay_${cart.MEM_CRT_IDX}" class="button warning">
            	<c:choose>
					<c:when test="${c_dlv_type eq 'service'}">	
						<span>상담예약</span>
					</c:when>
					<c:otherwise>
						<span>바로구매</span>
					</c:otherwise>
				</c:choose>
            </a>
            <a href="javascript:insertKeeping('<c:out value="${cart.PRD_MST_CD }" />');" class="button primary"><span>키핑</span></a>
        </div>
        <a href="javascript:deleteitem('<c:out value="${cart.MEM_CRT_IDX}"/>');" class="delete"><i><span class="blind">${cart.PRD_MST_NM} 삭제</span></i></a>
    </div>
</li><!-- // row -->