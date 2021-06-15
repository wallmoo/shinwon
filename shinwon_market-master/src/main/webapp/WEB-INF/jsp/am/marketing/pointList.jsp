<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
.tabcontent{display:none;}
.tabcontent.atv{display:block;}
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

            <div class="container"><!-- container -->

                <h2 class="title"><span>포인트 내역조회</span></h2>
                <div class="tab-list">
                    <ul class="tab">
                        <li class="in" data-tab="tab1"><a href="#"><span>E포인트</span></a></li>
                        <li data-tab="tab2"><a href="#"><span>통합포인트</span></a></li>
                        <li data-tab="tab3"><a href="#"><span>임직원포인트</span></a></li>
                    </ul>
                </div>

                <h3 class="title"><span>목록</span></h3>
				<!--<p>
                    *포인트 지급/사용내역을 조회할 수 있습니다.
                </p>-->
                <!-- tab1 : E-point 탭 --------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
                <div id="tab1" class="tabcontent atv">
                <!-- 검색 Parameter -->
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />

                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>기간</span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointStDt" id="searchPointStDt" class="text" value="<c:out value="${commandMap.searchPointStDt }"/>" readonly="readonly" data-target-end="#searchPointEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointEdDt" id="searchPointEdDt" class="text" value="<c:out value="${commandMap.searchPointEdDt }"/>" readonly="readonly" data-target-start="#searchPointStDt"/>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    <!--<a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>-->
                                </td>
                            </tr>
                            <tr>
                                <th><span>ID</span></th>
                                <td>
                                    <input type="text" name="searchMemPitMemId" id="searchMemPitMemId" class="text" value="<c:out value="${commandMap.searchMemPitMemId }"/>">
                                </td>
                                <th><span>이름</span></th>
                                <td>
                                    <input type="text" name="searchMemMstMemNm" id="searchMemMstMemNm" class="text" value="<c:out value="${commandMap.searchMemMstMemNm }"/>">
                                </td>
                            </tr>
                            <tr>
                                <th><span>구분/내역</span></th>
                                <td colspan="3">
                                    <select id="searchMemPitGbn" name="searchMemPitGbn" class="select" title="포인트 구분">
                                        <option value="">전체</option>
                                        <option value="P" <ui:select v="P" t="${commandMap.searchMemPitGbn}" g="selected"/>>적립</option>
                                        <option value="M" <ui:select v="M" t="${commandMap.searchMemPitGbn}" g="selected"/>>차감</option>
                                    </select>
                                    <select id="searchMemPitBrkDwn" name="searchMemPitBrkDwn" class="select" title="포인트  내역">
                                        <option value="">전체</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:;" id="search" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->

                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchPointStDt" value="<c:out value="${commandMap.searchPointStDt }"/>"/>
                    <input type="hidden" name="searchPointEdDt" value="<c:out value="${commandMap.searchPointEdDt }"/>"/>
                    <input type="hidden" name="searchMemPitMemId" value="<c:out value="${commandMap.searchMemPitMemId }"/>"/>
                    <input type="hidden" name="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>"/>
                    <input type="hidden" name="searchPitMstMemo" value="<c:out value="${commandMap.searchPitMstMemo }"/>"/>
                    <input type="hidden" name="searchMemPitGbn" value="<c:out value="${commandMap.searchMemPitGbn }"/>"/>
                    <input type="hidden" name="searchMemPitBrkDwn" value="<c:out value="${commandMap.searchMemPitBrkDwn }"/>"/>
                    <input type="hidden" name="PIT_MST_IDX" value=""/>

                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건)</span>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="javascript:goExcelDown()" id="goExcel" class="button small primary"><span>엑셀다운로드</span></a>
                            <a href="#none" id="goForm" class="button small primary"><span>E-포인트 적립/차감</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
					<!-- // 검색 Parameter -->

					
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                    <colgroup>
	                        <col style="width: 5%;" />
	                        <col style="width: 10%;" />
                            <col style="width: 8%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 15%;" />
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th>NO</th>
	                            <th>이름</th>
	                            <th>구분</th>
	                            <th>내역</th>
	                            <th>적립</th>
	                            <th>차감</th>
	                            <th>소멸</th>
	                            <th>잔여포인트</th>
	                            <th>처리자</th>
	                            <th>적립/차감/소멸일시</th>
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
	                                            <c:out value="${row.MEM_MST_MEM_NM }"/><br/>
	                                             (<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.MEM_PIT_MEM_ID }" />');" title="새 창 으로 열립니다."><c:out value="${row.MEM_PIT_MEM_ID }"/></a>)
	                                        </td>
	                                        <td>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'P'}">적립</c:if>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'M'}">차감</c:if>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'D'}">소명</c:if>
	                                        </td>
	                                        <td>
	                                             <c:out value="${row.MEM_PIT_BRK_DWN_NM }"/>
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_PLS }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_MNS }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_EXT }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_TOT_PIT }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                            <c:out value="${row.REG_EXCEL }"/>
	                                        </td>
	                                        <td><ui:formatDate value="${row.MEM_PIT_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>

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
	                </table><!-- // table -->

	                <div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
                </form>
                </div>
                <!--// tab1 : E-point 탭 ---------------------------------------------------------------------------------------------------------------------------------------------------------------->
 
                <!--tab2 : 통합포인트 탭  -------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                <div id="tab2" class="tabcontent">
                <!-- 검색 Parameter -->
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />

                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>기간</span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointStDt" id="searchPointStDt" class="text" value="<c:out value="${commandMap.searchPointStDt }"/>" readonly="readonly" data-target-end="#searchPointEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointEdDt" id="searchPointEdDt" class="text" value="<c:out value="${commandMap.searchPointEdDt }"/>" readonly="readonly" data-target-start="#searchPointStDt"/>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    <!--<a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>-->
                                </td>
                            </tr>
                            <tr>
                                <th><span>ID</span></th>
                                <td>
                                    <input type="text" name="searchMemPitMemId" id="searchMemPitMemId" class="text" value="<c:out value="${commandMap.searchMemPitMemId }"/>">
                                </td>
                                <th><span>이름</span></th>
                                <td>
                                    <input type="text" name="searchMemMstMemNm" id="searchMemMstMemNm" class="text" value="<c:out value="${commandMap.searchMemMstMemNm }"/>">
                                </td>
                            </tr>
                            <tr>
                                <th><span>구분/내역</span></th>
                                <td colspan="3">
                                    <select id="searchMemPitGbn" name="searchMemPitGbn" class="select" title="포인트 구분">
                                        <option value="">전체</option>
                                        <option value="P" <ui:select v="P" t="${commandMap.searchMemPitGbn}" g="selected"/>>적립</option>
                                        <option value="M" <ui:select v="M" t="${commandMap.searchMemPitGbn}" g="selected"/>>차감</option>
                                    </select>
                                    <select id="searchMemPitBrkDwn" name="searchMemPitBrkDwn" class="select" title="포인트  내역">
                                        <option value="">전체</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:;" id="search" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->

                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchPointStDt" value="<c:out value="${commandMap.searchPointStDt }"/>"/>
                    <input type="hidden" name="searchPointEdDt" value="<c:out value="${commandMap.searchPointEdDt }"/>"/>
                    <input type="hidden" name="searchMemPitMemId" value="<c:out value="${commandMap.searchMemPitMemId }"/>"/>
                    <input type="hidden" name="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>"/>
                    <input type="hidden" name="searchPitMstMemo" value="<c:out value="${commandMap.searchPitMstMemo }"/>"/>
                    <input type="hidden" name="searchMemPitGbn" value="<c:out value="${commandMap.searchMemPitGbn }"/>"/>
                    <input type="hidden" name="searchMemPitBrkDwn" value="<c:out value="${commandMap.searchMemPitBrkDwn }"/>"/>
                    <input type="hidden" name="PIT_MST_IDX" value=""/>

                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건)</span>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="javascript:goExcelDown()" id="goExcel" class="button small primary"><span>엑셀다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
					<!-- // 검색 Parameter -->

					
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                    <colgroup>
	                        <col style="width: 5%;" />
	                        <col style="width: 10%;" />
                            <col style="width: 8%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 15%;" />
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th>NO</th>
	                            <th>이름</th>
	                            <th>구분</th>
	                            <th>내역</th>
	                            <th>적립</th>
	                            <th>차감</th>
	                            <th>소멸</th>
	                            <th>잔여포인트</th>
	                            <th>적립/차감/소멸일시</th>
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
	                                            <c:out value="${row.MEM_MST_MEM_NM }"/><br/>
	                                             (<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.MEM_PIT_MEM_ID }" />');" title="새 창 으로 열립니다."><c:out value="${row.MEM_PIT_MEM_ID }"/></a>)
	                                        </td>
	                                        <td>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'P'}">적립</c:if>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'M'}">차감</c:if>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'D'}">소명</c:if>
	                                        </td>
	                                        <td>
	                                             <c:out value="${row.MEM_PIT_BRK_DWN_NM }"/>
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_PLS }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_MNS }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_EXT }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_TOT_PIT }" groupingUsed="true" />
	                                        </td>
	                                        <td><ui:formatDate value="${row.MEM_PIT_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>

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
	                </table><!-- // table -->

	                <div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
                </form>
                </div>
                <!--// tab2 : 통합포인트 탭  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                
                <!-- tab3 : 임직원포인트 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                <div id="tab3" class="tabcontent">
                <!-- 검색 Parameter -->
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />

                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>기간</span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointStDt" id="searchPointStDt" class="text" value="<c:out value="${commandMap.searchPointStDt }"/>" readonly="readonly" data-target-end="#searchPointEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointEdDt" id="searchPointEdDt" class="text" value="<c:out value="${commandMap.searchPointEdDt }"/>" readonly="readonly" data-target-start="#searchPointStDt"/>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    <!--<a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>-->
                                </td>
                            </tr>
                            <tr>
                                <th><span>ID</span></th>
                                <td>
                                    <input type="text" name="searchMemPitMemId" id="searchMemPitMemId" class="text" value="<c:out value="${commandMap.searchMemPitMemId }"/>">
                                </td>
                                <th><span>이름</span></th>
                                <td>
                                    <input type="text" name="searchMemMstMemNm" id="searchMemMstMemNm" class="text" value="<c:out value="${commandMap.searchMemMstMemNm }"/>">
                                </td>
                            </tr>
                            <tr>
                                <th><span>구분/내역</span></th>
                                <td colspan="3">
                                    <select id="searchMemPitGbn" name="searchMemPitGbn" class="select" title="포인트 구분">
                                        <option value="">전체</option>
                                        <option value="P" <ui:select v="P" t="${commandMap.searchMemPitGbn}" g="selected"/>>적립</option>
                                        <option value="M" <ui:select v="M" t="${commandMap.searchMemPitGbn}" g="selected"/>>차감</option>
                                    </select>
                                    <select id="searchMemPitBrkDwn" name="searchMemPitBrkDwn" class="select" title="포인트  내역">
                                        <option value="">전체</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:;" id="search" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->

                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchPointStDt" value="<c:out value="${commandMap.searchPointStDt }"/>"/>
                    <input type="hidden" name="searchPointEdDt" value="<c:out value="${commandMap.searchPointEdDt }"/>"/>
                    <input type="hidden" name="searchMemPitMemId" value="<c:out value="${commandMap.searchMemPitMemId }"/>"/>
                    <input type="hidden" name="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>"/>
                    <input type="hidden" name="searchPitMstMemo" value="<c:out value="${commandMap.searchPitMstMemo }"/>"/>
                    <input type="hidden" name="searchMemPitGbn" value="<c:out value="${commandMap.searchMemPitGbn }"/>"/>
                    <input type="hidden" name="searchMemPitBrkDwn" value="<c:out value="${commandMap.searchMemPitBrkDwn }"/>"/>
                    <input type="hidden" name="PIT_MST_IDX" value=""/>

                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건)</span>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="javascript:goExcelDown()" id="goExcel" class="button small primary"><span>엑셀다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
					<!-- // 검색 Parameter -->

					
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                    <colgroup>
	                        <col style="width: 5%;" />
	                        <col style="width: 10%;" />
                            <col style="width: 8%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 15%;" />
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th>NO</th>
	                            <th>이름</th>
	                            <th>구분</th>
	                            <th>내역</th>
	                            <th>적립</th>
	                            <th>차감</th>
	                            <th>소멸</th>
	                            <th>잔여포인트</th>
	                            <th>적립/차감/소멸일시</th>
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
	                                            <c:out value="${row.MEM_MST_MEM_NM }"/><br/>
	                                             (<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.MEM_PIT_MEM_ID }" />');" title="새 창 으로 열립니다."><c:out value="${row.MEM_PIT_MEM_ID }"/></a>)
	                                        </td>
	                                        <td>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'P'}">적립</c:if>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'M'}">차감</c:if>
	                                            <c:if test="${row.MEM_PIT_GBN eq 'D'}">소명</c:if>
	                                        </td>
	                                        <td>
	                                             <c:out value="${row.MEM_PIT_BRK_DWN_NM }"/>
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_PLS }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_MNS }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_EXT }" groupingUsed="true" />
	                                        </td>
	                                        <td>
	                                             <fmt:formatNumber value="${row.MEM_PIT_TOT_PIT }" groupingUsed="true" />
	                                        </td>
	                                        <td><ui:formatDate value="${row.MEM_PIT_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>

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
	                </table><!-- // table -->

	                <div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
                </form>
                </div>
                <!--// 임직원포인트 ----------------------------------------------------------------------------------------------------------------------------------------------------------------->
            </div><!-- // container -->

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

	// 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointForm.do", "target":"_self", "method":"post"}).submit();
    });

    // 상세페이지 이동
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='PIT_MST_IDX']").val($this.data("pit_mst_idx"));

        url = "<c:out value="${serverDomain}" />/am/marketing/pointDetail.do";

        $frm.attr({"action":url, "target":"_self", "method":"get"}).submit();
    });

 	// 검색 엔터 이벤트
    $('#searchForm').find("input").not(".datepicker").keydown(function (e){
        if(e.keyCode == 13){
        	$("#search").trigger("click");
            return false;
        }
    });

    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm");
        if($searchForm.valid())
        {
            $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
            $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointList.do", "target":"_self", "method":"post"}).submit();
        }
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointList.do", "target":"_self", "method":"post"}).submit();
    };

    getSubCodeList = function(code)
    {
        var $frm = $("#frm");

        var searchMemPitBrkDwn =  $frm.find("input[name='searchMemPitBrkDwn']").val()

        $.ajax({
            type    : "POST",
            url : "<c:out value="${serverDomain}" />/am/marketing/pointCodeAjax.do",
            data    :  { "code":code},
            dataType : "JSON",
            async   : false,
            success : function(data)
            {
                var selected = "";
                $("#searchMemPitBrkDwn").empty().append("<option value=''>전체</option>");
                $.each(data.list, function(i,item)
                {

                    if(searchMemPitBrkDwn != item.CMN_COM_IDX)
                    {
                        $("#searchMemPitBrkDwn").append("<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>");
                    }
                    else
                    {
                        $("#searchMemPitBrkDwn").append("<option value='"+item.CMN_COM_IDX+"' selected = 'selected'>"+item.CMN_COM_NM+"</option>");

                    }
                });

            },
            error   : function(xhr,status,error)
            {
                alert("포인트내역 호출 중 에러가 발생하였습니다.");
                //alert("code:"+xhr.status);
            }
        });
    };

    // 엑셀다운
    goExcelDown = function ()
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/pointListExcel.do", "target":"_self", "method":"post"}).submit();
    };

    getSubCodeList("P");

});
//탭 
$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('atv');
		$('.tabcontent').removeClass('atv');
		$(this).addClass('atv');
		$('#' + activeTab).addClass('atv');
	})
});
</script>
</body>
</html>
