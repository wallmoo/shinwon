<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-newarrivals"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
			<div id="inner"><!-- inner -->

                <div class="container breadcrumb-wrap"><!-- breadcrumb -->
                    <div id="breadcrumb" class="wrap">
                        <div class="holder">
                            <a href="#!" class="home"><span>홈</span></a>
                            <span class="gt">&gt;</span>
                            <strong class="warning">NEW ARRIVALS</strong>
                        </div>
                    </div>
                </div><!-- // breadcrumb -->

                <div class="container visual-wrap"><!-- visual -->
                    <div class="wrap">

                        <img src="<c:out value="${cdnDomain}" />/pc/img/custom/newarrivals.png" alt="" />

                    </div>
                </div><!-- // visual -->



                <div class="container"><!-- container -->
                    <div class="wrap"><!-- wrap -->


                        <h3 class="sr-only">상품전시</h3>

                        <div class="section-bbs-category mb20"><!-- section-bbs-category -->
                            <a href="<c:out value="${frontDomain }"/>/pc/product/productNewArrivals.do" <c:if test="${empty commandMap.idx}" > class="active" </c:if> ><span>ALL</span></a>
                        	<c:choose>
								<c:when test="${not empty listCategory}">
									<c:forEach var="item" items="${listCategory }" varStatus="status">  
										<span class="pipe">|</span>
		                            	<a href="/pc/product/productNewArrivals.do?idx=${item.PRD_CTG_IDX}" <c:if test="${commandMap.idx eq item.PRD_CTG_IDX}" > class="active" </c:if> ><span>${item.PRD_CTG_NM }</span></a>   
									</c:forEach>
								</c:when>
                            </c:choose>
                        </div><!-- // section-bbs-category -->

                        <div id="list" class="list-product item-4-large image"><!-- list-product -->  
                           	<c:choose>
		    					<c:when test="${not empty listProduct}">
		    						<ul class="reset core">
	    							<c:forEach var="item" items="${listProduct}" varStatus="status">
	    								<li class="item nth-child-${(status.index mod 4)+1}"><!-- item -->
	                                        <div class="module">
	                                            <div class="col thumb"  data-code="${item.PRD_MST_CD}" data-colors="${item.PRODUCT_RGB}">
	                                                <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="${cdnDomain}${item.PRD_IMAGE}" class="thumb198" alt="" /></a>
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
                        
						<div class="section-pagination"><!-- .section pagination -->
				            <ui:frontpaging paging="${paging}" jsFunction="goPage" />
				        </div><!-- // .section pagination -->

                        <div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>  

                    </div><!-- wrap -->
                </div><!-- // container -->

            </div><!-- // inner -->
<form id="frm" name="frm" method="post" >
    <input type="hidden" id="idx" name="idx" value="${commandMap.idx}" />
	<input type="hidden" id="cPage" name="cPage" value="${commandMap.cPage }" />
</form>
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script  type="text/javascript">
$(document).ready(function () {
	
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(cPage);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productNewArrivals.do?idx=${commandMap.idx}", "target":"_self", "method":"get"}).submit();
	};

});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>