<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>기획전</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap gutter"><!-- wrap -->
			    <div class=" grid section-plan">
			        <div class="col-1-1 plan-item">
			            <div class="item">
			                <span class="plan-date">
<%-- 			                [<c:out value="${planInfo.PLN_MST_GUBUN eq 'Y' ? '단독' : '본사' }"/>]  --%>
			                <ui:formatDate value="${planInfo.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${planInfo.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
			                <strong class="plan-title"><c:out value="${planInfo.PLN_MST_TITLE }"/></strong>
			                <div class="img-wrap mt15">
			                    ${planInfo.PLN_MST_MOBILE_BANNER }
			                </div>
			            </div>
			        </div>
			    </div>
			</div>

			<div class="wrap">

    			<c:choose>
					<c:when test="${not empty detailGroupList and not empty detailList }">
		    			<c:forEach var="groupRow" items="${detailGroupList }" varStatus="i">
		    				<h4 class="title"><span><c:out value="${groupRow.PLN_GRP_TITLE }"/></span></h4>
		
							<div class="wrap-product image mt10"><!-- wrap-product -->
								<div class="list-product item-2 image"><!-- list-ptoduct -->
									<c:forEach var="item" items="${detailList }" varStatus="y">									
										<c:if test="${groupRow.PLN_GRP_IDX eq item.PLN_GRP_IDX }">
											<div class="item-product" data-sale="null"><!-- item -->
												<div class="module"><!-- module -->
													<div class="thumb"><!-- thumb -->
													    <a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${item.PLN_PRD_MST_CD}" />', '_self');" ></a>;
													    	<img src="<c:out value="${cdnDomain }${item.IMG_THUMBNAIL}"/>" alt="${item.PRD_MST_NM }" class="thumb144">
													    </a>
													</div><!-- // thumb -->
													<div class="desc"><!-- desc -->
													    <c:if test="${not empty item.PRM_TEXT}" >
														    <p class="hello">
														    	<span><c:out value="${item.PRM_TEXT }" /></span>
														    </p>	
													    </c:if>
													    <p class="name">
													        <a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${item.PLN_PRD_MST_CD}" />', '_self'); ">
													        	<span>${item.PRD_MST_NM}</span>
													        </a>
													    </p>
													    <p class="price-after">
													        <fmt:formatNumber value="${item.PLN_PRD_PRICE }" groupingUsed="true" />원
													    </p>
													    <p class="labels">
													        <c:if test="${item.ICON_NEW eq 'Y' }">
											                	<span class="label new">NEW</span>
											                </c:if>
											                <c:if test="${item.ICON_MD eq 'Y' }">
																<span class="label md">MD추천</span>
											                </c:if>
													    </p>
													</div><!-- // desc -->
												</div><!-- // module -->
											</div><!-- // item -->
										</c:if>
									</c:forEach>
								</div><!-- // list-ptoduct -->
							</div><!-- // wrap-product -->

						<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>
						</c:forEach>
					</c:when>
				</c:choose>

				<div class="grid section-button actions gap"><!-- section-button -->
				    <div class="col-1-1">
				        <a href="javascript:;" id="goList" class="button primary full">
				            <span>기획전 목록</span>
				        </a>
				    </div>
				</div><!-- // section-button -->
				
				<form id="frm" name="frm">
				   	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
				   	<input type="hidden" name="PLN_MST_IDX" value=""/>
				   	<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
			  	</form>
			</div><!-- // wrap -->
			
		</div><!-- // container -->
	</div><!-- // contents -->
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

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