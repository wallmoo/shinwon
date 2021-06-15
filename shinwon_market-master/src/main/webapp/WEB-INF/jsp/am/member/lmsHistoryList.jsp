<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
	<a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

	<aside id="navigation"><!-- navigation -->
		<nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</nav>
	</aside><!-- // navigation -->

	<div id="body"><!-- body -->

		<section id="contents"><!-- contents -->

			<div id="breadcrumb"><!-- breadcrumb -->
				<a href="#none"><i class="icon-home em"></i> HOME</a>
				&gt;
				<a href="#none">회원관리</a>
				&gt;
				<span>LMS이력</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">LMS이력</h3>

				<div class="title-box">
					<h4 class="title">검색</h4>
				</div>

				<div class="section-form"><!-- section-form-a -->

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="searchYn" value="Y" />                    
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
					<div class="form-group">
						<label class="label"><span>발송기간</span></label>
						<div class="field">
							<input type="text" class="text datepicker s-datepicker" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />" /> ~
							<input type="text" class="text datepicker e-datepicker" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />" />
							<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            (날짜형식: YYYY-MM-DD)
						</div>
					</div>
					<div class="form-group">
						<label class="label"><span>제목</span></label>
						<div class="field">
							<input type="text" class="text" id="searchTitle" name="searchTitle" value="<c:out value="${commandMap.searchTitle }"/>"/>
						</div>
					</div>
					<div class="form-group">
						<label class="label"><span>내용</span></label>
						<div class="field">
							<input type="text" class="text" id="searchContents" name="searchContents" value="<c:out value="${commandMap.searchContents }"/>"/>
						</div>
					</div>
				</form>
				
				</div><!-- // section-form-a -->

                <div class="section-button search">
						<a href="javascript:search();" class="button button-b submit"><span>검색</span></a>
						<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                </div>


				<h4 class="title">목록</h4>

				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: 15%;" />
							<col style="width: 20%;" />
							<col style="width: auto;" />
							<col style="width: 10%;" />
							<col style="width: 15%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>휴대폰 번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>처리자명</th>
								<th>발송일</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><c:out value="${listNum }" /></td>
									<td>
										<c:if test="${not empty item.LMS_MST_HP2 && not empty item.LMS_MST_HP3 }">
											<c:out value="${item.LMS_MST_HP1 }"/>-<c:out value="${item.LMS_MST_HP2}"/>-<c:out value="${item.LMS_MST_HP3 }"/>
										</c:if>
									</td>
									<td><c:out value="${item.LMS_MST_TITLE }"/></td>
									<td><ui:replaceLineBreak content="${item.LMS_MST_CONTENTS}"/></td>
									<td><c:out value="${item.LMS_MST_REG_ID }"/></td>
									<td><ui:formatDate value="${item.LMS_MST_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
								<c:if test="${commandMap.searchYn eq 'Y'}">
									<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
									</tr>
								</c:if>
								<c:if test="${commandMap.searchYn ne 'Y'}">
									<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
									</tr>
								</c:if>
						    </c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div><!-- // col list -->

                <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                <input type="hidden" name="searchYn" value="Y" />
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchTitle" value="<c:out value="${commandMap.searchTitle }"/>"/>
                <input type="hidden" name="searchContents" value="<c:out value="${commandMap.searchContents }"/>"/>
                
				<div class="pagination"><!-- pagination -->
				    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->

				<div class="bbs-status"><!-- bbs status -->
					<div class="page">
						총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
					</div>
					<div class="sort">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
					</div>
				</div><!-- // bbs status -->

                </form>
                
			</div><!-- // contents-inner -->

		</section><!-- // contents -->

	</div><!-- // body -->

	<footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {

	// 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
    
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/lmsHistoryList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/lmsHistoryList.do", "target":"_self", "method":"post"}).submit();
    };
});
</script>
</body>
</html>