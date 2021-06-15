<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-list blackyak"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
  			<div id="contents"><!-- contents -->

                <div class="section-title"><!-- section-title-->
                    <h3><span>BEST SELLERS</span></h3>
                    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
                </div><!-- // section-title -->

                <div class="container"><!-- container -->
                    <div class="wrap"><!-- wrap -->

                        <form id="frm" name="frm" method="get">
                       		<input type="hidden" id="cPage"    name="cPage"    value="${commandMap.cPage }" />
                        <div class="grid head-actions padder"><!-- head-actions -->
                            <!--
                            <div class="col-2-3 total">
                                총 <strong class="warning">298 개의 상품</strong>이 있습니다.
                            </div>
                            -->

                            <div class="col-1-1 type">
                                카테고리&nbsp;
                                <select name="idx" id="idx" class="select half">
                                    <option value="" <ui:select v="${commandMap.idx}" t="" g="selected"/>>ALL</option>
		                        	<c:choose>
										<c:when test="${not empty listCategory}">
											<c:forEach var="item" items="${listCategory }" varStatus="status"> 
												<option value="${item.PRD_CTG_IDX}" <ui:select v="${commandMap.idx}" t="${item.PRD_CTG_IDX}" g="selected"/>>${item.PRD_CTG_NM }</option>    
											</c:forEach>
										</c:when>
		                            </c:choose>
                                </select>
                            </div>
                        </div><!-- // head-actions -->
						</form>
						
                        <div id="listBestSellers" class="wrap-product image"><!-- wrap-product -->
                            <div class="list-product item-2 image"><!-- list-product -->
                            <c:choose>
		    					<c:when test="${not empty listProduct}">
                            		<c:forEach var="item" items="${listProduct}" varStatus="status">
		                                <div class="item-product" data-sale="null"><!-- item -->
		                                    <div class="module">
		                                        <div class="thumb">
		                                        	<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="${cdnDomain}${item.PRD_IMAGE}" class="thumb144" alt="${item.PRD_MST_NM}" /></a>
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
		                                </div><!-- // item -->
                                	</c:forEach>
                              	 </c:when>
                              </c:choose>
                            </div><!-- // list-product -->
                        </div>

                        <div class="section-pagination"><!-- section pagination -->
                            <ui:frontpaging paging="${paging }" jsFunction="goPage" />
                        </div><!-- // section pagination -->

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
    
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(cPage);
	    $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/productBestSellers.do", "target":"_self", "method":"get"}).submit();
	};
	
	// 카테고리 선택시 
	$(document).on("change", "#idx", function ()
    {    
 		var $frm = $("#frm"); 
 		$frm.find("input[id='cPage']").val(1);
 		$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/productBestSellers.do", "target":"_self", "method":"get"}).submit();
    });

});

</script>
</body>
</html>    