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
	                <li><a href="<c:out value="${frontDomain }"/>/pc/member/businessMemInfoPolicy.do"><span>온라인 개인정보취급방침 (기업회원)</span></a></li>
	                <li class="active"><a href="javascript:;"><span>오프라인 개인정보취급방침</span></a><span class="blind">현재위치</span></li>
	            </ul><!-- // tab-a -->
	
	            <div class="access-terms"><!-- access-terms -->
	
	                <p>
	                    ㈜이패스씨앤아이(이하 &ldquo;회사&rdquo;라 함)는 회원의 개인정보보호를 매우 중요시하며, 회원이 회사의 서비스 (이하 &ldquo;마켓플랜트 서비스&rdquo; 또는 &ldquo;마켓플랜트&rdquo;이라 함)를 이용함과 동시에 매장, 온라인 및 모바일 상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고 있습니다. 이에 회사는 ‘개인정보보호법’, ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’등 모든 관련 법규를 준수하기 위하여 [㈜이패스씨앤아이 개인정보처리방침]을 제정하여 이를 준수하고 마켓플랜트 개인정보처리방침을 영업장에 비치하거나 홈페이지(www.epasscni.com)에 공개하여 회원이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br />
	                    회사는 개인정보 보호정책을 홈페이지에 공개함으로써 회원이 언제나 용이하게 보실 수 있도록 조치하고 있습니다. 회사의 개인정보 보호정책은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인해 수시로 변경될 수 있고, 이에 따른 개인정보 보호정책의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 그리고 개인정보 보호정책을 개정하는 경우 회사는 그 변경사항에 대하여 즉시 매장 안내문 또는 홈페이지를 통해서 게시하고 버전 번호 및 개정일자 등을 부여하여 개정된 사항을 회원이 쉽게 알아볼 수 있도록 하고 있습니다. 회원께서는 매장 및 사이트 방문시 수시로 확인하시기 바랍니다.<br />
	                    마켓플랜트의 개인정보처리방침은 다음과 같은 내용을 담고 있습니다. 
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

});
//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>