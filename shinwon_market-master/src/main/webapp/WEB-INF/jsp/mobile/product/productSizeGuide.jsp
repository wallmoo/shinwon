<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-detail blackyak"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
 		<div id="contents" class="section-detail"><!-- contents -->

                <div class="section-title"><!-- section-title-->
                    <h3><span>사이즈 조견표</span></h3>
                    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
                </div><!-- // section-title -->

                <div class="container"><!-- container -->
                    <div class="wrap gutter">

                        <div class="wyzwyg"><!-- wyzwyg -->
                            <c:choose>
								<c:when test="${not empty productSizeInfo.CMM_FLE_SYS_NM}">
									<img src="${cdnDomain}${productSizeInfo.CMM_FLE_ATT_PATH}${productSizeInfo.CMM_FLE_SYS_NM}" />
								</c:when>
								<c:otherwise>${productSizeInfo.BRD_GDS_CONTENTS }
								</c:otherwise>
							</c:choose>
                        </div><!-- // wyzwyg -->

                        <div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>
         
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

});

</script>
</body>
</html>    