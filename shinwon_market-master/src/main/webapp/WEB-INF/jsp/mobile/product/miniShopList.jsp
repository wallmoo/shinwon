<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-list blackyak"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>MINI SHOP</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- warp -->

				<div class="section-banner mt0 mb0"><!-- section banner -->
				    <img src="<c:out value='${cdnDomain}'/>/mobile/img/temp/minishop_list.png" alt="MINI OFFLINE SHOP" />
				</div><!-- // section banner -->

			</div><!-- // warp -->

			<div class="wrap gutter"><!-- warp -->

				<div class="minishop-list"><!-- minishop-list -->
				    <c:choose>
						<c:when test="${not empty miniShopBannerList}">
						    <c:forEach var="miniShopBannerRow" items="${miniShopBannerList}" varStatus="status">
							    <div class="section">
							        <a href="javascript:goNewPageUrl('${miniShopBannerRow.BNR_DTL_URL }','${miniShopBannerRow.BNR_DTL_TARGET}');">
							        	<img src="<c:out value='${cdnDomain}${miniShopBannerRow.CMM_FLE_ATT_PATH}${miniShopBannerRow.CMM_FLE_SYS_NM}'/>" alt="${miniShopBannerRow.CMN_FLE_ALT_TXT}" />
							        </a>
							    </div>
						    </c:forEach>
						</c:when>
						<c:otherwise>
							<div class="section">
								<div class="section-message message">
		                            <p>준비중입니다.</p>
		                        </div>
		                    </div>
						</c:otherwise>
					</c:choose>						    
				</div><!-- // minishop-list -->

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

$(function(){
   
});

</script>
</body>
</html>    