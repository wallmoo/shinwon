<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-detail blackyak"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
          <div id="contents" class="section-detail"><!-- contents -->

                <div class="section-title"><!-- section-title-->
                    <h3><span>${topCateName}</span></h3>
                    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
                    <a href="#more" class="more"><span class="icon"><em>더 보기</em></span></a>
                    <div id="more" class="sub">
                        <ul class="reset">
                        	<c:choose>
	    						<c:when test="${not empty listMenuCategory['1']}">
	    							<c:forEach var="item" items="${listMenuCategory['1'] }" varStatus="status">     
                                 		<li><a href="<c:out value="${mobileDomain }"/>/mobile/product/productList.do?idx=${item.PRD_CTG_IDX}"><span>${item.PRD_CTG_NM }</span></a></li>
                                 	</c:forEach>
                                 </c:when>
                            </c:choose>
                        </ul>
                    </div>

                </div><!-- // section-title -->

                <div class="container"><!-- container -->

                    <div class="wrap gutter mt10">
                        <div id="sliderBanner" class="slidr-wrap pager-inner"><!-- slider -->
							<c:if test="${fn:length(listPromotionBanner) gt 1}">
                            <a href="#!" class="slidr-nav in prev"><span class="icon"><em>이전</em></span></a>
                            <a href="#!" class="slidr-nav in next"><span class="icon"><em>다음</em></span></a>
							</c:if>
							
                            <div class="slider"><!-- slider -->                               
							<c:choose>
								<c:when test="${not empty listPromotionBanner}">
									<c:forEach var="item" items="${listPromotionBanner}" varStatus="status">                   
										<div class="item">
										    <a href="javascript:goNewPageUrl('${item.BNR_DTL_URL }','${item.BNR_DTL_TARGET}');"><img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.BNR_MST_TITLE}" class="full item-lazyload"/></a>
										</div>
									</c:forEach>
								</c:when>
							</c:choose>
                            </div><!-- // slider -->

                        </div><!-- // slider -->
                    </div>

                    <div class="wrap gutter">
                        <h5 class="title">NEW ARRIVALS</h5>
                    </div>

                    <div class="wrap">

                        <div id="sliderNewArrivals" class="slidr-wrap grid-product pager-outter"><!-- slider -->

                            <a href="#!" class="slidr-nav in prev ml5"><span class="icon"><em>이전</em></span></a>
                            <a href="#!" class="slidr-nav in next mr5"><span class="icon"><em>다음</em></span></a>

                            <div class="slider"><!-- grid product -->

								<c:choose>
			    					<c:when test="${not empty listNewProduct}">
		    							<c:forEach var="item" items="${listNewProduct}" varStatus="status">
		    								<div class="item-product image" data-sale="null"><!-- item -->
		                                        <div class="module">
		                                            <div class="thumb">
		                                                <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="${cdnDomain}${item.PRD_IMAGE}" class="thumb144 item-lazyload" alt="${item.PRD_MST_NM}" /></a>
		                                            </div>
		                                            <div class="desc">
			                                        	<p class="hello">
				                                        	<c:if test="${not empty item.PRM_TEXT}" >
					                                        	<span>[<c:out value="${item.PRM_TEXT }" />]</span>
					                                        </c:if>
				                                        </p>
			                                            <p class="name">
			                                               <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}"><span>${item.PRD_MST_NM}</span></a>
			                                            </p>
			                                            <p class="price-after">
			                                                <fmt:formatNumber value="${item.PRD_MST_PRICE }"/>원
			                                            </p> 
			                                            <p class="labels">
															<c:if test="${item.ICON_NEW eq 'Y'}">
		                                                    	<span class="label new">NEW</span>
		                                                    </c:if>
		                                                    <c:if test="${item.ICON_MD eq 'Y'}">
		                                                    	<span class="label md">MD추천</span>
		                                                    </c:if>
			                                            </p>
			                                         </div>	                                            
		                                         </div>
		                                     </div>
		    							</c:forEach>
			    					</c:when>
			    				</c:choose>
                            </div><!-- // grid-prod"  uct -->
    
                        </div><!-- // slider -->
         
                    </div><!-- // wrap -->

                    <div class="wrap section-submain-link"><!-- section-submain-link -->
                        <div class="grid">
                            <div class="col-1-2 col-md-1-4">
                                <img src="${cdnDomain}/mobile/img/custom/ban_b_03.png" alt="" class="thumb">
                            </div>
                            <c:choose>
								<c:when test="${not empty listStyleBanner}">
									<c:forEach var="item" items="${listStyleBanner}" varStatus="status"> 
										<div class="col-1-2 col-md-1-4">                  
		                                   <a href="javascript:goNewPageUrl('${item.BNR_DTL_URL }','${item.BNR_DTL_TARGET}');"><img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.BNR_MST_TITLE}" class="thumb"/></a>
		                                </div> 
									</c:forEach>
								</c:when>
							</c:choose>
                        </div>
                    </div><!-- // section-submain-link -->

                    <div class="wrap gutter">
                        <h5 class="title">HOT ITEM</h5>
                    </div>

                    <div class="wrap">

                        <div id="sliderHotItem" class="slidr-wrap grid-product pager-outter"><!-- slider -->

                            <a href="#!" class="slidr-nav in prev ml5"><span class="icon"><em>이전</em></span></a>
                            <a href="#!" class="slidr-nav in next mr5"><span class="icon"><em>다음</em></span></a>

                            <div class="slider"><!-- grid product -->
								<c:choose>
			    					<c:when test="${not empty listHotProduct}">
		    							<c:forEach var="item" items="${listHotProduct}" varStatus="status">
		    								<div class="item-product image" data-sale="null"><!-- item -->
		                                        <div class="module">
		                                            <div class="thumb">
		                                                <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="${cdnDomain}${item.PRD_IMAGE}" class="thumb144 item-lazyload" alt="${item.PRD_MST_NM}" /></a>
		                                            </div>
		                                            <div class="desc">
		                                            	<c:if test="${not empty item.PRM_TEXT}" >
				                                        	<p class="hello"><span>[<c:out value="${item.PRM_TEXT }" />]</span></p>
				                                        </c:if>
			                                            <p class="name">
			                                               <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}"><span>${item.PRD_MST_NM}</span></a>
			                                            </p>
			                                            <p class="price-after">
			                                                <fmt:formatNumber value="${item.PRD_MST_PRICE }"/>원
			                                            </p> 
			                                            <p class="labels">
															<c:if test="${item.ICON_NEW eq 'Y'}">
		                                                    	<span class="label new">NEW</span>
		                                                    </c:if>
		                                                    <c:if test="${item.ICON_MD eq 'Y'}">
		                                                    	<span class="label md">MD추천</span>
		                                                    </c:if>
			                                            </p>
			                                         </div>	                                            
		                                        </div>
		                                    </div>
		    							</c:forEach>
			    					</c:when>
			    				</c:choose>
                            </div><!-- // grid-prod"  uct -->
    
                        </div><!-- // slider -->

                        <div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

                    </div><!-- // wrap -->

                </div><!-- // container -->

         </div><!-- // inner -->
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
$.params = ($.params !== undefined) ? $.params : [];

$(function(){

    // 배너 슬라이더
    $("#sliderBanner").initOwlCarousel({
        singleItem: true,
        autoHeight: false,
        pagination: true,
        itemsDesktop: [1199, 2],
        itemsDesktopSmall: [979, 2],
        itemsTablet: [768, 1],
        itemsMobile: [479, 1]
    });

    // New Arrivals 슬라이더
    $("#sliderNewArrivals").initOwlCarousel({
        items: 3,
        singleItem: false,
        autoHeight: false
    });

    // Hot Item 슬라이더
    $("#sliderHotItem").initOwlCarousel({
        items: 3,
        singleItem: false,
        autoHeight: false
    });

});

</script>
</body>
</html>    