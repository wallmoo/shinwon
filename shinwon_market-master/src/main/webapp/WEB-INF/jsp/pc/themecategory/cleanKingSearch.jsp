<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/themecategory/themaHeader.jsp" %>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-theme">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	</header>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->

			<!-- .clean_d S -->
			<section class="clean_d">
				
				<!-- .search S -->
				<div class="search">
					<dl>
						<dt>
							<div class="blind">
								<span>For my advanced lifestyle</span>
								<h2>홈케어의 모든 것!</h2>
								<h3>전문가라서 다른  프리미엄 홈케어 서비스</h3>
								<p>내가 숨쉬는 공간, 내가 관리한다.<br/>건강한 라이프의 첫걸음, 마켓플랜트 클린킹에서 케어해 드립니다.</p>
							</div>
						</dt>
						<dd>
							<form method="post" name="sFrm" id="sFrm" action="<c:out value="${frontDomain}"/>/pc/themecategory/cleanKingSearch.do" >
								<input type="hidden" name="startCount"value="<%=startCount%>">
								<input type="hidden" name="collection" value="<%=collection%>">
								<input type="hidden" name="realQuery" value="<%=realQuery%>" />
								<input type="hidden" name="MGZ_MST_IDX" id="MGZ_MST_IDX" value="" />
									<label for="inp_search">
										<input type="text" id="inp_search" name="searchKeyword" placeholder="home cleaning의 모든 것!  키워드로 검색하세요" value="<%=searchKeyword %>" />
										<a href="javascript:void(0)" onClick="javascript:doThemaSearch();" class="ico_search"><span class="blind">검색하기</span></a>
									</label>
							</form>
						</dd>
					</dl>
				</div>
				<!-- .search E -->
				<!-- .search_list S -->
				<div class="search_list">
					<dl class="minW">
						
						<dt>
							<span class="ti">검색결과 <strong><%=themaCount %></strong>건</span>
							<a href="<c:out value="${frontDomain }" />/pc/themecategory/cleanKingMain.do" class="btn_st0 btn_white"><span>홈케어 홈</span></a>
						</dt>
						
						<dd class="list">
							<ul>
								<%@ include file="/WEB-INF/jsp/pc/search/result/result_thema.jsp" %>
							</ul>
						</dd>
						<dd class="pg_num_box">
							<%=wnsearch.getThemaPageLinks(startCount , themaCount, viewResultCount, 10)%>
						</dd>
					</dl>
				</div>
				<!-- .search_list E -->

				
			</section>
			<!-- .clean_d E -->
			
		


		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	
</section>
<!--// #wrap E -->
<script type="text/javascript">
goDetail	= function(idx){
	$("#MGZ_MST_IDX").val(idx);
	$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/cleanKingConView.do").submit();
};
</script>
</body>
</html>