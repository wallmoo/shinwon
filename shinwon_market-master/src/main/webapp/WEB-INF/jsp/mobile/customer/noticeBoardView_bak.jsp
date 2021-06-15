<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-customer"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>공지사항</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <h3 class="bbs-title"><c:out value="${row.BRD_NTS_TITLE}" /></h3>

        <div class="ct bbs-desc"><!-- bbs-desc -->
            <div class="fl date">
                <span class="blind">등록 날짜</span><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd"/>
            </div>
            <div class="fr hit">
                조회수 <fmt:formatNumber value="${row.BRD_NTS_READ_CNT }" groupingUsed="true" />
            </div>
        </div><!-- // bbs-desc -->
        <div class="padder bbs-view mt15"><!-- bbs-view -->
            ${row.BRD_NTS_CONTENTS }
        </div><!-- // bbs-view -->
		<c:if test="${not empty fileList }">
	        <div class="bbs-file mt15"><!-- bbs-file -->
	            <span class="blind">첨부파일</span>
	            <c:forEach var="fileRow" items="${fileList }" varStatus="i">
	            <a href="<c:out value="${cdnDomain}" /><c:out value="${fileRow.CMM_FLE_ATT_PATH}" /><c:out value="${fileRow.CMM_FLE_SYS_NM}" />" download data-ajax="false"><c:out value="${fileRow.CMM_FLE_ORG_NM}"/></a>
	            </c:forEach>
	        </div><!-- // bbs-file -->
		</c:if>
	</article>
	<!--// #container E -->


		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script src="<c:out value="${mobileDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
 

</script>
</body>
</html>