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
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->

			<!-- .wedding_d S -->
			<section class="wedding_d">
				
				<!-- .search S -->
				<div class="search">
					<dl>
						<dt>
							<div class="blind">
								<strong>Your Sweet Wedding</strong>
								<h2>결혼하세요?</h2>
								<h3>시간은 없고, 뭘 구입해야 할지 고민중이시라면<br/>마켓플랜트 웨딩킹에서 척척 해결하세요~</h3>
							</div>
						</dt>
						
						<dd>
							<form method="post" name="sFrm" id="sFrm" action="<c:out value="${frontDomain}"/>/pc/themecategory/weddingSearch.do" >
								<input type="hidden" name="startCount"value="<%=startCount%>">
								<input type="hidden" name="collection" value="<%=collection%>">
								<input type="hidden" name="realQuery" value="<%=realQuery%>" />
								<input type="hidden" name="MGZ_MST_IDX" id="MGZ_MST_IDX" value="" />
									<label for="inp_search">
									<input type="text" id="inp_search" name="searchKeyword" placeholder="Wedding plan의 모든 것! 키워드로 검색하세요" value="<%=searchKeyword %>"/>
									<a href="javascript:void(0)" onClick="javascript:doThemaSearch();" class="ico_search"><span class="blind">검색하기</span></a>
							</label>
							</form>
						</dd>
						
					</dl>
					
					<i class="msk_gr"></i>
					<iframe src="https://player.vimeo.com/video/161427096?autoplay=1&loop=1&title=0&byline=0&portrait=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
				</div>
				<!-- .search_list S -->
				<div class="search_list">
					<dl class="minW">
						
						<dt>
							<span class="ti">검색결과 <strong><%=themaCount %></strong>건</span>
							<a href="<c:out value="${frontDomain }" />/pc/themecategory/weddingMain.do" class="btn_st0 btn_white"><span>웨딩홈</span></a>
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
			<!-- .wedding_d E -->
			
		


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
	$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/weddingConView.do").submit();
};
</script>
</body>
</html>