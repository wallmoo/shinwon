<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-mypage -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>최근 본 상품</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="bbs-status"><!-- bbs-status -->
            	최근 본 상품 <span class="warning">
            				<c:choose>
			            		<c:when test="${not empty recentProductCount }">
									<fmt:formatNumber value="${recentProductCount }" groupingUsed="true"/>
			            		</c:when>
			            		<c:otherwise>
									0
			            		</c:otherwise>
			            	</c:choose>
            			</span>개 
	        </div><!-- // bbs-status -->
	
	        <div class="padder product-list-wrap look-history"><!-- product-list-wrap -->
				
				<c:choose>
        			<c:when test="${not empty recentProductList }">
			            <ul class="product-list">
			                <c:forEach var="recentProductRow" items="${recentProductList }" varStatus="i">
				                <li>
				                    <div class="module">
				                        <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${recentProductRow.PRD_MST_CD}" class="_pg_link" target="_self">
				                            <span class="thumb">
				                            	<img src="<c:out value="${cdnDomain }${recentProductRow.PRD_IMAGE }"/>" alt="<c:out value="${recentProductRow.PRD_IMAGE_ALT }"/>" />
				                            </span>
				                            <span class="subject"><c:out value="${recentProductRow.PRD_MST_NM}"/></span>
				                        </a>
				                        <p class="price-after">
				                            <span class="blind">판매가</span><strong class="large"><fmt:formatNumber value="${recentProductRow.PRD_MST_PRICE }" groupingUsed="true"/></strong>원
				                        </p>
				                    </div>
				                </li>
			                </c:forEach>
			            </ul>
					</c:when>
					<c:otherwise>
						<p class="no-more">
				                최근 본 상품이 없습니다.
			            </p>
					</c:otherwise>
				</c:choose>
	        </div><!-- // product-list-wrap -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
});
//]]>
</script>
</body>
</html>