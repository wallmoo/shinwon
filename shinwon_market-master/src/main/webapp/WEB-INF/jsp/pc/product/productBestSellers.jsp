<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-bestsellers"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
            <div id="inner"><!-- inner -->

                <div class="container breadcrumb-wrap"><!-- breadcrumb -->
                    <div id="breadcrumb" class="wrap">
                        <div class="holder">
                            <a href="#!" class="home"><span>홈</span></a>
                            <span class="gt">&gt;</span>
                            <strong class="warning">BEST SERLLERS</strong>
                        </div>
                    </div>
                </div><!-- // breadcrumb -->

                <div class="container visual-wrap"><!-- visual -->
                    <div class="wrap">
                        <img src="<c:out value="${cdnDomain}" />/pc/img/custom/best.png" alt="" />
                    </div>
                </div><!-- // visual -->

                <div class="container"><!-- container -->
                    <div class="wrap"><!-- wrap -->

                        <h3 class="sr-only">BEST SELLERS</h3>
                        
                         <div class="section-bbs-category mb20"><!-- section-bbs-category -->
                            <a href="/pc/product/productBestSellers.do" <c:if test="${empty commandMap.idx}" > class="active" </c:if> ><span>ALL</span></a>
                        	<c:choose>
								<c:when test="${not empty listCategory}">
									<c:forEach var="item" items="${listCategory }" varStatus="status">  
										<span class="pipe">|</span>
		                            	<a href="/pc/product/productBestSellers.do?idx=${item.PRD_CTG_IDX}" <c:if test="${commandMap.idx eq item.PRD_CTG_IDX}" > class="active" </c:if> ><span>${item.PRD_CTG_NM }</span></a>   
									</c:forEach>
								</c:when>
                            </c:choose>
                        </div><!-- // section-bbs-category -->
                        

                        <div id="listBest" class="list-product item-4-large image"><!-- list-product -->                          
							<c:choose>
		    					<c:when test="${not empty listProduct}">
		    						<ul class="reset core">
	    							<c:forEach var="item" items="${listProduct}" varStatus="status"> <!-- item large large-1 -->
	    								<li class="item <c:if test="${status.count < 3}">large large-${status.count}</c:if><c:if test="${status.count > 2}">nth-child-${((status.count-3) mod 4)+1}</c:if>"><!-- item -->
	                                        <div class="module">
	                                            <div class="col thumb"  data-code="${item.PRD_MST_CD}" data-colors="${item.PRODUCT_RGB}">
	                                            	<c:if test="${status.count < 3}">
	                                                <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="${cdnDomain}${item.PRD_IMAGE_BIG}" class="thumb490" alt="" /></a>
	                                                </c:if>
	                                                <c:if test="${status.count > 2}">
	                                                <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="${cdnDomain}${item.PRD_IMAGE}" class="thumb236" alt="" /></a>
	                                                </c:if>
	                                            </div>
	                                            <div class="col core">
	                                                <div class="desc">
	                                                    <p class="name">
	                                                        <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}">
	                                                        <c:if test="${not empty item.PRM_TEXT}" >[<c:out value="${item.PRM_TEXT }" />]</c:if>
	                                                        	${item.PRD_MST_NM}
	                                                        </a>
	                                                    </p>
	                                                </div>
	                                                <div class="prices">
	                                                    <p class="price-after">
	                                                        <fmt:formatNumber value="${item.PRD_MST_PRICE }"/>원
	                                                    </p>
	                                                </div>
	                                                <div class="labels">
	                                                	<c:if test="${item.ICON_NEW eq 'Y'}">
	                                                    	<span class="label new">NEW</span>
	                                                    </c:if>
	                                                    <c:if test="${item.ICON_MD eq 'Y'}">
	                                                    	<span class="label md">MD추천</span>
	                                                    </c:if>
	                                                    <c:if test="${item.ICON_EVENT eq 'Y'}">
	                                                    	<span class="label event">EVENT</span>
	                                                    </c:if>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </li>
	    							</c:forEach>
	    							</ul>
		    					</c:when>
		    					<c:otherwise>
									<p class="no-list-more line">
                                		상품이 없습니다.
                            		</p>
		    					</c:otherwise>
		    				</c:choose> 
                        </div><!-- // list-product -->

                        <div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>  

                    </div><!-- wrap -->
                </div><!-- // container -->                
            </div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script  type="text/javascript">
<!-- //

$(function(){
    $('#listBest .thumb').setBestRankBadge();
});

//-->
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>