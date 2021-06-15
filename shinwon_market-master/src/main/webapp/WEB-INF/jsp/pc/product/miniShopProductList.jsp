<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-display"><!-- page-display : 기획전 -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
            <div id="inner"><!-- inner -->

                <div class="container breadcrumb-wrap"><!-- breadcrumb -->
                    <div id="breadcrumb" class="wrap">
                        <div class="holder">
                            <a href="#!" class="home"><span>홈</span></a>
                            <span class="gt">&gt;</span>
                            <strong class="warning">MINI SHOP</strong>
                        </div>
                    </div>
                </div><!-- // breadcrumb -->


                <div class="container"><!-- container -->
                    <div class="wrap"><!-- wrap -->

                        <div class="section-title">
                            <h3 class="title"><span>MINI SHOP</span></h3>
                            <div class="more">
                                <select class="select" id="searchMiniShop" name="searchMiniShop">
                                	<c:choose>
										<c:when test="${not empty listShop}">
											<c:forEach var="item" items="${listShop}" varStatus="status">
												<option value="${item.MNI_SHP_IDX}" <ui:select v="${commandMap.MNI_SHP_IDX}" t="${item.MNI_SHP_IDX }" g="selected"/>>${item.BCNC_NM}</option>
											</c:forEach>
										</c:when>
	                                </c:choose>
                                </select>
                            </div>
                        </div>

                        <div>
                        	<img src="<c:out value='${cdnDomain}${shopInfo.CMM_FLE_ATT_PATH}${shopInfo.CMM_FLE_SYS_NM}'/>" alt="${shopInfo.CMN_FLE_ALT_TXT}" />
                        </div>

 						<div class="tab-c mt20"><!-- tab -->
 							<ul class="tab full-width item-5 js-nth-child">
 								<li class="nth-child-1 <c:if test="${empty commandMap.idx}" >active</c:if>"><a href="<c:out value="${frontDomain }"/>/pc/product/miniShopProductList.do?MNI_SHP_IDX=${commandMap.MNI_SHP_IDX}"><span>ALL</span></a></li>
	                        	<c:choose>
									<c:when test="${not empty listCategory}">
										<c:forEach var="item" items="${listCategory}" varStatus="status">
											<li class="nth-child-${status.count+1} <c:if test="${commandMap.idx eq item.PRD_CTG_IDX}" > active</c:if>"><a href="<c:out value="${frontDomain }"/>/pc/product/miniShopProductList.do?MNI_SHP_IDX=${commandMap.MNI_SHP_IDX}&idx=${item.PRD_CTG_IDX}"><span>${item.PRD_CTG_NM }</span></a></li>     
										</c:forEach>
										<c:if test="${((fn:length(listCategory)+1) mod 5) ne 0}">
                                    		<c:forEach var="i" begin="1" end="${5 - ((fn:length(listCategory)+1) mod 5)}">
                                    			<li class="nth-child-${(fn:length(listCategory)+i+1)}"><span></span></li>
                                    		</c:forEach>
                                    	</c:if>
									</c:when>
	                            	<c:otherwise>
                                    	<c:forEach var="i" begin="1" end="4">
                                    		<li class="nth-child-${i+1}"><span></span></li>
                                    	</c:forEach>
                                	</c:otherwise>
	                            </c:choose>
                            </ul>
                        </div><!-- // tab -->

                        <div class="list-product item-4-large image mt40"><!-- list-product -->
							<c:choose>
								<c:when test="${not empty listProduct}">
								<ul class="reset core">
									<c:forEach var="item" items="${listProduct}" varStatus="status">
		                                <li class="item nth-child-${(status.index mod 4)+1}"><!-- item -->
		                                    <div class="module">
		                                        <div class="col thumb" data-code="${item.PRD_MST_CD}" data-colors="${item.PRODUCT_RGB}">
		                                            <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="<c:out value='${cdnDomain}${item.PRD_IMAGE}'/>" class="thumb236" alt="" /></a>
		                                        </div>
		                                        <div class="col core">
		                                            <div class="desc">
		                                                <p class="name">
		                                                     <a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}">${item.PRD_MST_NM}</a>
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

                        <div class="hr mt20" aria-hidden="true"></div>
						<!-- paging 삭제 2015.06.04 
                        <div class="section-pagination">
				            <ui:frontpaging paging="${paging}" jsFunction="goPage" />
				        </div> 
				        --> 
                        <div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

                    </div><!-- wrap -->
                </div><!-- // container -->

            </div><!-- // inner -->
            
<form id="frm" name="frm" method="post" >
	<input type="hidden" id="cPage" name="cPage" value="${commandMap.cPage }" />
	<input type="hidden" id="MNI_SHP_IDX" name="MNI_SHP_IDX" value="${commandMap.MNI_SHP_IDX }" />
</form> 
   
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
$(document).ready(function () {
	
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(cPage);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/miniShopProductList.do?idx=${commandMap.idx}", "target":"_self", "method":"get"}).submit();
	};
	
	// 다른 미니샵으로 이동 
    $(document).on("change", "#searchMiniShop", function ()
    {    	

    	var $frm = $("#frm");
    	$frm.find("input[id='MNI_SHP_IDX']").val($(this).val());
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/miniShopProductList.do", "target":"_self", "method":"get"}).submit();
    });
	
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>