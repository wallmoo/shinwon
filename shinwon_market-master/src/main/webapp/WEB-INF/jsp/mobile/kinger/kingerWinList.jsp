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
			
			
			<table>
				<caption>KINGER 당첨자발표에 제목, 등록일로 구성된 표</caption>
				<colgroup>
				<col />
				<col style="width:85px" />
				</colgroup>
				<thead>
					<tr>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty list }">
					<tr>
						<td colspan="2" class="no_list">등록된 당첨자 발표가 없습니다.</td>
					</tr>						
					</c:when>
					<c:otherwise>
					<c:forEach items="${list }" var="row">
					<tr>
						<td><a href="javascript:goDetail('<c:out value="${row.EXP_MST_CD }" />')"><c:out value="${row.EXP_WIN_NM }"/><c:if test="${row.NEWMARK eq 'Y' }"><i class="ico_new"><span>new</span></i></c:if></a></td>
						<td><ui:formatDate value="${row.EXP_WIN_REG_DT }" pattern="yyyy.MM.dd"/></td>
					</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="section-pagination" style="padding:15px 0;">
				<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			</div>
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
	goPage			= function(cPage){
		location.href = "<c:out value="${serverDoamin}" />/mobile/kinger/kingerWinList.do?cPage=" + cPage;
	};
	
	goDetail		= function(exp_mst_cd){
		location.href = "<c:out value="${severDomain}" />/mobile/kinger/kingerWinView.do?cPage=<c:out value="${commandMap.cPage}" />&EXP_MST_CD=" + exp_mst_cd;
	};
</script>