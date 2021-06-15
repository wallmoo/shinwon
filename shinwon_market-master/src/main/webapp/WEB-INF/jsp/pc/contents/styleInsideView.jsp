<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-display"><!-- page class : page-display -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	        <div id="breadcrumb" class="wrap">
	            <div class="holder">
	                <span>홈</span>
	                <span class="gt">&gt;</span>
	                <strong class="warning">STYLE INSIDE</strong>
	            </div>
	        </div>
	    </div><!-- // breadcrumb -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

				<div class="section-title">
				    <h3 class="title">
				    	<span><c:out value="${contentsView.CON_CMN_COM_NM }"/></span>
				    </h3>
				    <div class="more">
				        <select class="select">
				            <option value="">다른 <c:out value="${contentsView.CON_CMN_COM_NM }"/> 선택</option>
				            <c:if test="${not empty ingStyleInsideList }">
								<c:forEach var="ingStyleInsideRow" items="${ingStyleInsideList }">
								 <option value="<c:out value="${ingStyleInsideRow.CON_MST_IDX }"/>" data-con_cmn_com_idx="${ingStyleInsideRow.CON_CMN_COM_IDX }"><c:out value="${ingStyleInsideRow.CON_MST_TITLE }"/></option>
								</c:forEach>
						 	</c:if>
				        </select>
				    </div>
				</div>

				<div class="style-manager"><!-- style-manager -->
				    ${contentsView.CON_MST_PC_PROMOTION }
				</div><!-- // style-manager -->
				<c:choose>
					<c:when test="${not empty detailProductList }">
						<h4 class="title"><span>RELATED PRODUCTS</span></h4>

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
										    <c:forEach var="item" items="${detailProductList }" varStatus="i">
											    <li class="item nth-child-${(i.index % fn:length(detailProductList)) + 1}"><!-- item -->
												    <div class="module">
												        <div class="col thumb" data-code="${item.CON_PRD_MST_CD }" data-colors="${item.PRD_RGB }">
												            <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.CON_PRD_MST_CD}"><img src="<c:out value="${cdnDomain }"/>${item.PRD_IMG}" class="thumb236" alt="" style="width:236px;height:236px;" /></a>
												        </div>
												        <div class="col core">
												            <div class="desc">
												                <p class="name">
												                    <a href="/pc/product/product.do?prdMstCd=${item.CON_PRD_MST_CD}"><c:out value="${item.PRD_MST_NM }" /></a>
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
					<input type="hidden" name="CON_MST_IDX" value="" />
					<input type="hidden" name="CON_CMN_COM_IDX" value=""/>
					<input type="hidden" name="CON_MST_TYPE" value="${commandMap.CON_MST_TYPE }"/>
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
		            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		            <input type="hidden" name="searchCmnComIdx" value="<c:out value="${commandMap.searchCmnComIdx }"/>"/> 
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
	        sliderHeight: '370px',
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
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/contents/styleInsideList.do", "target":"_self", "method":"get"}).submit();
		});
		
		// 진행중인 다른 styleInside 선택
		$(document).on("change", ".select", function ()
		{
			$("#frm").find("input[name='CON_MST_IDX']").val($(this).val());
			$("#frm").find("input[name='CON_CMN_COM_IDX']").val($(".select option:selected").data("con_cmn_com_idx"));
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/contents/styleInsideView.do","target":"_self","method":"get"}).submit();
		});
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>