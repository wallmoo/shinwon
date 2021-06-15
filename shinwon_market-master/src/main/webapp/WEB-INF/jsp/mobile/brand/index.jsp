<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-main"><%-- page class : main, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>


            <div class="container brand-main pt10"><!-- container -->
                
                <div class="padder section-banner"><!-- banner -->
                    <div class="grid">
					<c:choose>
                    <c:when test="${not empty listBannerA }" >
                    <c:forEach var="item" items="${listBannerA }" varStatus="status">
                    	<div class="col-1-1">
                    <c:if test="${not empty item.BNR_DTL_TARGET }" >
                         	<a href="javascript:goNewPageUrl('${item.BNR_DTL_URL }','${item.BNR_DTL_TARGET}');"><img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" class="full-width" /></a>
					</c:if>
					<c:if test="${ empty item.BNR_DTL_TARGET}" >
                    		<img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" class="full-width" />
					</c:if>
						</div>                                 
                    </c:forEach>
                    </c:when>
                   	</c:choose>
                    </div>
                </div><!-- // banner -->

                <div class="padder section-banner mt8"><!-- banner -->
                    <div class="grid">
                    <c:choose>
                    <c:when test="${not empty listBannerB }" >
                    <c:forEach var="item" items="${listBannerB }" varStatus="status">
                    	<div class="col-1-2">
                            <div class="module">
                    <c:if test="${not empty item.BNR_DTL_TARGET }" >
                         	<a href="javascript:goNewPageUrl('${item.BNR_DTL_URL }','${item.BNR_DTL_TARGET}');"><img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" class="full-width" /></a>
					</c:if>
					<c:if test="${ empty item.BNR_DTL_TARGET}" >
                    		<img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" class="full-width" />
					</c:if>
							</div>
                        </div>                                
                    </c:forEach>
                    </c:when>
                   	</c:choose>
                    </div>
                </div><!-- // banner -->
            </div><!-- // container -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
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

</body>
</html>