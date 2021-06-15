<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<article id="container" class="container" data-role="content">
			<!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>쿠폰 적용 상품</h2>
	            <a href="javascript:history.back(); return false;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <table class="table-d table-col coupon-product" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
	        <caption>상품정보로 구성된 쿠폰 적용 상품목록입니다.</caption>
	        <colgroup>
	            <col style="width: 30%;">
	            <col style="width: auto;">
	        </colgroup>
	        <thead>
	            <tr>
	                <th colspan="2" scope="col">상품정보</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:choose>
	        		<c:when test="${not empty list }">
	        			<c:forEach var="list" items="${list }" varStatus="status">
		        			<tr>
		        				<td>
				                    <span class="thumb">
				                    	<c:if test="${list.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT }">
											<i class="soldout passing"><span>일시품절</span></i>
										</c:if>
										<c:if test="${list.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT }">
											<i class="soldout"><span>품절</span></i>
										</c:if>
				                    	<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${list.PRD_MST_CD }" />','_self');" ><img data-original="<c:out value="${cdnDomain}" />/<c:out value="${list.PRD_IMG_ATT_PATH}" /><c:out value="${list.PRD_IMG_SYS_NM}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="<c:out value="${list.PRD_IMG_ALT_TEXT}" />" /></a>
				                    </span>
				                </td>
				                <td class="text-left">
				                    <p class="code">[<c:out value="${list.PRD_MST_CD }" />]</p>
				                    <a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${list.PRD_MST_CD }" />','_self');" ><c:out value="${list.PRD_MST_NM }" /></a>
				                    <c:choose>
				                		<c:when test="${list.PRD_MST_PRICE > 0 }">
						                    <p class="price-before">
						                        <span class="blind">소비자가</span><fmt:formatNumber value="${list.PRD_MST_PRC }" groupingUsed="true" />원
						                    </p>
						                    <p class="price-after">
						                        <span class="blind">판매가</span><strong class="xlarge"><fmt:formatNumber value="${list.PRD_MST_PRICE }" groupingUsed="true" />원</strong>
						                    </p>
				                		</c:when>
				                		<c:otherwise>
						                    <p class="price-after">
						                        <span class="blind">판매가</span><strong class="xlarge"><fmt:formatNumber value="${list.PRD_MST_PRC }" groupingUsed="true" />원</strong>
						                    </p>
				                		</c:otherwise>
				                	</c:choose>
				                </td>
				            </tr>
				    	</c:forEach>
	        		</c:when>
	        		<c:otherwise>
	        			<tr><td colspan=2>적용된 상품이 없습니다.</td></tr>
	        		</c:otherwise>
	        	</c:choose>
	        </tbody>
	        </table><!-- // table-d -->
	
	        <form id="pageFrm" name="pageFrm">
	    	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	    	<input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>"/>
	         <div class="section-pagination"><!-- section pagination -->
	             <ui:frontpaging paging="${paging }" jsFunction="goPage" />
	         </div><!-- // section pagination -->
	        </form>
				
		</article>
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
	goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myCouponProductPopup.do", "target":"_self", "method":"post"}).submit();
    };
}); //function
//]]>
</script>
</body>
</html>