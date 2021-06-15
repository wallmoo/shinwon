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
				<p class="error-head">찾으시는 상품은 판매중인 상품이 아닙니다.
				</p>
				<p class="error-body">
					찾으시는 상품은 품절 또는 BLACKYAK MALL에서 판매중지된 상품입니다.<br>
					해당 장애에 대한 문의사항은 고객센터 <strong><c:out value="${Code.CALL_CENTER_TEL }"/></strong>로 문의주시거나, <strong>'고객센터 &gt; 1:1문의'</strong>를 이용하여 주세요.
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