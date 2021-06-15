<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${not empty listProduct }">
		<c:set var="listNum" value="1" />
		<c:forEach var="listProduct" items="${listProduct }" varStatus="i">
			<c:choose>
				<c:when test="${listNum mod 2 == 0 }">
					<li class="ui-block-b ${i.last ? 'last' : '' }">
				</c:when>
				<c:otherwise>
					<li class="ui-block-a ${listProduct.LAST_PREV_YN == 'Y' ? 'last' : '' }">
				</c:otherwise>
			</c:choose>
				<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD }" />','_self');" class="_pg_link" >
					<span class="tx_img">
						<c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT || listProduct.PRD_MST_SEL_CNT == 0}">
							<span class="sold_out"><i>일시품절</i></span>
						</c:if>
						<c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}">
							<span class="sold_out"><i>품절</i></span>
						</c:if>
						<img data-original="<c:out value="${cdnDomain}" /><c:out value="${listProduct.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" />
					</span>
					<span class="tx_ti">
						<c:choose>
							<c:when test="${fn:length(listProduct.PRD_MST_NM) > 32}">
								<c:out value="${fn:substring(listProduct.PRD_MST_NM,0,32) }" />...
							</c:when>
							<c:otherwise>
								<c:out value="${listProduct.PRD_MST_NM}" />
							</c:otherwise>
						</c:choose>
					</span>
					<strong class="tx_price">
						<fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span>
						<c:if test="${listProduct.PRD_NOW_DST_POINT > 0}">
							<em class="discount">
								<span class="blind">할인률</span>
								<strong class="tx_num"><c:out value="${listProduct.PRD_NOW_DST_POINT}" /></strong>%
							</em>
						</c:if>
					</strong>
				</a>
			</li>
		<c:set var="listNum" value="${listNum + 1 }" />
		</c:forEach>
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
</c:choose>