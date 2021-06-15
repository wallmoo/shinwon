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
						<p class="error-head">해당상품은 모바일 전용 상품입니다. 모바일에서 확인하시기 바랍니다.
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