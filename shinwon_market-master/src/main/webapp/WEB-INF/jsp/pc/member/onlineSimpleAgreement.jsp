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
	                <dd class="l"><a href="javascript:void(0)"><span>온라인 회원 이용약관</span></a></dd>
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
	                <li class="active"><a href="javascript:;"><span>온라인 이용약관(간편회원)</span></a><span class="blind">현재위치</span></li>
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/onlineBusinessAgreement.do"><span>온라인 이용약관(기업회원)</span></a></li>
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/offlineAgreement.do"><span>오프라인 회원 이용약관</span></a></li>
	            </ul><!-- // tab-a -->
	
	            <div class="access-terms"><!-- access-terms -->

	                <div class="links"><!-- links -->
	                    <div class="holder">
	                        <ol class="ct list">
	                            <li><a href="#accessA">제 1조 (목적)</a></li>
	                            <li><a href="#accessB">제 2조 (정의)</a></li>
	                            <li><a href="#accessC">제 3조 (약관 등의 명시와 설명 및 개정)</a></li>
	                            <li><a href="#accessD">제 4조 (서비스의 제공 및 변경)</a></li>
	                            <li><a href="#accessE">제 5조 (서비스의 중단)</a></li>
	                            <li><a href="#accessF">제 6조 (회원가입)</a></li>
	                            <li><a href="#accessG">제 7조 (회원 탈퇴 및 자격 상실 등)</a></li>
	                            <li><a href="#accessH">제 8조 (회원에 대한 통지)</a></li>
	                            <li><a href="#accessI">제 9조 (구매신청 및 개인정보 제공 동의 등)</a></li>
	                            <li><a href="#accessJ">제 10조 (계약의 성립)</a></li>
	                            <li><a href="#accessK">제 11조 (지급방법)</a></li>
	                            <li><a href="#accessL">제 12조 (수신확인통지 &middot; 구매신청 변경 및 취소)</a></li>
	                            <li><a href="#accessM">제 13조 (재화 등의 공급)</a></li>
	                            <li><a href="#accessN">제 14조 (환급)</a></li>
	                            <li><a href="#accessO">제 15조 (청약철회 등)</a></li>
	                            <li><a href="#accessP">제 16조 (청약철회 등의 효과)</a></li>
	                            <li><a href="#accessQ">제 17조 (개인정보보호)</a></li>
	                            <li><a href="#accessR">제 18조 (&ldquo;몰&rdquo;의 의무)</a></li>
	                            <li><a href="#accessS">제 19조 (면책)</a></li>
	                            <li><a href="#accessT">제 20조 (회원의 ID 및 비밀번호에 대한 의무)</a></li>
	                            <li><a href="#accessU">제 21조 (이용자의 의무)</a></li>
	                            <li><a href="#accessV">제 22조 (연결 &ldquo;몰&rdquo;과 피연결 &ldquo;몰&rdquo;간의 관계)</a></li>
	                            <li><a href="#accessW">제 23조 (저작권의 귀속 및 이용제한)</a></li>
	                            <li><a href="#accessX">제 24조 (분쟁해결)</a></li>
	                            <li><a href="#accessY">제 25조 (재판권 및 준거법)</a></li>
	                            <li><a href="#accessZ">제 26조 부칙 제1조 (약관의 효력)</a></li>
	                        </ol>
	                    </div>
	                </div><!-- //links -->
	                
	                
	                <div class="module">
		                <h4 id="accessA">제 1조 (목적)</h4>
		
		                <p>
		                    이 약관은 (주)이패스씨앤아이(전자상거래 사업자, 이하 &ldquo;회사&rdquo;라 한다)이 운영하는 마켓플랜트 온라인몰(이하 &ldquo;몰&rdquo;이라 한다)에서 제공되는 인터넷 관련 서비스(이하 &ldquo;서비스&rdquo;라 한다)를 이용함에 있어 온라인몰과 이용자의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.
		                </p>
		
		                <p class="message notice-b">
		                    PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질을 반하지 않는 한 이 약관을 준용합니다.
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