<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<script>
	window.history.forward(); 
</script>

<body class="page-login">

	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container">
			<div class="minW2 contents"><!-- .contents S -->
				<form id="frm" name="frm">
					<input type="hidden" name="gubun" id="gubun" value="ONLINE<c:out value='${commandMap.MEM_MST_MEM_GBN }'/>"/>
					<ul class="login_form sty_comMem">
						<li class="ti">
							<h2>마켓플랜트 통합 회원 전환</h2>
							<hr class="bg_line_5px" />
						</li>
						<li class="con">
							<p class="tx_sub">
								마켓플랜트는 온라인회원, 오프라인회원님의 정보를 통합하여<br/>
								보다 나은 서비스를 제공하고자 합니다. 통합회원은 하나의 ID로 온라인, <br/>
								오프라인 서비스를 이용하실 수 있는 서비스입니다.
							</p>
							<dl class="tx_tip">
								<dt>마켓플랜트 통합회원이 되면</dt>
								<dd class="list">
									<span>1. OK캐쉬백 멤버십을 발행하여 쇼핑몰에서 적립/사용이 가능</span>
									<span>2. 회원등급별 쿠폰을 발행하여 상품 구매시 사용 가능</span>
									<span>3. 보유한 포인트를 통합포인트로 사용 가능</span>
								</dd>
							</dl>
							<strong class="tx_qu">통합회원으로 전환하시겠습니까?</strong>
							<div class="btn_box">
								<a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="btn_st2 btn_blk777"><span>다음에 전환하기</span></a>
								<a href="javascript:goChange();" class="btn_st2 btn_rd"><span>통합회원 전환하기</span></a>
								<p class="tx_ex">※ 마이페이지 > 회원정보수정에서도 통합회원 전환이 가능합니다.</p>
							</div>
						</li>
					</ul>
				</form>
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
	// 통합회원 전환하기 버튼 클릭 이벤트
	goChange = function(){
		$("#frm").attr({"action":"<c:out value="${serverSslDomain }"/>/pc/manager/changeOnlineMemCert.do", "target":"_self", "method":"post"}).submit();
	};
});
//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>