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
		<section class="king_con_d dang_con_d">
			<header class="dang_title">
				<h3><strong class="blind">Kinger 당첨자발표</strong></h3>
				<span class="tx_sub">마켓플랜트 1% 프리미엄 고객체험단, 킹저</span>
			</header>
			
			<!-- .kin_info S -->
			<dl class="kin_info">
				<dt>
					<h3><c:out value="${info.EXP_WIN_MAN_CPY }" /></h3>
					<span><c:out value="${info.EXP_WIN_SUB_CPY }" /></span>
					<c:if test="${not empty info.PRD_IMG_URL_PATH }">
					<img src="<c:out value="${cdnDoamin }${info.PRD_IMG_URL_PATH }" />" alt="" style="height:150px" />
					</c:if>
				</dt>
				<dd class="dd_tx">
					<table>
						<caption>당첨자발표에 당첨자 이름으로 구성된 표</caption>
						<colgroup>
						<col />
						<col />
						</colgroup>
						<tbody>
							<c:forEach items="${list }" var="win" varStatus="sta">
							<c:if test="${sta.first || sta.count mod 2 == 1 }">
								<tr>
							</c:if>	
								<td><c:out value="${win.HID_MEM_MST_MEM_ID }"/>(<c:out value="${win.HID_MEM_MST_MEM_NM }" />)</td>
							<c:if test="${sta.last || sta.count mod 2 == 0 }">
								</tr>
							</c:if>
							</c:forEach>
						</tbody>
					</table>
				</dd>
			</dl>
			<!--// .kin_info E -->
			
			<div class="king_shBox">
				<strong>아이디를  검색하여 당첨을 확인하세요.</strong>
				<label for="">
					<input type="text" name="inp_shId" id="inp_shId" />
				</label>
				<a href="javascript:void(0)" class="btn_sh"><strong>검색</strong></a>
			</div>
			
			<p class="tx_ex">
				<ui:replaceLineBreak content="${info.EXP_WIN_ATN}" />
			</p>

			<div class="btn_box"><a href="javascript:goMission();" class="btn_blk"><strong>KINGER 미션 보기</strong></a></div>
		</section>
		<!--// .king_con_d E -->

			
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

	$(document).on("click", ".btn_sh", function(){
		if($("#inp_shId").val() == ""){
			alert("아이디를  입력하세요");
			$("#inp_shId").focus();
			return;
		}else{
			goSearch();
		}
	});
	
	goSearch		= function(){
		var	searchKey		= $("#inp_shId").val();
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"EXP_MST_CD" : "<c:out value="${info.EXP_MST_CD}"/>"
				, "SEARCHKEY": searchKey
			},
			url  : "<c:out value="${mobileDomain}" />/mobile/kinger/kingerWinerSearchAjax.do",
			success : function(data) {
				alert(data.strResultMsg);
			},
			error : function(err) {
				//alert("오류가 발생하였습니다.\n[" + err.status + "]");
				window.jquery
						|| console
								.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	};
	
	goMission	= function(){
		location.href="<c:out value="${severDomain}" />/mobile/kinger/kingerMissionInfo.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />";	
	};
	
</script>
	