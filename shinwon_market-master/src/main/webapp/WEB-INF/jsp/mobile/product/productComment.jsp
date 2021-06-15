<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-detail blackyak"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->

     <div id="contents"><!-- contents -->

                <div class="section-title"><!-- section-title-->
                    <h3><span>상품평</span></h3>
                    <a href="javascript:goBack();" class="back" id="goProductDetail"><span class="icon"><em>돌아가기</em></span></a>
                </div><!-- // section-title -->

				<div class="container"><!-- container -->
				
                    <div class="wrap gutter"><!-- wrap -->

                        <ul class="list list-a">
                            <li>상품평은 상품을 구매한 회원만 작성 가능합니다.</li>
                            <li>성격에 맞지 않는 광고성, 단순반복성, 저작권침해 등 불건전한 내용을 올리실 경우 통보 없이 임의로 삭제될 수 있으니 양해 부탁드립니다. </li>
                        </ul>

                        <div class="section-graph"><!-- section-graph -->
                            <div class="grid summary">
                                <p class="title">이 아이템을 구매한 분들의 상품 만족도</p>
                                <div class="col-1-2 text-right">
                                    총
                                    <strong class="warning">${productReputation.REP_CNT}</strong>
                                    개
                                </div>
                                <div class="col-1-2 text-left">
                                	<c:if test="${productReputation.REP_POINT ne 0}" >
                                    	<span class="star star-${productReputation.REP_POINT} large"><em>${productReputation.REP_POINT}</em></span>
                                    </c:if>
                                </div>
                            </div>
                            <div class="grid core">
                                <div class="col-1-2">
                                    <p class="category">SIZE</p>
                                    <div class="group">
                                        <div class="grid inner">
                                            <div class="col-1-3 item">
                                                <p class="percent">${productRevStar.SIZE_THREE_STAR}%</p>
                                                <div class="graph">
                                                    <div class="amount" style="height: ${productRevStar.SIZE_THREE_STAR}%;"></div>
                                                </div>
                                                <p class="desc">크다</p>
                                            </div>
                                            <div class="col-1-3 item">
                                                <p class="percent">${productRevStar.SIZE_TWO_STAR}%</p>
                                                <div class="graph">
                                                    <div class="amount" style="height: ${productRevStar.SIZE_TWO_STAR}%;"></div>
                                                </div>
                                                <p class="desc">딱맞다</p>
                                            </div>
                                            <div class="col-1-3 item">
                                                <p class="percent">${productRevStar.SIZE_ONE_STAR}%</p>
                                                <div class="graph">
                                                    <div class="amount" style="height: ${productRevStar.SIZE_ONE_STAR}%;"></div>
                                                </div>
                                                <p class="desc">작다</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1-2">
                                    <p class="category">COLOR</p>
                                    <div class="group">
                                        <div class="grid inner">
                                            <div class="col-1-3 item">
                                                <p class="percent">${productRevStar.COLOR_ONE_STAR}%</p>
                                                <div class="graph">
                                                    <div class="amount" style="height: ${productRevStar.COLOR_ONE_STAR}%;"></div>
                                                </div>
                                                <p class="desc">밝다</p>
                                            </div>
                                            <div class="col-1-3 item">
                                                <p class="percent">${productRevStar.COLOR_TWO_STAR}%</p>
                                                <div class="graph">
                                                    <div class="amount" style="height: ${productRevStar.COLOR_TWO_STAR}%;"></div>
                                                </div>
                                                <p class="desc">화면과 같다</p>
                                            </div>
                                            <div class="col-1-3 item">
                                                <p class="percent">${productRevStar.COLOR_THREE_STAR}%</p>
                                                <div class="graph">
                                                    <div class="amount" style="height: ${productRevStar.COLOR_THREE_STAR}%;"></div>
                                                </div>
                                                <p class="desc">어둡다</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- section-graph -->

                        <div class="grid head-actions"><!-- head-actions -->
                            <div class="col-1-1 total text-left">
                                <a href="javascript:goReputationSearch('ALL');">
                                	<c:if test="${ empty commandMap.searchRevType || commandMap.searchRevType eq 'ALL'}" ><strong class="primary"></c:if>
                                	전체(${productReputation.REP_CNT})
                                	<c:if test="${ empty commandMap.searchRevType || commandMap.searchRevType eq 'ALL'}" ></strong></c:if>
                                </a>
                                &nbsp;/&nbsp;
                                <a href="javascript:goReputationSearch('PHOTO');">
                                 	<c:if test="${commandMap.searchRevType eq 'PHOTO'}" ><strong class="primary"></c:if>
                                	포토상품평(${productReputation.PHOTO_CNT})
                                	<c:if test="${commandMap.searchRevType eq 'PHOTO'}" ></strong></c:if>                               
                                </a>
                                &nbsp;/&nbsp;
                                <a href="javascript:goReputationSearch('TEXT');">
                                 	<c:if test="${commandMap.searchRevType eq 'TEXT'}" ><strong class="primary"></c:if>
                                	일반상품평(${productReputation.TEXT_CNT})
                                	<c:if test="${commandMap.searchRevType eq 'TEXT'}" ></strong></c:if> 
                                </a>
                            </div>
                        </div><!-- // head-actions -->

                        
                       	<c:choose>
						<c:when test="${not empty listReputation}">
							<div id="bbsReview" class="bbs-qna js-bbs-collapse"><!-- bbs-qna -->
							
								<c:forEach var="item" items="${listReputation }" varStatus="status"> 
									<div class="item-bbs"><!-- item -->
		                                <div class="grid head">
		                                    <div class="col-2-3">
		                                        <span class="star star-${item.PRD_REV_SCORE_STAR}"><em>${item.PRD_REV_SCORE_STAR}</em></span>
		                                    </div>
		                                    <div class="col-1-3 text-right">
		                                        <span class="info"><c:out value="${fn:substring(item.PRD_REV_REG_ID,0,(fn:length(item.PRD_REV_REG_ID)-4))}" />****</span>
		                                    </div>
		                                </div>
		                                <div class="subject">
		                                    <a href="#!" class="toggler">
		                                    	<c:if test="${not empty item.REP_IMG}">
													<span class="icon pic"><em>사진첨부</em></span>
                                                </c:if>
		                                        ${item.PRD_REV_TITLE}
		                                    </a>
		                                </div>
		                                <div class="toggle body no-padder"><!-- body -->
		                                	<c:if test="${not empty item.REP_IMG}">
		                                    <div class="pic">
		                                        <img src="${cdnDomain}${item.REP_IMG}" alt="" />
		                                    </div>
		                                    </c:if>
		                                    <div class="grid options">
		                                        <div class="col-1-2">
		                                            <span>SIZE:</span>
		                                            <strong>${Code.PRODUCT_REV_SIZE_NM[item.PRD_REV_SIZE_STAR]}</strong>
		                                        </div>
		                                        <div class="col-1-2">
		                                            <span>COLOR:</span>
		                                            <strong>${Code.PRODUCT_REV_COLOR_NM[item.PRD_REV_COLOR_STAR]}</strong>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="texts">
		                                        ${item.PRD_REV_CONTENTS}
		                                    </div>
		                                </div><!-- // body -->
		                            </div><!-- // item -->
								</c:forEach>
								
							</div>
						</c:when>
						<c:otherwise>
							<div class="section-message message">
	                            <p>조회할 내역이 없습니다.</p>
	                        </div>
						</c:otherwise>
						</c:choose>
						
						<form id="frm" name="frm">
							<input type="hidden" id="searchRevType" name="searchRevType" value="${commandMap.searchRevType }" />
							<input type="hidden" id="cPage" name="cPage" value="${commandMap.cPage }" />
							<input type="hidden" id="prdMstCd" name="prdMstCd" value="${commandMap.PRD_MST_CD}" />
						</form>						
						
                        <div class="section-pagination"><!-- section pagination -->
                           <ui:frontpaging paging="${paging }" jsFunction="goPage" />
                        </div><!-- // section pagination -->

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
$.params = ($.params !== undefined) ? $.params : [];

$(function(){
	
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(cPage);
	    $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/productComment.do", "target":"_self", "method":"get"}).submit();
	};
	
	// 상품평 필터링
	goReputationSearch = function (type) 
	{
		var $frm = $("#frm");
		$frm.find("input[id='cPage']").val("1");
	    $frm.find("input[id='searchRevType']").val(type);
	    $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/productComment.do", "target":"_self", "method":"get"}).submit();
	};
	
	// 상품 상세 페이지로 이동 
	$("#goProductDetail").click(function(){
		var $frm = $("#frm");
		$frm.attr({"action":"<c:out value="${mobileDomain }"/>/mobile/product/product.do", "target":"_self", "method":"get"}).submit();
	});
	
});

</script>
</body>
</html>    