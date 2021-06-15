<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-detail sub"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

<div class="container">
			
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
						<a href="/pc/main/index.do" class="button xlarge primary"><span>BLACKYAK MALL 홈으로 이동</span></a>
					</div>

				</div><!-- // basket-status -->  

			</div><!-- // outer-wrap -->

		</div><!-- // container -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>