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
	                <dd class="l"><a href="javascript:void(0)"><span>오프라인 회원 이용약관</span></a></dd>
	            </dl>
	
	            <div class="access-terms-guide"><!-- access-terms-guide -->
	                <h3><span class="warning">마켓플랜트</span> 쇼핑몰 이용약관</h3>
	                <p class="mt20">
	                    마켓플랜트는 온라인/오프라인 통합 멤버쉽을 운영하고 있습니다.<br />
	                    온라인 쇼핑몰 회원가입으로 쇼핑몰뿐만이 아니라 전국의 마켓플랜트 매장에서도 멤버쉽 혜택을 받으실 수 있습니다.<br />
	                    통합 전 회원약관 확인을 원하시면, 페에지 하단의 [온라인전용회원 약관보기]에서 확인하실 수 있습니다.
	                </p>
	            </div><!-- // access-terms-guide -->
	
	            <ul class="ct tab-a item-4"><!-- tab-a -->
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/onlineAgreement.do"><span>온라인 이용약관(통합회원)</span></a></li>
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/onlineSimpleAgreement.do"><span>온라인 이용약관(간편회원)</span></a></li>
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/onlineBusinessAgreement.do"><span>온라인 이용약관(기업회원)</span></a></li>
	                <li class="active"><a href="javascript:;"><span>오프라인 회원 이용약관</span></a><span class="blind">현재위치</span></li>
	            </ul><!-- // tab-a -->
	
	            <div class="access-terms"><!-- access-terms -->
	                
	                <div class="module">
		                <h4>제 1조 (목적)</h4>
		
		                <p>
		                    본 약관은 마켓플랜트 멤버십카드 회원이 당사가 제공하는 마켓플랜트 멤버십 카드 서비스를 이용함에 있어 마켓플랜트 멤버십카드 회원과 당사의 제반 권리, 의무 및 관련절차 등을 규정하는데 그 목적이 있습니다.
		                </p>
		
		            </div>
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

});
//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>