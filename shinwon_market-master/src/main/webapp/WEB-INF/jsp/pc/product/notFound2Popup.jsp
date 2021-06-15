<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="popup detail" data-size="450x520"><!-- page class : main, 팝업창 크기 -->
 
<h1 class="sr-only">LNS Mall Popup</h1>
 
<div id="popupContainer" class="popup-container"><!-- popup-container -->
    
    <div class="outer-wrap"><!-- outer wrap -->

		<div class="wrap"><!-- wrap -->
			
			<div class="error-description mt50 border-top-thick border-bottom-thick">
				<p class="error-head">해당상품은 모바일 전용 상품입니다. 모바일에서 확인하시기 바랍니다.
				</p>						
			</div>

			<div class="clearfix section-button">
				<a href="javascript:window.close();" class="button xlarge primary"><span>확인</span></a>
			</div>

		</div><!-- // basket-status -->  

	</div><!-- // outer-wrap -->
 
</div><!-- // popup-container -->

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>