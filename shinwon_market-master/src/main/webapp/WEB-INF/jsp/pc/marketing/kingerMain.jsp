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
			<section class="king_sub">
				<!-- .king_hd S -->
				<div class="king_hd">
					<h2 class="logo_kinger"><a href="<c:out value="${frontDomain }" />/pc/marketing/kingerMain.do"><img src="<c:out value="${cdnDomain }" />/pc/img/kinger/logo_kinger.png" alt="KINGER 마켓플랜트 프리미엄 1% 고객 체험단. 킹저" /></a></h2>
				</div>
				<!--// .king_hd E -->
				
				<c:if test="${not empty info }">
				<!-- .king_con S -->
				<div class="king_con">
					<!-- .king_ev S -->
					<div class="ct king_ev">
						<div class="king_ev_tx">
							<h2><span class="blind">KINGER</span><strong><c:out value="${info.EXP_KINGER_CD }" /></strong></h2>
							<h3><a href="javascript:void(0);" id="productImg" data-exp_mst_cd="<c:out value="${info.EXP_MST_CD }" />"><c:out value="${info.EXP_MST_NM }" escapeXml="false" /></a><span><c:if test="${not empty info.PRD_ERP_CD }"><c:out value="${info.PRD_ERP_CD }" /></c:if></span></h3>
							<p> 
								<strong>모집기간</strong>
								<strong><ui:formatDate value="${info.EXP_MST_RCT_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EXP_MST_RCT_ED_DT }" pattern="yyyy.MM.dd"/></strong>
							</p>
							<div class="btn_box">
								<a href="javascript:void(0)" class="btn_mission" data-exp_mst_cd="<c:out value="${info.EXP_MST_CD }" />"><span>KINGER 미션</span></a>
								<a href="javascript:void(0)" class="btn_dang" data-exp_mst_cd="<c:out value="${info.EXP_MST_CD }" />"><span>KINGER 당첨자발표</span></a>
							</div>
						</div>
						<div class="img_d">
							<c:choose>
								<c:when test="${info.DDAY >= 0 }">
									<i class="ico_day"><span class="blind">Kinger</span><strong>d-<c:out value="${info.DDAY }" /></strong></i>
								</c:when>
								<c:when test="${info.DDAY < 0 && info.WINCNT > 0}">
									<i class="ico_dang"><span class="blind">Kinger</span><strong>당첨발표</strong></i>
								</c:when>
								<c:when test="${info.DDAY < 0 && info.WINCNT eq 0}">
									<i class="ico_end"><span class="blind">Kinger</span><strong>모집종료</strong></i>
								</c:when>
							</c:choose>
							<a href="javascript:void(0);" id="productImg" data-exp_mst_cd="<c:out value="${info.EXP_MST_CD }" />"><img src="<c:out value="${cdnDomain }${info.PRD_IMG_URL_PATH }" />"  alt="<c:out value="${info.PRD_IMG_ALT_TEXT }" />"  /></a>
						</div>
						<i class="ico_pan"></i>
					</div>
					<!-- .king_ev E -->
					</c:if>
					<!-- .king_list S -->
					
					<div class="minW king_list">
						<h3><img src="<c:out value="${cdnDomain }" />/pc/img/kinger/ti_kinger_sub.png" alt="Kinger Card" /></h3>
						<c:if test="${not empty list }">
						<c:set var="clsNm" value="" />
						<ul>
							<c:forEach items="${list }" var="row" varStatus="sta">
							<c:choose>
								<c:when test="${sta.count mod 5 == 0 || sta.first}">
									<c:set var="clsNm" value="f" />	
								</c:when>
								<c:when test="${sta.count mod 4 == 0 || sta.last}">
									<c:set var="clsNm" value="l" />	
								</c:when>
								<c:otherwise>
									<c:set var="clsNm" value="" />	
								</c:otherwise>
							</c:choose>
							
							<li class="<c:out value="${clsNm }" />" >
								<a href="javascript:void(0)" id="productImg" data-exp_mst_cd="<c:out value="${row.EXP_MST_CD }" />" >
									<i class="list_num <c:if test="${row.DDAY < 0 }">end</c:if>"><strong>Kinger <c:out value="${row.EXP_KINGER_CD }" /></strong></i>
									<c:if test="${row.T_EXP_REV_BEST_CNT > 0 }" ><i class="ico_best"><span class="ir">BEST 발표</span></i></c:if>
									<img src="<c:out value="${cdnDomain }${row.PRD_IMG_URL_PATH }" />" alt="<c:out value="${row.PRD_IMG_ALT_TEXT }" />" />
									<strong class="tx_comNum"><c:if test="${not empty row.PRD_MST_BRAND_NM and not empty row.PRD_ERP_CD}">[</c:if><c:if test="${not empty row.PRD_MST_BRAND_NM }" ><c:out value="${row.PRD_MST_BRAND_NM }" /> /</c:if> <c:out value="${row.PRD_ERP_CD }" /><c:if test="${not empty row.PRD_MST_BRAND_NM and not empty row.PRD_ERP_CD}">]</c:if></strong>
									<strong class="tx_ti"><c:out value="${row.EXP_MST_NM }" /></strong>
									<span class="tx_rv">KINGER 리뷰 <strong><c:out value="${row.T_EXP_REV_CNT }" /></strong><span>개</span></span>
								</a>
							</li>
							
							</c:forEach>
						</ul>
						</c:if>	
						<form id="frm" name="frm" >
						<input type="hidden" name="EXP_MST_CD" id="EXP_MST_CD" value="" />
						<input type="hidden" name="cPage" id="cPage" value="<c:out value="${commandMap.cPage }"/>"/>		
						<div class="section-pagination" style="padding:30px 0 50px;">
							<ui:frontpaging paging="${paging }" jsFunction="goPage" />
						</div>
						</form>
					</div>
					<!--// .king_list E -->
				</div>
				<!-- .king_con E -->

			</section>
			<!--// .king_sub E -->
			

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    
    <script type="text/javascript">
    	$(function(){
    		
    		goPage = function (cPage){
    	        var $frm = $("#frm");
    	        $frm.find("#cPage").val(cPage);
    	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/marketing/kingerMain.do", "target":"_self", "method":"get"}).submit();
    	    };
    	    
    		$(document).on("click", "#productImg", function(){
    			$("#EXP_MST_CD").val($(this).data("exp_mst_cd"));
    			$("#frm").attr("action", "<c:out value="${frontDomain}"/>/pc/marketing/kingerView.do").submit();
    		});
    		
    		$(document).on("click", ".btn_mission", function(){
    			location.href="<c:out value="${frontDomain}"/>/pc/marketing/kingerMissionInfo.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />";
    		});
    		
			$(document).on("click", ".btn_dang", function(){
				$("#EXP_MST_CD").val($(this).data("exp_mst_cd"));
				location.href="<c:out value="${frontDomain}"/>/pc/marketing/kingerWinList.do";
    		});
    		
    	});
    </script>
    
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>