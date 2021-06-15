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
	            <h2>기타 위탁업체 보기</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	            
	        <table class="table-b table-row mt20"><!-- table-b -->
	        <caption>위탁 업체명, 제위탁의 범위, 공유되는 정보, 보유 및 이용기간으로 구성된 위탁업체 정보 테이블입니다.</caption>
	        <colgroup>
	            <col style="width: 120px;" />
	            <col style="width: auto;" />
	        </colgroup>
	        <tbody>
	            <tr>
	                <th scope="row">위탁 업체명</th>
	                <td>
	                </td>
	            </tr>
	            <tr>
	                <th scope="row">제위탁의 범위</th>
	                <td>배송</td>
	            </tr>
	            <tr>
	                <th scope="row">공유되는 정보</th>
	                <td>고객명, 연락처, 주소, 배송내역</td>
	            </tr>
	            <tr>
	                <th scope="row">보유 및 이용기간</th>
	                <td>배송 완료시</td>
	            </tr>
	        </tbody>
	        </table><!-- // table-b -->
	            
	        <table class="table-b table-row mt20"><!-- table-b -->
	        <caption>위탁 업체명, 제위탁의 범위, 공유되는 정보, 보유 및 이용기간으로 구성된 위탁업체 정보 테이블입니다.</caption>
	        <colgroup>
	            <col style="width: 120px;" />
	            <col style="width: auto;" />
	        </colgroup>
	        <tbody>
	            <tr>
	                <th scope="row">위탁 업체명</th>
	                <td>
	                </td>
	            </tr>
	            <tr>
	                <th scope="row">제위탁의 범위</th>
	                <td>A/S대행</td>
	            </tr>
	            <tr>
	                <th scope="row">공유되는 정보</th>
	                <td>고객명, 연락처, 주소, 구매내역, A/S의뢰내용</td>
	            </tr>
	            <tr>
	                <th scope="row">보유 및 이용기간</th>
	                <td>서비스 종료시</td>
	            </tr>
	        </tbody>
	        </table><!-- // table-b -->
			
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