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
                <span>매장개설문의 관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">매장개설문의 관리</h3>

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
	                        <label class="label"><span>등록일</span></label>
	                        <div class="field">
	                            <input type="text" name="searchStartDate" id="searchStartDate" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchStartDate }"/>"/> ~
	                            <input type="text" name="searchEndDate" id="searchEndDate" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                            <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            (날짜형식: YYYY-MM-DD)
	                        </div>
	                    </div>
					    
	                    <div class="form-group">
							<label class="label"><span>매장명/담당자명</span></label>
							<div class="field">
								<select class="select" id="searchRegType" name="searchRegType">
									<option value="SHOP_NM" <c:if test="${commandMap.searchRegType eq 'SHOP_NM'}">selected="selected"</c:if>>매장명</option>
	                        		<option value="MEMBER_NM" <c:if test="${commandMap.searchRegType eq 'MEMBER_NM' }">selected="selected"</c:if>>담당자명</option>
	                        	</select>
	                        	<input type="text" class="text serach-text" name="searchRegTypeKeyword" id="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
							</div>
						</div>
                        
	                    <div class="form-group">
	                        <label class="label"><span>상담유무</span></label>
	                        <div class="field">
	                            <input type="radio" id="stateA" name="searchShpReqReplyYn" class="radio" <c:if test="${empty commandMap.searchShpReqReplyYn }">checked="checked"</c:if> value=""/>
	                            <label for="stateA">전체</label>
	                            <input type="radio" id="stateB" name="searchShpReqReplyYn" class="radio" <c:if test="${commandMap.searchShpReqReplyYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                            <label for="stateB">상담완료</label>
	                            <input type="radio" id="stateC" name="searchShpReqReplyYn" class="radio" <c:if test="${commandMap.searchShpReqReplyYn eq 'N' }">checked="checked"</c:if> value="N"/>
	                            <label for="stateC">상담전</label>
	                        </div>
	                    </div>
                    </form>
                </div><!-- // section-form-a -->


                <h4 class="title">리스트</h4>
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>매장명</th>
                                <th>담당자명</th>
                                <th>영업면적</th>                                
                                <th>주소</th>
                                <th>등록일</th>
                                <th>상담유무</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
		                                	<td class="left">
			                                    <a href="javascript:;" class="list-title" data-shp_req_idx="<c:out value="${row.SHP_REQ_IDX }"/>">
													<c:out value="${row.SHP_REQ_SHOP_NM}"/>
			                                    </a>
			                                </td>			                                
			                                <td><c:out value="${row.SHP_REQ_MEMBER_NM}"/></td>	
			                                <td><c:out value="${row.SHP_REQ_AREA}"/>평</td>		                                
			                                <td>
			                                	[<c:out value="${fn:substring(row.SHP_REQ_POST,0,3)}" />-<c:out value="${fn:substring(row.SHP_REQ_POST,3,6)}" />]<c:out value="${row.ADDR }"/>
			                                </td>
			                                <td><ui:formatDate value="${row.SHP_REQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
			                                <td>
			                                    <span class="label label-<c:out value="${row.SHP_REQ_COUNSEL_YN eq 'Y'?'b':'a' }"/>">
			                                        <c:out value="${row.SHP_REQ_COUNSEL_YN eq 'Y'?'상담완료':'상담전' }"/>
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
                    <input type="hidden" name="SHP_REQ_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>                    
                    <input type="hidden" name="searchShpReqReplyYn" value="<c:out value="${commandMap.searchShpReqReplyYn }"/>"/>
                    <input type="hidden" name="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
                    
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
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='SHP_REQ_IDX']").val($(this).data("shp_req_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/shopOpenEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchRegTypeKeyword", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/board/shopOpenList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/shopOpenList.do", "target":"_self", "method":"post"}).submit();
    };
});
</script>
</body>
</html>