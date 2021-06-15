<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-etc"><!-- page class : page-etc -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>삼성카드 마케팅활용 약관</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	            
	        <div class="padder access-terms"><!-- access-terms -->
	            <p>
	                본 내용의 동의 여부는 마켓플랜트 멤버십 회원 가입에 어떠한 영향도 미치지 않습니다. "제공하는 개인 정보 항목" 은 가입 당시 정보 및 이후 변경 된 정보도 포함합니다. 
	            </p>
	
	            <ol class="list list-ol mt30">
	                <li>제공받는 자 : 삼성카드 및 삼성카드 수임인 또는 위탁업체</li>
	                <li>제공받는 자의 이용 목적 : 마켓플랜트 제휴 신용카드의 안내 및 발급 권유, 카드 발급 신청 등의 텔레마케팅 이용 목적</li>
	                <li>제공되는 개인정보 항목 : 이름, 암호화된 동일인식별정보(CI), 생년월일, 성별, 주소, 휴대폰번호, 가입채널</li>
	                <li>제공방법 : 개인정보 보유 및 이용기간 내의 본인의 추가 동의없이 필요시마다 제공</li>
	                <li>보유 기간 : 제공받은 날로부터 6개월 이내</li>
	            </ol>
	
	            <p class="info mt20">
	                개인정보 제공받는 업체 및 서비스는 마켓플랜트를 통해 확인하실 수 있으며, 상기 내용의 변경 발생 시 별도 통지 없이 홈페이지를 통해 안내를 드립니다.
	            </p>
	
	        </div><!-- // access-terms -->
			
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

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