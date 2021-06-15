<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
<style>
.tabcontent{display:none;}
.tabcontent.atv{display:block;}
</style>
</head>
<body class="page-popup">

    <div class="modal"><!-- modal -->
    
        <div class="modal-wrapper"><!-- modal-wrapper -->
        
            <div class="modal-inner"><!-- modal-inner -->
            
            <h2 class="title"><span>포인트</span></h2>
              
                <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
                
                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>
                <!-- // table -->
                <div class="tab-list"><!-- tab -->
                    <ul class="tab">
                        <li class="in" data-tab="tab1">
                            <a href="#1">통합포인트</a>
                        </li>
                        <li data-tab="tab2">
                            <a href="#2">e포인트</a>
                        </li>
                        <li data-tab="tab3">
                            <a href="#3">임직원포인트</a>
                        </li>
                    </ul>
                </div>
                
                <h3 class="title"><span>목록</span></h3>
                
                <!-- 통합포인트 -->
                <div id="tab1" class="tabcontent atv">
                	<table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>SHOWINDOW 적립 통합포인트</span></th>
                            <td>
                                <c:if test="${empty tPointSumMap.PLS_SUM }">0</c:if>
                                <c:if test="${not empty tPointSumMap.PLS_SUM }"><fmt:formatNumber value="${tPointSumMap.PLS_SUM}" type="number"/></c:if> p
                            </td>
                            <th><span>SHOWINDOW 차감 통합포인트</span></th>
                            <td>
                                <c:if test="${empty tPointSumMap.MNS_SUM }">0</c:if>
                                <c:if test="${not empty tPointSumMap.MNS_SUM }"><fmt:formatNumber value="${tPointSumMap.MNS_SUM}" type="number"/></c:if> p
                            </td>
                            <th><span>현재 잔여 통합포인트</span></th>
                            <td>
                               <%--  <c:if test="${empty pointSum.CUR_POINT }">0</c:if> --%>
                                <%-- <c:if test="${not empty pointSum.CUR_POINT }"> --%>
                                <%-- <fmt:formatNumber var="totalTonghapPoint" value="${tpnMapList[0].TOTAL_POINT}" type="number"/></c:if>  --%>
                                <c:out value="${commandMap.tPointBalance}"/>p
                            </td>
                        </tr>
                         
                    </tbody>
                </table>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" id="tPoint_pageSize" value="<c:out value="${commandMap.pageSize }"/>" />        
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
                  
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>  
                                <th><span>발생기간</span></th>
                                <td colspan=3> 
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointStDt" id="searchPointStDt" class="text" value="<c:out value="${commandMap.searchPointStDt }"/>" readonly="readonly" data-target-end="#searchPointEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointEdDt" id="searchPointEdDt" class="text" value="<c:out value="${commandMap.searchPointEdDt }"/>" readonly="readonly" data-target-start="#searchPointStDt"/>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>통합포인트 구분/내역</span></th>
                                <td>
                                    <select id="searchMemPitGbn" name="searchMemPitGbn" class="select" title="포인트 구분">
                                        <option value="">전체</option>
                                        <option value="P" <ui:select v="P" t="${commandMap.searchMemPitGbn}" g="selected"/>>적립</option> 
                                        <option value="M" <ui:select v="M" t="${commandMap.searchMemPitGbn}" g="selected"/>>차감</option>
                                    </select>
                                    <!-- <select id="searchMemPitBrkDwn" name="searchMemPitBrkDwn" class="select" title="포인트  내역">
                                        <option value="">전체</option>
                                    </select> -->
                                </td>
                               <%--  <th><span>관리자메모</span></th>
                                <td>
                                     <input type="text" name="searchPitMstMemo" id="searchPitMstMemo" class="text large" value="<c:out value="${commandMap.searchPitMstMemo }"/>">
                                </td> --%>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
            
                </form>
                
                <div class="grid section-button-search">
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm">
                <!-- <form id="frmTpoint" name="frmTpoint"> -->
                
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <select class="select" id="tPoint_pageSize_select" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                            <span class="pages">
                                (총 <strong class="em"><c:out value="${tPointPaging.totalRecordCount }"/></strong>건, 1 of 1 page)
                            </span>
                        </div>

                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
                    
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>구분</th>
                                <th>발생일</th>
                                <th>내역</th>
                                <th>적립</th>
                                <th>차감</th>
                                <th>소멸</th>
                                <th>잔여</th>
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty tpnMapList }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${tpnMapList }" varStatus="i">
                                        <tr>
                                            <td><c:out value="${listNum }"/></td>
                                           <td>
                                                <c:out value="${row.OCCUR_NAME }"/>
                                            </td>
                                            <td>
                                            	<fmt:parseDate var="stringDate" value="${row.OCCUR_DATE }" pattern="yyyymmdd" />									
												<fmt:formatDate var="date" value="${stringDate }" pattern="yyyy-MM-dd" />
												<c:out value="${date }" />
                                           	</td>
                                            <td>
                                                 <c:out value="${row.OCCUR_NAME }"/>
                                            </td>
                                           
                                            <td>
                                                <%--  <fmt:formatNumber value="${row.OCCUR_POINT }" groupingUsed="true" /> --%>
                                                 ${row.OCCUR_POINT }
                                            </td>
                                            <td>
                                                 <%-- <fmt:formatNumber value="${row.OCCUR_POINT }" groupingUsed="true" /> --%>
                                                 ${row.OCCUR_POINT }
                                            </td>
                                            <td>
                                                <%--  <fmt:formatNumber value="${row.MEM_PIT_EXT }" groupingUsed="true" /> --%>
                                            </td>
                                            <td>
                                                 <%-- <fmt:formatNumber value="${row.TOTAL_POINT }" groupingUsed="true" /> --%>
                                                 ${row.TOTAL_POINT }
                                            </td>
                                        </tr>
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="10">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>  
                            </c:choose>
                        </tbody>
                    </table>
                
                    <input type="hidden" name="cPage" id="tPoint_cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchPointStDt" value="<c:out value="${commandMap.searchPointStDt }"/>"/>
                    <input type="hidden" name="searchPointEdDt" value="<c:out value="${commandMap.searchPointEdDt }"/>"/>
                    <input type="hidden" name="searchMemPitGbn" value="<c:out value="${commandMap.searchMemPitGbn }"/>"/>
                    <input type="hidden" name="searchMemPitBrkDwn" value="<c:out value="${commandMap.searchMemPitBrkDwn }"/>"/>
                    <input type="hidden" name="searchPitMstMemo" value="<c:out value="${commandMap.searchPitMstMemo }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>     
                
                    <div class="section-pagination"><!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                            <%-- <ui:paging paging="${paging }" jsFunction="goPageTpointAjax" /> --%>
                        </div>
                    </div><!-- // section pagination -->
                 
                </form>
                </div>
                <!-- //통합포인트 -->
                
                <!-- e포인트 -->
                <div id="tab2" class="tabcontent">
                	<table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>총 적립 E포인트</span></th>
                            <td>
                                <c:if test="${empty ePointSumMap.PLS_SUM }">0</c:if>
                                <c:if test="${not empty ePointSumMap.PLS_SUM }"><fmt:formatNumber value="${ePointSumMap.PLS_SUM}" type="number"/></c:if> P
                            </td>
                            <th><span>총 차감 E포인트</span></th>
                            <td>
                                <c:if test="${empty ePointSumMap.MNS_SUM }">0</c:if>
                                <c:if test="${not empty ePointSumMap.MNS_SUM }"><fmt:formatNumber value="${ePointSumMap.MNS_SUM}" type="number"/></c:if> P
                            </td>
                            <th><span>현재 잔여 E포인트</span></th>
                            <td>
                                <c:if test="${empty ePointSumMap.CUR_POINT }">0</c:if>
                                <c:if test="${not empty ePointSumMap.CUR_POINT }"><fmt:formatNumber value="${ePointSumMap.CUR_POINT}" type="number"/></c:if> P
                            </td>
                        </tr>
                         
                    </tbody>
                </table>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" id="ePoint_pageSize" value="<c:out value="${commandMap.pageSize }"/>" />        
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
                  
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>  
                                <th><span>발생기간</span></th>
                                <td colspan=3> 
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointStDt" id="searchPointStDt" class="text" value="<c:out value="${commandMap.searchPointStDt }"/>" readonly="readonly" data-target-end="#searchPointEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointEdDt" id="searchPointEdDt" class="text" value="<c:out value="${commandMap.searchPointEdDt }"/>" readonly="readonly" data-target-start="#searchPointStDt"/>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>E포인트 구분/내역</span></th>
                                <td>
                                    <select id="searchMemPitGbn" name="searchMemPitGbn" class="select" title="포인트 구분">
                                        <option value="">전체</option>
                                        <option value="P" <ui:select v="P" t="${commandMap.searchMemPitGbn}" g="selected"/>>적립</option> 
                                        <option value="M" <ui:select v="M" t="${commandMap.searchMemPitGbn}" g="selected"/>>차감</option>
                                    </select>
                                    <select id="searchMemPitBrkDwn" name="searchMemPitBrkDwn" class="select" title="포인트  내역">
                                        <option value="">전체</option>
                                    </select>
                                </td>
                                <th><span>관리자메모</span></th>
                                <td>
                                     <input type="text" name="searchPitMstMemo" id="searchPitMstMemo" class="text large" value="<c:out value="${commandMap.searchPitMstMemo }"/>">
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
            
                </form>
                
                <div class="grid section-button-search">
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm">
                <!-- <form id="frm" name="frmEpoint"> -->
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" >
                            <option value="20" selected>20개씩 보기</option>
                            <option value="40" >40개씩 보기</option>
                            <option value="60" >60개씩 보기</option>
                            <option value="80" >80개씩 보기</option>
                            <option value="100" >100개씩 보기</option>
                            </select>
                            <span class="pages">
                                (총 <strong class="em">
                                <c:if test="${empty ePointPaging.totalRecordCount}">0</c:if>
                                <c:if test="${not empty ePointPaging.totalRecordCount }">
									<c:out value="${ePointPaging.totalRecordCount }"/>                                
                                </c:if>
                                </strong>건, 
                                <c:out value="${ePointPaging.cPage }"/> of <c:out value="${ePointPaging.totalPageCount }"/> page)
                            </span>
                        </div>

                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
                    
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>구분</th>
                                <th>발생일</th>
                                <th>내역</th>
                                <th>메모</th>
                                <th>적립</th>
                                <th>차감</th>
                                <th>소멸</th>
                                <th>잔여</th>
                                <th>처리자</th>
                            </tr>
                        </thead>
                        <tbody id="ePoint-list-field">
                            <c:choose>
                                <c:when test="${not empty ePointList }">
                                    <c:set var="listNum" value="${ePointPaging.listNum}" />
                                    <c:forEach var="row" items="${ePointList }" varStatus="i">
                                        <tr>
                                            <td><c:out value="${listNum }"/></td>
                                           <td>
                                                <c:if test="${row.MEM_PIT_GBN eq 'P'}">적립</c:if>
                                                <c:if test="${row.MEM_PIT_GBN eq 'M'}">차감</c:if>
                                                <c:if test="${row.MEM_PIT_GBN eq 'D'}">소명</c:if>
                                            </td>
                                            <td><ui:formatDate value="${row.MEM_PIT_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                            <td>
                                                 <c:out value="${row.MEM_PIT_BRK_DWN_NM }"/>
                                            </td>
                                            <td>
                                                 <c:out value="${row.PIT_MST_MEMO }"/>
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
                                                <c:if test="${not empty row.MEM_PIT_REG_ID}">
                                                    <c:out value="${row.MEM_PIT_REG_NM }"/><br/>(<c:out value="${row.MEM_PIT_REG_ID }"/>)
                                                </c:if>                                              
                                            </td>
                                        </tr>
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="10">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>  
                            </c:choose>
                        </tbody>
                    </table>
                
                    <input type="hidden" name="cPage" id="ePoint_cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchPointStDt" value="<c:out value="${commandMap.searchPointStDt }"/>"/>
                    <input type="hidden" name="searchPointEdDt" value="<c:out value="${commandMap.searchPointEdDt }"/>"/>
                    <input type="hidden" name="searchMemPitGbn" value="<c:out value="${commandMap.searchMemPitGbn }"/>"/>
                    <input type="hidden" name="searchMemPitBrkDwn" value="<c:out value="${commandMap.searchMemPitBrkDwn }"/>"/>
                    <input type="hidden" name="searchPitMstMemo" value="<c:out value="${commandMap.searchPitMstMemo }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>     
                
                    <div class="section-pagination" id="ePoint-pagination"><!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <%-- <ui:paging paging="${ePointPaging }" jsFunction="goPage" /> --%>
                             <ui:paging paging="${ePointPaging }" jsFunction="goPageEpoint" /> 
                        </div>
                    </div><!-- // section pagination -->
                 
                </form>
                </div>
                <!-- //e포인트 -->
                
                <!-- 임직원포인트 -->
                <div id="tab3" class="tabcontent">
                	<table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 18%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>총 적립 임직원포인트</span></th>
                            <td>
                                <fmt:formatNumber value="${swPointBalance}" type="number"/> p
                            </td>
                            <th><span>SHOWINDOW 차감 임직원포인트</span></th>
                            <td>
                                <c:if test="${empty swPointSumMap.MNS_SUM }">0</c:if>
                                <c:if test="${not empty swPointSumMap.MNS_SUM }"><fmt:formatNumber value="${swPointSumMap.MNS_SUM}" type="number"/></c:if> p
                            </td>
                            <th><span>현재 잔여 임직원포인트</span></th>
                            <td>
                                <c:if test="${empty swPointSumMap.CUR_POINT }"><fmt:formatNumber value="${swPointBalance}" type="number"/></c:if>
                                <c:if test="${not empty swPointSumMap.CUR_POINT }"><fmt:formatNumber value="${swPointSumMap.CUR_POINT}" type="number"/></c:if> p
                            </td>
                        </tr>
                         
                    </tbody>
                </table>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />        
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
                  
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>  
                                <th><span>발생기간</span></th>
                                <td colspan=3> 
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointStDt" id="searchPointStDt" class="text" value="<c:out value="${commandMap.searchPointStDt }"/>" readonly="readonly" data-target-end="#searchPointEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointEdDt" id="searchPointEdDt" class="text" value="<c:out value="${commandMap.searchPointEdDt }"/>" readonly="readonly" data-target-start="#searchPointStDt"/>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>임직원포인트 구분/내역</span></th>
                                <td>
                                    <select id="searchMemPitGbn" name="searchMemPitGbn" class="select" title="포인트 구분">
                                        <option value="">전체</option>
                                        <option value="P" <ui:select v="P" t="${commandMap.searchMemPitGbn}" g="selected"/>>적립</option> 
                                        <option value="M" <ui:select v="M" t="${commandMap.searchMemPitGbn}" g="selected"/>>차감</option>
                                    </select>
                                    <select id="searchMemPitBrkDwn" name="searchMemPitBrkDwn" class="select" title="포인트  내역">
                                        <option value="">전체</option>
                                    </select>
                                </td>
                                <%-- <th><span>관리자메모</span></th>
                                <td>
                                     <input type="text" name="searchPitMstMemo" id="searchPitMstMemo" class="text large" value="<c:out value="${commandMap.searchPitMstMemo }"/>">
                                </td> --%>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
            
                </form>
                
                <div class="grid section-button-search">
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm">
                <!-- <form id="frm" name="frmEmp"> -->
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="보기 개수" >
                            <option value="20" selected>20개씩 보기</option>
                            <option value="40" >40개씩 보기</option>
                            <option value="60" >60개씩 보기</option>
                            <option value="80" >80개씩 보기</option>
                            <option value="100" >100개씩 보기</option>
                            </select>
                            <span class="pages">
                                (총 <strong class="em">1</strong>건, 1 of 1 page)
                            </span>
                        </div>

                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
                    
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>구분</th>
                                <th>발생일</th>
                                <th>내역</th>
                                <th>메모</th>
                                <th>적립</th>
                                <th>차감</th>
                                <th>소멸</th>
                                <th>잔여</th>
                                <th>처리자</th>
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
                                                <c:if test="${row.MEM_PIT_GBN eq 'P'}">적립</c:if>
                                                <c:if test="${row.MEM_PIT_GBN eq 'M'}">차감</c:if>
                                                <c:if test="${row.MEM_PIT_GBN eq 'D'}">소명</c:if>
                                            </td>
                                            <td><ui:formatDate value="${row.MEM_PIT_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                            <td>
                                                 <c:out value="${row.MEM_PIT_BRK_DWN_NM }"/>
                                            </td>
                                            <td>
                                                 <c:out value="${row.PIT_MST_MEMO }"/>
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
                                                <c:if test="${not empty row.MEM_PIT_REG_ID}">
                                                    <c:out value="${row.MEM_PIT_REG_NM }"/><br/>(<c:out value="${row.MEM_PIT_REG_ID }"/>)
                                                </c:if>                                              
                                            </td>
                                        </tr>
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="10">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>  
                            </c:choose>
                        </tbody>
                    </table>
                
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchPointStDt" value="<c:out value="${commandMap.searchPointStDt }"/>"/>
                    <input type="hidden" name="searchPointEdDt" value="<c:out value="${commandMap.searchPointEdDt }"/>"/>
                    <input type="hidden" name="searchMemPitGbn" value="<c:out value="${commandMap.searchMemPitGbn }"/>"/>
                    <input type="hidden" name="searchMemPitBrkDwn" value="<c:out value="${commandMap.searchMemPitBrkDwn }"/>"/>
                    <input type="hidden" name="searchPitMstMemo" value="<c:out value="${commandMap.searchPitMstMemo }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>     
                
                    <div class="section-pagination"><!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                            
                        </div>
                    </div><!-- // section pagination -->
                 
                </form>
                </div>
                <!-- //임직원포인트 -->
                
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>    
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<script>
//<![CDATA[
$(document).ready(function () 
{
	// 탭 
	$(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			//$('ul.tab li').removeClass('atv');
			$(this).siblings("li").removeClass('in atv');
			$('.tabcontent').removeClass('atv');
			$(this).addClass('atv in');
			$('#' + activeTab).addClass('atv');
		})
	});
/* 	$(function(){
		var link = document.location.href; //현재 접속 url
		var tab = link.split('/').pop();
		$('a[href$='+tab+']').trigger('click');
	}); */
	
    // 검색
    goSearch = function() 
    {
    	//goSearch = function(filter)
    	//if(filter==tPointSearch)
    	//else if(filter==ePointSearch)
    		//else if(filter==SwPointSearch)
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberPitPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            goSearch();
        }
    });  
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () 
    {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberPitPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    
    // date format 잡아주기 (ajax 페이지 이동 시 사용)
    getDateString = function(str) {
    	if(str) {
    		return str.substr(0,4)+"."+str.substr(4,2)+"."+str.substr(6,2)+" "+str.substr(8,2)+":"+str.substr(10,2)+":"+str.substr(12,2);
    	} else {
    		return "";
    	}
    };
    
    //페이지 이동 Ajax
    goPageEpoint = function (nPage){
    	//const idFromMap = ${memberInfo.MEM_MST_MEM_ID}
    	const MEM_ID = '${memberInfo.MEM_MST_MEM_ID}';
    	const cPage = nPage; // ui:page에서 숫자를 직접 넣어준다. $('#ePoint_cPage').val();
    	const pageSize = parseInt($("#pageSize option:selected").val()); //$('#ePoint_pageSize').val();
    	
    	
    	console.log(cPage+", "+pageSize);
    	
    	$.ajax({
    		type: 'post',
    		url: "<c:out value="${serverDomain}"/>/am/member/infoMemberPitPopupEpointPaging.do",
    		data: {"cPage": cPage, "pageSize": pageSize, "MEM_ID": MEM_ID},
    		datatype: 'JSON',
    		async: false,
    		success: function(data){
    			console.log(data);
    			var html = "";
   				var html2 = "";
    			//var previousPage =  
   				$.each(data.ePointListJSON ,function(index,item){
    				var GBN = item.MEM_PIT_GBN== "P" ? "적립" : "차감";
    				
    				var TotalCount = parseInt(item.ePointTotalCount, 10);
    				console.log("TotalCount : ",TotalCount);
    				var RNUM = parseInt(item.RNUM, 10);
    				var apparentRNUM = TotalCount - RNUM + 1;
    				
    				var DATE = getDateString(item.MEM_PIT_REG_DT);
    				
    				html +="<tr>";
    			    html +="<td>"+apparentRNUM+"</td>";
    			    html +="<td>"+GBN+"</td>";
    			    html +="<td>"+DATE+"</td>";
    			    html +="<td>"+item.MEM_PIT_BRK_DWN_NM+"</td>";
    			    html +="<td></td>";
    			    html +="<td>"+item.MEM_PIT_PLS+"</td>";
    			    html +="<td>"+item.MEM_PIT_MNS+"</td>";
    			    html +="<td>"+item.MEM_PIT_EXT+"</td>";
    			    html +="<td>"+item.MEM_PIT_TOT_PIT+"</td>";
    			    html +="<td>"+item.MEM_PIT_REG_NM+"<br>("+item.MEM_PIT_REG_ID+")</td>";
    			    html +="</tr>";    			    
    			});
    			  $('#ePoint-list-field').html(html);
    			  
    			

    		}, 
    		error: function(xhr, status, error){
    			alert("포인트내역 호출 중 에러가 발생하였습니다. : "+status);
    		}
    	});
    };
   
    
    /*    
    goPageTpoint = function (){
    	$.ajax({
    		type:'post',
    		url: '',
    		data: ,
    		datatype: '',
    		async: false,
    		success: ,
    		error: function(xhr, status, error){
    			alert();
    		}
    	});
    };
    
    goPageSwPoint = function (){
    	$.ajax({
    		type:'post',
    		url:'',
    		data: ,
    		datatype: '',
    		async : false,
    		success: ,
    		error: function(xhr, status, error){
    			alert();
    		}
    	});
    };
*/    
    // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
        goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
        //goSearchDelivery(url);
        popup(url, "550", "700", "yes", "deliveryView");
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
    
    getSubCodeList("P");
}); //$(document).ready();     


//]]>
</script>
</body>
</html>