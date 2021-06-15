<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

        <div class="container">

            <h2 class="title"><span>OOTD 관리</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				<input type="hidden" name="searchYn" value="Y" />
								
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>등록일</span></th>
                            <td colspan="3">
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><span>작성자/ID</span></th>
                            <td>
                              <input type="text" name="searchMemNm" id="searchMemNm" class="text" value="<c:out value="${commandMap.searchMemNm}"/>"/> / <input type="text" name="searchMemID" id="searchMemID" class="text" value="<c:out value="${commandMap.searchMemID}"/>"/>
                            </td>
                            <th><span>전시상태</span></th>
                            <td>
                                <input type="radio" id="searchStatus1" name="searchStatus" class="checkbox" value="" <c:if test="${empty commandMap.searchStatus }">checked="checked"</c:if> />
                                <label for="searchStatus1">전체</label>
                                <input type="radio"	id="searchStatus2" name="searchStatus" class="checkbox" value="Y" <c:if test="${commandMap.searchStatus eq 'Y'}">checked="checked"</c:if> />
                                <label for="searchStatus2">전시</label>
                                <input type="radio" id="searchStatus3" name="searchStatus" class="checkbox" value="N" <c:if test="${commandMap.searchStatus eq 'N'}">checked="checked"</c:if> />
                                <label for="searchStatus3">미전시</label>
                            </td>
                        </tr>
                        <tr>
                            <th><span>키워드</span></th>
                            <td colspan="3"><input type="text" name="searchKeyword" id="searchKeyword" class="text xlarge" value="<c:out value="${commandMap.searchKeyword}"/>"/></td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="javascript:search();" class="button small primary"><span>검색</span></a>
            </div>

            <form id="frm" name="frm">
            
                <input type="hidden" name="CNT_MST_IDX" value="" />
               	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
               	<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                <input type="hidden" name="searchMemNm" value="<c:out value="${commandMap.searchMemNm }"/>"/>
                <input type="hidden" name="searchMemCd" value="<c:out value="${commandMap.searchMemCd }"/>"/>
                <input type="hidden" name="searchStatus" value="<c:out value="${commandMap.searchStatus }"/>"/>
                <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
	            <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
	            
                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                        <span class="pages">
                            (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                        </span>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 8%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록/수정일</th>
                            <th>댓글수</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test="${not empty OOTD_DATA_LIST}">
                    		<c:set var="listNum" value="${paging.listNum}" />
                    		<c:forEach items="${OOTD_DATA_LIST}" var="data" varStatus="i">
	                    		<tr>
		                            <td><c:out value="${listNum }" /></td>
		                            <td class="text-left txt_line1">
			                            <a href="javascript:;" class="list-title" data-ootd_idx="<c:out value="${data.CNT_MST_IDX }"/>">
											<c:out value="${data.CNT_MST_TITLE }" />
										</a>
									</td>
		                            <td>
		                            	<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${data.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
											<c:out value="${data.MEM_MST_MEM_ID }(${data.MEM_MST_MEM_NM })" />
										</a>
									</td>
		                            <td><ui:formatDate value="${data.CNT_MST_REG_DT}" pattern="yyyy.MM.dd HH:mm"/></td>
		                            <td><c:out value="${data.COMMENT_COUNT}" /></td>
		                            <td><c:out value="${data.CNT_MST_USE_YN}" /></td>
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

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->

            </form>
        </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){

	search = function() 
    {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/board/ootdBoardList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/ootdBoardList.do", "target":"_self", "method":"post"}).submit();
    };
    
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='CNT_MST_IDX']").val($(this).data("ootd_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/ootdBoardEdit.do", "target":"_self", "method":"post"}).submit();
    });
});
//-->
</script>

</body>
</html>
