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

				<h2 class="title"><span>입점문의관리</span></h2>

				<h3 class="title"><span>목록</span></h3>

				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />

					<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
						<colgroup>
							<col style="width:10%;">
							<col style="width:40%;">
							<col style="width:10%;">
							<col style="width:40%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>신청일</span></th>
								<td colspan="3">
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
								</td>
							</tr>
							<tr>
								<th><span>업체명</span></th>
								<td><input type="text" class="text" id="searchVendorNm" name="searchVendorNm" value="<c:out value="${commandMap.searchVendorNm }"/>" maxlength="30"/></td>
								<th><span>사업자등록번호</span></th>
								<td>
									<input type="text" class="text large number" name="searchBusiNo" id="searchBusiNo" value="<c:out value="${commandMap.searchBusiNo }"/>" maxlength="13"/>
								</td>
							</tr>
							<tr>
								<th><span>담당자명</span></th>
								<td>
									<input type="text" class="text" name="searchManagerNm" id="searchManagerNm" value="<c:out value="${commandMap.searchManagerNm }"/>" maxlength="500"/>
								</td>
							</tr>
						</tbody>
					</table><!-- // table -->

				</form>

				<div class="grid section-button-search"><!-- 검색 하단 버튼 -->
					<a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
					<a href="javascript:search();" class="button small primary datepicker"><span>검색</span></a>
				</div><!-- // 검색 하단 버튼 -->

				<form id="frm" name="frm">
					<input type="hidden" name="VDR_CST_IDX" id="VDR_CST_IDX"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
					<input type="hidden" name="searchBusiNo" value="<c:out value="${commandMap.searchBusiNo }"/>"/>
					<input type="hidden" name="searchVendorNm" value="<c:out value="${commandMap.searchVendorNm }"/>"/>
					<input type="hidden" name="searchManagerNm" value="<c:out value="${commandMap.searchManagerNm }"/>"/>

					<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages">
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>
					 </div><!-- // 목록 상단 버튼 -->
				</form>

				<table cellspacing="0" class="table-col table-b"><!-- table -->
					<colgroup>
						<col style="width: 8%;"/>
						<col style="width: auto;"/>
						<col style="width: auto;"/>
						<col style="width: auto;" />
						<col style="width: 10%;"/>
						<col style="width: 20%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>업체명</th>
							<th>사업자등록번호</th>
							<th>담당자명</th>
							<th>신청일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty list }">
								<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="row" items="${list }" varStatus="i">
									<tr>
										<td><c:out value="${listNum }"/></td> 
										<td class="left"><a href="javascript:goView('<c:out value="${row.VDR_CST_IDX }"/>');" class="list-title">${row.VDR_CST_NM }</a></td>
										<td><c:out value="${row.VDR_CST_BUSI1 }"/>-<c:out value="${row.VDR_CST_BUSI2 }"/>-<c:out value="${row.VDR_CST_BUSI3 }"/></td>
										<td><c:out value="${row.VDR_CST_MNG_NM }"/></td>
										<td><ui:formatDate value="${row.VDR_CST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
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

	var $frm = $("#frm");

	// 대표상품군 SelectBox
	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "P");

	$(document).on("click", "#searchPrdCtgDepth1", function ()
	{
		getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "P");
	});

	if("${commandMap.searchPrdCtgDepth1}" != null){
		getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", "P");
	}

	// 업체명 클릭 이벤트
	goView = function (vdrCstIdx) {
		$frm.find("input[name='VDR_CST_IDX']").val(vdrCstIdx);
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorCounselEdit.do", "target":"_self", "method":"post"}).submit();
	};

	// 검색 엔터 이벤트
	$('#searchForm').find("input").not(".datepicker").keydown(function (e)
	{
		if(e.keyCode == 13)
		{
			search();
		}
	});

	// 검색 버튼 클릭 이벤트
	search = function(){
		var $searchForm = $("#searchForm");

		$searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorCounselList.do", "target":"_self", "method":"post"}).submit();
	};

	// 페이지 사이즈 변경 이벤트
	$(document).on("change", "select[name='pageSize']", function () {
		goPage(1);
	});

	// 페이지 이동
	goPage = function (cPage)
	{
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorCounselList.do", "target":"_self", "method":"post"}).submit();
	};

});
</script>

</body>
</html>
