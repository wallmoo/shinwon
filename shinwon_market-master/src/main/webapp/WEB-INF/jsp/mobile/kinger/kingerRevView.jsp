<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
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
            <h2>KINGER 리뷰</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
			
			<div class="btn_r">
				<c:if test="${not empty info.PREV_EXP_REV_IDX }">
				<a href="javascript:void(0);" class="_pg_link btn_prev" id="prevLink"><i></i><em class="blind">이전 리뷰 페이지로 이동</em></a>
				</c:if>
				<c:if test="${not empty info.NEXT_EXP_REV_IDX }">
				<a href="javascript:void(0);" class="_pg_link btn_next" id="nextLink">><i></i><em class="blind">다음 리뷰 페이지로 이동</em></a>
				</c:if>
			</div>
        </div>
		<!--// .section-title E -->

		<!-- .king_reDt S -->
		<section class="king_reDt">
			<div id="kin_hd_fix" class="king_fix kin_hd_fix">
				<a href="javascript:void(0);" class="_pg_link btn_list" id="listLink"><i></i><span class="blind">리스트 페이지로 이동</span></a>
				<h2 class="tx_doc"><c:out value="${info.EXP_MST_NM }" /></h2>
				<div class="btn_r">
					<c:if test="${not empty info.PREV_EXP_REV_IDX }">
					<a href="javascript:void(0);" class="_pg_link btn_prev" id="prevLink"><i></i><em class="blind">이전 리뷰 페이지로 이동</em></a>
					</c:if>
					<c:if test="${not empty info.NEXT_EXP_REV_IDX }">
					<a href="javascript:void(0);" class="_pg_link btn_next" id="nextLink"><i></i><em class="blind">다음 리뷰 페이지로 이동</em></a>
					</c:if>
				</div>
			</div>

			<dl>
				<dt class="re_ti">
					<h4 class="pr_title"><c:out value="${info.EXP_REV_NM }" /></h4>
					<h3 class="re_title"><c:out value="${info.EXP_REV_SUB_NM }" /></h3>
					<span class="tx_dateNid"><ui:formatDate value="${info.EXP_REV_REG_DT }" pattern="yyyy.MM.dd"/> / <strong><c:out value="${info.HID_MEM_MST_MEM_ID }"/></strong></span>
				</dt>
				<dd class="re_con">
					<c:out value="${info.EXP_REV_CTS }" escapeXml="false" />
					<img src="<c:out value="${cdnDomain }${info.CMM_FLE_SAVE_PATH }" />" alt="사진1" style="width:100%;height:auto;min-height:300px;" />
				</dd>
			</dl>

			<div class="king_fix">
				<a href="javascript:void(0);" class="_pg_link btn_list" id="listLink"><i></i><span class="blind">리스트 페이지로 이동</span></a>
				<div class="btn_r">
					<c:if test="${not empty info.PREV_EXP_REV_IDX }">
					<a href="javascript:void(0);" class="_pg_link btn_prev" id="prevLink"><i></i><em class="blind">이전 리뷰 페이지로 이동</em></a>
					</c:if>
					<c:if test="${not empty info.NEXT_EXP_REV_IDX }">
					<a href="javascript:void(0);" class="_pg_link btn_next" id="nextLink"><i></i><em class="blind">다음 리뷰 페이지로 이동</em></a>
					</c:if>
				</div>
			</div>
		</section>
		<!--// .king_reDt E -->
	
			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script>

//상단에 제목바뀌는거
var _kin_hd_fix;
$(function(){
	_kin_hd_fix = $('#kin_hd_fix');
});
$(document).on('scroll', function(){
	if($.com.win_scroll <= $.com.hd_fix_top[0]){
		if(_kin_hd_fix.css('display') == 'block') _kin_hd_fix.hide().removeClass('_fix_top');
	}else{
		if(_kin_hd_fix.css('display') == 'none') _kin_hd_fix.fadeIn().addClass('_fix_top');
	}
});

$(document).on("click", "#listLink", function(){
	location.href ="<c:out value="${mobileDomain}"/>/mobile/kinger/kingerView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&cPage=<c:out value="${commandMap.cPage}" />";	
});

$(document).on("click", "#prevLink", function(){
	location.href ="<c:out value="${mobileDomain}"/>/mobile/kinger/kingerRevView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&cPage=<c:out value="${commandMap.cPage}" />&EXP_REV_IDX=<c:out value="${info.PREV_EXP_REV_IDX}" />";
});

$(document).on("click", "#nextLink", function(){
	location.href ="<c:out value="${mobileDomain}"/>/mobile/kinger/kingerRevView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&cPage=<c:out value="${commandMap.cPage}" />&EXP_REV_IDX=<c:out value="${info.NEXT_EXP_REV_IDX}" />";
});

</script>