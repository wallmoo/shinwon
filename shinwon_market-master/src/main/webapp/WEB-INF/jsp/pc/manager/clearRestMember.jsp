<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<script>
	window.history.forward(); 
</script>

<body class="page-join">

	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container">
			<div class="minW contents qAcc_d"><!-- .contents S -->
				
				<div class="qAcc_top">
					휴면계정이 해제되었습니다.
				</div>
				<dl class="qAcc_con">
					<dt>
						<h2>마켓플랜트 쇼핑몰 재방문을 환영합니다. </h2>
						<h3>이제 마켓플랜트의 모든 회원 서비스를 원활히 이용하실 수 있습니다. </h3>
					</dt>
					<dd class="info">
						<table class="table_st3">
							<caption></caption>
							<colgroup>
							<col style="width:229px;*width:149px" />
							<col />
							</colgroup>
							<tbody>
								<tr>
									<th><span>미이용 기간</span></th>
									<td><span><c:out value="${not empty restMemberInfo.UNUSED_DT ? restMemberInfo.UNUSED_DT : 0 }"/>일</span></td>
								</tr>
								<tr>
									<th><span>휴면계정 처리일</span></th>
									<td><span><ui:formatDate pattern="yyyy.MM.dd" value="${restMemberInfo.MEM_MST_RST_DT }"/></span></td>
								</tr>
								<tr>
									<th><span>휴면계정 해제일</span></th>
									<td><span><ui:formatDate pattern="yyyy.MM.dd" value="${restMemberInfo.TODAY }"/></span></td>
								</tr>
							</tbody>
						</table>
						<p class="tx_ex">
							<span class="co_red">※ 휴면 회원 전환 시, 보유 크라운는 소멸되었습니다. </span>
							<span class="co_red">※ 보유하셨던 포인트는 별도 소멸없이 유지되어 있으니, 자세한 내용은 MYLAND에서 확인해 주세요.</span>
						</p>
					</dd>
					<dd class="btn_box">
						<a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="btn_st1 btn_rd"><span>쇼핑하기</span></a>
					</dd>
				</dl>
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->
		<%-- 각 화면 본문 끝 --%>

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
		
	</section>
	
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
});
//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>