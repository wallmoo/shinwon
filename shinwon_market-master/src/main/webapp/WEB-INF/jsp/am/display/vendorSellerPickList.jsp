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

            <h2 class="title"><span>셀러픽관리</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>등록일</span></th>
                            <td>
                            
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" id="searchCntMstStDt" name="searchCntMstStDt" value="<c:out value="${commandMap.searchCntMstStDt }" />" readonly="readonly" data-target-end="#searchCntMstEdDt"> ~
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" id="searchCntMstEdDt" name="searchCntMstEdDt" value="<c:out value="${commandMap.searchCntMstEdDt }" />" readonly="readonly" data-target-start="#searchCntMstStDt">
                                <a href="javascript:fnDateSet('searchCntMstEdDt', 'searchCntMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                <a href="javascript:fnDateSet('searchCntMstEdDt', 'searchCntMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('searchCntMstEdDt', 'searchCntMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('searchCntMstEdDt', 'searchCntMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><span>상태</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchCntMstUseYn" class="radio" <c:if test="${empty commandMap.searchCntMstUseYn }">checked="checked"</c:if> value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="searchCntMstUseYn" class="radio" <c:if test="${commandMap.searchCntMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="searchCntMstUseYn" class="radio" <c:if test="${commandMap.searchCntMstUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                        <tr>
                            <th><span>키워드</span></th>
                            <td><input type="text" name="searchCntMstTitle" id="searchCntMstTitle" class="text xlarge" value="<c:out value="${commandMap.searchCntMstTitle}"/>"/></td>
                        </tr>

                    </tbody>
                </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="javascript:search();" id="search" class="button small primary"><span>검색</span></a>
            </div>

            <form id="frm" name="frm">
               <input type="hidden" name="CNT_MST_IDX" value="" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                <input type="hidden" name="searchCntMstTitle" value="<c:out value="${commandMap.searchCntMstTitle }"/>" />
                <input type="hidden" name="searchCntMstStDt" value="<c:out value="${commandMap.searchCntMstStDt }"/>" />
                <input type="hidden" name="searchCntMstEdDt" value="<c:out value="${commandMap.searchCntMstEdDt }"/>" />
                <input type="hidden" name="searchMemID" value="<c:out value="${commandMap.searchMemID }"/>" />
                <input type="hidden" name="searchCntMstUseYn" value="<c:out value="${commandMap.searchCntMstUseYn }"/>" />
                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
                <input type="hidden" name="selectedSellerPickList" id="selectedSellerPickList"/>
                
                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage" />
                        <span class="pages">
                            (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                        </span>
                    </div>

                    <div class="col-1-2 text-right">
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                        <a href="#none" id="goRegist" class="button small primary"><span>저장</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll"></th>
                            <th>NO</th>
                            <th>입점사</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>등록일</th>
                            <th>좋아요 수</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody id="sellerpickList">
                        <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td><input type="checkbox" name="CNT_MST_IDXs" value="<c:out value="${row.CNT_MST_IDX }" />" class="checkbox checkRow"></td></td>
                                            <td><c:out value="${listNum }"/></td>
                                            <td><c:out value="${row.VDR_MST_NM }"/></td>
                                            <td><c:out value="${row.CNT_MST_REG_ID }"/></td>
                                            <td class="left">
                                                <a href="#none" class="list-title" data-cnt_mst_idx="<c:out value="${row.CNT_MST_IDX }"/>">
                                                    <c:out value="${row.CNT_MST_TITLE }"/>
                                                </a>
                                            </td>
                                            <td><c:out value="${row.CNT_MST_REG_DT }"/></td>
                                            <td><c:out value="${row.LIKE_COUNTS }"/></td>
                                            <td>
                                                <select class="select" data-org="<c:out value="${row.CNT_MST_USE_YN }"/>">
                                                    <option value="Y" <c:if test="${row.CNT_MST_USE_YN eq 'Y' }">selected</c:if>>사용</option>
                                                    <option value="N" <c:if test="${row.CNT_MST_USE_YN eq 'N' }">selected</c:if>>미사용</option>
                                                </select>
                                            </td>
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
                </table>

                <div class="section-pagination">
					<!-- section pagination -->
					<h4 class="sr-only">목록 페이징</h4>
					<div class="wrap">
						<!-- 개발 시 wrap 이하 모듈 시작 -->
						<ui:paging paging="${paging }" jsFunction="goPage" />
					</div>
				</div>
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/vendorSellerPickList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/vendorSellerPickList.do", "target":"_self", "method":"post"}).submit();
    };
    
	$(document).on("click",	"#goForm",function() {
		$("#frm").attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/display/vendorSellerPickForm.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
	});
	
	$(document).on("click",	"#goRegist",function() {
		
		var data = new Array();
    	$("#sellerpickList").find("tr").each(function(i){
    		var obj = new Object();
			var $tr = $(this).find(".list-title");
			obj.CNT_MST_IDX = $tr.data("cnt_mst_idx");
			obj.CNT_MST_USE_YN = $(this).find("select :selected").val();
			obj.CNT_MST_USE_YN_ORG = $(this).find(".select").data("org");
			data.push(obj);
		});
    	
		$("#selectedSellerPickList").val(JSON.stringify(data));
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/display/sellerPickListModify.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
		
	});
	
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='CNT_MST_IDX']").val($(this).data("cnt_mst_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/vendorSellerPickEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
});
//-->
</script>

</body>
</html>
