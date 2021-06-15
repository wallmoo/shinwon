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

                <h2 class="title"><span>타임세일</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>상품코드</span></th>
	                            <td>
	                                <input type="text" class="text large" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
	                            </td>
	                            <th><span>상품명</span></th>
	                            <td>
	                                <input type="text" class="text large" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
	                            </td>
	                            <th><span>사용여부</span></th>
	                            <td>
	                              	<input type="radio" id="searchOneDayUesYn1" class="radio" name="searchOneDayUesYn" value="" <ui:select v="${commandMap.searchOneDayUesYn }" t="" g="checked"/> />
									<label for="searchOneDayUesYn1">전체</label>
									<input type="radio" id="searchOneDayUesYn2" class="radio" name="searchOneDayUesYn" value="Y" <ui:select v="${commandMap.searchOneDayUesYn }" t="Y" g="checked"/> />
									<label for="searchOneDayUesYn2">사용</label>
									<input type="radio" id="searchOneDayUesYn3" class="radio" name="searchOneDayUesYn" value="N" <ui:select v="${commandMap.searchOneDayUesYn }" t="N" g="checked"/> />
									<label for="searchOneDayUesYn3">미사용</label>
	                            </td>
                            </tr>
                            <tr>
                            	<th><span>구분</span></th>
	                            <td>
	                               <select class="select">
	                               		<option>전체</option>
	                               		<option>일반</option>
	                               		<option>타임스페셜</option>
	                               </select>
	                            </td>
	                            <th><span>기간검색</span></th>
	                            <td colspan="3">
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />"   readonly="readonly" data-target-end="#searchEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />"  readonly="readonly" data-target-start="#searchStartDate"/>
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
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:search();" class="button small primary"><span>검색</span></a>
                </div>

                <form id="frm" name="frm">
	                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchOneDayUesYn" value="<c:out value="${commandMap.searchAdMstDplYn }"/>"/>
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" id="ONE_DAY_IDX" name="ONE_DAY_IDX" value="" />
	                <input type="hidden" name="COPY_YN" value="N" />

	                <input type="hidden" name="searchPopMstTopYn" value="<c:out value="${commandMap.searchPopMstTopYn }"/>"/>

	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>

	                    <div class="col-1-2 text-right">
	                        <a href="javascript:goForm();" class="button small primary"><span>등록</span></a>

	                    </div>
                	</div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: auto;" />
							<col style="width: 5%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
							<col style="width: auto;" />
							<col style="width: 5%;" />
							<col style="width: 5%;" />
							<col style="width: 10%;" />
							<col style="width: 5%;" />
							<col style="width: 5%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>타임세일제목</th>
								<th>구분</th>
								<th>상품코드</th>
								<th>이미지</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>상품재고</th>
								<th>적용일/시간</th>
								<th>전시여부</th>
								<th>사용여부</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							    <c:when test="${not empty list}">
							    	<c:set var="listNum" value="${paging.listNum}" />
							    	<c:forEach var="item" items="${list }" varStatus="status">
									<tr>
										<td><c:out value="${listNum }" /></td>
										<td class="left">
											<a href="#none" class="list-title" data-one_day_idx="<c:out value="${item.ONE_DAY_IDX }"/>">
												<c:out value="${item.ONE_DAY_NM }" />
											</a>


										</td>
										<td>일반</td>
										<td><c:out value="${item.PRD_MST_CD }" /></td>
										<td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
										<td class="left"><c:out value="${item.PRD_MST_NM }" /></td>
										<td><fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" /></td>
										<td><c:out value="${item.PRD_MST_SEL_CNT }" /></td>
										<td>
											<ui:formatDate value="${item.ONE_DAY_ST_DT }" pattern="yyyy.MM.dd"/><br/>
											<c:out value="${item.ONE_DAY_ST_HH }" />:<c:out value="${item.ONE_DAY_ST_MM }" />~<c:out value="${item.ONE_DAY_ED_HH }" />:<c:out value="${item.ONE_DAY_ED_MM }" />
										</td>
										<td>
											<select>
												<option>전시</option>
												<option>미전시</option>
											</select>
										</td>
										<td>
											<c:out value="${item.ONE_DAY_USE_YN eq 'Y' ? '사용' : '미사용' }"/>
										</td>
										<td><ui:formatDate value="${item.ONE_DAY_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
									</tr>
									<c:set var="listNum" value="${listNum-1}" />
							    	</c:forEach>
							    </c:when>
							    <c:otherwise>
									<c:if test="${param.searchYn eq 'Y'}">
							    	<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
									</tr>
							    	</c:if>
							    	<c:if test="${param.searchYn ne 'Y'}">
							    	<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
									</tr>
							    	</c:if>
							    </c:otherwise>
							</c:choose>
						</tbody>
					</table>

                    <div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
	                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
	                </div><!-- // section button --> 

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
	  // 검색 엔터 이벤트
    $('#searchForm').find("input").not(".datepicker").keydown(function (e)
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });

 // 상세페이지 이동
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='ONE_DAY_IDX']").val($this.data("one_day_idx"));
        var url = "";

        url = "<c:out value="${serverDomain}" />/am/marketing/oneDayEdit.do";

        $frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
    });

    // 검색
    search = function()
    {
        var $searchForm = $("#searchForm");

        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/oneDayList.do", "target":"_self", "method":"post"}).submit();
    };

    // 페이지 이동
    goPage = function (cPage)
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/oneDayList.do", "target":"_self", "method":"post"}).submit();
    };

    goView = function ( env, popMstIdx)
    {
        var $frm = $("#frm");
        $frm.find("ONE_DAY_IDX").val(popMstIdx);


        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/oneDayEdit.do", "target":"_self", "method":"post"}).submit();

    };

    goForm = function ()
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/oneDayForm.do", "target":"_self", "method":"post"}).submit();
    };

	$(document).on("click", "#goCopy", function () {

        var $frm = $("#frm");
        $frm.find("input[name='ONE_DAY_IDX']").val($(this).data("one_day_idx"));
        $frm.find("input[name='COPY_YN']").val("Y");
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/oneDayEdit.do", "target":"_self", "method":"post"}).submit();
    });
});
//-->
</script>

</body>
</html>
