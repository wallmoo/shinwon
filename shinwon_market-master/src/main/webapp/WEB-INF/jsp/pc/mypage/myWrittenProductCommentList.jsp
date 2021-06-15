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
		                    <li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myWritableProductCommentList.do"><span>작성 가능한 상품후기(<c:out value="${writableCount }"/>)</span></a></li>
		                    <li class="active"><a href="javascript:;"><span>등록한 상품후기(<c:out value="${writtenCount }"/>)</span></a><span class="blind">현재위치</span></li>
		                </ul><!-- // tab-a -->
		                
		                <c:choose>
		                	<c:when test="${not empty writtenList }">
		                		<ul class="review-list"><!-- review-list -->
				                    <c:forEach var="writtenRow" items="${writtenList }" varStatus="i">
				                    	<li class="col">
					                        <p class="product-name">
												<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${writtenRow.PRD_PRD_MST_CD}" target="_blank">
					                            	<c:out value="${writtenRow.PRD_MST_NM }"/>
					                            </a>
					                        </p>
					                        <div class="desc">
					                            <span class="thumb">
					                            	<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${writtenRow.PRD_PRD_MST_CD}" target="_blank">
						                            	<img src="<c:out value="${cdnDomain}${writtenRow.PRD_IMG}"/>" 
						                            			class="thumb125" alt="<c:out value="${writtenRow.PRD_MST_NM }"/>" />
													</a>
					                            </span>
					                            <div class="score-total">
					                                <span class="blind">상품평 총점 10점 만점 중</span>
					                                <i class="ico_star2"><i class="star-<c:out value="${writtenRow.PRD_REV_AVG_STAR }"/>"></i></i>
					                                <strong class="warning"><c:out value="${writtenRow.PRD_REV_AVG_STAR_POINT }"/></strong>
					                                <span class="blind">점</span>
					                            </div>
					                            <ul>
					                            	<li>
					                                    <span class="tit">기능</span>
					                                    <span class="blind">5점 만점 중</span>
					                                    <i class="ico_star2">
					                                    	<i class="star-<c:out value="${writtenRow.PRD_REV_FNC_STAR}"/>">
					                                    		<span class="ir">
					                                    			<c:out value="${writtenRow.PRD_REV_FNC_STAR }"/>점			
					                                    		</span>
				                                    		</i>
					                                    </i>
					                                </li>
					                                <li>
					                                    <span class="tit">가격</span>
					                                    <span class="blind">5점 만점 중</span>
					                                    <i class="ico_star2">
					                                    	<i class="star-<c:out value="${writtenRow.PRD_REV_PRC_STAR}"/>">
					                                    		<span class="ir">
					                                    			<c:out value="${writtenRow.PRD_REV_PRC_STAR}"/>점
					                                    		</span>
					                                    	</i>
					                                    </i>
					                                </li>
					                                <li>
					                                    <span class="tit">만족도</span>
					                                    <span class="blind">5점 만점 중</span>
					                                    <i class="ico_star2">
					                                    	<i class="star-<c:out value="${writtenRow.PRD_REV_SCORE_STAR}"/>">
					                                    		<span class="ir">
					                                    			<c:out value="${writtenRow.PRD_REV_SCORE_STAR }"/>점
					                                    		</span>
					                                    	</i>
					                                    </i>
					                                </li>
					                            </ul>
					                        </div>
					                        <p class="subject">
					                        	<c:if test="${not empty writtenRow.fileList}">
					                            	<span class="icon picture"><em class="blind">사진이 포함된 게시글</em></span>
					                            </c:if>
					                            <c:if test="${writtenRow.PRD_REV_CHN_GBN eq 'M'}">
					                            	<span class="icon phone"><em class="blind">모바일에서 작성된 게시글</em></span>
					                            </c:if>					                            
					                            <c:out value="${writtenRow.PRD_REV_TITLE }"/>
					                        </p>
					                        <div class="core">
					                            <ui:replaceLineBreak content="${writtenRow.PRD_REV_CONTENTS }"/>
					                            <br /><br />
					                            <c:if test="${not empty writtenRow.fileList}">
					                            	<c:forEach items="${writtenRow.fileList}" var="fileRow" varStatus="i">
														<img src="<c:out value="${cdnDomain }"/><c:out value="${fileRow.CMM_FLE_ATT_PATH }"/><c:out value="${fileRow.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${fileRow.CMM_FLE_ALT_TXT }"/>" />					                            		
					                            	</c:forEach>
					                            </c:if>
					                        </div>
					                        <p class="date">
					                            <ui:formatDate value="${writtenRow.PRD_REV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
					                            <span class="blind">에 작성</span>
					                        </p>
					                        <a href="javascript:goWriteProductComment('<c:out value="${writtenRow.PRD_ORD_PRD_IDX }"/>', '<c:out value="${writtenRow.PRD_PRD_MST_CD }"/>', '<c:out value="${writtenRow.PRD_REV_IDX }"/>');" 
				                        		class="btn_st0 btn_white modify"><span>수정</span></a>
					                    </li>
				                    </c:forEach>
				                </ul><!-- // review-list -->
		                	</c:when>
		                	<c:otherwise>
		                		<div class="product-list-a my-product my-review">
				                	<p class="message no-more">
				                       	작성한 상품후기가 없습니다.
				                    </p>
				                </div>
		                	</c:otherwise>
		                </c:choose>
		                
		                <ul class="list list-a small mt20">
		                    <li>구매하신 상품에 남겨주신 상품 후기를 확인하실 수 있습니다.</li>
		                    <li>상품후기는 배송완료 상품으로 주문일로부터 90일 이내 작성이 가능합니다.</li>
		                    <li>배송완료 단계에서 상품 후기를  작성하시면 구매확정으로 단계가 변경됩니다.</li>
		                </ul>
		
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
	        $pageFrm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myWrittenProductCommentList.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 상품후기 작성 팝업
	    goWriteProductComment = function(prdIdx, prdMstCd, prdRevIdx){
	    	window.open("<c:out value="${frontDomain}"/>/pc/mypage/myProductCommentPopup.do?PRD_ORD_PRD_IDX="+prdIdx+"&PRD_PRD_MST_CD="+prdMstCd+"&PRD_REV_IDX=" + prdRevIdx,"myProductCommentPopup","width=1024,height=768,scrollbars=no,target=_blank");
	    };
	});
//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>