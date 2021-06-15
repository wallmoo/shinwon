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

            <h2 class="title"><span>펀딩</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr><!-- row -->
                            <th><span>상품코드</span></th>
                            <td>
                                <input type="text" name="searchPrdMstCd" id="searchPrdMstCd" class="text large" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                            </td>
                            <th><span>상품명</span></th>
                            <td>
                                <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text large" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>진행상태</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchFndMstStatus" class="radio"  <c:if test="${empty commandMap.searchFndMstStatus }">checked="checked"</c:if> value=""/>
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="searchFndMstStatus" class="radio"  <c:if test="${commandMap.searchFndMstStatus eq 'ing' }">checked="checked"</c:if> value="ing" /> 
                                <label for="stateB">진행</label>
                                <input type="radio" id="stateC" name="searchFndMstStatus" class="radio"  <c:if test="${commandMap.searchFndMstStatus eq 'end' }">checked="checked"</c:if> value="end" />
                                <label for="stateC">종료</label>
                                <input type="radio" id="stateD" name="searchFndMstStatus" class="radio"  <c:if test="${commandMap.searchFndMstStatus eq 'N' }">checked="checked"</c:if> value="N" />
                                <label for="stateD">오픈예정</label>
                            </td>
                            <th><span>사용여부</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchFndMstUseYn" class="radio" <c:if test="${empty commandMap.searchFndMstUseYn }">checked="checked"</c:if> value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="searchFndMstUseYn" class="radio"  <c:if test="${commandMap.searchFndMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="searchFndMstUseYn" class="radio" <c:if test="${commandMap.searchFndMstUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                        <tr>
                            <th><span>기간</span></th>
                            <td colspan="3">
                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                               <input type="text" class="text" name="searchStartDate" id="searchStartDate"	value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="searchEndDate"> ~
                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                               <input type="text" class="text" name="searchEndDate"	id="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="searchStartDate">
                               <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                               <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                               <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                               <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                               <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="#none" id="search" class="button small primary"><span>검색</span></a>
            </div>

            <form id="frm" name="frm">
               <input type="hidden" name="PLN_MST_IDX" value="" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                <input type="hidden" name="searchPlnMstShopType" value="" />
                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
                <input type="hidden" name="searchPlnMstTitle" value="<c:out value="${commandMap.searchPlnMstTitle }"/>" />
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>" />
                <input type="hidden" name="searchPlnMstUseYn" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>" />
                <input type="hidden" name="selectedFndMstList" id="selectedFndMstList">

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                        <span class="pages">
                            (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                        </span>
                    </div>

                    <div class="col-1-2 text-right">
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: 7%;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 3%;" />
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />
                        <col style="width: 15%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>펀딩제목</th>
                            <th>상품코드</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>차수</th>
                            <th>판매가</th>
                            <th>신청수</th>
                            <th>펀딩기간</th>
                            <th>진행상태</th>
                            <th>사용여부</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody id="fundingList">
                        <c:choose>
	                        <c:when test="${not empty list }">
	                            <c:set var="listNum" value="${paging.listNum}" />
		                        <c:forEach var="row" items="${list}" varStatus="i">
			                        <tr>
			                            <td>1</td>
			                            <td><a href="javascript:goView('<c:out value="${row.FND_MST_IDX }"/>');" class="list-title" data-fnd_mst_idx="<c:out value="${row.FND_MST_IDX }"/>">${row.FND_MST_NM }</a></td>
			                            <td>${row.PRD_MST_CD }</td>
			                            <td><span class="thumbnail_img"><img src="${cdnDomain}${row.PRD_IMAGE}"></span></td>
			                            <td>${row.PRD_MST_NM }</td>
			                            <td>${row.FND_MST_IDX }</td>
			                            <td><fmt:formatNumber value="${row.PRD_MST_PRC }" groupingUsed="true" /></td>
			                            <td>0</td>
			                            <td><ui:formatDate pattern="yyyy.MM.dd" value="${row.FND_MST_ST_DT}"/> ~ <ui:formatDate pattern="yyyy.MM.dd" value="${row.FND_MST_ED_DT}"/></td>
			                            <td>진행</td>
			                            <td>
			                            	<select name="FND_MST_USE_YN" class="select">
												<option <c:if test="${row.FND_MST_USE_YN eq 'Y'}"> selected data-fnd_mst_use_yn="Y" </c:if> value="Y">사용</option>
												<option <c:if test="${row.FND_MST_USE_YN eq 'N'}"> selected data-fnd_mst_use_yn="N" </c:if> value="N">미사용</option>
											</select>
			                            </td>
			                            <td><ui:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${row.FND_MST_REG_DT}"/></td>
			                        </tr>
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
                </form>

                <div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
                </div><!-- // section button -->

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <!-- <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a> -->
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

    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/fundingForm.do", "target":"_self", "method":"post"}).submit();
    });

    // 검색 버튼 클릭 이벤트
	$(document).on("click","#search",function() {
		var $searchForm = $("#searchForm");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/fundingList.do",	"target" : "_self",	"method" : "post"}).submit();
	});

	// 저장 버튼
	$(document).on("click",	"#goRegist",function() {
		var data = new Array();
    	$("#fundingList").find("tr").each(function(i){
    		var obj = new Object();
			var $tr = $(this).find(".list-title");
			obj.FND_MST_IDX = $tr.data("fnd_mst_idx");
			obj.FND_MST_USE_YN = $(this).find("select :selected").val();
			data.push(obj);
		});

		$("#selectedFndMstList").val(JSON.stringify(data));
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/marketing/fundingListModify.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
    

	// 상품 상세페이지 이동 (새창)
	goView = function (fndFstIdx)
	{
		var $frm = $("#frm");
		$frm.find("input[name='FND_MST_IDX']").val(fndFstIdx);
		
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/fundingEdit.do", "target":"_blank", "method":"post"}).submit();
	};
});
//-->
</script>

</body>
</html>
