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
			<div class="wrap gutter"><!-- warp -->

				<div class="tab-b item-3"><!-- tab-b -->
				    <ul class="tab">
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandAboutMarmot.do"><span>ABOUT<br />MARMOT</span></a></li>
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandHistoryMarmot.do"><span>HISTORY</span></a></li>
				        <li class="active"><a href="javascript:;"><span>PRESS CENTER </span></a></li>
				    </ul>
				</div><!-- // tab-b -->

				<div class="grid section-view"><!-- section-view -->
				    <div class="col-1-1 view-title">
				        <p><strong><c:out value="${contentsView.CON_MST_TITLE }"/></strong></p>                                
				        <div class="info">
				            <span class="date"><ui:formatDate value="${contentsView.CON_MST_REG_DT }" pattern="yyyy.MM.dd"/></span>
				        </div>
				    </div>
				    <div class="col-1-1 view-content">
				       ${contentsView.CON_MST_MOBILE_PROMOTION }
				    </div>
				</div><!-- // section-view -->

				<div class="grid section-button"><!-- section-button -->
				    <a href="javascript:;" id="goList" class="button primary full"><span>목록</span></a>
				</div><!-- // section-button -->

				<form id="frm" name="frm">
					<input type="hidden" name="CON_MST_IDX" value="" />
					<input type="hidden" name="CON_CMN_COM_IDX" value=""/>
					<input type="hidden" name="CON_MST_TYPE" value="${commandMap.CON_MST_TYPE }"/>				
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
		            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		            <input type="hidden" name="searchCmnComIdx" value="<c:out value="${commandMap.searchCmnComIdx }"/>"/>  
	            </form>
				
				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

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
		//목록
		$(document).on("click","#goList",function()
		{
			$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brandPressCenterList.do", "target":"_self", "method":"get"}).submit();
		});
	});

</script>

</body>
</html>