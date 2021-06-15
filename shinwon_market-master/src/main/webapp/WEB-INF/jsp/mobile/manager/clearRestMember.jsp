<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-login"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		
			<!-- .section-title S -->
			<div class="section-title _hd_fix">
	            <h2>휴면계정복원</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .quieRestore S -->
			<section class="quieRestore">
				<h3>마켓플랜트 쇼핑몰 <br/>재방문을 환영합니다. </h3>
				<span class="tx_sub">이제 마켓플랜트의 <br/>모든 회원 서비스를 원할히 이용하실 수 있습니다. </span>
	
				<table>
					<caption>휴면계정복원에 미이용 기간, 휴면 계정 처리일, 휴면 계정 해제일로 구성된 표</caption>
					<colgroup>
					<col style="width:50%" />
					<col />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>미이용 기간</strong></th>
							<td><c:out value="${not empty restMemberInfo.UNUSED_DT ? restMemberInfo.UNUSED_DT : 0  }"/>일</td>
						</tr>
						<tr>
							<th><strong>휴면 계정 처리일</strong></th>
							<td><ui:formatDate pattern="yyyy.MM.dd" value="${restMemberInfo.MEM_MST_RST_DT }"/></td>
						</tr>
						<tr>
							<th><strong>휴면 계정  해제일</strong></th>
							<td><ui:formatDate pattern="yyyy.MM.dd" value="${restMemberInfo.TODAY }"/></td>
						</tr>
					</tbody>
				</table>
	
				<p class="tx_ex">
					<span><i class="ico_exc">!</i>휴면 회원 전환 시, 보유 포인트는 보관되며, 보유 크라운은 소멸되었습니다.</span>
					<span><i class="ico_exc">!</i>자세한 내용은 마이페이지에서 확인해주세요.</span>
				</p>
			</section>
			<!--// .quieRestore E -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
});
//]]>
</script>
</body>
</html>