<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-assadeal assadeal"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
		    <div id="breadcrumb" class="wrap">
		        <div class="holder">
		            <a href="javascript:;" class="home"><span>홈</span></a>
		            <span class="gt">&gt;</span>
		            <strong class="warning">ASSADEAL</strong>
		        </div>
		    </div>
		</div><!-- // breadcrumb -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

				<div class="section-visual">
				    <img src="<c:out value="${cdnDomain }"/>/pc/img/custom/assadeal.png" alt="" /> 
				</div>

				<div id="list" class="list-product item-4-large image"><!-- list-product -->
					<c:choose>
						<c:when test="${not empty assadealList }">
							<ul class="reset core">
								<c:forEach var="assadealRow" items="${assadealList }" varStatus="i">
									<li class="item <c:if test="${i.count mod 2 eq 1}">odd</c:if> <c:if test="${i.count mod 2 eq 0}">even</c:if> nth-child-${(i.index mod 4)+1}"><!-- item -->
									    <div class="module">
									        <div class="col thumb" data-code="${assadealRow.PRD_MST_CD}" data-colors="${assadealRow.PRODUCT_RGB}">
									            <span class="sticker sale"><strong>${assadealRow.PRD_MST_DISC_RT }</strong>%</span>
									            <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${assadealRow.PRD_MST_CD}"><img src="${cdnDomain}${assadealRow.PRD_IMAGE}" class="thumb198" alt="" /></a>
									        </div>
									        <div class="col core">
									            <div class="desc">
									                <p class="name">
									                    <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${assadealRow.PRD_MST_CD}&cat=${catIdx}">${assadealRow.PRD_MST_NM}</a>
									                </p>
									            </div>
									            <div class="prices">
													<p class="price-before">
									                	<fmt:formatNumber value="${assadealRow.PRD_MST_NORMAL_PRICE }" groupingUsed="true" />원
									                </p>
									                <p class="price-after">
									                    <fmt:formatNumber value="${assadealRow.PRD_MST_PRICE }"/>원
									                </p>
									            </div>
									            <div class="labels">
									                <c:if test="${assadealRow.ICON_NEW eq 'Y'}">
                                                    	<span class="label new">NEW</span>
                                                    </c:if>
                                                    <c:if test="${assadealRow.ICON_MD eq 'Y'}">
                                                    	<span class="label md">MD추천</span>
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

				<form id="frm" name="frm">
					<input type="hidden" id="cPage" name="cPage" value="${commandMap.cPage }" />
					<div class="section-pagination"><!-- .section pagination -->
		            	<ui:frontpaging paging="${paging}" jsFunction="goPage" />
		        	</div><!-- // .section pagination -->				
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
	$(function(){
		// 페이지 이동
		goPage = function (cPage) 
		{
		    var $frm = $("#frm");
		    $frm.find("input[id='cPage']").val(cPage);
		    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/assadealList.do", "target":"_self", "method":"get"}).submit();
		};
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>