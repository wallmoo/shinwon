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
			<h3><span>상품상세정보</span></h3>
			<a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->
	
		<div class="container"><!-- container -->
			<div class="wrap gutter">
			
				<c:choose>
				<c:when test="${not empty productInfo.PRD_MST_DETAIL_DESC}">
					<h4 class="title"><span>상품상세정보</span></h4>
	
	                <div class="wyzwyg"><!-- wyzwyg -->
	                    ${productInfo.PRD_MST_DETAIL_DESC}
	                </div><!-- // wyzwyg -->
				</c:when>
                </c:choose>
				
				
				<c:choose>
				<c:when test="${not empty listProductTechInfo}">
					<h4 class="title"><span>제품기술정보</span></h4>
					<div class="clearfix technology"><!-- technology -->
						<div class="table">
						<c:forEach var="item" items="${listProductTechInfo }" varStatus="status">
							<div class="row">
                                <div style="width: 100px;" class="cell">
                                    <img alt="${item.CMN_FLE_ALT_TXT}" src="<c:out value='${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}' />">
                                </div>
                                 <div style="width: auto;" class="cell">
                                    <strong style="font-size: 16px; color: #000;">${item.BRD_SHG_TITLE}</strong>
                                    <div class="module">
                                         ${item.BRD_SHG_CONTENTS}
                                   </div>
                                </div>
                            </div>
                       </c:forEach>
                       </div>
                    </div>
               </c:when>
               </c:choose>
			
				<c:choose>
				<c:when test="${not empty productWashGuide}" > 
					<h4 class="title"><span>세탁 및 취급 주의사항</span></h4>
	
	                <div class="wyzwyg"><!-- wyzwyg -->
	                    ${productWashGuide.BRD_GDS_CONTENTS}
	                </div><!-- // wyzwyg -->  
                    	
                </c:when>
                </c:choose>
			
				<c:choose>
				<c:when test="${not empty productSizeInfo}" >
					<h4 class="title"><span>SIZE INFO</span></h4>
					
					<div class="wyzwyg"><!-- wyzwyg -->
						<c:if test="${not empty productSizeInfo.CMM_FLE_SYS_NM}">
                        	<img src="<c:out value='${cdnDomain}${productSizeInfo.CMM_FLE_ATT_PATH}${productSizeInfo.CMM_FLE_SYS_NM}' />" alt="${productSizeInfo.BRD_GDS_TITLE}" />
                        </c:if>
                        ${productSizeInfo.BRD_GDS_CONTENTS}
					</div>
                </c:when>
                </c:choose>
			
				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>
			
			</div><!-- // wrap -->
		</div><!-- // container -->
	
	</div><!-- // inner -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // contents -->

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