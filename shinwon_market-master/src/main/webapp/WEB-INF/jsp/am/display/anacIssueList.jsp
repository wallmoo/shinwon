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
                <a href="#none">전시 관리</a>
                &gt;
                <a href="#none">브랜드전시-아낙</a>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">브랜드전시-아낙</h3>
                
                 <div class="tab-a justified" style="margin-top: 20px; width: 100%"><!-- tab -->
                    <ul class="tab">
                        <li id="ANAC_MAIN_TAB"><a href="javascript:fnAnacChangeTab('MAIN');" >Main Page</a></li>
                        <li id="ANAC_TOP7_TAB"><a href="javascript:fnAnacChangeTab('TOP7');" >TOP7</a></li>
                        <li id="ANAC_REAL_TAB"><a href="javascript:fnAnacChangeTab('REAL');" >REAL ANAC</a></li>
                        <li id="ANAC_PLAY_TAB"><a href="javascript:fnAnacChangeTab('PLAY');" >PLAY</a></li>
                        <li id="ANAC_ISSUE_TAB"  class = "active"><a href="javascript:fnAnacChangeTab('ISSUE');" >ISSUE</a></li>
                        <li id="ANAC_ITEMS_TAB"><a href="javascript:fnAnacChangeTab('ITEMS');" >ITEMS</a></li>
                    </ul>
                </div><!-- // tab -->

                <div class="title-box">
                    <h4 class="title">검색</h4>
                </div>
                
                
                <div class="section-form"><!-- section-form-a -->
                
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
 
	                    <div class="form-group">
                            <label class="label"><span>상태</span></label>
                            <div class="field">
                                <input type="radio" id="stateA" name="searchAnaIsuDplYn" class="radio" <c:if test="${empty commandMap.searchAnaIsuDplYn }">checked="checked"</c:if> value=""/>
                                <label for="stateA">전체</label>
                                <input type="radio" id="stateB" name="searchAnaIsuDplYn" class="radio" <c:if test="${commandMap.searchAnaIsuDplYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                <label for="stateB">전시</label>
                                <input type="radio" id="stateC" name="searchAnaIsuDplYn" class="radio" <c:if test="${commandMap.searchAnaIsuDplYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                <label for="stateC">미전시</label>
                            </div>
                        </div>
                        
                    </form>
                </div><!-- // section-form-a -->

                 <div class="section-button search">
                        <a href="#none" id="search" class="button button-b submit"><span>검색</span></a>
                        <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                 </div>


                <h4 class="title">리스트</h4>
                <div class="right">
                    <a href="#none" id="goForm" class="button button-b"><span>등록</span></a>
                </div>
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 7%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>ID</th>
                                <th>이슈명1</th>
                                <th>이슈명2</th>
                                <th>일정</th>
                                <th>등록일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
			                                <td>
                                                <a href="#none" class="list-title" data-ana_isu_idx="${row.ANA_ISU_IDX }" >
                                                    <c:out value="${row.ANA_ISU_IDX }"/>
                                                </a>
			                                </td>
			                                <td>
			                                	 <c:out value="${row.ANA_ISU_NM1 }"/>
			                                </td>
			                                <td>
			                                	 <c:out value="${row.ANA_ISU_NM2 }"/>
			                                </td>
			                                <td>
			                                	<ui:formatDate value="${row.ANA_ISU_ST_DT }" pattern="yyyy.MM.dd"/>~
			                                	<ui:formatDate value="${row.ANA_ISU_ED_DT }" pattern="yyyy.MM.dd"/>
			                                </td>
			                                <td><ui:formatDate value="${row.ANA_ISU_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
			                                <td>
                                                <span class="label label-<c:out value="${row.ANA_ISU_DPL_YN eq 'Y'?'b':'a' }"/>">
                                                    <c:out value="${row.ANA_ISU_DPL_YN eq 'Y'?'전시':'미전시' }"/>
                                                </span>
                                            </td>
			                            </tr>
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div><!-- // col list -->

                <div class="pagination"><!-- pagination -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->

                <form id="frm" name="frm">
                    <input type="hidden" name="ANA_ISU_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchAnaIsuDplYn" value="<c:out value="${commandMap.searchAnaIsuDplYn }"/>"/>
                     <div class="bbs-status"><!-- bbs status -->
                        <div class="page">
                            총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
                        </div>
	                    <div class="sort">
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                    </div>
	                </div>
                </form>

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
    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacIssueForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='ANA_ISU_IDX']").val($(this).data("ana_isu_idx"));
        
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/anacIssueEdit.do", "target":"_self", "method":"post"}).submit();
        
        
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/anacIssueList.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/anacIssueList.do", "target":"_self", "method":"post"}).submit();
    };
    
    fnAnacChangeTab  = function (pageGb) 
    {
    	if(pageGb=="MAIN") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacMainList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="TOP7") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacTopList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="REAL") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacRealList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="PLAY") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacPlayList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="ISSUE") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacIssueList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="ITEMS") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacItemsList.do", "target":"_self", "method":"post"}).submit();
    	
    };
    
});
</script>
</body>
</html>