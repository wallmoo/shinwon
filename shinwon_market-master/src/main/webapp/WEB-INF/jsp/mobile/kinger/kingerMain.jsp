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
            <h2>고객체험단</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .king_con_d S -->
		<section class="king_con_d">
			<header>
				<h3><span class="ir">KINGER</span></h3>
				<span class="tx_sub">마켓플랜트 1% 프리미엄 고객체험단, 킹저</span>
			</header>
			
			<!-- .king_recruit S -->
			<c:if test="${not empty info }">
			<dl class="king_recruit">
				<dt>
					<span class="blind">현제 진행중인 KIBER 모집</span>
					<strong>KINGER <c:out value="${info.EXP_KINGER_CD }" /> <span>모집</span></strong>
				</dt>
				<dd class="dd_info">
					<i class="ico_day">
						<span class="blind">KINGER</span>
						<c:choose>
							<c:when test="${info.DDAY >= 0  }">
								<strong>D-<c:out value="${info.DDAY }" />
							</c:when>
							<c:when test="${info.DDAY < 0 and info.WINCNT eq 0 }">
								<strong class="tx_dang">모집종료</strong>		
							</c:when>
							<c:when test="${info.DDAY < 0 and info.WINCNT > 0 }">
								<strong class="tx_dang">당첨발표</strong>
							</c:when>
						</c:choose>
					</i>
					<div class="img_d">
						<a href="javascript:goKingerView('<c:out value="${info.EXP_MST_CD }" />');"><img src="<c:out value="${cdnDomain }${info.PRD_IMG_URL_PATH }" />" alt="<c:out value="${info.PRD_IMG_ALT_TEXT }" />" /></a>
					</div>
					<p class="tx_d">
						<span class="tx_date"><ui:formatDate value="${info.EXP_MST_RCT_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EXP_MST_RCT_ED_DT }" pattern="yyyy.MM.dd"/></span>
						<strong class="tx_ti"><c:out value="${info.EXP_MST_NM }" /></strong>
						<span class="tx_model"><c:out value="${info.PRD_MST_ERP_CD }" /></span>
					</p>
				</dd>
				<dd class="dd_btn">
					<a href="javascript:goDang('<c:out value="${info.EXP_MST_CD }" />');" class="btn_dang"><strong>KINGER 당첨자 발표</strong></a>
					<a href="javascript:goMission('<c:out value="${info.EXP_MST_CD }" />');" class="btn_mission"><strong>KINGER 미션</strong></a>
				</dd>
			</dl>
			</c:if>
			<!--// .king_recruit E -->
			
			<dl class="king_list">
				<dt><span class="blind">KINGER CARD</span></dt>
				<dd class="list">
				<c:if test="${not empty list }">
					<c:set var="clsNm" value="" />
					<ul class="ui-grid-a _scroll_list_ck">
						<c:forEach items="${list }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${sta.count mod 2 == 1 || sta.first}">
								<c:set var="clsNm" value="a" />	
							</c:when>
							<c:when test="${sta.count mod 2 == 0}">
								<c:set var="clsNm" value="b" />	
							</c:when>
						</c:choose>
						<li class="ui-block-<c:out value="${clsNm }" />" >
							<a href="javascript:goKingerView('<c:out value="${row.EXP_MST_CD }" />');">
								<span class="tx_no">NO.<c:out value="${row.EXP_KINGER_CD }" /></span>
								<c:if test="${not empty row.PRD_IMG_URL_PATH }">
								<img src="<c:out value="${cdnDomain }${row.PRD_IMG_URL_PATH }" />" alt="<c:out value="${row.PRD_IMG_ALT_TEXT }" />" />
								</c:if>
								<strong class="tx_ti"><c:out value="${row.EXP_MST_NM }" /></strong>
							</a>
							<a href="javascript:void(0)" class="tx">
								<span>KINGER 리뷰 </span>
								<span><c:out value="${row.T_EXP_REV_CNT }" /> 개</span>
							</a>
						</li>
						</c:forEach>
					</ul>
				</c:if>
				</dd>
			</dl>
		</section>
		<!--// .king_con_d E -->

	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
			goKingerView			= function(exp_mst_cd){
				location.href = "<c:out value="${mobileDomain}"/>/mobile/kinger/kingerView.do?EXP_MST_CD=" + exp_mst_cd;
			};
			
			goDang					= function(exp_mst_cd){
				location.href = "<c:out value="${severDomain}" />/mobile/kinger/kingerWinList.do";
			};
			
			goMission				= function(exp_mst_cd){
				location.href="<c:out value="${severDomain}" />/mobile/kinger/kingerMissionInfo.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />";
			};
			
			$.com.win_scrollList = true;//스크롤 할거야~
			function _return_scrollList(_idx, _reNum){
				/*
					_idx = 리스트감싸고있는 객체
					_reNum = 리턴 몇번째넘어왔는지
				*/
				var totalCount		= <c:out value="${paging.totalPageCount}" />;
				var clsNm			= "";
				var _list_html 		= "";
				
				if(_reNum <= totalCount){
					$.ajax({
			        	async 	: false,
			        	type 	: "POST",
			        	data	: {
			        		"cPage"				: _reNum + 2,
			        		"EXP_MST_CD"		: '<c:out value="${info.EXP_MST_CD}" />'
			        	},
			        	url		: "<c:out value="${mobileDomain}" />/mobile/kinger/kingerListAjax.do",
						success : function(data) {
							
							$.each(data.list, function(i,item){
								if(i % 2 == 0){
									clsNm		= "a";
								}else{
									clsNm		= "b";
								}
								
								_list_html		= '<li class="ui-block-'+ clsNm + '">';
								_list_html		+= '<a href="javascript:goKingerView("' + item.EXP_MST_CD + '");">';
								_list_html 		+= '<span class="tx_no">NO.<c:out value="${row.EXP_KINGER_CD }" /></span>';
								
								if(item.PRD_IMG_URL_PATH != null && item.row.PRD_IMG_URL_PATH !== ""){
									_list_html		+= '<img src="<c:out value="${cdnDomain}" />"' + item.PRD_IMG_URL_PATH + '" alt="' + item.PRD_IMG_ALT_TEXT + '" >';	
								}
								
								_list_html		+= '<strong class="tx_ti">'+ item.EXP_MST_NM + '</strong>';
								_list_html 		+= '</a>';
								_list_html		+= '<a href="javascript:void(0)" class="btn_gre3 btn_re"><strong>KINGER 리뷰 ' + item.T_EXP_REV_CNT + '개</strong></a>';
								_list_html		+= '</li>';
							});
							
							_idx.append(_list_html);
						},
						error 	: function(err) {
							//alert("오류가 발생하였습니다.\n[" + err.status + "]");
							window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
						}
			        });
				}else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
			}
			
		</script>
</section>
<!--// #wrap E -->
</body>
</html>