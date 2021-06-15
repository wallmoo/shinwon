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
	            <h2>참여한 이벤트</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="bbs-status"><!-- bbs-status -->
	            나의 참여 이벤트 <span class="warning"><fmt:formatNumber value="${totalCount }" groupingUsed="true" /></span>개 
	        </div><!-- // bbs-status -->
	
	        <table class="table-d table-col my-event" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
	        <caption>이벤트명, 응모일, 상태, 당첨자발표, 당첨결과로 구성된 나의 참여 이벤트 목록입니다.</caption>
	        <colgroup>
	            <col style="width: auto;">
	            <col style="width: 22%;">
	            <col style="width: 14%;">
	            <col style="width: 18%;">
	            <col style="width: 14%;">
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col">이벤트명</th>
	                <th scope="col">응모일</th>
	                <th scope="col">상태</th>
	                <th scope="col">당첨자<br />발표</th>
	                <th scope="col">당첨<br />결과</th>
	            </tr>
	        </thead>
	        <tbody>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="list" items="${list }" varStatus="status">
							<tr>
	    						<td class="text-left">
	        						<a href="javascript:;"><c:out value="${list.EVT_MST_TITLE }" /></a>
								</td>
								<td><ui:formatDate value="${list.EVT_JOIN_REG_DT }" pattern="yyyy.MM.dd"/></td>
								<td><c:out value="${list.EVT_MST_STATUS }" /></td>
								<td>
									<c:choose>
										<c:when test="${list.EVT_WIN_CNT > 0 }">
											<a href="<c:out value="${mobileDomain }"/>/mobile/customer/eventWinView.do?EVT_WIN_IDX=<c:out value="${list.EVT_WIN_IDX }" />" target="_self" class="button small disable"><span>당첨자<br />보기</span></a>
										</c:when>
										<c:otherwise>
											<span class="button small"><span>당첨자<br />보기</span></span>
											
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${list.EVT_WIN_CNT > 0 }">
											<c:choose>
												<c:when test="${list.EVT_JOIN_WIN_YN eq 'Y' }">
													<span class="warning">당첨</span>
												</c:when>
												<c:otherwise>
													미당첨
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
							    </td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
						    <td colspan="5">
						        <p class="no-more">
						            참여하신 이벤트가 없습니다.
						        </p>
						    </td>
						</tr>
					</c:otherwise>
				</c:choose>
	        </tbody>
	        </table><!-- // table-d -->
	
	        <div class="padder mt20">
	            <ul class="list list-a mt10">
	                <li>참여하신 이벤트 내역과 당첨 결과를 확인하실 수 있습니다.</li>
	                <li>최근 6개월간 참여한 이벤트 리스트입니다.</li>
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
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myEventList.do", "target":"_self", "method":"post"}).submit();
    };
});
//]]>
</script>
</body>
</html>