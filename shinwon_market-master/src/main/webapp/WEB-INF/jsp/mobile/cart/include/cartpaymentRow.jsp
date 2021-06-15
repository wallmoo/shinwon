<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<li class="col"><!-- row -->
    <div class="item">
        <a href="javascript:goProductView('<c:out value="${cart.PRD_MST_CD }" />');" class="link">
            <span class="thumb"><img data-original="<c:out value="${cdnDomain }${cart.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="${cart.PRD_IMAGE_ALT}" /></span>
            <span class="subject"><c:out value="${cart.PRD_MST_NM}" /></span>
        </a>
        
        <c:if test="${not empty cart.OPT_DTL_NM or not empty cart.subPrdList}">
			<div class="option">
				<p>
					옵션 :
					<c:if test="${not empty cart.optionList}">
						<c:out value="${cart.OPT_DTL_NM}" />
						<c:if test="${not empty cart.subPrdList}">
							&nbsp;/&nbsp;
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
								<fmt:formatNumber value="${subPrd.PRD_TMP_CNT}" type="number" />개 )
							${i.last ? '' : '/&nbsp;'}	
						</c:forEach>
					</c:if>
				</p>
			</div>
		</c:if>
				
        <div class="amount">
            <fmt:formatNumber value="${cart.PRD_TMP_CNT}" type="number" />개
        </div>
        <p class="price-after">
            <span class="blind">판매가</span><strong><fmt:formatNumber value="${cart.CUSTOMER_ORDER_PRICE}" type="number" /></strong>원
        </p>
        
        <c:choose><%-- 배송구분별로 내용이 달라진다. --%>
			<c:when test="${cart.ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우 배송 --%>
			
			</c:when>
			<c:when test="${cart.ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹 배송 --%>
			
			</c:when>
			<c:otherwise>
				
				<c:choose>
					<c:when test="${not empty cartlist[0].ORD_TMP_PRE_CD}"><%-- 재결제인 경우--%>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${cart.DLV_BUNDLE_YN eq 'Y'}">
								<p class="price-ship">
						            <strong>배송비</strong>
						            <c:choose>
										<c:when
											test="${cart.FREE_DLV_CHARGE_YN eq 'Y' or cart.FIN_DLV_CHARGE eq 0 }">
											<span>무료배송</span>
											<span>(도서,산간제외)</span>
										</c:when>
										<c:when test="${cart.FREE_DLV_CHARGE_YN ne 'Y'}">
											<span><fmt:formatNumber value="${cart.DLV_CHARGE}"
													type="number" />원</span>
											<span>(도서,산간제외)<br /> <fmt:formatNumber
													value="${cart.VDR_MST_DLV_PRICE}" type="number" />원이상<br />무료배송
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
											<span><fmt:formatNumber value="${cart.FIN_DLV_CHARGE}"
													type="number" />원</span>
											<span>(도서,산간제외)<br /> <fmt:formatNumber
													value="${cart.VDR_MST_DLV_PRICE}" type="number" />원이상<br />무료배송
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
        
        <c:if test="${cart.PRD_MST_DLV_DSN_YN eq 'Y' }">
        	<p class="ship-date">
	            <strong>지정일 배송가능</strong>
	            <a href="#shipDate_${cart.PRD_TMP_IDX }" id="a_shipDate_${cart.PRD_TMP_IDX}" class="button small js-toggler"><span>변경</span></a>
	            <span class="date span_dlv_due_dt_${cart.PRD_MST_VDR_IDX}_${cart.DLV_BUNDLE_YN}" id="span_dlv_due_dt_${cart.PRD_TMP_IDX }"></span>
	            
	            <input type="hidden" id="DLV_DUE_DT_${cart.PRD_TMP_IDX}" name="DLV_DUE_DT_${cart.PRD_TMP_IDX}" class="DLV_DUE_DT_${cart.PRD_MST_VDR_IDX}_${cart.DLV_BUNDLE_YN}" data-vdr_idx="${cart.PRD_MST_VDR_IDX }" data-dlv_bundle_yn="${cart.DLV_BUNDLE_YN }"/>
	            <input type="hidden" id="MIN_DLV_DUE_DT_${cart.PRD_TMP_IDX}" value="${cart.DLV_MIN_DT }"/>
	            <input type="hidden" id="MAX_DLV_DUE_DT_${cart.PRD_TMP_IDX}" value="${cart.DLV_MAX_DT }"/>
	        </p>
	        
	        <div id="shipDate_${cart.PRD_TMP_IDX }" class="ship-date-detail toggle">
	            <h5>배송일 지정</h5>
	            <select class="select" data-role="none" title="희망 배송일 년" id="DLV_DUE_DT_YEAR_${cart.PRD_TMP_IDX}">
	                <option value="">연도 선택</option>
	                <c:forEach var="item" items="${yearList}">
	                	<option value="${item}">${item}</option>
	                </c:forEach>
	            </select>
	            <select class="select" data-role="none" title="희망 배송일 월" id="DLV_DUE_DT_MON_${cart.PRD_TMP_IDX}">
	                <option value="">월 선택</option>
	                <c:forEach begin="1" end="12" step="1" varStatus="month">
	                	<option value="<fmt:formatNumber value="${month.index}" pattern="00" />"><fmt:formatNumber value="${month.index}" pattern="00" /></option>
	                </c:forEach>
	            </select>
	            <select class="select" data-role="none" title="희망 배송일 일" id="DLV_DUE_DT_DAY_${cart.PRD_TMP_IDX}">
	                <option value="">일 선택</option>
	                <c:forEach begin="1" end="31" step="1" varStatus="day">
	                	<option value="<fmt:formatNumber value="${day.index}" pattern="00" />"><fmt:formatNumber value="${day.index}" pattern="00" /></option>
	                </c:forEach>
	            </select>
	            <div class="action">
	                <a href="javascript:saveDlvDueDt('${cart.PRD_TMP_IDX}');" class="button primary"><span>저장</span></a>
	            </div>
	        </div>
		</c:if>
    </div>
</li><!-- // row -->