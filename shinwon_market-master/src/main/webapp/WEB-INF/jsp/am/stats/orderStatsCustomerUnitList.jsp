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
                        <li class="active"><a href="<c:out value="${serverDomain}" />/am/stats/orderStatsCustomerUnitList.do">객단가</a></li>
                        <li><a href="<c:out value="${serverDomain}" />/am/stats/orderStatsAgeSexList.do">성별/연령별</a></li>
                        <li><a href="#none">입점업체별</a></li>
                        <li><a href="#none">결제수단별</a></li>
                        <li><a href="#none">포인트별</a></li>
                        <li><a href="#none">쿠폰별</a></li>
                    </ul>
                </div><!-- // tab -->

                <h3 class="title"><span>검색</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />

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
                            <!--<tr>
                                <th><span>주문매체</span></th>
                                <td>
                                    <input type="radio" id="searchChannel1" name="searchChannel" class="radio" value="" <c:if test="${empty commandMap.searchChannel }">checked="checked"</c:if> />
                                    <label for="searchChannel1">전체</label>
                                    <input type="radio" id="searchChannel2" name="searchChannel" class="radio" value="${Code.USER_ENV_TYPE_PC }" <c:if test="${commandMap.searchChannel eq Code.USER_ENV_TYPE_PC}">checked="checked"</c:if> />
                                    <label for="searchChannel2">PC</label>
                                    <input type="radio" id="searchChannel3" name="searchChannel" class="radio" value="${Code.USER_ENV_TYPE_MOBILE }" <c:if test="${commandMap.searchChannel eq Code.USER_ENV_TYPE_MOBILE}">checked="checked"</c:if> />
                                    <label for="searchChannel3">MOBILE</label>
                                </td>
                            </tr>-->
                            <tr>
                                <th><span>카테고리</span></th>
                                <td>
                                    <select class="select" id="searchPrdCtgEnv" name="searchPrdCtgEnv" >
                                        <option value="" >미선택</option>
                                        <option value="<c:out value="${Code.CATEGORY_TYPE_PC }" />" <ui:select v="${commandMap.searchPrdCtgEnv }" t="${Code.CATEGORY_TYPE_PC }" g="selected"/>>PC</option>
                                        <option value="<c:out value="${Code.CATEGORY_TYPE_MOBILE }" />" <ui:select v="${commandMap.searchPrdCtgEnv }" t="${Code.CATEGORY_TYPE_MOBILE }" g="selected"/>>MOBILE</option>
                                    </select>

                                    <select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" >
                                        <option value="">대분류선택</option>
                                    </select>
                                    <select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" >
                                        <option value="">중분류선택</option>
                                    </select>
                                    <!--<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
                                        <option value="">소분류선택</option>
                                    </select>
                                    <select class="select" id="searchPrdCtgDepth4" name="searchPrdCtgDepth4" >
                                        <option value="">세분류선택</option>
                                    </select>-->
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
                    <h3 class="title"><span>조회결과<strong class="primary"> (단위:명/원)</strong></span></h3>
                    <div class="more">
                        <a href="javascript:goExcelDown();" class="button small primary"><span>엑셀 다운로드</span></a>
                    </div>
                </div><!-- // section-title -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <thead>
                        <tr>
                            <th>1처 카테고리</th>
                            <th>2차 카테고리</th>
                            <th>3차 카테고리</th>
                            <th>판매실적</th>
                            <th>고객수</th>
                            <th>객단가</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:forEach items="${list}" var="data" varStatus="i">
                                <tr>
                                    <td><c:out value="${data.TOP_CAT_NM}"/></td>
                                    <td><c:out value="${data.UP_CAT_NM}"/></td>
                                    <td><c:out value="${data.PRD_CTG_NM}"/></td>
                                    <td><fmt:formatNumber value="${data.SUM_ORD_PRD_ORD_PRC}" type="number"/></td>
                                    <td><fmt:formatNumber value="${data.CUSTOMER_CNT}" type="number"/></td>
                                    <td><fmt:formatNumber value="${data.CUSTOMER_UNIT_PRICE}" type="number"/></td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${commandMap.searchYn eq 'Y'}">
                                <tr>
                                    <td colspan="6">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                </tr>
                            </c:if>
                            <c:if test="${commandMap.searchYn ne 'Y'}">
                                <tr>
                                    <td colspan="6">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
                                </tr>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table><!-- // table -->

                <form id="frm" name="frm"><!-- 엑셀다운 폼 -->
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
                    <input type="hidden" name="searchChannel" value="<c:out value="${commandMap.searchChannel }"/>"/>
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

    // 카테고리 설정
    if( $("#frm").find("input[name='searchPrdCtgEnv']").val() != ""){
        getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    }

    if( $("#frm").find("input[name='searchPrdCtgIdx']").val() == "")
    {
//      getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>");
    }
    else
    {
        getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
        getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
        getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
        getCategoryList("searchPrdCtgDepth4", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    }

    $(document).on("change", "#searchPrdCtgEnv", function ()
    {
        getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth4", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });

    $(document).on("change", "#searchPrdCtgDepth1", function ()
    {
        getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth2", function ()
    {
        getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth3", function ()
    {
        getCategoryList("searchPrdCtgDepth4", $("#searchPrdCtgDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });

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

        // 상품 카테고리 검색 조건
        var searchCategoryIdx = "";
        var tempCategoryIdx = "";

        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth1 option:selected").val();
        if (tempCategoryIdx != '')
        {
            searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth2 option:selected").val();
        if (tempCategoryIdx != '')
        {
            searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth3 option:selected").val();
        if (tempCategoryIdx != '')
        {
            searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth4 option:selected").val();
        if (tempCategoryIdx != '')
        {
            searchCategoryIdx = tempCategoryIdx;
        }
        $searchForm.find("#searchPrdCtgIdx").val(searchCategoryIdx);

        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/stats/orderStatsCustomerUnitList.do", "target":"_self", "method":"get"}).submit();
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
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/stats/orderStatsCustomerUnitListExcel.do", "target":"_self", "method":"get"}).submit();
    };

});
</script>

</body>
</html>
