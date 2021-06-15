<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-login"><!-- page class : page-login page-join -->
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
	            <h2>통합 회원 전환</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .combineMem S -->
			<section class="combineMem">
				<dl>
					<dt>
						<h3>마켓플랜트 통합 회원 전환</h3>
						<p class="sub_tx">
							<span>마켓플랜트는 통합 회원 전환으로 보다 나은 서비스를 제공하고자 합니다.</span>
							<span>통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있는 서비스입니다.</span>
						</p>
					</dt>
					<dd class="dd_tabMn">
						<ol class="ui-grid-c">							
							<li class="ui-block-a">
								<p>
									<span>STEP 01</span>
									<strong>본인인증</strong>
								</p>
							</li>
							<li class="ui-block-b">
								<p>
									<span>STEP 02</span>
									<strong>약관동의</strong>
								</p>
							</li>
							<li class="ui-block-c">
								<p>
									<span>STEP 03</span>
									<strong>정보확인</strong>
								</p>
							</li>
							<li class="ui-block-d on">
								<p>
									<span>STEP 04</span>
									<strong>전환완료</strong>
								</p>
							</li>
						</ol>
					</dd>
	
					<dd class="dd_chgEnd">
						<h3>감사합니다.</h3>
						<strong class="tx_sub">마켓플랜트<br/>통합회원 전환이 <strong class="co_red">완료</strong> 되었습니다.</strong>
	
						<div class="tx_mamNum">
							<strong>나의 멤버십 번호 : </strong>
							<strong>
								<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 0, 4) }"/> -
								<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 4, 8) }"/> -
								<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 8, 12) }"/> -
								<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 12, 16) }"/>
							</strong>
						</div>
						
						<span class="tx_ex">자세한 회원정보는 마이페이지>회원정보>회원정보수정에서 확인바랍니다.</span>
	
						<div class="btn_box">
							<c:choose>
								<c:when test="${sessionUser.ROLE_USER eq 'user'}">
									<a href="<c:out value="${mobileSslDomain }"/>/mobile/main/index.do" class="_pg_link btn_red" target="_self"><span>쇼핑 하기</span></a>
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/login.do" class="_pg_link btn_red" target="_self"><span>로그인 하기</span></a>							
								</c:otherwise>
							</c:choose>
							<a href="<c:out value="${mobileDomain }"/>/mobile/event/memberBenefit.do" class="_pg_link btn_gre2" target="_self"><strong>통합회원혜택보기</strong></a>
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