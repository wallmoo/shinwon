<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-customer"><!-- page class : page-login page-join -->
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
	            <h2>자주묻는 질문</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="faq-search"><!-- faq-search -->
	            <label for="faqSearch" class="xlarge">FAQ</label>
	            <input type="text" id="faqSearch" class="text">
	            <a href="javascript:;" class="button primary"><span>검색</span></a>
	        </div><!-- // faq-search -->
	
	        <hr class="hr-b">
	
	        <div class="faq-result text-center"><!-- faq-result -->
	            &ldquo;<span class="warning">배송</span>&rdquo;에 대해 총 <span class="warning">62</span>건의 FAQ가 검색 되었습니다.
	        </div><!-- faq-result -->
	
	        <div class="faq-list" data-role="collapsible-set"><!-- faq-list -->
	            <div class="section" data-role="collapsible" data-collapsed="false">
	                <h3>
	                    <i class="type question"><span class="blind">질문</span></i>
	                    <strong><span class="blind">하위 카테고리</span>상품</strong>
	                    구매가능 여부를 알고 싶어요.
	                    <i class="more"><!-- icon --></i>
	                </h3>
	                <div class="toggle-box">
	                    <i class="type answer"><span class="blind">답변</span></i>
	                    비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br /><br />
	                    ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                </div>
	            </div>
	            <div class="section" data-role="collapsible" data-collapsed="true">
	                <h3>
	                    <i class="type question"><span class="blind">질문</span></i>
	                    <strong><span class="blind">하위 카테고리</span>상품</strong>
	                    구매가능 여부를 알고 싶어요.
	                    <i class="more"><!-- icon --></i>
	                </h3>
	                <div class="toggle-box">
	                    <i class="type answer"><span class="blind">답변</span></i>
	                    비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br /><br />
	                    ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                </div>
	            </div>
	            <div class="section" data-role="collapsible" data-collapsed="true">
	                <h3>
	                    <i class="type question"><span class="blind">질문</span></i>
	                    <strong><span class="blind">하위 카테고리</span>상품</strong>
	                    구매가능 여부를 알고 싶어요.
	                    <i class="more"><!-- icon --></i>
	                </h3>
	                <div class="toggle-box">
	                    <i class="type answer"><span class="blind">답변</span></i>
	                    비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br /><br />
	                    ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                </div>
	            </div>
	        </div><!-- // faq-list -->
				
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