<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<article id="container" class="container" data-role="content">
			<!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>1:1문의</h2>
	            <a href="javascript:history.back(); return false;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	            
	        <div class="section-button mt20"><!-- section-button -->
	            <a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myInquiryForm.do" target="_self" class="button primary full"><span>1:1 문의하기</span></a>
	        </div><!-- // section-button -->
	
	        <div class="bbs-status"><!-- bbs-status -->
	            문의 <span class="warning"><fmt:formatNumber value="${totalCount }" groupingUsed="true" /></span>건
	        </div><!-- // bbs-status -->
	
	        <table class="table-a table-col qna-list" border="0" cellpadding="0" cellspacing="0"><!-- qna-list -->
	        <caption>구분, 질문내용, 진행현황으로 구성된 일대일 문의 목록입니다.</caption>
	        <colgroup>
	            <col style="width: 10%;">
	            <col style="width: auto;">
	            <col style="width: 20%;">
	        </colgroup>
	        <thead class="blind">
	            <tr>
	                <th scope="col">구분</th>
	                <th scope="col">질문내용</th>
	                <th scope="col">진행현황</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:choose>
	         		<c:when test="${not empty list }">
	         			<c:forEach var="list" items="${list }" varStatus="status">
	         				<tr>
	         					<td><strong class="large">Q<span class="blind">질문</span></strong></td>
				                <td class="text-left">
				                    <p class="subject">
				                        <a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myInquiryView.do?MEM_ADV_IDX=<c:out value="${list.MEM_ADV_IDX }" />" target="_self">
				                        	<strong>[<c:out value="${list.MEM_ADV_QST_TYPE_NM }" />] <c:out value="${list.MEM_ADV_TITLE }" /></strong>
				                        </a>
				                    </p>
				                    <p class="date">
				                        <ui:formatDate value="${list.MEM_ADV_REG_DT }" pattern="yyyy.MM.dd"/>
				                        <span class="blind">에 작성</span>
				                    </p>
				                </td>
				                <td>
				                	<c:choose>
				                    	<c:when test="${list.MEM_ADV_RPL_YN eq 'N' }">
				                    		<span class="no">미답변</span>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<span class="warning">답변완료</span>
				                    	</c:otherwise>
				                    </c:choose>
				                </td>
							</tr>
	         			</c:forEach>
	         		</c:when>
	         		<c:otherwise>
	         			<tr>
		                   <td colspan="3">
		                       <p class="message no-more">
		                           1:1문의내역이 없습니다. 
		                       </p>
		                   </td>
		               </tr>
	         		</c:otherwise>
	         	</c:choose>
	        </tbody>
	        </table><!-- // qna-list -->
	
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>문의하신 내용과 답변내용 확인하실 수 있습니다.</li>
	                <li>질문 내용에 만족하실만한 답변 작성을 위해서 시간 소요가 될 수 있는 점 양해 부탁드립니다.</li>
	                <li>답변 완료된 문의는 수정 하실 수 없습니다.</li>
	            </ul>
	        </div>
	
	        <form id="pageFrm" name="pageFrm">
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
				<div class="section-pagination"><!-- section pagination -->
					<ui:frontpaging paging="${paging }" jsFunction="goPage" />
				</div><!-- // section pagination -->
			</form>
				
		</article>
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>

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
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
    };
});
//]]>
</script>
</body>
</html>