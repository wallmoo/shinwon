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
                <span>자주쓰는 답변</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">자주쓰는 답변</h3>

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
	                        <label class="label"><span>답변</span></label>
	                        <div class="field">
	                        	<input type="hidden"  name="searchType" id="searchType" value="S_ALL"/>
	                            <%-- <select class="select" name="searchType" id="searchType">
	                                <option value="S_ALL" <c:if test="${commandMap.searchType eq 'S_ALL'}">selected="selected"</c:if>>전체</option>
	                                <option value="S_TITLE" <c:if test="${commandMap.searchType eq 'S_TITLE' }">selected="selected"</c:if>>제목</option>
	                                <option value="S_CONTENTS" <c:if test="${commandMap.searchType eq 'S_CONTENTS' }">selected="selected"</c:if>>내용</option>
	                            </select> --%>
	                            <input type="text" class="text long" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>" placeholder="제목 또는 내용에서 찾으시는 단어를 입력하세요."/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>구분</span></label>
	                        <div class="field">
	                           <select class="select" name="searchCmnCmnComIdx" id="searchCmnCmnComIdx">
	                               <option value="" <c:if test="${empty commandMap.searchCmnCmnComIdx }">selected="selected"</c:if>>전체</option>
	                               <c:if test="${not empty inqTypeCodeList }">
	                                   <c:forEach var="codeRow" items="${inqTypeCodeList }" varStatus="i">
	                                       <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${codeRow.CMN_COM_IDX eq commandMap.searchCmnCmnComIdx }">selected="selected"</c:if>>
	                                           <c:out value="${codeRow.CMN_COM_NM }"/>
                                            </option>
	                                   </c:forEach>
	                               </c:if>
	                           </select>
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
                            <col style="width: 15%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>문의유형</th>
                                <th>제목</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
			                                <td><c:out value="${row.CMN_CMN_COM_NM }"/></td>
			                                <td class="left">
			                                 <a href="#none" class="ellipsis list-title" data-cmn_ans_idx="<c:out value="${row.CMN_ANS_IDX }"/>">
			                                     <c:out value="${row.CMN_ANS_TITLE }"/>
			                                 </a>
			                                </td>
			                                <td><ui:formatDate value="${row.CMN_ANS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
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
                    <input type="hidden" name="CMN_ANS_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchCmnCmnComIdx" value="<c:out value="${commandMap.searchCmnCmnComIdx }"/>"/>
                    <input type="hidden" name="searchCmnAnsUseYn" value="<c:out value="${commandMap.searchCmnAnsUseYn }"/>"/>
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
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/oftenReplyForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='CMN_ANS_IDX']").val($(this).data("cmn_ans_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/oftenReplyEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#searchWord", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/board/oftenReplyList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/oftenReplyList.do", "target":"_self", "method":"post"}).submit();
    };
});
</script>
</body>
</html>