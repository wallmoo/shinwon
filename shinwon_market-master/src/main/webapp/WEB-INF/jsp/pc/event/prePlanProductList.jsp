<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-display view"><!-- page-display view : 기획전 -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	        <div id="breadcrumb" class="wrap">
	            <div class="holder">
	                <span>홈</span>
	                <span class="gt">&gt;</span>
	                <strong class="warning">기획전</strong>
	            </div>
	        </div>
	    </div><!-- // breadcrumb -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

				<div class="section-title">
				    <h3 class="title"><span><c:out value="${planInfo.PLN_MST_TITLE }"/></span></h3>
				    <div class="more">
				        <select class="select" id="ingPlanList">
				            <option value="">진행중인 다른 기획전 선택 </option>
                            <c:choose>
                            	<c:when test="${not empty ingPlanList }">
                            		<c:forEach var="ingPlanRow" items="${ingPlanList }" varStatus="status">     
	                            		<option value="<c:out value="${ingPlanRow.PLN_MST_IDX }"/>" ><c:out value="${ingPlanRow.PLN_MST_TITLE }"/></option>
	                            	</c:forEach>
                            	</c:when>
                            	<c:otherwise>
                            		<option value="" >진행중인 기획전이 없습니다.</option>	
                            	</c:otherwise>
                            </c:choose>
				        </select>
				    </div>
				</div>

				<h4 class="title title-event">
					<span>
<%-- 						[<c:out value="${planInfo.PLN_MST_GUBUN eq 'Y' ? '단독' : '본사' }"/> 기획전]  --%>
						<ui:formatDate value="${planInfo.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${planInfo.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/>
					</span>
				</h4>

				<div class="event-view-body"><!-- event-view-body -->
				    <div class="holder">
				        ${planInfo.PLN_MST_PC_BANNER }
				    </div>
				</div><!-- // event-view-body -->

				<div class="tab-a mt20 tab-anchor"><!-- tab-anchor -->
                    <ul class="tab js-scrollTo" data-margin="165">
                        <c:forEach var="groupRow" items="${detailGroupList }" varStatus="i">
				        	<li><a href="#planGroup_<c:out value="${groupRow.PLN_GRP_IDX }"/>"><span><c:out value="${groupRow.PLN_GRP_TITLE }"/></span></a></li>
				        </c:forEach>
                    </ul>
                </div><!-- // tab-anchor -->
				
				<c:choose>
					<c:when test="${not empty detailGroupList and not empty detailList }">
                    	<c:forEach var="groupRow" items="${detailGroupList }" varStatus="i">
                    		<div id="planGroup_<c:out value="${groupRow.PLN_GRP_IDX }"/>" class="section-display-title"><!-- title -->
							    <h5 class="reset"><span><c:out value="${groupRow.PLN_GRP_TITLE }"/></span></h5>
							    <div class="more">
							        <a href="#top" class="js-scrollTo"><span class="icon"></span></a>
							    </div>
							</div><!-- // title -->
							<div id="list" class="list-product item-${groupRow.PLN_GRP_COL }-large image"><!-- list-product -->
								<ul class="reset core">
									<c:forEach var="item" items="${detailList }" varStatus="y">									
										<c:if test="${groupRow.PLN_GRP_IDX eq item.PLN_GRP_IDX }">
									    	<li class="item nth-child-${item.RNK_NUM}"><!-- item -->
												<div class="module">
											        <div class="col thumb" data-code="${item.PLN_PRD_MST_CD }" data-colors="${item.PRODUCT_RGB }">
											            <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PLN_PRD_MST_CD}"><img src="<c:out value="${cdnDomain }${item.IMG_THUMBNAIL }"/>"  alt="" /></a>
											        </div>
										        	<div class="col core">
											            <div class="desc">
											                <p class="name">
											                    <a href="/pc/product/product.do?prdMstCd=${item.PLN_PRD_MST_CD}"><c:out value="${item.PRD_MST_NM }" /></a>
											                </p>
											            </div>
											            <div class="prices">
											                <p class="price-after">
											                	<fmt:formatNumber value="${item.PLN_PRD_PRICE }" groupingUsed="true" />원
											                </p>
											            </div>
											            <div class="labels">
											                <c:if test="${item.ICON_NEW eq 'Y' }">
											                	<span class="label new">NEW</span>
											                </c:if>
											                <c:if test="${item.ICON_MD eq 'Y' }">
																<span class="label md">MD추천</span>
											                </c:if>
											            </div>
										        	</div>
										    	</div>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div><!-- // list-product -->
						</c:forEach>
					</c:when>
				</c:choose>
				
				<div class="section-button"><!-- section button -->
			    	<a href="javascript:;" id="goList" class="button primary large"><span>기획전목록</span></a>
				</div><!-- // section button -->

				<form id="frm" name="frm">
	            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	            	<input type="hidden" name="PLN_MST_IDX" value=""/>
	            	<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
            	</form>
				<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

			</div><!-- wrap -->
		</div><!-- // container -->

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>