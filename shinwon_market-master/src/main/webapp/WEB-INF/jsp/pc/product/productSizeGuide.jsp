<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-popup"><!-- page-list -->
	
	<div id="skipNavigation">
	    <a href="#contents">컨텐츠 바로가기</a>
	</div>
	
	<div id="popContainer"><!-- popContainer -->
	    <h3 class="title">
	        <span>사이즈 조견표</span>
	        <!--
	        <small>측정 방법에 따라 약간의 오차가 있을 수 있습니다.</small>
	        -->
	        <a href="javascript:self.close();" class="close"><span class="icon"><em>창 닫기</em></span></a>
    	</h3>
    	 <div id="popWrapper"><!-- popWrapper -->
    	 	<div class="clearfix size-info"><!-- size-info -->
   	 			<c:choose>
				<c:when test="${not empty productSizeInfo.CMM_FLE_SYS_NM}">
				<img src="${cdnDomain}${productSizeInfo.CMM_FLE_ATT_PATH}${productSizeInfo.CMM_FLE_SYS_NM}" />
				</c:when>
				<c:otherwise>${productSizeInfo.BRD_GDS_CONTENTS }
				</c:otherwise>
				</c:choose>
    	 	</div><!-- size-info -->
    	 </div><!-- popWrapper -->
	</div><!-- popContainer -->
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>
