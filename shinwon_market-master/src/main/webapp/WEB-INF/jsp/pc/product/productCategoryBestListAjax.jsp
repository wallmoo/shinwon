<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

	<ul>
		<c:choose>
			<c:when test="${not empty listProductCateBest }">
				<c:set var="cbNum" value="1" />
				<c:forEach var="listProductCateBest" items="${listProductCateBest }" varStatus="status">
					<c:choose>
						<c:when test="${cbNum == 1 }">
							<li class="f">
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${cbNum == 5 || fn:length(listProductCateBest) == cbNum}">
									<li class="l">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					
						<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${listProductCateBest.PRD_MST_CD }" />&cateIdx=<c:out value="${commandMap.catIdx}" />" title="새창으로 링크연결">
							<img src="<c:out value="${cdnDomain}" />/<c:out value="${listProductCateBest.PRD_IMAGE}" />" alt="추천상품1 이미지" />
							<span class="ti">
								<c:choose>
									<c:when test="${fn:length(listProductCateBest.PRD_MST_NM) > 34 }">
										<c:out value="${fn:substring(listProductCateBest.PRD_MST_NM,0,34) }"/>...
									</c:when>
									<c:otherwise>
										<c:out value="${listProductCateBest.PRD_MST_NM }"/>
									</c:otherwise>
								</c:choose>
							</span>
							<strong class="money"><fmt:formatNumber value="${listProductCateBest.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span></strong>
						</a>
					</li>
				<c:set var="cbNum" value="${cbNum + 1 }" />
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li >
					<string>등록 된 카테고리 BEST가 없습니다.</string>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
