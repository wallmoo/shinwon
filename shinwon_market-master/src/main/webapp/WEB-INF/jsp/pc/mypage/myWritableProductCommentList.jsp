<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
		<section id="wrap">

			<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
			<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

			<%-- 각 화면 본문 시작 --%>
			<!-- #container S -->
		    <article id="container" class="container">
		        <div class="minW contents"><!-- contents S -->
		
		            <dl class="loc">
		                <dt class="blind">현재 카테고리 경로</dt>
		                <dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
		                <dd><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do"><span>마이페이지</span></a></dd>
		                <dd><a href="javascript:void(0)"><span>쇼핑활동</span></a></dd>
		                <dd class="l"><a href="javascript:void(0)"><span>상품후기</span></a></dd>
		            </dl>
		
		            <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
		
		            <div id="body"><!-- #body -->
		
		                <h3 class="title">상품후기</h3>
		
		                <c:if test="${summaryMap.MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE}">
			                <div class="my-mileage"><!-- my-mileage -->
			                    <p>
		                        	적립 예상 크라운&nbsp;&nbsp;&nbsp;&nbsp;
			                        <span class="warning"><fmt:formatNumber value="${writableCount == 0 ? 0 : (writableCount*500)}" groupingUsed="true"/></span>C
			                    </p>
			                    <ul class="ct">
			                        <li>
			                            <div class="module">
			                                상품후기 작성하면 :
			                                <span class="warning">200</span>C 적립
			                            </div>
			                        </li>
			                        <li>
			                            <div class="module">
			                                포토후기 작성하면 :
			                                <span class="warning">500</span>C 적립
			                            </div>
			                        </li>
			                    </ul>
			                </div><!-- my-mileage -->
		                </c:if>
		
		                <ul class="ct tab-a item-2 mt40"><!-- tab-a -->
		                    <li class="active"><a href="javascript:;"><span>작성 가능한 상품후기(<c:out value="${writableCount }"/>)</span></a><span class="blind">현재위치</span></li>
		                    <li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myWrittenProductCommentList.do"><span>등록한 상품후기(<c:out value="${writtenCount }"/>)</span></a></li>
		                </ul><!-- // tab-a -->
		
		                <div class="product-list-a my-product my-review"><!-- product-list-a -->
		                    <c:choose>
	                   			<c:when test="${not empty writableList }">
	                   				<ul class="ct">
				                        <c:forEach var="writableRow" items="${writableList }" varStatus="i">
				                        	<li>
					                            <div class="module">
					                                <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${writableRow.ORD_PRD_MST_CD}" target="_blank">
					                                    <span class="thumb">
					                                    	<img src="<c:out value="${cdnDomain}${writableRow.PRD_IMG}"/>" 
					                                    			class="thumb200" alt="<c:out value="${writableRow.PRD_MST_NM }"/>" />
					                                    </span>
					                                    <span class="subject"><c:out value="${writableRow.PRD_MST_NM }"/></span>
					                                </a>
					                                <p class="option">
					                                	<a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myShoppingInfo.do?ORD_MST_CD=${writableRow.ORD_MST_CD}" target="_blank">
					                                		<c:out value="${writableRow.ORD_MST_CD }"/>
					                                	</a>
					                                </p>
					                                <p class="date">주문일 <ui:formatDate value="${writableRow.ORD_MST_ORD_DT }" pattern="yyyy.MM.dd"/></p>
					                                <p class="action">
					                                    <a href="javascript:goWriteProductComment('<c:out value="${writableRow.ORD_PRD_IDX }"/>', '<c:out value="${writableRow.ORD_PRD_MST_CD }"/>');" 
					                                    	class="btn_st0 btn_white small"><span>상품후기</span></a>
					                                </p>
					                            </div>
					                        </li>
				                        </c:forEach>
				                    </ul>
	                   			</c:when>
	                   			<c:otherwise>
	                   				<p class="message no-more">
			                        	작성 가능한 상품후기가 없습니다.
				                    </p>
	                   			</c:otherwise>
		                    </c:choose>
		                </div><!-- // product-list-a -->
		
		                <form id="pageFrm" name="pageFrm">
		            		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			                <div class="section-pagination"><!-- section pagination -->
			                    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
			                </div><!-- // section pagination -->
		                </form>
		
		            </div><!-- // #body -->
		
		        </div><!--// .contents E -->
		    </article>
		    <!--// #container E -->
			<%-- 각 화면 본문 끝 --%>

			<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
			
		</section>
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
	        $pageFrm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myWritableProductCommentList.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 상품후기 작성 팝업
	    goWriteProductComment = function(prdIdx, prdMstCd){
    		window.open("<c:out value="${frontDomain}"/>/pc/mypage/myProductCommentPopup.do?PRD_ORD_PRD_IDX="+prdIdx+"&PRD_PRD_MST_CD="+prdMstCd,"myProductCommentPopup","width=1024,height=768,scrollbars=no,target=_blank");	    		
	    };
	});
//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>