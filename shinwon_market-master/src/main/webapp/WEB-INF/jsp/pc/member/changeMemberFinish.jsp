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
				
				<dl class="join_top"><!-- .join_top S -->
					<dt><h2>마켓플랜트 통합 회원 전환</h2></dt>
					<dd class="tx_sub">
						<p>마켓플랜트는 통합 회원 전환으로 보다 나은 서비스를 제공하고자 합니다.<br/>
							통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있는 서비스입니다.</p>
					</dd>
					<dd class="nv stp_4">
						<ol>
							<li class="f"><strong><span>01</span>가입정보확인</strong></li>
							<li><strong><span>02</span>전환 약관동의</strong></li>
							<li><strong><span>03</span>가입정보 재입력</strong></li>
							<li class="l on"><strong><span>04</span>전환완료</strong></li>
						</ol>
					</dd>
				</dl><!--// .join_top E -->
	
				<ul class="join_con"><!-- .join_con S -->
					<li class="change_con">
						<div class="con">
							<h3>감사합니다.</h3>
							<h4>마켓플랜트 통합회원 전환이<br/>완료 되었습니다.</h4>
							
							<img src="<c:out value="${cdnDomain }"/>/pc/img/custom/join_finish_obj.png" alt="" />
							
							<div class="my-info">
								<c:if test="${not empty commandMap.MEM_MST_MEM_ID }">
									<p><c:out value="${commandMap.MEM_MST_MEM_ID }"/></p>
								</c:if>										
									<p>
									나의 멤버십 번호 : 
										<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 0, 4) }"/> -
										<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 4, 8) }"/> -
										<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 8, 12) }"/> -
										<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 12, 16) }"/>
									</p>
							</div>
						</div>
						<p class="mt20"><span class="large14">자세한 회원정보는 마이페이지 &gt; 회원정보 &gt; 회원정보 수정에서  확인바랍니다.</span></p>
					</li>
					<li class="btn_box mt50">
						<c:choose>
							<c:when test="${sessionUser.ROLE_USER eq 'user'}">
								<a href="<c:out value="${serverSslDomain }"/>/pc/main/index.do" class="btn_st2 btn_rd"><span>쇼핑 하기</span></a>
							</c:when>
							<c:otherwise>
								<a href="<c:out value="${serverSslDomain }"/>/pc/manager/login.do" class="btn_st2 btn_rd"><span>로그인 하기</span></a>							
							</c:otherwise>
						</c:choose>
						<a href="<c:out value="${serverDomain }"/>/pc/event/memberBenefit.do" class="btn_st2 btn_blk777"><span>통합회원 혜택보기</span></a>
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