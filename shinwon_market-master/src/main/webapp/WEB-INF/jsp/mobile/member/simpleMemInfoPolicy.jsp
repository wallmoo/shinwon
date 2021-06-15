<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-etc"><!-- page class : page-etc -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>개인정보취급방침</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <p class="text-center mt20">
	            <strong class="xlarge"><span class="warning">마켓플랜트</span> 개인정보취급방침</strong>
	        </p>
	
	        <div class="access-tab"><!-- access-tab -->
	        	<table border="0" cellpadding="0" cellspacing="0">
	        	<colgroup>
	        		<col style="width: 25%;" span="3" />
	        		<col style="width: auto;" />
	        	</colgroup>
	        	<tbody>
	        		<tr>
	        			<th colspan="3" class="active">온라인<span class="blind">현재위치</span></th>
	        			<th rowspan="2"><a href="<c:out value="${mobileDomain }"/>/mobile/member/offlineMemInfoPolicy.do" class="_pg_link" target="_self">오프라인</a></th>
	        		</tr>
	        		<tr>
	        			<td><a href="<c:out value="${mobileDomain }"/>/mobile/member/basicMemInfoPolicy.do" class="_pg_link" target="_self">통합회원</a></td>
	        			<td class="active"><a href="javascript:;">간편회원</a><span class="blind">현재위치</span></td>
	        			<td><a href="<c:out value="${mobileDomain }"/>/mobile/member/businessMemInfoPolicy.do" class="_pg_link" target="_self">기업회원</a></td>
	        		</tr>
	        	</tbody>
	        	</table>
	        </div><!-- // access-tab -->
	
	        <div class="padder access-terms"><!-- access-terms -->
	        
	        	<p class="mt20">
	                    마켓플랜트 쇼핑몰은 회원의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보 취급방침을 수립 &middot; 공개합니다.<br />
	                    마켓플랜트의 개인정보 취급방침은 관련 법률 및 지침의 변경과 마켓플랜트 내부 운영방침의 변경에 따라 변경될 수 있습니다. [개인정보 취급방침]이 변경될 경우 변경사항은 마켓플랜트 쇼핑몰에 게시됩니다. 변경사항에 의문이 있으실 경우는 언제라도 담당자에게 문의하시거나 마켓플랜트 쇼핑몰을 방문하여 확인하실 수 있습니다.<br />
	                    마켓플랜트는 회원의 정보를 소중히 여기고, 불법적인 개인정보 유출 방지를 위해 최선의 노력을 다하겠습니다.
	                </p>
            </div>
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