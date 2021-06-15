<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-login"><!-- page class : page-login -->
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
	            <h2>아이디/비밀번호찾기</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .inquiry_tab_d S -->
			<section class="inquiry_tab_d">
				<dl class="tab_st1">
					<dt class="tab_mn ui-grid-a">
						<a href="javascript:void(0)" class="_pg_link ui-block-a on"><strong>아이디 찾기</strong></a>
						<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/pwFind.do?gubun=PW&type=m." class="_pg_link ui-block-b" target="_self"><strong>비밀번호 찾기</strong></a>
					</dt>
					
					<!-- #tab_con_id S -->
					<dd id="tab_con_id" class="tab_con dd_inq_id">
						<h3 class="tx_ti">회원님이 가입하신 아이디는 다음과 같습니다.</h3>
						
						<c:choose>
							<c:when test="${commandMap.memType eq 'memberBusiness' }">
								<c:if test="${not empty list }">
									<c:forEach var="row" items="${list }" varStatus="i">
										<strong class="co_red tx_id">
											<c:out value="${row.MEM_MST_MEM_ID}"/>
										</strong>											
									</c:forEach>
								</c:if>
							</c:when>
							<c:otherwise>
								<strong class="co_red tx_id">
									<c:out value="${commandMap.MEM_MST_MEM_ID}"/>
								</strong>									
							</c:otherwise>
						</c:choose>
	
						<div class="btn_box">
							<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/pwFind.do?gubun=PW&type=m." class="_pg_link btn_red" target="_self"><strong>비밀번호 찾기</strong></a>
							<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/login.do" class="_pg_link btn_gre" target="_self"><strong>로그인 하기</strong></a>
						</div>
						<p class="tx_ex2">
							<span>아이디는 개인정보보호를 위하여 일부만 보여드립니다.</span>
							<span>위에 제공된 방법으로 아이디 찾기가 어려우실 경우 고객센터 <a href="tel:02-6925-1160">02-6925-1160</a>로 문의하여 주시기 바랍니다.</span>
						</p>
					</dd>
					<!-- #tab_con_id E -->
				</dl>
			</section>
			<!--// .inquiry_tab_d E -->
				
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
	//탭
	$.com.util.tab($('.tab_st1 .tab_mn'), 0);
});
//]]>
</script>
</body>
</html>