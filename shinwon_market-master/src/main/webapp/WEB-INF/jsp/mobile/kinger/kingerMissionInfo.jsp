<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<c:choose>
	<c:when test="${empty commandMap.EXP_MST_CD}">
		<script type="text/javascript">
			alert("잘못된 접속입니다.");
			location.href="/mobile/kinger/kingerMain.do";
		</script>						
	</c:when>
</c:choose>
</head>
<body class="page-king">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>KINGER 당첨자 발표</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .king_mission S -->
		<section class="king_mission">
			<header>
				<h3><span class="ir">KINGER</span></h3>
				<span class="tx_sub">마켓플랜트 1% 프리미엄 고객체험단, 킹저</span>
			</header>
			<dl class="mission_step">
				<dt><strong>Kinger 프로세스</strong></dt>
				<dd>
					<ol>
						<li>
							<span class="blind">1단계</span><span class="ico_consent">동의서 제출</span><i class="ico_ar"><span class="blind">다음단계</span></i>
						</li>
						<li>
							<span class="blind">2단계</span><span class="ico_win">당첨 확인</span>
							<i class="ico_ar"><span class="blind">다음단계</span></i>
						</li>
						<li>
							<span class="blind">3단계</span><span class="ico_product">상품 체험</span>
							<i class="ico_ar"><span class="blind">다음단계</span></i>
						</li>
						<li>
							<span class="blind">4단계</span><span class="ico_pen">블로그 리뷰 2개  작성</span>
							<i class="ico_ar"><span class="blind">다음단계</span></i>
						</li>
						<li>
							<span class="blind">5단계</span><span class="ico_pen">킹저 리뷰 2개 작성</span>
							<i class="ico_ar"><span class="blind">다음단계</span></i>
						</li>
						<li><span class="blind">6단계</span><span class="ico_kinger">미션 완료</span></li>
					</ol>
				</dd>
			</dl>

			<dl class="mission_qNa">
				<dt><strong>Kinger(킹저)란?</strong></dt>
				<dd>
					킹저는 마켓플랜트의 고객체험단으로써, 상품을 직접 사용해 보고 리얼한 리뷰를 제공해 주는 프리미엄 체험단 입니다. <br/><br/>

					마켓플랜트에서 소개하고 싶은 기능과 디자인이 뛰어난 상품을 선정하여 킹저를 모집하며, 킹저님들의 상품에 대한 솔!직!한 리뷰를 통해 마켓플랜트 회원님들이 좀 더 현명하게 구매하실 수 있도록 도움을 드리고자 합니다.<br/><br/>

					킹저는 언제나 공정한 심사로 선정되며, 킹저로 정성껏 활동해 주시는 모든 킹저님들께는 활동포인트 1,000포인트를 드립니 다. (10,000 포인트를 적립하시면, 1,000 마일리지로 전환하여 사용하실 수 있습니다.) 또한 베스트 리뷰로 채택이 되시면, 백화점 상품권을 감사의 의미로 선물 드립니다.
				</dd>
				<dt><strong>무엇을?</strong></dt>
				<dd>
					<ol>
						<li>
							<i class="ico_num">01</i>
							<strong class="tx_ti">활동 기간 내에 <em>킹저님의 블로그에 체험리뷰 2개를 작성</em>해 주세요.</strong>
							<span class="tx_sub">* 리뷰는 반드시 ‘전체공개’ 해주세요.</span>
						</li>
						<li>
							<i class="ico_num">02</i>
							<strong class="tx_ti">마켓플랜트 <em>쇼핑몰 킹저 리뷰에 2개의 리뷰를 작성해</em> 주세요.</strong>
							<span class="tx_sub">* 위에 킹저님의 블로그 내용과 동일한 내용이며, HTML소스를 복사하여 입력해 주시면 됩니다.</span>
						</li>
					</ol>
				</dd>
				<dt><strong>어떻게?</strong></dt>
				<dd>
					<ol class="list_type2">
						<li>
							<i class="ico_num">01</i>
							<strong class="tx_ti">먼저 킹저님의 블로그에 리뷰 2개 작성을 완료합니다.</strong>
						</li>
						<li>
							<i class="ico_num">02</i>
							<strong class="tx_ti">마켓플랜트 킹저 리뷰에 킹저님의 블로그에 작성한 내용을 HTML 소스 복사하여 붙여 넣습니다.</strong>
						</li>
						<li>
							<i class="ico_num">03</i>
							<strong class="tx_ti">자동으로 반영된 리뷰 내용에서 동영상, 네이버 이모티콘(스티커) 부분은 삭제합니다. (해당 내용은 킹저 리뷰에 업로드 되지 않습니다. 엑박(X)이 뜰 수 있으니 꼭~! 기억해주세요.)</strong>
						</li>
						<li>
							<i class="ico_num">04</i>
							<strong class="tx_ti">제목은 리뷰의 제목과 동일하게 입력합니다.</strong>
						</li>
						<li>
							<i class="ico_num">05</i>
							<strong class="tx_ti">[미리보기] 버튼을 통해 내용이 잘 입력되었는지 확인하시고, 저장해 주세요.</strong>
						</li>
						<li>
							<i class="ico_num">06</i>
							<strong class="tx_ti">킹저 리뷰등록 완료~! (베테랑 블로거님들이니 아주 쉽게 작성하실 수 있으리라 믿습니다.)</strong>
						</li>
					</ol>
				</dd>
				<dd class="mission_desc">
					“미션 완료 후 BEST Kinger로 선정되시면,<br> 
					백화점 상품권을 선물로 드립니다.”<br>
					(킹저 당첨자 발표페이지에서 확인)<br>
					<span class="txt_highlight">또한 BEST KINGER로 선정되시면, 다른 킹저 모집에서도</span>
					당첨 우선권이 주어집니다.
				</dd>
			</dl>
			<div class="btn_box">
			<c:choose>
				<c:when test="${info.EXP_ETR_AGR_YN eq 'Y' }">
					<a href="javascript:void(0)" class="btn_puple"><strong>KINGER 동의서 제출 완료</strong></a>
				</c:when>
				<c:otherwise>
					<a href="javascript:goSend();" class="btn_red"><strong>KINGER 활동 동의서 제출하기</strong></a>
				</c:otherwise>
			</c:choose>				
			</div> 
		</section>
		<!--// .king_mission E -->

			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script type="text/javascript">
	goSend				= function(){
		<c:choose>
			<c:when test="${empty commandMap.MEM_MST_MEM_ID}">
				alert("로그인 후 동의서를 제출하실 수 있습니다.");
			</c:when>
			<c:when test="${icnt == 0}">
				alert("KINGER 당첨자 발표 후에 확인 해 주세요.");
			</c:when>
			<c:when test="${empty info}">
				alert("KINGER 당첨 여부를확인해주세요\nKINGER 당첨자의 동의서를 받고 있습니다.");
			</c:when>
			<c:otherwise>
				window.open("<c:out value="${mobileDomain}" />/mobile/kinger/popup/kingerConsentPopUp.do?EXP_MST_CD=<c:out value="${commandMap.EXP_MST_CD}" />", "consent");
			</c:otherwise>
		</c:choose>	
	};
</script>
