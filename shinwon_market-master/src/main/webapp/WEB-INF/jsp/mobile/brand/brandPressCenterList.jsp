<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-brand marmot"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>BRAND STORY</span></h3>
		    <a href="javascript:;" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- warp -->

				<div class="tab-b item-3"><!-- tab-b -->
				    <ul class="tab">
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandAboutMarmot.do"><span>ABOUT<br />MARMOT</span></a></li>
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandHistoryMarmot.do"><span>HISTORY</span></a></li>
				        <li class="active"><a href="javascript:;"><span>PRESS CENTER </span></a></li>
				    </ul>
				</div><!-- // tab-b -->

				<div class="gap"><!-- gap -->
					<div class="grid head-actions"><!-- head-actions -->
					    <div class="col-111 total">
					        <strong class="primary">총 <span class="warning"><fmt:formatNumber value="${totalCount }" groupingUsed="true" /></span>개의 게시물이 있습니다.</strong>
					    </div>
					</div><!-- // head-actions -->
				
					<div class="grid section-board">
					    <c:choose>
							<c:when test="${not empty brandPressCenterList }">
							    <ul class="photo-list">
							        <c:forEach var="brandPressCenterRow" items="${brandPressCenterList }" varStatus="i">
								        <li class="row">
								            <a href="javascript:;" class="brandPressCenterView" data-con_mst_idx = "${brandPressCenterRow.CON_MST_IDX }" data-con_cmn_com_idx = "${brandPressCenterRow.CON_CMN_COM_IDX }">
								                <span class="img-wrap">
								                    <img src="<c:out value="${cdnDomain }"/>${brandPressCenterRow.CMM_FLE_ATT_PATH}${brandPressCenterRow.CMM_FLE_SYS_NM}" alt="보도자료" />
								                </span>
								                <span class="title">
								                    <c:out value="${brandPressCenterRow.CON_MST_TITLE }"/>
								                </span>
								                <span class="date">
								                    <ui:formatDate value="${brandPressCenterRow.CON_MST_REG_DT }" pattern="yyyy.MM.dd"/>
								                </span>
								            </a>
								        </li>
							        </c:forEach>
								</ul>
							</c:when>
							<c:otherwise>
								<div class="section-message message">
	                            	<p>보도자료가 없습니다.</p>
	                        	</div>
							</c:otherwise>
						</c:choose>
					</div>
				
					<form id="frm" name="frm">
						<input type="hidden" name="CON_MST_IDX" value="" />
						<input type="hidden" name="CON_CMN_COM_IDX" value=""/>
						<input type="hidden" name="CON_MST_TYPE" value="${commandMap.CON_MST_TYPE }"/>				
						<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
			            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			            <input type="hidden" name="searchCmnComIdx" value="<c:out value="${commandMap.searchCmnComIdx }"/>"/>  
			               
			            <div class="section-pagination"><!-- section pagination -->
							<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			            </div><!-- // section pagination -->
		            </form>
				
					<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>
				
				</div><!-- // gap -->
    
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

	$(function(){
		// 제목 클릭 이벤트
	    $(document).on("click", ".brandPressCenterView", function () 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='CON_MST_IDX']").val($(this).data("con_mst_idx"));
	        $frm.find("input[name='CON_CMN_COM_IDX']").val($(this).data("con_cmn_com_idx"));
	        $frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/brand/brandPressCenterView.do", "target":"_self", "method":"get"}).submit();
	    });
		
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brandPressCenterList.do", "target":"_self", "method":"get"}).submit();
	    };
	});

</script>

</body>
</html>