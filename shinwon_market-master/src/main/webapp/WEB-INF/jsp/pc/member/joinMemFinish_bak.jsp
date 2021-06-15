<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-join">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
	<section id="wrap">
		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
	
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				<c:if test="${commandMap.joinType eq 'memberBasic' }">
					<dl class="join_top"><!-- .join_top S -->
						<dt><h2>마켓플랜트 쇼핑몰 회원가입</h2></dt>
						<dd class="tx_sub">
							<p>마켓플랜트 통합회원으로 가입하시면 마켓플랜트와<br/>
								전국 매장에서 포인트 적립 및 다양한 혜택을 받으실 수 있으며 프로모션과 이벤트 참여가 가능합니다.<br/>
								고객님의 개인정보보호를 위해 본인 확인 절차를 거쳐 회원가입을 하고 있습니다.</p>
						</dd>
						<dd class="nv stp_4">
							<ol>
								<li class="f"><strong><span>01</span>본인인증</strong></li>
								<li><strong><span>02</span>약관동의</strong></li>
								<li><strong><span>03</span>정보입력</strong></li>
								<li class="l on"><strong><span>04</span>가입완료</strong></li>
							</ol>
						</dd>
					</dl><!--// .join_top E -->
				</c:if>
				<c:if test="${commandMap.joinType eq 'memberSimple' }">
					<dl class="join_top"><!-- .join_top S -->
						<dt><h2>마켓플랜트 쇼핑몰 회원가입</h2></dt>
						<dd class="tx_sub">
							<p>이메일을 이용한 간편 가입 방식으로 누구나 가입 가능합니다.<br/>
								현재 사용중인 이메일로 회원가입 해주세요.</p>
						</dd>
						<dd class="nv stp_4">
							<ol>
								<li class="f"><strong><span>01</span>본인인증</strong></li>
								<li><strong><span>02</span>약관동의</strong></li>
								<li><strong><span>03</span>정보입력</strong></li>
								<li class="l on"><strong><span>04</span>가입완료</strong></li>
							</ol>
						</dd>
					</dl><!--// .join_top E -->
				</c:if>
				<c:if test="${commandMap.joinType eq 'memberBusiness' }">
					<dl class="join_top"><!-- .join_top S -->
						<dt><h2>마켓플랜트 쇼핑몰 회원가입</h2></dt>
						<dd class="tx_sub">
							<p>기업회원으로 가입하시면 기업회원 할인을 받으실 수 있습니다.<br/>
								기업회원 확인을 위해 사업자등록번호로  가입 가능합니다.</p>
						</dd>
						<dd class="nv stp_4">
							<ol>
								<li class="f"><strong><span>01</span>사업자인증</strong></li>
								<li><strong><span>02</span>약관동의</strong></li>
								<li><strong><span>03</span>정보입력</strong></li>
								<li class="l on"><strong><span>04</span>가입완료</strong></li>
							</ol>
						</dd>
					</dl><!--// .join_top E -->				
				</c:if>
	
				<ul class="join_con"><!-- .join_con S -->
					<li class="change_con">
						<div class="con">
							<h3>마켓플랜트 회원가입이<br/> <span class="co_red">정상적으로 완료</span> 되었습니다.</h3>
							<h3>&nbsp;</h3>
							
							<%-- <img src="<c:out value="${cdnDomain }"/>/pc/img/custom/join_finish_obj.png" alt="" /> --%>

							<div class="my-info">
									<p><c:out value="${commandMap.MEM_MST_MEM_ID }"/></p>
									<c:if test="${commandMap.joinType eq 'memberBasic' }">
									<!-- 
										<p>
											<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 0, 4) }"/> -
											<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 4, 8) }"/> -
											<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 8, 12) }"/> -
											<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 12, 16) }"/>
										</p>
									 -->
									</c:if>
									<c:if test="${commandMap.joinType eq 'memberSimple' }">
										<p><c:out value="${commandMap.MEM_MST_MAIL }"/></p>
									</c:if>
									<c:if test="${commandMap.joinType eq 'memberBusiness' }">
										<p><c:out value="${commandMap.MEM_CPR_NM }"/></p>
									</c:if>
							</div>
						</div>
						<p class="mt20"><span class="large14">자세한 회원정보는 마이페이지 &gt; 회원정보 &gt; 회원정보 수정에서  확인바랍니다.</span></p>
					</li>
					<li class="btn_box mt50">
						<a href="<c:out value="${serverSslDomain }"/>/pc/manager/login.do" class="btn_st2 btn_rd"><span>로그인 하기</span></a>
						<c:if test="${commandMap.joinType eq 'memberBasic' }">
							<a href="<c:out value="${serverDomain }"/>/pc/event/memberBenefit.do" class="btn_st2 btn_blk777"><span>통합회원 혜택보기</span></a>
						</c:if>
					</li>
				</ul><!--// .join_con E -->
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->		
	
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		
	});
</script>
</body>
</html>