<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- #layOpt S -->
<form name="optLayerForm" id="optLayerForm">
<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${productInfo.PRD_MST_CD}" />" /><!-- 상품코드 -->
<input type="hidden" name="PRD_MST_PRICE" id="PRD_MST_PRICE" value="<c:out value="${productInfo.PRD_MST_PRICE}" />" /><!-- 상품가격 -->
<input type="hidden" name="TOT_PRD_MST_PRC" id="TOT_PRD_MST_PRC" value="0" /><!-- 계산 된 결제금액 -->
<input type="hidden" name="PRD_MST_SEL_CNT" id="PRD_MST_SEL_CNT" value="<c:out value="${productInfo.PRD_MST_SEL_CNT}" />" /><!-- 상품 재고 -->
<input type="hidden" name="MEM_CRT_DLV_GBN" id="MEM_CRT_DLV_GBN" value="2096" /><!-- 상품유형 -->
<input type="hidden" name="PRD_MST_LNG_IST_MNT" id="PRD_MST_LNG_IST_MNT" value="<c:out value="${productInfo.PRD_MST_LNG_IST_MNT}" />" /><!-- 장기할부개월 -->
<input type="hidden" name="PRD_MST_NM" id="PRD_MST_NM" value="<c:out value="${productInfo.PRD_MST_NM_MB }" />" /><!-- 상품명 -->
<input type="hidden" name="couponType" id="couponType" />
<input type="hidden" name="cateIdx" id="cateIdx" value="<c:out value="${commandMap.cateIdx }" />" />
<input type="hidden" name="BRD_INQ_IDX" id="BRD_INQ_IDX" />
<input type="hidden" name="viewType" id="viewType" />
<input type="hidden" name="planIdx" id="planIdx" value="<c:out value="${commandMap.planIdx }" />" /><!-- 기획전 Idx -->


<section id="layOpt" class="popup_st0"><!--  data-role="popup" data-overlay-theme="a"  -->
	<dl class="ui-content">
		<dt>
			<h2>상품 옵션</h2>
			<a href="javascript:layerClose();" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
	<c:if test="${not empty optionMstList }">
		<c:set var="optMstNum" value="1" />
		<c:forEach var="optionMstList" items="${optionMstList }" varStatus="status">
			<c:set var="subcnt" value="1" />
			<c:set var="optMstIdx" value="${optionMstList.PRD_OPT_IDX }" />

			<c:choose>
				<c:when test="${optMstNum == 1 }">
					<dd class="dd_option">
					<strong class="tx_ti"><c:out value="${optionMstList.PRD_OPT_EST_NM }" /></strong>
					<span class="tx_ex">(상품옵션을 선택해주세요)</span>
				</c:when>
				<c:otherwise>
					<c:if test="${optMstEstYn ne optionMstList.PRD_OPT_EST_YN }" >
						</dd>
						<dd class="dd_option">
						<strong class="tx_ti"><c:out value="${optionMstList.PRD_OPT_EST_NM }" /></strong>
						<span class="tx_ex">(추가구매를 원하시면 선택해주세요)</span>
					</c:if>
				</c:otherwise>
			</c:choose>
			<c:set var="optMstEstYn" value="${optionMstList.PRD_OPT_EST_YN }" />
			<input type="hidden" name="PRD_OPT_EST_YN" id="PRD_OPT_EST_YN" value="<c:out value="${optionMstList.PRD_OPT_EST_YN }" />" />
			<c:if test="${not empty optionDtlList }">
				<div class="sel_box">
				<span class="sel_ti"><c:out value="${optionMstList.PRD_OPT_NM }" /></span>
				<label for="sel_co">
				<select id="getoptDtlCho" name="getoptDtlCho" >
					<c:forEach var="optionDtlList" items="${optionDtlList }" varStatus="status">
						<c:if test="${optionMstList.PRD_OPT_IDX eq optionDtlList.PRD_OPT_IDX }">
							<c:if test="${subcnt eq 1 }">
								<option value="">선택해주세요.</option>
							</c:if>
							<option value="<c:out value="${optionMstList.PRD_OPT_NM }" />^<c:out value="${optionDtlList.OPT_DTL_NM }" />^<c:out value="${optionDtlList.OPT_DTL_IDX }" />^<c:out value="${optionDtlList.OPT_DTL_ADD_PRC }" />^<c:out value="${optionDtlList.OPT_DTL_STK_CNT }" />^<c:out value="${optionMstList.PRD_OPT_EST_YN }" />^<c:out value="${optionMstList.PRD_OPT_CNT_YN }" />"><c:out value="${optionDtlList.OPT_DTL_ADD_PRC_NM }" /></option>
							<c:set var="subcnt" value="${subcnt + 1 }" />
						</c:if>
					</c:forEach>
				</select>
				</label>
				</div>
			</c:if>
			<c:if test="${optMstIdx ne optionMstList.PRD_OPT_IDX }">
				</dd>
			</c:if>
			<c:set var="optMstNum" value="${optMstNum + 1 }" />
		</c:forEach>
	</c:if>
	
	<c:if test="${empty optionDtlList }">
		<dd class="dd_option">
			<strong class="tx_ti">구매수량변경</strong>
			<span class="tx_ex">(상품옵션을 선택해주세요)</span>
			<div class="sel_box">
			<span class="sel_ti">수량변경</span>
			<label for="sel_co">
			<select id="getoptDtlCho" name="getoptDtlCho" >
				<option value="">선택해주세요.</option>
				<option value="구매수량변경^구매수량변경^0^0^<c:out value="${productInfo.PRD_MST_SEL_CNT}" />^Y^Y">구매수량변경</option>
			</select>
			</label>
			</div>
		</dd>
	</c:if>

	<!--// .dd_option E -->
	<!-- .dd_selList S -->
	
	<dd class="dd_selList" id="applyOptionChoiceList" style="display:none;">

	</dd>
	
	<!--// .dd_selList E -->
		<dd class="btn_box">
		<c:choose>
			<c:when test="${commandMap.esmCart eq 'T' }">
			<a href="javascript:layerClose();" class="btn_wht"><strong>취소</strong></a>
			<a href="javascript:void(0)" class="btn_gre" id="btn_esm" ><strong>견적담기</strong></a>
			</c:when>
			<c:otherwise>
			<a href="javascript:layerClose();" class="btn_wht"><strong>취소</strong></a>
			<a href="javascript:void(0)" class="btn_gre" id="btn_ok" ><strong>확인</strong></a>
			</c:otherwise>
		</c:choose>			
		</dd>

	</dl>
</section>
</form>
<!--//#layOpt E -->