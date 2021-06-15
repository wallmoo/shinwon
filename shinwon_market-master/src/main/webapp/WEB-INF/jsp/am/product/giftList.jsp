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

                <h2 class="title"><span>사은품관리</span></h2>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>목록</span></h3>
                </div><!-- // section-title -->
				
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
	                        <tr><!-- row -->
	                            <th><span>사은품명</span></th>
	                            <td>
	                                <input type="text" class="text large" name="searchGftMstName" id="searchGftMstName" value="<c:out value="${commandMap.searchGftMstName }"/>"/>
	                            </td>
	                            <th><span>상태</span></th>
	                            <td>
	                                <input type="radio" id="stateA" name="searchGftMstUseYn" class="radio" <c:if test="${empty commandMap.searchGftMstUseYn }">checked="checked"</c:if> value=""/>
		                            <label for="stateA">전체</label>
		                            <input type="radio" id="stateB" name="searchGftMstUseYn" class="radio" <c:if test="${commandMap.searchGftMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
		                            <label for="stateB">사용</label>
		                            <input type="radio" id="stateC" name="searchGftMstUseYn" class="radio" <c:if test="${commandMap.searchGftMstUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
		                            <label for="stateC">미사용</label>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th><span>기간</span></th>
	                            <td colspan=3>
	                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                       			<input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
	                       			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                                <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
		                            <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	            </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->

				<form id="frm" name="frm">
                	<input type="hidden" name="GFT_MST_IDX"       value=""/>
	                <input type="hidden" name="cPage"             value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="searchStartDate"   value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate"     value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchGftMstName"  value="<c:out value="${commandMap.searchGftMstName }"/>"/>
	                <input type="hidden" name="searchGftMstUseYn" value="<c:out value="${commandMap.searchGftMstUseYn }"/>"/>
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
	                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                    <div class="col-1-2 text-left">
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
	                    </div>
	                    <div class="col-1-2 text-right">
	                        <a href="javascript:;" id="goForm" class="button small primary"><span>등록</span></a>
	                    </div>
	                </div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th>NO</th>
                            <th>사은품명</th>
                            <th>사은기간</th>
                            <th>상품수</th>
                            <th>등록일</th>
                            <th>상태</th>
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
										<a href="#none" class="list-title" data-brd_gds_idx="<c:out value="${row.GFT_MST_IDX }"/>">
											<c:out value="${row.GFT_MST_NAME }"/>
										</a>
									</td>
									<td>
										<ui:formatDate value="${row.GFT_MST_ST_DT }" pattern="yyyy.MM.dd"/>
										~
										<ui:formatDate value="${row.GFT_MST_ED_DT }" pattern="yyyy.MM.dd"/>
									</td>
									<td>
										<fmt:formatNumber value="${row.PRD_CNT }" groupingUsed="true" />
									</td>
									<td><ui:formatDate value="${row.GFT_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
									<td>
										<c:out value="${row.GFT_MST_USE_YN eq 'Y'?'사용':'미사용' }"/>
									</td>
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
	                </table><!-- // table -->
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
	// 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/giftForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='GFT_MST_IDX']").val($(this).data("brd_gds_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/giftEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 사은품명 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchGftMstName", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/giftList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/giftList.do", "target":"_self", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
