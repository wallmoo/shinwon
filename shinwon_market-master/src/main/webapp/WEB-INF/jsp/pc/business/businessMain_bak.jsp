<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>
<%@ page import = "java.util.*" %>

<body class="page-join">

	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	
	<!-- #wrap S -->
	<section id="wrap">
		
		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>

		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				<!-- .counsel_d S -->
				<section class="counsel_d">
					<dl class="join_head">
						<dt class="minW">
							<h2>마켓플랜트 입점센터</h2>
							<p>마켓플랜트 쇼핑몰은 <br/>경쟁력있는 가격, 뛰어난 품질과 디자인을 갖춘 상품을 기다립니다.</p>
						</dt>
						<dd class="minW">
							<a href="<c:out value="${frontDomain }"/>/pc/business/standingPointCounselForm.do" class="btn_wt_l"><span>입점 상담신청</span></a>
							<a href="<c:out value="${frontDomain }"/>/pc/business/standingPointCounselList.do" class="btn_wt_l"><span>입점 상담신청 조회</span></a>
						</dd>
					</dl>
					<dl class="join_step">
						<dt><h3>입점 절차</h3></dt>
						<dd>
							<img src="<c:out value="${cdnDomain }"/>/pc/img/join/img_join_step.jpg" alt="입점절차 단계 이미지" longdesc="#join_step_con" />
							<div id="join_step_con" class="blind">
								<dl>
									<dt>1단계</dt>
									<dd>신규 입점업체 등록 및 입점상담 신청</dd>
									<dt>2단계</dt>
									<dd>담당MD와 상담</dd>
									<dt>3단계</dt>
									<dd>입점계약 체결</dd>
									<dt>4단계</dt>
									<dd>입점신청서 작성</dd>
									<dt>5단계</dt>
									<dd>입점등록 완료</dd>
									<dt>6단계</dt>
									<dd>상품등록 및 판매</dd>
								</dl>
							</div>
						</dd>
					</dl>
				</section>
				<!--// .counsel_d E -->
	
			</div><!--// .contents E -->
		</article>
	<!--// #container E -->
		
	<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
	</section>
<script>
	$(function(){
	    
	});
</script>
</body>
</html>