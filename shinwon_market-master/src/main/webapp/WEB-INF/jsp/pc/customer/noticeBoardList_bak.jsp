<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-customer"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <dl class="loc">
                <dt class="blind">현제 카테고리 경로</dt>
                <dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
                <dd><a href="javascript:void(0)"><span>고객센터</span></a></dd>
                <dd class="l"><a href="javascript:void(0)"><span>공지사항</span></a></dd>
            </dl>

            <%@ include file="/WEB-INF/jsp/pc/include/customer/aside.jsp" %>


            <div id="body"><!-- #body -->

                <h3 class="title">공지사항</h3> 

                <table class="bbs-list"><!-- bbs-list -->
                <caption>번호, 제목, 등록일, 조회수로 구성된 공지사항 목록입니다.</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: auto%;" />
                    <col style="width: 15%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">제목</th>
                        <th scope="col">등록일</th>
                        <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 상단공지 -->
                	<c:if test="${not empty topList }">
                		<c:forEach var="row" items="${topList }" varStatus="i">
		                    <tr>
		                        <td>공지</td>
		                        <td class="subject"><a href="javascript:;" data-brd_nts_idx="<c:out value="${row.BRD_NTS_IDX }"/>" data-brd_nts_top_yn="Y"><c:out value="${row.BRD_NTS_TITLE }"/></a></td>
		                        <td><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy-MM-dd"/></td>
		                        <td><fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/></td>
		                    </tr>
                    	</c:forEach>
					</c:if>
					<!-- 일반공지 -->
					<c:choose>
	                	<c:when test="${not empty list }">
	                    	<c:set var="listNum" value="${paging.listNum}" />
	                    	<c:forEach var="row" items="${list }" varStatus="i">										                 		
			                    <tr>
			                        <td><c:out value="${listNum }"/></td>
			                        <td class="subject"><a href="javascript:;" data-brd_nts_idx="<c:out value="${row.BRD_NTS_IDX }"/>" data-brd_nts_top_yn="N"><c:out value="${row.BRD_NTS_TITLE }"/></a></td>
			                        <td><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy-MM-dd"/></td>
			                        <td><fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/></td>
			                    </tr>
			                    <c:set var="listNum" value="${listNum-1}" />
							</c:forEach>
						</c:when>										                    	
					</c:choose>
                </tbody>
                </table><!-- // bbs-list -->
				
				<form id="frm" name="frm">
				<input type="hidden" name="BRD_NTS_IDX" value="" />
				<input type="hidden" name="BRD_NTS_TOP_YN" value="" />
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
				<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>" />
				
                <div class="section-pagination"><!-- section pagination -->
					<ui:frontpaging paging="${paging }" jsFunction="goPage" />
                </div><!-- // section pagination -->
				</form>
            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script>
	$(function()
	{
		// 제목 a Tag 클릭 이벤트
	    $(document).on("click", ".subject a", function () 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='BRD_NTS_IDX']").val($(this).data("brd_nts_idx"));
	        $frm.find("input[name='BRD_NTS_TOP_YN']").val($(this).data("brd_nts_top_yn"));	        
	        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/noticeBoardView.do", "target":"_self", "method":"get"}).submit();
	    });
		
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/noticeBoardList.do", "target":"_self", "method":"get"}).submit();
	    };
	});
</script>

<!-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body> -->
</html>
