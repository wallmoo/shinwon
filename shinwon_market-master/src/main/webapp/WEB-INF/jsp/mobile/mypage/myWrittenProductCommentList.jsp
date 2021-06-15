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
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myWritableProductCommentList.do','_self');" class="_pg_link" target="_self">작성 가능한 상품후기<em>(<c:out value="${writableCount }"/>)</em></a></li>
	                <li class="active"><a href="javascript:;">등록한 상품후기<em>(<c:out value="${writtenCount }"/>)</em></a><span class="blind">현재위치</span></li>
	            </ul>
	        </div><!-- // tab-a -->
	
			<form id="frm" name="frm">
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
				<input type="hidden" name="PRD_ORD_PRD_IDX" id="prdIdx" value=""/>
				<input type="hidden" name="PRD_PRD_MST_CD" id="prdMstCd" value=""/>
				<input type="hidden" name="PRD_REV_IDX" id="prdRevIdx" value=""/>
		        <div class="padder">
		            <c:choose>
	                	<c:when test="${not empty writtenList }">
	                		<ul class="review-list"><!-- review-list -->
				                <c:forEach var="writtenRow" items="${writtenList }" varStatus="i">
					                <li class="col">
					                    <div class="desc">
					                        <div class="thumbnail">
					                            <span class="thumb">
													<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${writtenRow.PRD_PRD_MST_CD}" class="_pg_link" target="_self">				                            
					                            		<img src="<c:out value="${cdnDomain}${writtenRow.PRD_IMG}"/>" alt="<c:out value="${writtenRow.PRD_MST_NM }"/>" />
					                            	</a>
					                            </span>
					                        </div>
					                        <div class="info">
				                            	<p class="product-name">
													<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${writtenRow.PRD_PRD_MST_CD}" class="_pg_link" target="_self">
				                            			<c:out value="${writtenRow.PRD_MST_NM }"/>
				                            		</a>
				                            	</p>
					                            <ul>
					                                <li>
					                                    <span class="tit">기능</span>
					                                    <i class="ico_star0">
					                                    	<i class="star_<c:out value="${writtenRow.PRD_REV_FNC_STAR}"/>">
					                                    		<span class="blind">별점 10점 만점 중 <c:out value="${writtenRow.PRD_REV_FNC_STAR }"/>점</span>
					                                    	</i>
					                                    </i>
					                                </li>
					                                <li>
					                                    <span class="tit">가격</span>
					                                    <i class="ico_star0">
					                                    	<i class="star_<c:out value="${writtenRow.PRD_REV_PRC_STAR}"/>">
					                                    		<span class="blind">별점 10점 만점 중 <c:out value="${writtenRow.PRD_REV_PRC_STAR}"/>점</span>
					                                    	</i>
					                                    </i>
					                                </li>
					                                <li>
					                                    <span class="tit">만족도</span>
					                                    <i class="ico_star0">
					                                    	<i class="star_<c:out value="${writtenRow.PRD_REV_SCORE_STAR}"/>">
					                                    		<span class="blind">별점 10점 만점 중 <c:out value="${writtenRow.PRD_REV_SCORE_STAR }"/>점</span>
					                                    	</i>
					                                    </i>
					                                </li>
					                            </ul>
					                            <div class="total">
					                                <span class="blind">상품평 총점 10점 만점 중</span>
					                                <i class="ico_star0"><i class="star_<c:out value="${writtenRow.PRD_REV_AVG_STAR }"/>"><span class="blind">별점 10점 만점 중</span></i></i>
					                                <strong class="warning"><c:out value="${writtenRow.PRD_REV_AVG_STAR_POINT }"/></strong>
					                                <span class="blind">점</span>
					                            </div>
					                        </div>
					                    </div>
					
					                    <div class="core">
					                        <p class="subject">
					                            <c:if test="${not empty writtenRow.fileList}">
					                            	<span class="icon picture"><em class="blind">사진이 포함된 게시글</em></span>
					                            </c:if>
					                            <c:if test="${writtenRow.PRD_REV_CHN_GBN eq 'M'}">
					                            	<span class="icon phone"><em class="blind">모바일에서 작성된 게시글</em></span>
					                            </c:if>
					                            <c:out value="${writtenRow.PRD_REV_TITLE }"/>
					                        </p>
					                        <div class="detail">
					                            <ui:replaceLineBreak content="${writtenRow.PRD_REV_CONTENTS }"/><br /><br />
					                            <c:if test="${not empty writtenRow.fileList}">
					                            	<c:forEach items="${writtenRow.fileList}" var="fileRow" varStatus="i">
														<img src="<c:out value="${cdnDomain }"/><c:out value="${fileRow.CMM_FLE_ATT_PATH }"/><c:out value="${fileRow.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${fileRow.CMM_FLE_ALT_TXT }"/>" />					                            		
					                            	</c:forEach>
					                            </c:if>
					                        </div>
					
					                        <div class="ct mt20">
					                            <div class="fl date">
					                                <ui:formatDate value="${writtenRow.PRD_REV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
					                                <span class="blind">에 작성</span>
					                            </div>
					                            <div class="fr">
					                                <a href="javascript:goWriteProductComment('<c:out value="${writtenRow.PRD_ORD_PRD_IDX }"/>', '<c:out value="${writtenRow.PRD_PRD_MST_CD }"/>', '<c:out value="${writtenRow.PRD_REV_IDX }"/>');" class="button small _pg_link"><span>수정</span></a>
					                            </div>
					                        </div>
					                    </div>
					                </li>
				                </c:forEach>
				            </ul><!-- // review-list -->
	                	</c:when>
	                	<c:otherwise>
	           				<p class="no-more">
			                	작성한 상품후기가 없습니다.
				            </p>
	           			</c:otherwise>
	                </c:choose>
		
		            <ul class="list list-a mt20">
		                <li>구매하신 상품에 남겨주신 상품 후기를 확인하실 수 있습니다.</li>
		                <li>상품후기는 배송완료 상품으로 주문일로부터 90일 이내 작성이 가능합니다.</li>
		                <li>배송완료 단계에서 상품 후기를  작성하시면 구매확정으로 단계가 변경됩니다.</li>
		            </ul>
		        </div>
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
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myWrittenProductCommentList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 상품후기 작성 팝업
    goWriteProductComment = function(prdIdx, prdMstCd, prdRevIdx){
    	var $frm = $("#frm");
    	$frm.find("#prdIdx").val(prdIdx);
    	$frm.find("#prdMstCd").val(prdMstCd);
    	$frm.find("#prdRevIdx").val(prdRevIdx);
    	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductCommentForm.do", "target":"_self", "method":"post"}).submit();
    };
});
//]]>
</script>
</body>
</html>