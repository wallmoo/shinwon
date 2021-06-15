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
                <a href="#none">프로모션관리</a>
                &gt;
                <span>이벤트관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">이벤트관리</h3>

                <div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
                    <ul class="tab">
                        <li><a href="#none" id="goBiasicEdit">기본정보</a></li>
                        <li><a href="#none" id="goEventEntryList">응모자확인&당첨자 선정</a></li>
                        <li class="active"><a href="#none" id="goEventEntryWinnerList">당첨자 발표</a></li>
                    </ul>
                </div><!-- // tab -->
                <h4 class="title">이벤트명 : <c:out value="${info.EVT_MST_TITLE }"/></h4>
                        <div class="section-button">
		                    <a href="#none" id="goForm" class="button button-a"><span>등록</span></a>
		                </div>
		               
		                <form name="tabForm" id="tabForm">
                            <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
                            <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
                            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPageBasic }"/>"/>
                            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
                            <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                            <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                            <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                            <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                            <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                            <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                            <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                        </form>
                    
                         
		                <div class="table-a"><!-- col list -->
		                    <table class="core">
				                <colgroup>
				                    <col style="width: 5%;" />
				                    <col style="width: auto;" />
				                    <col style="width: 20%;" />
				                    <col style="width: 15%;" />
				                    <col style="width: 15%;" />
				                </colgroup>
				                <thead>
				                    <tr>
				                        <th>NO</th>
				                        <th>제목</th>
				                        <th>등록일</th>
				                        <th>작성자</th>
				                        <th>상태</th>
				                    </tr>
				                </thead>
				                <tbody>
				                    <c:choose>
				                        <c:when test="${not empty list }">
				                            <c:set var="listNum" value="${paging.listNum}" />
				                            <c:forEach var="row" items="${list }" varStatus="i">
				                                <tr>
				                                 <td><c:out value="${listNum }"/></td>
				                                 <td>
				                                 	<a href="#none" class="list-title" data-evt_win_idx="<c:out value="${row.EVT_WIN_IDX }"/>">
				                                 		<c:out value="${row.EVT_WIN_NM }" />
				                                 	</a>
				                                 </td>
				                                 <td><ui:formatDate value="${row.EVT_WIN_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
				                                 <td><c:out value="${row.EVT_WIN_REG_NM }" />(<c:out value="${row.EVT_WIN_REG_ID }" />)</td>
				                                 <td>
													<span class="label label-<c:out value="${row.EVT_WIN_USE_YN eq 'Y'?'b':'a' }"/>">
														<c:out value="${row.EVT_WIN_USE_YN eq 'Y'?'사용':'미사용' }" />
													</span>
												</td>
				                                 
				                          
				                             </tr>
				                             <c:set var="listNum" value="${listNum-1}" />
				                            </c:forEach>
				                        </c:when>
				                        		                        
				                        <c:otherwise>
				                            <tr><td colspan="5">등록된 당첨자발표가 없습니다.</td></tr>
				                        </c:otherwise>
				                    </c:choose>             
				                </tbody>
				            </table>
		                </div><!-- // col list -->
		
		                <div class="pagination"><!-- pagination -->
		                    <ui:paging paging="${paging }" jsFunction="goPage" />
		                </div><!-- // pagination -->
		
		                <form name="tabForm" id="tabForm">
		                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
		                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
		                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPageBasic }"/>"/>
		                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
		                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
		                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
		                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
		                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
		                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
		                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
		                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
		                </form>
		                <form id="frm" name="frm">
		                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
		                    <input type="hidden" name="EVT_WIN_IDX" value="" />
		                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
		                    <input type="hidden" name="cPageEntry" value="<c:out value="${commandMap.cPageEntry }"/>"/>
		                    <input type="hidden" name="cPageBasic" value="<c:out value="${commandMap.cPageBasic }"/>"/>
		                    <input type="hidden" name="pageSizeBasic" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
		                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
		                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
		                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
		                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
		                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
		                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
		                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
		                    <div class="bbs-status"><!-- bbs status -->
                                <div class="page">
		                            총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
		                        </div>
		                        <div class="sort">
		                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSizeEntry" type="" jsFunction="goPage"/>
		                        </div>
		                    </div>
		                </form>
                    <%-- </c:otherwise>
                </c:choose> --%>
            </div><!-- // contents-inner -->

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    
    // 목록버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventList.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 기본정보 탭 클릭 이벤트
    $(document).on("click", "#goBiasicEdit", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 응모자 탭 클릭 이벤트
    $(document).on("click", "#goEventEntryList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target" : "_self", "method" : "post"}).submit();
    });
    
    $(document).on("click", "#goForm", function () {
    	$("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerForm.do", "target":"_self", "method":"post"}).submit();
    });
    
 // 상세페이지 이동
    $(document).on("click", ".list-title", function () {
    	var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='EVT_WIN_IDX']").val($this.data("evt_win_idx"));
        
        var url = "";
        
        url = "<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerEdit.do";
        
        $frm.attr({"action":url, "target":"_self", "method":"get"}).submit();
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSizeEntry']", function () {
        goPage(1);
    });
     
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPageEntry']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target":"_self", "method":"post"}).submit();
    };
    
});
</script>
</body>
</html>