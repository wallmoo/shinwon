<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display mountia"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>매장안내</span></h3>
		    <a href="javascript:;" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- warp -->

				<div class="tab-b"><!-- tab-b -->
				    <ul class="tab">
				        <li class="active"><a href="javascript:;"><span>매장안내</span></a></li>
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandStoreOpenMountia.do"><span>매장개설문의</span></a></li>
				    </ul>
				</div><!-- // tab-b -->
				
				<div class="gap">

					<div class="tab-a"><!-- tab-a -->
					    <c:choose>
					    	<c:when test="${not empty storeAreaList }">
					    		<ul class="tab">
							        <c:forEach var="storeAreaRow" items="${storeAreaList }" varStatus="i">
										<li class="<c:if test="${storeAreaRow.AREA_CD eq commandMap.searchAreaCd}">active</c:if>">
											<a href="javascript:;" class="storeArea" data-area_cd = "${storeAreaRow.AREA_CD }"><span>${storeAreaRow.AREA_NM }</span></a>
										</li>
							        </c:forEach>
							    </ul>	
					    	</c:when>
					    </c:choose>
					</div><!-- // tab-a -->
	
					<div class="grid head-actions"><!-- head-actions -->
					    <div class="col-1-1 text-left">
					        <strong class="primary">
					            <span class="warning">${searchAreaNm }</span>에는 총 
					            <span class="warning">${mountiaTotalCount }</span>개의 매장이 있습니다.
					        </strong>
					    </div>
					</div><!-- // head-actions -->
	
					<div class="section-board section-shop-list"><!-- section-shop-list -->
						<c:choose>
							<c:when test="${not empty mountiaStoreList }">
								<c:forEach var="mountiaStoreRow" items="${mountiaStoreList }" varStatus="i">
									<div class="grid row"><!-- list -->
									    <div class="col-3-4 info">
									        <p class="reset name">
									            <span class="icon map"><em>위치</em></span>
									            <span class="primary"><c:out value="${mountiaStoreRow.BCNC_NM }"/> | <c:out value="${mountiaStoreRow.TEL }"/></span>
									        </p>
									        <p class="reset address">
									            <span class="info"><c:out value="${mountiaStoreRow.ADDR }"/></span>
									        </p>
									    </div>
									    <div class="col-1-4">
									        <div class="section-button actions">
									        	<a href="javascript:;" class="button primary full" data-store_api_addr = "${mountiaStoreRow.API_ADDR }" data-store_addr = "${mountiaStoreRow.ADDR }" data-store_tel="${mountiaStoreRow.TEL }" data-store_nm="${mountiaStoreRow.BCNC_NM }">
									            	<span>지도보기</span>
									            </a>
									        </div>
									    </div>
									</div><!-- // list -->
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="section-message message">
		                            <p>해당 매장이 없습니다.</p>
		                        </div>	
							</c:otherwise>
						</c:choose>
					</div><!-- // section-shop-list -->
					
					<form id="frm" name="frm">
			            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			            <input type="hidden" name="searchAreaCd" value="<c:out value="${commandMap.searchAreaCd }"/>"/>
			            <input type="hidden" name="searchStoreAddr" value="<c:out value="${commandMap.searchStoreAddr }"/>"/>
			            <input type="hidden" name="searchStoreApiAddr" value="<c:out value="${commandMap.searchStoreApiAddr }"/>"/>
			            <input type="hidden" name="searchStoreTel" value="<c:out value="${commandMap.searchStoreTel }"/>"/>
			            <input type="hidden" name="searchStoreNm" value="<c:out value="${commandMap.searchStoreNm }"/>"/>
		               
			            <div class="section-pagination"><!-- section pagination -->
							<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			            </div><!-- // section pagination -->
	            	</form>
	            	
            	</div>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // warp -->
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

	$(function()
	{
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brandStoreIntroMountia.do", "target":"_self", "method":"get"}).submit();
	    };
	    
	    // 탭 클릭 시 
	    $(".storeArea").on("click",function()
	    {
	    	var $frm = $("#frm");
	    	$frm.find("input[name='cPage']").val("1");	    	
	        $frm.find("input[name='searchAreaCd']").val($(this).data("area_cd"));
	        $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brandStoreIntroMountia.do", "target":"_self", "method":"get"}).submit();
	    });
	    
	    // 지도보기 클릭 시 
	    $(".full").on("click",function()
	    {
	    	var $frm = $("#frm");
	    	$frm.find("input[name='searchStoreAddr']").val($(this).data("store_addr"));
	    	$frm.find("input[name='searchStoreTel']").val($(this).data("store_tel"));
	    	$frm.find("input[name='searchStoreNm']").val($(this).data("store_nm"));
	    	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brandStoreAddrInfo.do", "target":"_self", "method":"get"}).submit();
	    });
	});

</script>

</body>
</html>