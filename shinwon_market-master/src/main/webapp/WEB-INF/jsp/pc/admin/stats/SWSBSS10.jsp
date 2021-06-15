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

        <div class="container"><!-- container -->

        <h2 class="title"><span>매출통계</span></h2>

        <div class="tab-list"><!-- tab -->
            <ul class="tab">
                <li><a href="#none">판매실적</a></li>
                <li><a href="<c:out value="${serverDomain}" />/am/stats/orderStatsProductList.do">판매상품</a></li>
                <li><a href="<c:out value="${serverDomain}" />/am/stats/orderStatsCustomerUnitList.do">객단가</a></li>
                <li><a href="<c:out value="${serverDomain}" />/am/stats/orderStatsAgeSexList.do">성별/연령별</a></li>
                <li class="active"><a href="#none">입점업체별</a></li>
                <li><a href="#none">결제수단별</a></li>
                <li><a href="#none">포인트별</a></li>
                <li><a href="#none">쿠폰별</a></li>
            </ul>
        </div><!-- // tab -->

        <h3 class="title"><span>검색</span></h3>

        <form id="searchForm" name="searchForm">
            <input type="hidden" name="searchYn" value="Y" />

            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><span>조회기간</span></th>
                        <td>
                            <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                            <input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchStartDate"/> ~
                            <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                            <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchEndDate"/>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -3, 0,  '-');" class="button button-a xsmall"><span>세달</span></a>
                        </td>
                    </tr>
                    <tr>
                        <th><span>주문매체</span></th>
                        <td>
                            <select class="select">
                                <option value="">전체</option>
                            </select>
                            <!--<input type="radio" id="searchChannel1" name="searchChannel" class="radio" value="" <c:if test="${empty commandMap.searchChannel }">checked="checked"</c:if> />
                            <label for="searchChannel1">전체</label>
                            <input type="radio" id="searchChannel2" name="searchChannel" class="radio" value="${Code.USER_ENV_TYPE_PC }" <c:if test="${commandMap.searchChannel eq Code.USER_ENV_TYPE_PC}">checked="checked"</c:if> />
                            <label for="searchChannel2">PC</label>
                            <input type="radio" id="searchChannel3" name="searchChannel" class="radio" value="${Code.USER_ENV_TYPE_MOBILE }" <c:if test="${commandMap.searchChannel eq Code.USER_ENV_TYPE_MOBILE}">checked="checked"</c:if> />
                            <label for="searchChannel3">MOBILE</label>-->
                        </td>
                    </tr>
                </tbody>
            </table><!-- // table -->

        </form>

        <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
            <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
            <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
        </div><!-- // 검색 하단 버튼 -->

        <div class="section-title"><!-- section-title -->
            <h3 class="title"><span>조회결과<strong class="primary"> (단위:원)</strong></span></h3>
            <div class="more">
                <a href="javascript:goExcelDown();" class="button small primary"><span>엑셀 다운로드</span></a>
            </div>
        </div><!-- // section-title -->

        <table cellspacing="0" class="table-col table-b"><!-- table -->
            <thead>
                <tr>
                    <th rowspan="2">입점사</th>
                    <th colspan="2">주문</th>
                    <th colspan="2">취소</th>
                    <th colspan="2">판매</th>
                    <th colspan="2">반품</th>
                    <th colspan="2">매출</th>
                </tr>
                <tr>
                    <th class="border-left">건수</th>
                    <th>금액</th>
                    <th>건수</th>
                    <th>금액</th>
                    <th>건수</th>
                    <th>금액</th>
                    <th>건수</th>
                    <th>금액</th>
                    <th>건수</th>
                    <th>금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>입점사Z</td>
                    <td>10</td>
                    <td>1,000,000</td>
                    <td>10</td>
                    <td>1,000,000</td>
                    <td>10</td>
                    <td>1,000,000</td>
                    <td>10</td>
                    <td>1,000,000</td>
                    <td>10</td>
                    <td>11,000,000</td>
                </tr>
                <tr>
                    <td>입점사f</td>
                    <td>20</td>
                    <td>1,000,000</td>
                    <td>20</td>
                    <td>1,000,000</td>
                    <td>20</td>
                    <td>1,000,000</td>
                    <td>20</td>
                    <td>1,000,000</td>
                    <td>20</td>
                    <td>4,000,000</td>
                </tr>
                <tr>
                    <td>입점사a</td>
                    <td>30</td>
                    <td>1,000,000</td>
                    <td>30</td>
                    <td>1,000,000</td>
                    <td>30</td>
                    <td>1,000,000</td>
                    <td>30</td>
                    <td>1,000,000</td>
                    <td>30</td>
                    <td>3,000,000</td>
                </tr>
                <tr>
                    <td>합계</td>
                    <td>60</td>
                    <td>3,000,000</td>
                    <td>30</td>
                    <td>3,000,000</td>
                    <td>60</td>
                    <td>3,000,000</td>
                    <td>60</td>
                    <td>3,000,000</td>
                    <td>60</td>
                    <td>100,000</td>
                </tr>
                <tr>
                    <td colspan="11">조건을 선택하신 후 검색해 주세요.</td>
                </tr>
            </tbody>
        </table><!-- // table -->

        <form id="frm" name="frm"><!-- 엑셀다운 폼 -->
            <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
            <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
            <input type="hidden" name="searchChannel" value="<c:out value="${commandMap.searchChannel }"/>"/>
        </form><!-- // 엑셀다운 폼 -->

    </div><!-- // container -->

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

//-->
</script>

</body>
</html>
