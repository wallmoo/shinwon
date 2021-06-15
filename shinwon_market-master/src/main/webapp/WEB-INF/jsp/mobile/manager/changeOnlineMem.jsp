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
							<span>마켓플랜트는 통합 회원 전환으로 <br/>보다 나은 서비스를 제공하고자 합니다.</span>
							<span>통합회원은 하나의 ID로 온라인, 오프라인 서비스를 <br/> 이용하실 수 있는 서비스입니다.</span>
						</p>
					</dt>
					<dd class="dd_benefit">
						<table>
							<caption>마켓플랜트 통합회원이 되면 드리는 혜택 3가지를 설명하는 표</caption>
							<colgroup>
							<col />
							</colgroup>
							<thead>
								<tr>
									<th><strong>마켓플랜트 통합회원이 되면</strong></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<span>
											<i>01</i>
											OK캐쉬백 멤버십을 발행하여 쇼핑몰에서 적립/사용이 가능
										</span>
									</td>
								</tr>
								<tr>
									<td>
	
										<span>
											<i>02</i>
											회원등급별 쿠폰을 발행하여 상품 구매시 사용 가능
										</span>
	
									</td>
								</tr>
								<tr>
									<td>								
										<span>
											<i>03</i>
											보유한 포인트를 통합포인트로 사용 가능
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</dd>
					<dd class="dd_btn">
						<strong>통합회원으로 전환 하시겠습니까?</strong>
						<form id="frm" name="frm">
							<input type="hidden" name="gubun" id="gubun" value="ONLINE<c:out value='${commandMap.MEM_MST_MEM_GBN }'/>"/>
							<input type="hidden" name="type" id="type" value="m."/>
							<ul class="ui-grid-a">
								<li><a href="<c:out value="${mobileDomain }"/>/mobile/main/index.do" class="_pg_link btn_gre" target="_self"><strong>다음에 전환하기</strong></a></li>
								<li><a href="javascript:goChange();" class="_pg_link btn_red"><strong>통합회원 전환하기</strong></a></li>
							</ul>
						</form>
	
						<p>가입 정보에 대한 문의는 <a href="tel:02-6925-1160">02-6925-1160</a> 으로 문의해주세요</p>
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
	// 통합회원 전환하기 버튼 클릭 이벤트
	goChange = function(){
		$("#frm").attr({"action":"<c:out value="${mobileSslDomain }"/>/mobile/manager/changeOnlineMemCert.do", "target":"_self", "method":"post"}).submit();
	};
});
//]]>
</script>
</body>
</html>