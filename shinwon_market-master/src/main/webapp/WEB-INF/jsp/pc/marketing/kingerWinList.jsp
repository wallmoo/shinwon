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
			<form method="post" name="frm" id="frm" >
			<input type="hidden" name="EXP_MST_CD" id="EXP_MST_CD" />
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }" />" />
			<section class="king_sub king_dang king_dang_list">
				<!-- .king_hd S -->
				<div class="king_hd">
					<h2 class="logo_kinger"><a href="<c:out value="${frontDomain }" />/pc/marketing/kingerMain.do"><img src="<c:out value="${cdnDomain }" />/pc/img/kinger/logo_kinger.png" alt="KINGER 마켓플랜트 프리미엄 1% 고객 체험단. 킹저" /></a></h2>
				</div>
				<!--// .king_hd E -->
				
				<!-- .king_con S -->
				<div class="king_con">
					<h2 class="con_ti"><strong>당첨자 발표</strong></h2/>
					
					<table class="table_dang_list">
						<caption>킹저당첨자발표 리스트에서 번호, 제목, 등록일, 조회수로 구성된 표</caption>
						<colgroup>
						<col style="width:113px" />
						<col />
						<col style="width:95px" />
						<col style="width:158px" />
						</colgroup>
						<thead>
							<tr>
								<th><strong>번호</strong></th>
								<th><strong>제목</strong></th>
								<th><strong>등록일</strong></th>
								<th><strong>조회수</strong></th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty list }">
							<tr>
								<td colspan="4" class="no_list">등록된 당첨자 발표가 없습니다.</td>
							</tr>
							</c:when>
							<c:otherwise>
							<c:set var="listNum" value="${paging.listNum }" />
							<c:forEach items="${list }" var="row">
							<tr>
								<td><c:out value="${listNum }" /></td>
								<td class="td_ti"><a href="javascript:void(0)" data-exp_mst_cd="<c:out value="${row.EXP_MST_CD }" />" id="goDetail" ><span><c:out value="${row.EXP_WIN_NM }"/></span></a></td>
								<td><ui:formatDate value="${row.EXP_WIN_REG_DT }" pattern="yyyy.MM.dd"/></td>
								<td><c:out value="${row.EXP_WIN_CNT }" /></td>
							</tr>
							<c:set var="listNum" value="${listNum - 1 }" />
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<c:if test="${not empty list }">
					<div class=section-pagination style="padding:30px; 0">
						<ui:frontpaging paging="${paging }" jsFunction="goPage" />
					</div>
					</c:if>
				</div>
				<!-- .king_con E -->

			</section>
			</form>
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
<script type="text/javascript">
	goPage			= function(cPage){
		location.href = "<c:out value="${frontDoamin}" />/pc/marketing/kingerWinList.do?cPage=" + cPage;
	};
	
	$(document).on("click", "#goDetail", function(){
		$("#EXP_MST_CD").val($(this).data("exp_mst_cd"));
		$("#frm").attr("action", "<c:out value="${frontDoamin}" />/pc/marketing/kingerWinView.do").submit();
	});
</script>