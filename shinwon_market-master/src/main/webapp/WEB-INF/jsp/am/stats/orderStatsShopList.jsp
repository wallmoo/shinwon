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

                <h2 class="title"><span>매장별통계</span></h2>

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
                                </td>
                            </tr>
                            <tr>
                                <th><span>브랜드/매장</span></th>
                                <td>
                                <select class="select">
                                    <option value="">전체</option>
                                </select>
                                <select class="select">
                                    <option value="">전체</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>매장명/매장코드</span></th>
                                <td>
                                    <input type="text" class="text large" place> / <input type="text" class="text large">
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
                    <h3 class="title"><span>조회결과<strong class="primary"> $2020년 01월$기준</strong></span></h3>
                    <div class="more">
                        <a href="javascript:goExcelDown();" class="button small primary"><span>엑셀 다운로드</span></a>
                    </div>
                </div><!-- // section-title -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <thead>
                        <tr>
                            <th rowspan="2">브랜드</th>
                            <th rowspan="2">매장명<br/>(매장코드)</th>
                            <th colspan="2">매장픽업</th>
                            <th colspan="3">매장택배발송</th>
                            <th colspan="3">결제건수</th>
                            <th rowspan="2">거절건수</th>
                            <th colspan="2">합계</th>
                        </tr>
                        <tr>
                            <th class="border-left">건수</th>
                            <th>매장수수료</th>
                            <th>건수</th>
                            <th>배송비</th>
                            <th>매장수수료</th>
                            <th>건수</th>
                            <th>매장수수료</th>
                            <th>건수</th>
                            <th>매장수수료</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:forEach items="${list}" var="data" varStatus="i">
                                <tr>
                                    <td>SIEG</td>
                                    <td>롯데센텀시티(SG)<br/>(G9050P)</td>
                                    <td>14</td>
                                    <td>110,000</td>
                                    <td>3</td>
                                    <td>32,500</td>
                                    <td>85,000</td>
                                    <td>2</td>
                                    <td>35,000</td>
                                    <td>12</td>
                                    <td>15</td>
                                    <td>107,500</td>
                                </tr>
                                <tr>
                                    <td>VIKI</td>
                                    <td>양산모다<br/>(G9050P)</td>
                                    <td>86</td>
                                    <td>2,890,000</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>1</td>
                                    <td>15,000</td>
                                    <td>5</td>
                                    <td>85</td>
                                    <td>2,875,000</td>
                                </tr>
                                <tr>
                                    <td>SI</td>
                                    <td>NC(아)부천(SI)<br/>(G9050P)</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>147</td>
                                    <td>367,500</td>
                                    <td>0</td>
                                    <td>3</td>
                                    <td>50,000</td>
                                    <td>6</td>
                                    <td>144</td>
                                    <td>317,500</td>
                                </tr>
                                <tr style="background:#f5f5f5;">
                                    <td colspan="2">합계</td>
                                    <td>100</td>
                                    <td>3,000,000</td>
                                    <td>150</td>
                                    <td>400,000</td>
                                    <td>4,500,000</td>
                                    <td>6</td>
                                    <td>90,000</td>
                                    <td>23</td>
                                    <td>234</td>
                                    <td>3,300,000</td>
                                </tr>
                                <!--<tr>
                                    <td><c:out value="${data.ORD_MST_BRAND_NM}"/></td>
                                    <td><c:out value="${data.ORD_PRD_BCNC_NM}"/><br/>(<c:out value="${data.ORD_MST_BCNC_CD}"/>)</td>
                                    <td></td>
                                    <td><fmt:formatNumber value="${data.PAY_PAYMENT_PRICE}" type="number"/></td>
                                    <td><fmt:formatNumber value="${data.PAY_ORD_MST_CNT}" type="number"/></td>
                                    <td><fmt:formatNumber value="${data.CANCEL_PAYMENT_PRICE}" type="number"/></td>
                                    <td><fmt:formatNumber value="${data.CANCEL_ORD_MST_CNT}" type="number"/></td>
                                </tr>-->
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${commandMap.searchYn eq 'Y'}">
                                <tr>
                                    <td colspan="14">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                </tr>
                            </c:if>
                            <c:if test="${commandMap.searchYn ne 'Y'}">
                                <tr>
                                    <td colspan="14">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
                                </tr>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table><!-- // table -->

                <form id="frm" name="frm"><!-- 엑셀다운 폼 -->
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchBcncCd" value="<c:out value="${commandMap.searchBcncCd }"/>"/>
                </form><!-- // 엑셀다운 폼 -->

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
$(function () {

	// 검색 엔터 이벤트
    $('#searchForm').find("input").not(".datepicker").keydown(function (e)
    {
        if(e.keyCode == 13)
        {
            goSearch();
        }
    });

    // 검색
    goSearch = function()
    {
        alert("준비중입니다.");
        /*
        var $searchForm = $("#searchForm");

        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/stats/orderMallStatsShopList.do", "target":"_self", "method":"get"}).submit();
        */
    };

    // 엑셀다운
    goExcelDown = function ()
    {
        if("${commandMap.searchYn }" != "Y"){
            alert("검색을 해주십시요.");
            return;
        }
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/stats/orderStatsShopListExcel.do", "target":"_self", "method":"get"}).submit();
    };

    $(document).on("change","input[name=searchBcncCd]", function(){
        if($(this).val() == ""){
            $("#searchBcncNm").val("");
            $("#store2").val("");
        }
    });

    fnResultStore = function (obj)
    {
        $("#store2").prop("checked",true);
        $("#store2").val(obj.SHOP_CD);
        $("#searchBcncNm").val(obj.SHOP_NM);
        return true;
    }

    // 미니샵 검색
    searchMiniShop = function ()
    {
        popup('<c:out value="${serverDomain}" />/am/stats/orderStatsRegularStorePopup.do',"600","500","no","_SearchRegularStorePopup");
    };

});
</script>

</body>
</html>
