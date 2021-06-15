<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-etc">

	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container">
			<div class="minW contents"><!-- contents S -->
	
	            <dl class="loc">
	                <dt class="blind">현제 카테고리 경로</dt>
	                <dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
	                <dd class="l"><a href="javascript:void(0)"><span>개인정보취급방침</span></a></dd>
	            </dl>
	
	            <div class="access-terms-guide"><!-- access-terms-guide -->
	                <h3><span class="warning">마켓플랜트</span> 쇼핑몰 개인정보취급방침</h3>
	            </div><!-- // access-terms-guide -->
	
	            <ul class="ct tab-a item-4"><!-- tab-a -->
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/basicMemInfoPolicy.do"><span>온라인 개인정보취급방침 (통합회원)</span></a></li>
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/simpleMemInfoPolicy.do"><span>온라인 개인정보취급방침 (간편회원)</span></a></li>
	                <li class="active"><a href="javascript:;"><span>온라인 개인정보취급방침 (기업회원)</span></a><span class="blind">현재위치</span></li>
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/offlineMemInfoPolicy.do"><span>오프라인 개인정보취급방침</span></a></li>
	            </ul><!-- // tab-a -->
	
	            <div class="access-terms"><!-- access-terms -->

	                <p>
	                    마켓플랜트 쇼핑몰은 회원의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보 취급방침을 수립 &middot; 공개합니다.<br />
	                    마켓플랜트의 개인정보 취급방침은 관련 법률 및 지침의 변경과 마켓플랜트 내부 운영방침의 변경에 따라 변경될 수 있습니다. [개인정보 취급방침]이 변경될 경우 변경사항은 마켓플랜트 쇼핑몰에 게시됩니다. 변경사항에 의문이 있으실 경우는 언제라도 담당자에게 문의하시거나 마켓플랜트 쇼핑몰을 방문하여 확인하실 수 있습니다.<br />
	                    마켓플랜트는 회원의 정보를 소중히 여기고, 불법적인 개인정보 유출 방지를 위해 최선의 노력을 다하겠습니다.
	                </p>
	                
	            </div><!-- // access-terms -->
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->
		<%-- 각 화면 본문 끝 --%>

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
		
	</section>
	
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){

	// 기탁 위탁업체 보기
	etcInfo = function(){
		window.open("<c:out value="${frontDomain}"/>/pc/member/etcInfoPopup.do","etcInfoPopup","width=850,height=644,scrollbars=yes,target=_blank");
	};
});
//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>