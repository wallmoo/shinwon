<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-helpdesk blackyak">

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->

	<div id="contents"><!-- contents -->
		<div class="section-title"><!-- section-title -->
		    <h3><span>이용약관</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		    <a href="#more" class="more"><span class="icon"><em>더 보기</em></span></a>
		    <div id="more" class="sub">
		        <ul class="reset">
		        	<li><a href="<c:out value="${mobileDomain}" />/mobile/customer/faqBoardList.do"><span>FAQ</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/inquiryMain.do"><span>1:1문의</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardList.do"><span>공지사항</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/membershipBenefitNormal.do"><span>멤버십혜택</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/groupInquiryForm.do"><span>단체주문문의</span></a></li>
		            <li class="active"><a href="javascript:;"><span>이용약관</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/privacyPolicy.do"><span>개인정보취급방침</span></a></li>
		        </ul>
		    </div>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap gutter"><!-- wrap -->

				<div class="section-clause">
				    <h4 class="mt20">제1조 목적 </h4>
				    <p>이 약관은 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</p>
				    <p class="info">「PC통신, 모바일, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」</p>
				
				</div>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // wrap -->

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
//<![CDATA[
	$(function(){  
		
	});
//]]>
</script>

</body>
</html>