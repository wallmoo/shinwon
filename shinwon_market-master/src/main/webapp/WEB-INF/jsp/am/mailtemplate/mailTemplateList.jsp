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
                <a href="javascript:;"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="javascript:;">상품메일관리[<c:out value="${tempTitle }" />]</a>
                &gt;
                <span>입점상담관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">상품메일관리[<c:out value="${tempTitle }" />]</h3>

                <div class="title-box">
                    <h4 class="title">검색</h4>
                </div>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm" name="searchForm">
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    
						<div class="form-group" >
	                        <div class="col">
								<label class="label"><span>등록일</span></label>
								<div class="field">
									<input type="text" class="text datepicker s-datepicker" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />" /> ~
									<input type="text" class="text datepicker e-datepicker" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />" />
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
		                            (날짜형식: YYYY-MM-DD)
								</div>
	                        </div>
						</div>
	                    
						<div class="form-group">
                            <div class="col">
	                            <label class="label"><span>메일제목</span></label>
	                            <div class="field">
	                                <input type="text" class="text" name="searchEmlMstNm" id="searchEmlMstNm" value="<c:out value="${commandMap.searchEmlMstNm }"/>" maxlength="13"/>
	                            </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
	                        <label class="label"><span>상태</span></label>
	                        <div class="field">
	                            <input type="radio" id="stateA" name="searchEmlMstYn" class="radio" <c:if test="${empty commandMap.searchEmlMstYn }">checked="checked"</c:if> value=""/>
	                            <label for="stateA">전체</label>
	                            <input type="radio" id="stateB" name="searchEmlMstYn" class="radio" <c:if test="${commandMap.searchEmlMstYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                            <label for="stateB">사용</label>
	                            <input type="radio" id="stateC" name="searchEmlMstYn" class="radio" <c:if test="${commandMap.searchEmlMstYn eq 'N' }">checked="checked"</c:if> value="N"/>
	                            <label for="stateC">미사용</label>
	                        </div>
	                    </div>
					</form>
                </div><!-- // section-form-a -->

                 <div class="section-button search">
                        <a href="javascript:search();" class="button button-b submit"><span>검색</span></a>
                        <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                 </div>


                <h4 class="title">리스트</h4>
	                <div class="right">
	                    <a href="#none" id="goForm" class="button button-b"><span>등록</span></a>
	                </div>
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 8%;"/>
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />
                            <col style="width: 10%;"/>
                            <col style="width: 15%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>메일제목</th>
                                <th>등록일</th>
                                <th>발송예정일</th>
                                <th>사용여부</th>
                            </tr>
                        </thead>
                        <tbody>            
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>	
			                                <td >
			                                    <a href="javascript:goView('<c:out value="${row.EML_MST_IDX }"/>');" class="list-title">
			                                        <c:out value="${row.EML_MST_NM }"/>
			                                    </a>
			                                </td>	
			                                <td><ui:formatDate value="${row.EML_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
			                                <td><ui:formatDate value="${row.EML_MST_ST_DT }" pattern="yyyy.MM.dd"/></td>
			                                <td>
			                                	<span class="label label-<c:out value="${row.EML_MST_YN eq 'Y'?'b':'a' }"/>">
                                                	<c:out value="${row.EML_MST_YN_NM}"/> 
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
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>    
                    <input type="hidden" name="EML_MST_IDX" />                
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchEmlMstNm" value="<c:out value="${commandMap.searchEmlMstNm }"/>"/>
                    <input type="hidden" name="searchEmlMstYn" value="<c:out value="${commandMap.searchEmlMstYn }"/>"/>
                    <input type="hidden" name="path" id="path" value="<c:out value="${path }"/>"/>
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
$(function () {
    
	var $frm = $("#frm");
	var path = $("#path").val();
	
 	// 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
    
    // 검색 버튼 클릭 이벤트
    search = function(){
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/mailtemplate/mailTemplate"+path+"List.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
 	// 메일폼 수정
    goView = function (emlMstIdx) {
        $frm.find("input[name='EML_MST_IDX']").val(emlMstIdx);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/mailtemplate/mailTemplate"+path+"Edit.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/mailtemplate/mailTemplate"+path+"List.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
    	$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/mailtemplate/mailTemplate"+path+"Form.do", "target":"_self", "method":"post"}).submit();
        return false;
    });
    
});
</script>
</body>
</html>