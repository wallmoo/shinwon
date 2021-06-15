<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-login page-join"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">

			<!-- .section-title S -->
			<div class="section-title _hd_fix">
	            <h2>회원가입</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .combineMem S -->
			<section class="combineMem join_d">
				<dl>
					<dt>
						<h3>마켓플랜트 회원가입</h3>
						<p class="sub_tx">
							<span>회원가입을 하시면<br/>다양한 서비스와 혜택을 받으실 수 있습니다. <br/>고객님의 개인정보보호를 위해 본인 확인 절차를 거쳐<br/> 회원가입을 하고 있습니다.</span>
						</p>
					</dt>
					<dd class="dd_joinType">
						<div class="ty_comb">
							<a href="<c:out value="${mobileSslDomain }"/>/mobile/member/joinMemBasicStep1.do?gubun=JOIN&type=m." class="_pg_link btn_red" target="_self"><strong>통합회원 가입</strong><span>(만14세 이상 내국인)</span></a>
							<p class="tx_ex3">
								<strong>통합회원이란?</strong>
								<span>온오프라인 통합회원으로 회원 등급별 다양한 쿠폰 및 멤버십 혜택은 물론, 마켓플랜트 에서 진행하는 다양한 프로모션 행사에 참여가 가능합니다.</span>
							</p>
						</div>
						<div class="ty_email">
							<a href="<c:out value="${mobileSslDomain }"/>/mobile/member/joinMemSimpleStep1.do" class="_pg_link btn_gre2" target="_self"><strong>이메일 간편 가입</strong><span>(만14세 이상 내국인)</span></a>
							<p class="tx_ex3">
								<strong>간편 가입이란?</strong>
								<span>본인인증 없이 이메일을 이용한 간편가입 방식으로 누구나 가입 가능합니다. 단, 간편회원은 쿠폰 사용 및 포인트, 크라운 적립이 제한될 수 있습니다.</span>
							</p>
						</div>
					</dd>
				</dl>
			</section>
			<!--// .combineMem E -->
				
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