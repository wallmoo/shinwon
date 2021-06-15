<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-kinger">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->


			<!-- .king_sub S -->
			<section class="king_sub king_detail">
				<!-- .king_hd S -->
				<div class="king_hd">
					<h2 class="logo_kinger"><a href="<c:out value="${frontDomain }" />/pc/marketing/kingerMain.do"><img src="<c:out value="${cdnDomain }" />/pc/img/kinger/logo_kinger.png" alt="KINGER 마켓플랜트 프리미엄 1% 고객 체험단. 킹저" /></a></h2>
				</div>
				<!--// .king_hd E -->
				
				<!-- .king_con S -->
				<div class="king_con">
					<div class="con_ti">
						<a href="javascript:void(0)" class="btn_mn" id="listLink"><span class="blind">고객체험단 서브메뉴</span></a>
						<h2><span class="ti"><c:out value="${info.EXP_MST_NM }" /> <c:out value="${info.PRD_ERP_CD }" /></span> <span class="ti_con"><c:out value="${info.EXP_REV_NM }" /></span></h2/>
						<a href="javascript:void(0)" class="btn_l" id="prevLink"><span class="blind">이전 리뷰 보기</span></a>
						<a href="javascript:void(0)" class="btn_r" id="nextLink"><span class="blind">다음 리뷰 보기</span></a>
					</div>					
					
					<dl class="tx_consent">
						<dt class="tx_ti">
							<h3><c:out value="${info.EXP_REV_NM }" /></h3>
							<span class="tx_date"><ui:formatDate value="${info.EXP_REV_REG_DT }" pattern="yyyy.MM.dd"/></span>
							<span class="tx_id"><c:out value="${info.HID_MEM_MST_MEM_ID }"/></span>
						</dt>
						<dd class="tx_con">
							<c:if test="${not empty info.CMM_FLE_SAVE_PATH }">
							<img src="<c:out value="${cdnDomain }${info.CMM_FLE_SAVE_PATH }" />" alt="" style="width:410px;height:272px;" /><br/><br/>
							</c:if>
							<c:out value="${info.EXP_REV_CTS }" escapeXml="false" />
						</dd>
					</dl>
					<div class="f_con_ti">
						<a href="javascript:void(0)" class="btn_mn" id="listLink"><span class="blind">고객체험단 서브메뉴</span></a>
						<a href="javascript:void(0)" class="btn_l" id="prevLink"><span class="blind">이전 리뷰 보기</span></a>
						<a href="javascript:void(0)" class="btn_r" id="nextLink"><span class="blind">다음 리뷰 보기</span></a>
					</div>	
				</div>
				<!-- .king_con E -->

			</section>
			<!--// .king_sub E -->
			

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script>
//메뉴 높이체크
var sc_top, king_ti, king_top, king_con;
	$(window).scroll(function(){
		sc_top = $(window).scrollTop(),
		css_top = sc_top - king_top,
		con_top = king_con.offset().top;
	
		if(sc_top >= king_top){
			king_ti.css({top:css_top});

			if(sc_top >= con_top) king_ti.addClass('in');
			else king_ti.removeClass('in');
			
		}else king_ti.removeAttr('style');	
		
	});
	
	$(document).ready(function(){
		king_ti = $('.king_con .con_ti'),
		king_top = king_ti.offset().top;
		king_con = $('.king_con .tx_consent .tx_ti');
	});
	
	$(document).on("click", "#listLink", function(){
		location.href ="<c:out value="${frontDomain}"/>/pc/marketing/kingerView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&cPage=<c:out value="${commandMap.cPage}" />";	
	});
	
	$(document).on("click", "#prevLink", function(){
		<c:if test="${not empty info.PREV_EXP_REV_IDX }">
		location.href ="<c:out value="${frontDomain}"/>/pc/marketing/kingerRevView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&cPage=<c:out value="${commandMap.cPage}" />&EXP_REV_IDX=<c:out value="${info.PREV_EXP_REV_IDX}" />";
		</c:if>
	});
	
	$(document).on("click", "#nextLink", function(){
		<c:if test="${not empty info.NEXT_EXP_REV_IDX }">
		location.href ="<c:out value="${frontDomain}"/>/pc/marketing/kingerRevView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&cPage=<c:out value="${commandMap.cPage}" />&EXP_REV_IDX=<c:out value="${info.NEXT_EXP_REV_IDX}" />";
		</c:if>
	});
	
</script>