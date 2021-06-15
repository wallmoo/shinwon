<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<tr>
	<td class="check"><input type="checkbox"
		title="${cart.PRD_MST_NM} 상품 선택" id="crtCheckBox_${cart.MEM_CRT_IDX}"
		class="checkbox crt_idx crt_idx_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> crt_idx_${c_dlv_type2}</c:if>"
		checked="checked" data-dlv_type="${c_dlv_type}"
		value="<c:out value="${cart.MEM_CRT_IDX}"/>" /></td>
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

				<c:if test="${not empty cart.optionList or not empty cart.subPrdList}">
					<div class="option dotum">
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
						
						<c:if test="${cart.MEM_CRT_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우 배송 아닌 경우만 변경 가능--%>
							<a href="javascript:;"
								class="btn_st0 btn_white xxsmall js-option-change"> <span>변경</span>
							</a>
						</c:if>
					</div>
				</c:if>
			</div>
		</div>
	</td>
	<td class="price">
		<p>
			<span><fmt:formatNumber value="${cart.PRODUCT_PRICE}" type="number" /></span>원
		</p> 
		<c:if test="${cart.SUM_SUB_OPTION_ADD_PRC gt 0}">
			<p><span class="desc dotum">추가옵션금액<br /><fmt:formatNumber value="${cart.SUM_SUB_OPTION_ADD_PRC}" type="number" />원</span></p>
		</c:if>
	</td>
	<td class="amount">
		<c:choose>
			<c:when test="${cart.MEM_CRT_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우 배송 아닌 경우만 변경 가능--%>
				<label for="memCrtCnt_${cart.MEM_CRT_IDX}" class="inp_amount"> 
					<input type="text" id="memCrtCnt_${cart.MEM_CRT_IDX}" name="inp_amount" class="text" maxlength="2" value="<c:out value="${cart.MEM_CRT_CNT}"/>" />
					<a href="javascript:void(0)" class="btn_valU"><span class="blind">구매수량 1 올리기</span></a> 
					<a href="javascript:void(0)" class="btn_valB"><span	class="blind">구매수량 1 내리기</span></a>
				</label>
				<p>
					<a href="javascript:goCntModify('${cart.MEM_CRT_IDX}');"
						class="btn_st0 btn_white xsmall"> <span>변경</span>
					</a>
				</p>
			</c:when>
			<c:otherwise>
				<c:out value="${cart.MEM_CRT_CNT}"/>
			</c:otherwise>
		</c:choose>
	</td>
	<td class="price">
		<p>
			<span><fmt:formatNumber value="${cart.INSTANT_CPN_ORDER_PRICE}" type="number" /></span>원
		</p>
	</td>
	<td class="price">
		<p>
			<span><fmt:formatNumber value="${cart.CUSTOMER_ORDER_PRICE}" type="number" /></span>원
		</p>
	</td>
	<td class="benefit">
		<c:choose>
		<c:when test="${c_dlv_type eq 'service'}">	
			-
		</c:when>
		<c:otherwise>
			<c:if test="${not empty cart.cardPromotionList}">
				<p>
					<a href="#discountPayment_${cart.MEM_CRT_IDX }" class="js-tooltip" data-size="250x200"><span
						class="label card-discount">카드할인</span></a>
				</p>
				<p>
					<c:forEach var="cardPro" items="${cart.cardPromotionList }" varStatus="cardProStatus">
						<c:out value="${cardPro.SIMPLE_CARD_NM}"/>
						${cardProStatus.last ? '' : ',' }
					</c:forEach>
				</p>
				
				<div id="discountPayment_${cart.MEM_CRT_IDX }" class="layer-tooltip"><!-- #discountPayment -->
	                <h5 class="title h1">카드할인 정보</h5>
	                <div class="holder">
						<c:forEach var="cardPro" items="${cart.cardPromotionList }" varStatus="cardProStatus">
							<h6 class="title h2 level">${cardPro.CARD_NM }</h6>
							<div class="frame-a">
		                        <ul class="list list-b">
		                            <li>
		                            	<fmt:formatNumber value="${cardPro.PMT_CRD_SML_PRC}" type="number" />만원 이상 결제 시 
		                            	<c:if test="${cardPro.PMT_CRD_SAL_GBN eq 'R' }">
	                                   		${cardPro.PMT_CRD_SAL_PRC }%
	                                   	</c:if>
	                                   	<c:if test="${cardPro.PMT_CRD_SAL_GBN eq 'M' }">
	                                   		<fmt:formatNumber value="${cardPro.PMT_CRD_SAL_PRC}" type="number" />만원
	                                   	</c:if>
		                            	할인 
		                            	/ 최대 <fmt:formatNumber value="${cardPro.PMT_CRD_MXM_PRC}" type="number" />만원
		                            </li>
		                        </ul>
		                    </div>
						</c:forEach>
	                </div>
	            </div><!-- // #discountPayment -->
			</c:if>
			
			<p>
				<span class="icon-mileage"><em class="blind">포인트</em></span>적립
			</p>
			<p>
				+
				<fmt:formatNumber value="${cart.RESERVE_MILEAGE}" type="number" />
				원
			</p>
		</c:otherwise>
		</c:choose>
	</td>

	<c:choose>
		<c:when test="${c_dlv_type eq 'service'}">	
			<td class="ship">
				<p>-</p>
			</td>
		</c:when>
		<c:otherwise>
			<c:choose><%-- 배송구분별로 내용이 달라진다. --%>
				<c:when test="${cart.MEM_CRT_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우 배송 --%>
					<td class="ship">
		                <p>
		                	<a href="javascript:getItNowShopInfoPopup('${cart.MEM_CRT_SHP_MST_IDX }');"><span><c:out value="${cart.SHP_MST_NM }"/></span></a>
		                	<span class="desc dotum">
		                		<ui:formatDate pattern="yyyy.MM.dd" value="${cart.MEM_CRT_GET_PKU_DT }"/><br/>
		                		<c:out value="${cart.MEM_CRT_GET_PKU_HH }"/>
		                	</span>
		                </p>
		            </td>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${cart.DLV_BUNDLE_YN eq 'Y' and cart.VDR_ROWNUM eq 1}">
							<td class="ship" rowspan="${cart.VDR_IDX_CNT*2}">
								<p>
									<c:choose>
										<c:when
											test="${cart.FREE_DLV_CHARGE_YN eq 'Y' or cart.FIN_DLV_CHARGE eq 0 }">
											<span>무료배송</span>
											<span class="desc dotum">(도서,산간제외)</span>
										</c:when>
										<c:when test="${cart.FREE_DLV_CHARGE_YN ne 'Y'}">
											<span><fmt:formatNumber value="${cart.FIN_DLV_CHARGE}" type="number" />원</span>
											<span class="desc dotum">(도서,산간제외)<br /> <fmt:formatNumber
													value="${cart.VDR_MST_DLV_PRICE}" type="number" />원이상<br />무료배송
											</span>
										</c:when>
									</c:choose>
								</p>
							</td>
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
											<span><fmt:formatNumber value="${cart.FIN_DLV_CHARGE}" type="number" />원</span>
											<span class="desc dotum">(도서,산간제외)<br /> <fmt:formatNumber
													value="${cart.VDR_MST_DLV_PRICE}" type="number" />원이상<br />무료배송
											</span>
										</c:if>
									</c:if>
								</p>
							</td>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	
	<td class="action">
		<p>
			<a
				href="javascript:payment(<c:out value="${cart.MEM_CRT_IDX}"/>, '${c_dlv_type}');"
				id="directPay_${cart.MEM_CRT_IDX}" class="btn_st0 btn_blk777 xsmall">
				<c:choose>
					<c:when test="${c_dlv_type eq 'service'}">	
						<span>상담예약</span>
					</c:when>
					<c:otherwise>
						<span>바로구매</span>
					</c:otherwise>
				</c:choose>	
			</a>
		</p>
		<p>
			<a href="javascript:insertKeeping('<c:out value="${cart.PRD_MST_CD }" />');" class="btn_st0 btn_white xsmall"><span>키핑</span></a>				
		</p>
		<p>
			<a
				href="javascript:deleteitem('<c:out value="${cart.MEM_CRT_IDX}"/>');"
				class="btn_st0 btn_white xsmall"><span>삭제하기</span></a>
		</p>
	</td>
</tr>
<tr class="option-change">
	<td colspan="9"><input type="hidden"
		id="org_option_${cart.MEM_CRT_IDX }" value="${cart.OPT_DTL_IDX}" />
	<%-- 기존 옵션 idx --%>
		<div class="option-change-wrap">
			<h5>상품옵션변경</h5>
			<div class="section-option">
				<%--필수옵션 옵션 리스트 --%>
				<c:if test="${not empty cart.optionList}">
					<label for="option_${cart.MEM_CRT_IDX }">${cart.optionList[0].PRD_OPT_NM}</label>
					<select id="option_${cart.MEM_CRT_IDX }" class="sel_chg">
						<c:forEach var="option" items="${cart.optionList}">
							<option value="${option.OPT_DTL_IDX}"
								<c:if test="${option.OPT_DTL_IDX eq cart.OPT_DTL_IDX}">selected="selected"</c:if>>
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
					<a
						href="javascript:goOptionModify('<c:out value="${cart.MEM_CRT_IDX}"/>');"
						class="btn_st0 btn_white small"><span>옵션변경</span></a>
				</c:if>
			</div>

			<%-- 선택옵션 상품 리스트 --%>
			<c:if test="${not empty cart.subPrdList}">
				<div class="option-list">
					<ul class="ct">
						<c:forEach var="subPrd" items="${cart.subPrdList}">
							<li><input type="hidden"
								id="org_option_${subPrd.MEM_CRT_IDX }"
								value="${subPrd.OPT_DTL_IDX}" />
							<%-- 기존 옵션 idx --%> <label class="tit"
								for="option_${subPrd.MEM_CRT_IDX }">${subPrd.subOptionList[0].PRD_OPT_NM}</label>
								<select id="option_${subPrd.MEM_CRT_IDX }" class="sel_chg">
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
							</select> <c:if test="${subPrd.PRD_OPT_CNT_YN eq 'Y'}">
									<%-- 수량 변경 가능한 경우 --%>
									<label for="inp_amount_${subPrd.MEM_CRT_IDX }"
										class="inp_amount"> <input type="text"
										value="${subPrd.MEM_CRT_CNT }"
										id="inp_amount_${subPrd.MEM_CRT_IDX }"
										name="inp_amount_${subPrd.MEM_CRT_IDX }" class="text" maxlength="2"/> <a
										href="javascript:void(0)" class="btn_valU"><span
											class="blind">구매수량 1 올리기</span></a> <a href="javascript:void(0)"
										class="btn_valB"><span class="blind">구매수량 1 내리기</span></a>
									</label>
								</c:if> <c:if test="${subPrd.PRD_OPT_CNT_YN ne 'Y'}">
									<%-- 수량 변경 불가능한 경우 --%>
									${subPrd.MEM_CRT_CNT }개
								</c:if> <a
								href="javascript:goOptionModify('<c:out value="${subPrd.MEM_CRT_IDX}"/>');"
								class="btn_st1 btn_white small"><span>변경</span></a></li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</div></td>
</tr>
