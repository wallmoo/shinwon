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
			<h3><span>MINISHOP</span></h3>
			<a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

				<div class="section-banner mt0 mb0"><!-- section banner -->
				    <img src="<c:out value='${cdnDomain}${shopInfo.CMM_FLE_ATT_PATH}${shopInfo.CMM_FLE_SYS_NM}'/>" alt="${shopInfo.CMN_FLE_ALT_TXT}" />
				</div><!-- // section banner -->

				<div class="grid head-actions padder mt10"><!-- head-actions -->
					<div class="col-1-1 type">
				        <c:choose>
							<c:when test="${not empty listCategory}">
								<select name="productCategory" id="productCategory" class="select half">
                                    <option value="">ALL</option>
                                   	<c:forEach var="item" items="${listCategory}" varStatus="status">
                                   		<option value="${item.PRD_CTG_IDX }" <ui:select v="${commandMap.idx }" t="${item.PRD_CTG_IDX}" g="selected"/>><c:out value="${item.PRD_CTG_NM }"/></option>
                                   	</c:forEach>
                                </select>
							</c:when>
						</c:choose>
					</div>
				</div><!-- // head-actions -->

				<div id="listMiniShop" class="wrap-product image"><!-- wrap-product -->
					<c:choose>
						<c:when test="${not empty listProduct}">
							<div class="list-product item-2 image"><!-- list-product -->
								<c:forEach var="item" items="${listProduct}" varStatus="status">
									<div class="item-product" data-sale="null"><!-- item -->
									    <div class="module">
									        <div class="thumb">
									        	<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}">
									        		<img src="<c:out value='${cdnDomain}${item.PRD_IMAGE}'/>" class="thumb144" alt="" />
									        	</a>
									        </div>
									        <div class="desc">
									            <p class="hello">
									            	<span><c:out value="${item.PRM_TEXT }"/></span>
									            </p>
									            <p class="name">
									               <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}">${item.PRD_MST_NM}</a>
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
							</div>
						</c:when>
						<c:otherwise>
							<div class="section-message message">
	                            <p>상품이 없습니다.</p>
	                        </div>
						</c:otherwise>						
					</c:choose>
				</div><!-- // list-product -->

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

$(function(){
   $("#productCategory").on("change",function(){
	  location.href = "<c:out value="${mobileDomain}"/>/mobile/product/miniShopProductList.do?MNI_SHP_IDX=${commandMap.MNI_SHP_IDX}&idx="+$(this).val(); 
   });
});

</script>
</body>
</html>    