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
                <a href="#none">고객센터</a>
                &gt;
                <span>카드 이벤트 안내 관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">카드 이벤트 안내 관리</h3>

                <div class="title-box">
                    <h4 class="title">검색</h4>

                    <div class="right">
                        <a href="#none" id="search" class="button button-b"><span>검색</span></a>
                        <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                    </div>
                </div>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
 	                    
	                    <div class="form-group">
	                        <label class="label"><span>상태</span></label>
	                        <div class="field">
	                            <input type="radio" id="stateA" name="searchBrdCarUseYn" class="radio" <c:if test="${empty commandMap.searchBrdCarUseYn }">checked="checked"</c:if> value=""/>
	                            <label for="stateA">전체</label>
	                            <input type="radio" id="stateB" name="searchBrdCarUseYn" class="radio" <c:if test="${commandMap.searchBrdCarUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                            <label for="stateB">사용</label>
	                            <input type="radio" id="stateC" name="searchBrdCarUseYn" class="radio" <c:if test="${commandMap.searchBrdCarUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
	                            <label for="stateC">미사용</label>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
		                    <label class="label"><span>카드사</span></label>
		                    <div class="field">
		                        <select class="select" name="searchBrdCmnComIdx" id="searchBrdCmnComIdx">
		                            <option value="" <c:if test="${empty commandMap.searchBrdCmnComIdx }">selected="selected"</c:if>>전체</option>
		                            <c:if test="${not empty codeList }">
		                                <c:forEach var="codeRow" items="${codeList }" varStatus="i">
		                                    <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${codeRow.CMN_COM_IDX eq commandMap.searchBrdCmnComIdx }">selected="selected"</c:if>>
		                                        <c:out value="${codeRow.CMN_COM_NM }"/>
		                                    </option>
		                                </c:forEach>
		                            </c:if>
		                        </select>
		                    </div>
		                </div>
                
                        <div class="form-group">
                            <label class="label"><span>내용</span></label>
                            <div class="field">
                                <input type="text" class="text long" name="searchKeyword" id="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" placeholder="제목 또는 내용에서 찾으시는 단어를 입력하세요."/>
                            </div>
                        </div>
                        
                    </form>
                </div><!-- // section-form-a -->


                <h4 class="title">리스트</h4>
                <div class="right">
                    <a href="#none" id="goForm" class="button button-b"><span>등록</span></a>
                </div>
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                        	<col style="width: 5%;" />
                        	<col style="width: 20%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                            	<th>NO</th>
                            	<th>유형</th>
                                <th>제목</th>
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
                                        	<td><c:out value="${row.BRD_CMN_COM_NM }"/></td>
			                                <td class="left">
			                                    <a href="#none" class="list-title" data-brd_car_idx="<c:out value="${row.BRD_CAR_IDX }"/>">
			                                        <c:out value="${row.BRD_CAR_TITLE }"/>
			                                    </a>
			                                </td>
			                                <td>
			                                   <span class="label label-<c:out value="${row.BRD_CAR_USE_YN eq 'Y'?'b':'a' }"/>">
	                                                <c:out value="${row.BRD_CAR_USE_YN eq 'Y'?'사용':'미사용' }"/>
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
                    <input type="hidden" name="BRD_CAR_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchBrdCarUseYn" value="<c:out value="${commandMap.searchBrdCarUseYn }"/>"/>
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
<script type="text/javascript">
$(document).ready(function () {
    
    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/cardBoardForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='BRD_CAR_IDX']").val($(this).data("brd_car_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/cardBoardEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 내용 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchKeyword", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });    
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/board/cardBoardList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/cardBoardList.do", "target":"_self", "method":"post"}).submit();
    };
    
});
</script>
</body>
</html>