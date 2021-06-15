<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<tr>
    <td class="product">
        <div class="item">
            <div class="thumb">
            	<a
					href="javascript:goProductView('<c:out value="${cart.PRD_MST_CD }" />');">
					<img src="<c:out value="${cdnDomain }${cart.PRODUCT_THUM_IMG}"/>"
					class="thumb84" alt="${cart.PRD_IMAGE_ALT}" />
				</a>
            </div>
            <div class="core">
                <p class="subject">
                	<a
						href="javascript:goProductView('<c:out value="${cart.PRD_MST_CD }" />');">
						<c:out value="${cart.PRD_MST_NM}" />
					</a>
                </p>
                
                <c:if test="${not empty cart.OPT_DTL_NM or not empty cart.subPrdList}">
					<div class="option dotum">
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
					</div>
				</c:if>
				
            </div>
        </div>
    </td>
    <td class="price">
    	<p>
    		<c:choose>
           		<c:when test="${not empty cart.ESM_PRD_IDX }">
           			<span>-</span>
           		</c:when>
           		<c:otherwise>
           			<span><fmt:formatNumber value="${cart.PRODUCT_PRICE}" type="number" /></span>원
           		</c:otherwise>
           	</c:choose>
		</p> 
		<%-- <c:if test="${cart.SUM_SUB_OPTION_ADD_PRC gt 0}">
			<p>
				<span>옵션추가금:<fmt:formatNumber value="${cart.SUM_SUB_OPTION_ADD_PRC}" type="number" /></span>원
			</p>
		</c:if> --%>
    </td>
    <td class="amount"><fmt:formatNumber value="${cart.PRD_TMP_CNT}" type="number" /></td>
    <td class="price">
        <p><span><fmt:formatNumber value="${cart.INSTANT_CPN_ORDER_PRICE}" type="number" /></span>원</p>
    </td>
    <td class="price">
        <p><span><fmt:formatNumber value="${cart.CUSTOMER_ORDER_PRICE}" type="number" /></span>원</p>
    </td>
    
    <c:choose><%-- 배송구분별로 내용이 달라진다. --%>
		<c:when test="${cart.ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우 배송 --%>
			<td class="ship">
                <p>
                	<span><c:out value="${cart.SHP_MST_NM }"/></span>
                	<span class="desc dotum">
                		<ui:formatDate pattern="yyyy.MM.dd" value="${cart.ORD_TMP_GET_PKU_DT }"/><br/>
                		<c:out value="${cart.ORD_TMP_GET_PKU_HH }"/>
                	</span>
                </p>
            </td>
		</c:when>
		<c:when test="${cart.ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹 배송 --%>
			<td class="ship">
                <p>
                	<span>-</span>
                </p>
            </td>
		</c:when>
		<c:otherwise>
			
			<c:choose>
			<c:when test="${not empty cartlist[0].ORD_TMP_PRE_CD}"><%-- 재결제인 경우--%>
				<td class="ship">
					<p>
						-
					</p>
				</td>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${cart.DLV_BUNDLE_YN eq 'Y' and cart.VDR_ROWNUM eq 1}">
						<td class="ship" rowspan="${cart.VDR_IDX_CNT}">
							<p>
								<c:choose>
									<c:when
										test="${cart.FREE_DLV_CHARGE_YN eq 'Y' or cart.FIN_DLV_CHARGE eq 0 }">
										<span>무료배송</span>
										<span class="desc dotum">(도서,산간제외)</span>
									</c:when>
									<c:when test="${cart.FREE_DLV_CHARGE_YN ne 'Y'}">
										<span><fmt:formatNumber value="${cart.FIN_DLV_CHARGE}"
												type="number" />원</span>
										<span class="desc dotum">(도서,산간제외)<br /> <fmt:formatNumber
												value="${cart.VDR_MST_DLV_PRICE}" type="number" />원이상<br />무료배송
										</span>
									</c:when>
								</c:choose>
							</p>
							<c:if test="${cart.PRD_MST_DLV_DSN_YN eq 'Y' }">
								<p><a href="#shipFix" class="btn_st0 btn_blk777 xsmall js-tooltip" data-size="360x360"><span>지정일배송가능</span></a></p>
						        <p>
						            <input type="text" id="DLV_DUE_DT_${cart.PRD_TMP_IDX}" name="DLV_DUE_DT_${cart.PRD_TMP_IDX}" readonly="readonly" class="text" maxlength="10" data-max="${cart.DLV_MAX_DT}" data-min="${cart.DLV_MIN_DT}" title="배송 지정일" data-vdr_idx="${cart.PRD_MST_VDR_IDX }" data-dlv_bundle_yn="${cart.DLV_BUNDLE_YN }"/>
						            <a href="javascript:;" class="btn_calendar"><span class="ir">달력</span></a>
						        </p>
							</c:if>
						</td>
					</c:when>
					<c:when test="${cart.DLV_BUNDLE_YN eq 'Y' and cart.VDR_ROWNUM ne 1}">
						<input type="hidden" id="DLV_DUE_DT_${cart.PRD_TMP_IDX}" name="DLV_DUE_DT_${cart.PRD_TMP_IDX}" class="DLV_DUE_DT_${cart.PRD_MST_VDR_IDX}_${cart.DLV_BUNDLE_YN}" />
					</c:when>
					<c:when test="${cart.DLV_BUNDLE_YN eq 'N'}">
						<td class="ship">
							<p>
								<c:if test="${cart.FREE_DLV_CHARGE_YN eq 'Y'}">
									<span>무료배송</span>
									<span class="desc dotum">(도서,산간제외)</span>
								</c:if>
								<c:if test="${cart.FREE_DLV_CHARGE_YN ne 'Y'}">
									<c:if test="${cart.FIN_DLV_CHARGE eq 0 }">
										<span>무료배송</span>
									</c:if>
									<c:if test="${cart.FIN_DLV_CHARGE gt 0 }">
										<span><fmt:formatNumber value="${cart.FIN_DLV_CHARGE}"
												type="number" />원</span>
										<span class="desc dotum">(도서,산간제외)<br /> <fmt:formatNumber
												value="${cart.VDR_MST_DLV_PRICE}" type="number" />원이상<br />무료배송
										</span>
									</c:if>
								</c:if>
							</p>
							<c:if test="${cart.PRD_MST_DLV_DSN_YN eq 'Y' }">
								<p><a href="#shipFix" class="btn_st0 btn_blk777 xsmall js-tooltip" data-size="360x360"><span>지정일배송가능</span></a></p>
						        <p>
						            <input type="text" id="DLV_DUE_DT_${cart.PRD_TMP_IDX}" name="DLV_DUE_DT_${cart.PRD_TMP_IDX}" readonly="readonly" class="text" maxlength="10" data-max="${cart.DLV_MAX_DT}" data-min="${cart.DLV_MIN_DT}" title="배송 지정일" /><a href="javascript:;" class="btn_calendar"><span class="ir">달력</span></a>
						        </p>
							</c:if>
						</td>
					</c:when>
				</c:choose>
			</c:otherwise>
			</c:choose>
			
		</c:otherwise>
	</c:choose>	
    
</tr>