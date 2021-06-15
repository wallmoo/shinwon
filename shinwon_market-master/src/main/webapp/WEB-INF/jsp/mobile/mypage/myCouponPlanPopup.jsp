<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<article id="container" class="container" data-role="content">
			<!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>쿠폰 적용 기획전</h2>
	            <a href="javascript:history.back(); return false;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <table class="table-d table-col coupon-plan" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
	        <caption>기획전명/기획전기간, 쿠폰유효기간으로 구성된 쿠폰 적용 기획전목록입니다.</caption>
	        <colgroup>
	            <col style="width: auto;">
	            <col style="width: 25%;">
	        </colgroup>
	        <thead>
	            <tr>
	                <th>기획전명/기획전기간</th>
	                <th>쿠폰유효기간</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:choose>
	        		<c:when test="${not empty list }">
	        			<c:forEach var="list" items="${list }" varStatus="status">
		        			<tr>
				                <td class="text-left">
				                	<p class="subject"><a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/planProductList.do?PLN_MST_IDX=<c:out value="${list.PLN_MST_IDX }" />','_self');" ><strong><c:out value="${list.PLN_MST_TITLE }" /></strong></a></p>
				                	<p class="date"><ui:formatDate value="${list.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/><br /> ~ <ui:formatDate value="${list.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></p>
				                </td>
				                <td>
				                	<c:choose>
				                		<c:when test="${list.CPN_MST_ISU_DAY_GBN eq 'B' }">
				                			발행일로 부터 <c:out value="${list.CPN_MST_USE_DAY }" />일
				                		</c:when>
				                		<c:otherwise>
				                			<ui:formatDate value="${list.CPN_MST_USE_ST_DT }" pattern="yyyy.MM.dd"/><br /> ~ <ui:formatDate value="${list.CPN_MST_USE_ED_DT }" pattern="yyyy.MM.dd"/>
				                		</c:otherwise>
				                	</c:choose>
				                </td>
				            </tr>
				    	</c:forEach>
	        		</c:when>
	        		<c:otherwise>
	        			<tr><td colspan=2>적용된 기획전이 없습니다.</td></tr>
	        		</c:otherwise>
	        	</c:choose>
	        </tbody>
	        </table><!-- // table-d -->
	
	        <form id="pageFrm" name="pageFrm">
	    	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	    	<input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>"/>
	         <div class="section-pagination"><!-- section pagination -->
	             <ui:frontpaging paging="${paging }" jsFunction="goPage" />
	         </div><!-- // section pagination -->
	        </form>
				
		</article>
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
	goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myCouponPlanPopup.do", "target":"_self", "method":"post"}).submit();
    };
}); //function
//]]>
</script>
</body>
</html>