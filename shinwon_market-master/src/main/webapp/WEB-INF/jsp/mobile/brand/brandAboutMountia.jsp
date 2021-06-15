<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-brand mountia"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

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
				        <li class="active"><a href="javascript:;"><span>ABOUT<br />MOUNTIA</span></a></li>
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandHistoryMountia.do"><span>HISTORY</span></a></li>
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandPressCenterList.do"><span>PRESS CENTER </span></a></li>
				    </ul>
				</div><!-- // tab-b -->

				<div class="gap"><!-- gap -->
				    <p class="text-center mt25 mb25"><span class="icon brand-logo mountia"><em>MOUNTIA MOUNTAIN DESIGN</em></span></p>
                    <p><strong class="warning large">산이 만든 아웃도어  마운티아</strong></p>
				    ${aboutMountiaMap.CON_MST_MOBILE_PROMOTION }
				</div><!-- // gap -->

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // warcvp -->
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
		
	});

</script>

</body>
</html>