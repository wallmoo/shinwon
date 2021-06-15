<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-lookbook-main"><!-- page class : page-lookbook-main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	
		<div class="container container-a"><!-- container -->

			<div class="outer-wrap outer-wrap-a"><!-- outer-wrap -->
				<div class="wrap wrap-a">
					<div class="breadcrumbs">
						<a href="/pc/main/index.do" class="home"></a>
						<span><a href="#"><img src="<c:out value="${cdnDomain}" />/pc/img/common/breadcrumb_gt.png">LOOKBOOK</a></span>
					</div>
					
					
					<c:choose>
					<c:when test="${not empty listLookBookBanner}">
					<c:set var="listNum" value="1" />
					<c:forEach var="item" items="${listLookBookBanner }" varStatus="status">
					
					<div class="lookbook-item" id="lookbookItem<fmt:formatNumber pattern="00" value="${listNum }" />" 
						style="background-image: url('${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}');">
						
						<c:if test="${not empty item.BNR_DTL_TARGET }" >
							<a class="lookbook-link" href="${item.BNR_DTL_URL }" <c:if test="${item.BNR_DTL_TARGET eq 'N'}" >target="_blank" </c:if>></a>
						</c:if>
						<c:if test="${ empty item.BNR_DTL_TARGET}" >
							<a class="lookbook-link" href="javascript:;"></a>
						</c:if>
					</div>
	
					<c:set var="listNum" value="${listNum+1}" />
					</c:forEach>
					</c:when>
					</c:choose>
							
                </div><!-- // wrap -->

            </div><!-- // outer-wrap -->

            <div class="bottom-spacer" aria-hidden="true"></div><!-- bottom spacer : container 닫는 태그 상단에 위치 -->
        </div><!-- // container -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
$(function(){
    // 해당 페이지에만 필요한 개별 스크립트 삽입
    // console log version
    // window.jquery || console.log('jquery version: ' + $().jquery);
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>