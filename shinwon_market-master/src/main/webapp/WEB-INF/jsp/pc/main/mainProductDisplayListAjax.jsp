<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${commandMap.type eq 'md'}">
		<c:choose>
			<c:when test="${not empty MainProductDisplayList && fn:length(MainProductDisplayList) == 4}">
				<ul>
					<c:set var="num" value="1" />
					<c:forEach var="cleanRow" items="${MainProductDisplayList }" varStatus="i">
						<li <c:if test="${num == 1}">class="f"</c:if> <c:if test="${num == 4}">class="l"</c:if>>
							<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${cleanRow.PRD_MST_CD }" />">
								<c:if test="${sessionUser.MEM_MST_MEM_GBN ne '683' && commandMap.type ne 'md' }">
									<c:if test="${cleanRow.PRD_NOW_DST_POINT > 0 && cleanRow.PRD_CPN_DST_POINT eq 0}">
										<i class="ico_sale"><span><c:out value="${cleanRow.PRD_NOW_DST_POINT}" />%</span></i>
									</c:if>
									<c:if test="${cleanRow.PRD_CPN_DST_POINT > 0}">
										<i class="ico_coupon"><span class="ir">쿠폰</span></i>
									</c:if>
								</c:if>
								<img src="<c:out value="${cdnDomain}" />/<c:out value="${cleanRow.PRD_IMAGE}" />" class="thumb198" alt="<c:out value="${cleanRow.PRD_IMAGE_ALT}" />" />
								<span class="ti">
									<c:choose>
										<c:when test="${cleanRow.PRD_MST_BRAND_NM ne null && cleanRow.PRD_MST_CPS_MDL ne null }">
											[<c:out value="${cleanRow.PRD_MST_BRAND_NM}" />/<c:out value="${cleanRow.PRD_MST_CPS_MDL}" />]
										</c:when>
										<c:otherwise>
											<c:if test="${cleanRow.PRD_MST_BRAND_NM ne null }">
												[<c:out value="${cleanRow.PRD_MST_BRAND_NM}" />]	
											</c:if>
											<c:if test="${cleanRow.PRD_MST_CPS_MDL ne null }">
												[<c:out value="${cleanRow.PRD_MST_CPS_MDL}" />]	
											</c:if>
										</c:otherwise>
									</c:choose>
										<br>
									<c:out value="${cleanRow.DSP_MST_TXT}" />
								</span>
								<c:choose>
									<c:when test="${(cleanRow.PRD_NOW_DST_POINT > 0 || cleanRow.PRD_CPN_DST_POINT > 0) && sessionUser.MEM_MST_MEM_GBN ne '683'}">
										<c:choose>
											<c:when test="${cleanRow.PRD_CPN_DST_POINT > 0 }">
												<strong class="pr_m"><strong class="co_blue"><fmt:formatNumber value="${cleanRow.PRD_CPN_DST_PRICE }" groupingUsed="true" /></strong><span class="co_blue">원</span></strong>
											</c:when>
											<c:otherwise>
												<strong class="pr_m"><strong class="co_red"><fmt:formatNumber value="${cleanRow.PRD_NOW_DST_PRICE }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<strong class="pr_m"><strong><fmt:formatNumber value="${cleanRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>																			
									</c:otherwise>
								</c:choose>
							</a>
						</li>
					<c:set var="num" value="${num + 1 }" />	
					</c:forEach>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li class="no_list">
						등록된 상품이 없습니다.
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${not empty MainProductDisplayList}">
				<ul>
					<c:set var="num" value="1" />
					<c:forEach var="cleanRow" items="${MainProductDisplayList }" varStatus="i">
						<li <c:if test="${num == 1}">class="f"</c:if> <c:if test="${num == 4}">class="l"</c:if>>
							<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${cleanRow.PRD_MST_CD }" />">
								<c:if test="${sessionUser.MEM_MST_MEM_GBN ne '683' && commandMap.type ne 'md' }">
									<c:if test="${cleanRow.PRD_NOW_DST_POINT > 0 && cleanRow.PRD_CPN_DST_POINT eq 0}">
										<i class="ico_sale"><span><c:out value="${cleanRow.PRD_NOW_DST_POINT}" />%</span></i>
									</c:if>
									<c:if test="${cleanRow.PRD_CPN_DST_POINT > 0}">
										<i class="ico_coupon"><span class="ir">쿠폰</span></i>
									</c:if>
								</c:if>
								<img src="<c:out value="${cdnDomain}" />/<c:out value="${cleanRow.PRD_IMAGE}" />" class="thumb198" alt="<c:out value="${cleanRow.PRD_IMAGE_ALT}" />" />
								<span class="ti">
									<c:choose>
										<c:when test="${cleanRow.PRD_MST_BRAND_NM ne null && cleanRow.PRD_MST_CPS_MDL ne null }">
											[<c:out value="${cleanRow.PRD_MST_BRAND_NM}" />/<c:out value="${cleanRow.PRD_MST_CPS_MDL}" />]
										</c:when>
										<c:otherwise>
											<c:if test="${cleanRow.PRD_MST_BRAND_NM ne null }">
												[<c:out value="${cleanRow.PRD_MST_BRAND_NM}" />]	
											</c:if>
											<c:if test="${cleanRow.PRD_MST_CPS_MDL ne null }">
												[<c:out value="${cleanRow.PRD_MST_CPS_MDL}" />]	
											</c:if>
										</c:otherwise>
									</c:choose>
										<br>
									<c:out value="${cleanRow.DSP_MST_TXT}" />
								</span>
								<c:choose>
									<c:when test="${(cleanRow.PRD_NOW_DST_POINT > 0 || cleanRow.PRD_CPN_DST_POINT > 0) && sessionUser.MEM_MST_MEM_GBN ne '683'}">
										<c:choose>
											<c:when test="${cleanRow.PRD_CPN_DST_POINT > 0 }">
												<strong class="pr_m"><strong class="co_blue"><fmt:formatNumber value="${cleanRow.PRD_CPN_DST_PRICE }" groupingUsed="true" /></strong><span class="co_blue">원</span></strong>
											</c:when>
											<c:otherwise>
												<strong class="pr_m"><strong class="co_red"><fmt:formatNumber value="${cleanRow.PRD_NOW_DST_PRICE }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<strong class="pr_m"><strong><fmt:formatNumber value="${cleanRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>																			
									</c:otherwise>
								</c:choose>
							</a>
						</li>
					<c:set var="num" value="${num + 1 }" />	
					</c:forEach>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li class="no_list">
						등록된 상품이 없습니다.
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>