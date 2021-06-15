<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${not empty listProductCateBest }">
		<c:forEach var="listProductCateBest" items="${listProductCateBest }" varStatus="status">
			<li>
				<div class="module">
					<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${listProductCateBest.PRD_MST_CD }" />&cateIdx=<c:out value="${commandMap.catIdx}" />" target="_self">
						<span class="thumb"><img src="<c:out value="${cdnDomain}" />/<c:out value="${listProductCateBest.PRD_IMAGE}" />" alt="추천상품1 이미지" /></span>
						<span class="subject">
							<c:choose>
								<c:when test="${fn:length(listProductCateBest.PRD_MST_NM) > 34 }">
									<c:out value="${fn:substring(listProductCateBest.PRD_MST_NM,0,34) }"/>...
								</c:when>
								<c:otherwise>
									<c:out value="${listProductCateBest.PRD_MST_NM }"/>
								</c:otherwise>
							</c:choose>
						</span>
					</a>
					<p class="price-before">
						<span class="blind">판매가</span><em class="small"><fmt:formatNumber value="${listProductCateBest.PRD_MST_ERP_PRC }" groupingUsed="true" />원</em>
					</p>
					<p class="price-after">
						<span class="blind">할인가</span><strong class="large"><fmt:formatNumber value="${listProductCateBest.PRD_MST_PRICE }" groupingUsed="true" /></strong>원
					</p>
				</div>
			</li>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<li >
			<string>등록 된 카테고리 BEST가 없습니다.</string>
		</li>
	</c:otherwise>
</c:choose>