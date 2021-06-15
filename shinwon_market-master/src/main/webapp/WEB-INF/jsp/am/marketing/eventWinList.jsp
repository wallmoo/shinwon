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

            <h2 class="title"><span>이벤트 당첨자 관리</span></h2>

            <div class="tab-list"><!-- tab -->
               <ul class="tab">
                 <li class="in"><a href="#none">당첨자 선정 이벤트</a></li>
                 <li><a href="#">즉시 지급 이벤트</a></li>
               </ul>
            </div><!-- // tab -->

            <h3 class="title"><span>검색</span></h3>

            <form id="searchForm" name="searchForm" action="/am/marketing/eventWinList.do" method="POST">
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 12%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>이벤트 기간</span></th>
                            <td colspan="3">
                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                               <input type="text" class="text" id="searchEvtMstStDt" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }" />" readonly="readonly" data-target-end="#searchEvtMstEdDt"> ~
                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                               <input type="text" class="text" id="searchEvtMstEdDt" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }" />" readonly="readonly" data-target-start="#searchEvtMstStDt">
                               <a href="javascript:fnDateSet('searchEvtMstEdDt', 'searchEvtMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                               <a href="javascript:fnDateSet('searchEvtMstEdDt', 'searchEvtMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                               <a href="javascript:fnDateSet('searchEvtMstEdDt', 'searchEvtMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                               <a href="javascript:fnDateSet('searchEvtMstEdDt', 'searchEvtMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>이벤트 유형</span></th>
                            <td>
                                <select id="searchEvtMstType" name="searchEvtMstType" class="select">
                                <optgroup label="이벤트 유형">
                                    <option label="<c:out value="전체" />"></option>
                                <c:forEach var="itemGroup" items="${eventTypeList}" varStatus="itemGroupIndex">
                                    <option label="${itemGroup.CMN_COM_NM}" <c:if test="${commandMap.searchEvtMstType eq itemGroup.CMN_COM_IDX }">selected='selected'</c:if>><c:out value="${itemGroup.CMN_COM_IDX }" /></option>
                                </c:forEach>
                                </optgroup>
                            </td>
                            <th><span>이벤트명</span></th>
                            <td>
                                <input type="text" name="searchEvtMstTitle" id="searchEvtMstTitle" class="text large" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>발표일</span></th>
                            <td>
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" name="evtMstEdDt" value="<c:out value="${commandMap.evtMstEdDt }" />" readonly="readonly" data-target-end="#searchEvtMstEdDt">
                            </td>
                            <th><span>진행여부</span></th>
                            <td>
                                    <input type="radio" id="stateA" name="searchEvtMstUseYn" class="radio" <c:if test="${empty commandMap.searchEvtMstUseYn }">checked="checked"</c:if> value=""/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" id="stateB" name="searchEvtMstUseYn" class="radio" <c:if test="${commandMap.searchEvtMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                    <label for="stateB">사용</label>
                                    <input type="radio" id="stateC" name="searchEvtMstUseYn" class="radio" <c:if test="${commandMap.searchEvtMstUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                    <label for="stateC">미사용</label>
                            </td>
                        </tr>

                    </tbody>
                </table><!-- // table -->

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                    <a href="javascript:searchForm();" id="search" class="button small primary"><span>검색</span></a>
                </div>

               <input type="hidden" name="PLN_MST_IDX" value="" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }" />" />
                <input type="hidden" name="searchEvtMstShopType" value="" />

                <h3 class="title"><span>목록</span></h3>

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                        <span class="pages">
                            (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                        </span>
                    </div>

                    <!-- <div class="col-1-2 text-right">
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div> -->
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 12%;" />
                        <col style="width: auto;" />
                        <col style="width: 20%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>이벤트 유형</th>
                            <th>이벤트 명</th>
                            <th>이벤트 기간</th>
                            <th>발표일</th>
                            <th>진행여부</th>
                            <th>응모자수</th>
                            <th>당첨자수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list }" var="data" varStatus="status">
                        <fmt:parseDate var="evtMstStDt" value="${data.EVT_MST_ST_DT}" pattern="yyyyMMdd" />
                        <fmt:parseDate var="evtMstEdDt" value="${data.EVT_MST_ED_DT}" pattern="yyyyMMdd" />
                        <fmt:parseDate var="evtMstWinDt" value="${data.EVT_MST_WIN_DT}" pattern="yyyyMMdd" />
                        <tr>
                            <td><c:out value="${totalCount - data.RNUM + 1}" /></td>
                            <td><c:out value="${data.EVT_MST_TYPE_NM }" /></td>
                            <td><a href="#"><c:out value="${data.EVT_MST_TITLE }"/></a></td>
                            <td><fmt:formatDate value="${evtMstStDt }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${evtMstEdDt }" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${evtMstWinDt }" pattern="yyyy-MM-dd"/></td>
                            <td><c:out value="${data.EVT_MST_USE_YN eq 'Y' ? '진행' : '종료' }" /></td>
                            <td><c:out value="${data.EVT_MST_PRE_WIN }" /></td>
                            <td><c:choose><c:when test="${data.EVT_MST_WIN_CNT == 0 or empty data.EVT_MST_WIN_CNT}"><c:out value="-" /></c:when><c:otherwise><c:out value="${data.EVT_MST_WIN_CNT } / ${data.EVT_MST_ETR_CNT }" /></c:otherwise></c:choose></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                </table>
                </form>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->

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
});

var searchForm = function()
{
    $('#searchForm').submit();
}

// 페이지 사이즈 변경 이벤트
$(document).on("change", "select[name='pageSize']", function () {
    goPage(1);
});

// 페이지 이동
var goPage = function (cPage) 
{
    var $frm = $("#searchForm");
    $frm.find("input[name='cPage']").val(cPage);
    $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventWinList.do", "target":"_self", "method":"post"}).submit();
};
//-->
</script>

</body>
</html>