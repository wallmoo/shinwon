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
	        			<th colspan="3">온라인</th>
	        			<th rowspan="2" class="active">오프라인<span class="blind">현재위치</span></th>
	        		</tr>
	        		<tr>
	        			<td><a href="<c:out value="${mobileDomain }"/>/mobile/member/basicMemInfoPolicy.do" class="_pg_link" target="_self">통합회원</a></td>
	        			<td><a href="<c:out value="${mobileDomain }"/>/mobile/member/simpleMemInfoPolicy.do" class="_pg_link" target="_self">간편회원</a></td>
	        			<td><a href="<c:out value="${mobileDomain }"/>/mobile/member/businessMemInfoPolicy.do" class="_pg_link" target="_self">기업회원</a></td>
	        		</tr>
	        	</tbody>
	        	</table>
	        </div><!-- // access-tab -->
	
	        <div class="padder access-terms"><!-- access-terms -->
	            <p>
	                ㈜이패스씨앤아이(이하 &ldquo;회사&rdquo;라 함)는 회원의 개인정보보호를 매우 중요시하며, 회원이 회사의 서비스 (이하 &ldquo;마켓플랜트 서비스&rdquo; 또는 &ldquo;마켓플랜트&rdquo;이라 함)를 이용함과 동시에 매장, 온라인 및 모바일 상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고 있습니다. 이에 회사는 ‘개인정보보호법’, ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’등 모든 관련 법규를 준수하기 위하여 [㈜이패스씨앤아이 개인정보처리방침]을 제정하여 이를 준수하고 마켓플랜트 개인정보처리방침을 영업장에 비치하거나 홈페이지(www.epasscni.com)에 공개하여 회원이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br />
	                회사는 개인정보 보호정책을 홈페이지에 공개함으로써 회원이 언제나 용이하게 보실 수 있도록 조치하고 있습니다. 회사의 개인정보 보호정책은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인해 수시로 변경될 수 있고, 이에 따른 개인정보 보호정책의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 그리고 개인정보 보호정책을 개정하는 경우 회사는 그 변경사항에 대하여 즉시 매장 안내문 또는 홈페이지를 통해서 게시하고 버전 번호 및 개정일자 등을 부여하여 개정된 사항을 회원이 쉽게 알아볼 수 있도록 하고 있습니다. 회원께서는 매장 및 사이트 방문시 수시로 확인하시기 바랍니다.<br />
	                마켓플랜트의 개인정보처리방침은 다음과 같은 내용을 담고 있습니다. 
	            </p>
	
	                                     
	        </div><!-- // access-terms -->
			
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