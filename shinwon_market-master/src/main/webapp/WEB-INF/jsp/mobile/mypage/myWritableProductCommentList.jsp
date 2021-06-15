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
	            <h2>상품후기</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
			<c:if test="${summaryMap.MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE}">
		        <div class="padder">
		            <dl class="my-condition point"><!-- my-condition -->
		                <dt>적립 예상 크라운</dt>
		                <dd><strong class="warning"><fmt:formatNumber value="${writableCount == 0 ? 0 : (writableCount*500)}" groupingUsed="true"/></strong> C</dd>
		            </dl><!-- // my-condition -->
		
		            <p class="review-guide mt10">
	                	상품후기 작성하면 <span class="warning">200</span>C 적립 / 포토후기 작성하면 <span class="warning">500</span>C 적립
		            </p>
		        </div>
	        </c:if>
	
	        <div class="tab-a" data-role="navbar"><!-- tab-a -->
	            <ul>
	                <li class="active"><a href="javascript:;">작성 가능한 상품후기<em>(<c:out value="${writableCount }"/>)</em></a><span class="blind">현재위치</span></li>
	                <li><a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myWrittenProductCommentList.do" class="_pg_link" target="_self">등록한 상품후기<em>(<c:out value="${writtenCount }"/>)</em></a></li>
	            </ul>
	        </div><!-- // tab-a -->
	
			<form id="frm" name="frm">
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
				<input type="hidden" name="PRD_ORD_PRD_IDX" id="prdIdx" value=""/>
				<input type="hidden" name="PRD_PRD_MST_CD" id="prdMstCd" value=""/>
		        <div class="padder product-list-wrap my-review"><!-- product-list-wrap -->
		            <c:choose>
	           			<c:when test="${not empty writableList }">
	           				<ul class="product-list">
				                <c:forEach var="writableRow" items="${writableList }" varStatus="i">
					                <li>
					                    <div class="module">
					                        <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${writableRow.ORD_PRD_MST_CD}" class="_pg_link" target="_self">
					                            <span class="thumb">
					                            	<img src="<c:out value="${cdnDomain}${writableRow.PRD_IMG}"/>" 
		                                    				class="thumb200" alt="<c:out value="${writableRow.PRD_MST_NM }"/>" />
					                            </span>
					                            <span class="subject"><c:out value="${writableRow.PRD_MST_NM }"/></span>
					                        </a>
					                        <p class="order-code">
					                            <span class="blind">주문번호</span>
					                            <a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}"/>/mobile/mypage/myShoppingInfo.do?ORD_MST_CD=<c:out value="${writableRow.ORD_MST_CD }" />','_self');" class="_pg_link" target="_self">
					                            	<c:out value="${writableRow.ORD_MST_CD }"/>
					                            </a>
					                        </p>
					                        <p class="date">
					                            <span class="small">주문일 <ui:formatDate value="${writableRow.ORD_MST_ORD_DT }" pattern="yyyy.MM.dd"/></span>
					                        </p>
					                    </div>
					                    <div class="action">
					                        <a href="javascript:goWriteProductComment('<c:out value="${writableRow.ORD_PRD_IDX }"/>', '<c:out value="${writableRow.ORD_PRD_MST_CD }"/>');" class="button _pg_link"><span>상품후기</span></a>
					                    </div>
					                </li>
				                </c:forEach>
				            </ul>
	           			</c:when>
	           			<c:otherwise>
	           				<p class="no-more">
			                	작성 가능한 상품후기가 없습니다.
				            </p>
	           			</c:otherwise>
	           		</c:choose>
		        </div><!-- // product-list-wrap -->
			</form>
			
	        <form id="pageFrm" name="pageFrm">
	       		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	            <div class="section-pagination"><!-- section pagination -->
	                <ui:frontpaging paging="${paging }" jsFunction="goPage" />
	            </div><!-- // section pagination -->
            </form>
				
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
	// 페이지 이동
    goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myWritableProductCommentList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 상품후기 작성 폼으로 이동
    goWriteProductComment = function(prdIdx, prdMstCd){
    	var $frm = $("#frm");
    	$frm.find("#prdIdx").val(prdIdx);
    	$frm.find("#prdMstCd").val(prdMstCd);
    	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductCommentForm.do", "target":"_self", "method":"post"}).submit();
    };
});
//]]>
</script>
</body>
</html>