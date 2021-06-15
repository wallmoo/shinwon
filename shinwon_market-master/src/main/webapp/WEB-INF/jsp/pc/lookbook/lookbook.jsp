<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-display"><!-- page class : page-lookbook -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	        <div id="breadcrumb" class="wrap">
	            <div class="holder">
	                <span>홈</span>
	                <span class="gt">&gt;</span>
	                <strong class="warning">LOOKBOOK</strong>
	            </div>
	        </div>
	    </div><!-- // breadcrumb -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

				<h3 class="title"><span>LOOKBOOK</span></h3>

				<div class="event-view-body"><!-- event-view-body -->
				    <div class="holder">
				        <img src="<c:out value="${cdnDomain }"/>${lookBookImageMap.LKB_IMG_ATT_PATH}${lookBookImageMap.LKB_IMG_SYS_NM}" alt="${lookBookImageMap.LKB_IMG_TXT}" />
				    </div>
				</div><!-- // event-view-body -->

				<c:choose>
					<c:when test="${not empty imageProductList }">
						<h4 class="title"><span>RELATED ITEM</span></h4>

						<div class="section-slider section-related-product">
						    <div class="wrap">
						        <div class="slidr-utils">
						            <div id="counterRelatedItem" class="slidr-counter"></div>
						            <a id="prevRelatedItem" href="javascript:;" class="slidr-nav prev" style="top: 167px;"><span class="icon"><em>이전</em></span></a>
									<a id="nextRelatedItem" href="javascript:;" class="slidr-nav next" style="top: 167px;"><span class="icon"><em>다음</em></span></a>
								</div>
								
								<div id="relatedItem" class="slidr js-prductSlidr"><!-- slider -->

									<div id="list" class="itemwrap list-product item-4-large image list-product-style"><!-- list-product -->
										<ul class="reset core">
										    <c:forEach var="item" items="${imageProductList }" varStatus="i">
											    <li class="item nth-child-${(i.index % fn:length(imageProductList)) + 1}"><!-- item -->
											      <div class="module">
											          <div class="col thumb" data-code="${item.LKB_PRD_MST_CD }" data-colors="${item.PRD_RGB }">
											              <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.LKB_PRD_MST_CD}"><img src="<c:out value="${cdnDomain }"/>${item.PRD_IMG}" class="thumb236" alt="${item.PRD_MST_NM }" /></a>
											          </div>
											          <div class="col core">
											              <div class="desc">
											                  <p class="name">
											                      <a href="/pc/product/product.do?prdMstCd=${item.LKB_PRD_MST_CD}"><c:out value="${item.PRD_MST_NM }" /></a>
											                  </p>
											              </div>
											              <div class="prices">
											                  <p class="price-after">
											                      <fmt:formatNumber value="${item.PRD_PRICE }" groupingUsed="true" />원
											                  </p>
											              </div>
											              <div class="labels">
																<c:if test="${item.ICON_NEW eq 'Y' }">
																	<span class="label new">NEW</span>
																</c:if>
																<c:if test="${item.ICON_MD eq 'Y' }">
																	<span class="label md">MD추천</span>
																</c:if>
											              </div>
											          </div>
											      </div>
											  	</li>
											</c:forEach>
									    </ul>
									</div><!-- // list-product -->
								</div><!-- // slider -->
    						</div>
						</div>
					</c:when>
				</c:choose>

				<div class="section-button"><!-- section button -->
				    <a href="javascript:;" id="goList" class="button info dark large"><span>목록</span></a>
				</div><!-- // section button -->
				
				<form id="frm" name="frm">
					<input type="hidden" name="LKB_MST_IDX" value="" />
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
		            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
            	</form>

				<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

			</div><!-- wrap -->
		</div><!-- // container -->              

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
	$(function()
	{
		// init slider
	    $('#relatedItem').productSlidr({
	    	// autoPlay: false,
	        visibleLength: 4,
	        sliderHeight: '335px',
	        navPrev: '#prevRelatedItem',
	        navNext: '#nextRelatedItem',
	        pager: '#pagerRelatedItem',
	        onInit: function(base){
	            setTimeout(function(){
	                $('.list-product').setProductUtil();
	            }, 1000);
	        }
	    });
		
		//목록
		$(document).on("click","#goList",function()
		{
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/lookbook/lookbookList.do", "target":"_self", "method":"get"}).submit();
		});
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>