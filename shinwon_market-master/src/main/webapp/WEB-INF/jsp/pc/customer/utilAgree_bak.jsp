<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-helpdesk"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	         <div id="breadcrumb" class="wrap">
	             <div class="holder">
	                 <span>홈</span>
	                 <span class="gt">&gt;</span>
	                 <span>고객센터</span>
	                 <span class="gt">&gt;</span>
	                 <strong class="warning">이용약관</strong>
	             </div>
	         </div>
	    </div><!-- // breadcrumb -->

		<div class="container visual-wrap"><!-- visual -->
		    <div class="wrap">
		        <img src="<c:out value="${cdnDomain}"/>/pc/img/custom/visual_helpdesk.png" alt="" />
		    </div>
		</div><!-- // visual -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

				<div id="lnb"><!-- lnb -->
				    <ul class="reset">
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do">FAQ</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/inquiryMain.do">1:1문의</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/noticeBoardList.do">공지사항</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/membershipBenefit.do">멤버십혜택</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/groupInquiryForm.do">단체주문문의</a></li>
				        <li class="active"><a href="<c:out value="${frontDomain}" />/pc/customer/utilAgree.do">이용약관</a></li>
					    <li><a href="<c:out value="${frontDomain}" />/pc/customer/privacyPolicy.do">개인정보취급방침</a></li>
				    </ul>
				</div><!-- // lnb -->

				<div id="internal"><!-- internal -->


					<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

				</div><!-- internal -->

			</div><!-- wrap -->
		</div><!-- // container -->

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script>
$(function(){

});
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>