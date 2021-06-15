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

				<h2 class="title"><span>권한관리</span></h2>

				<div class="section-title"><!-- section-title -->
					<h3 class="title"><span>목록</span></h3>
				</div><!-- // section-title -->
				
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				
					<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: 40%;" />
							<col style="width: 10%;" />
							<col style="width: 40%;" />
						</colgroup>
						<tbody>
							<tr><!-- row -->
								<th><span>권한명</span></th>
								<td>
									<input type="text" class="text logon" name="searchAutMstNm" id="searchAutMstNm" value="<c:out value="${commandMap.searchAutMstNm }"/>"/>
								</td>
								<th><span>사용설정</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" id="stateA" name="searchAutMstState" class="radio" <c:if test="${empty commandMap.searchAutMstState }">checked="checked"</c:if> value=""/>
											<label for="stateA">전체</label>
										</li>
										<li>
											<input type="radio" id="stateB" name="searchAutMstState" class="radio" <c:if test="${commandMap.searchAutMstState eq 'Y' }">checked="checked"</c:if> value="Y"/>
											<label for="stateB">사용</label>
										</li>
										<li>
											<input type="radio" id="stateC" name="searchAutMstState" class="radio" <c:if test="${commandMap.searchAutMstState eq 'N' }">checked="checked"</c:if> value="N"/>
											<label for="stateC">미사용</label>
										</li>
									</ul>	
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
					<input type="hidden" name="AUT_MST_IDX" value="" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="searchAutMstNm" value="<c:out value="${commandMap.searchAutMstNm }"/>"/>
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
					<input type="hidden" name="searchAutMstState" value="<c:out value="${commandMap.searchAutMstState }"/>"/>
				
					<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">  
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages">
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>
						<%--슈퍼관리자만 권한등록을 할 수 있음 --%>
						<c:if test="${sessionAdmin.AUT_MST_IDX eq 1 }">
							<div class="col-1-2 text-right">
								<a href="#none;" id="goForm" class="button small primary"><span>등록</span></a>
							</div>
						</c:if>
					</div><!-- // 목록 상단 버튼 -->
				</form>

				<table cellspacing="0" class="table-col table-b"><!-- table -->
				<colgroup>
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>권한명</th>
						<th>등록일</th>
						<th>사용설정</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:set var="listNum" value="${paging.listNum}" />
							<c:forEach var="row" items="${list }" varStatus="i">
								<tr>
									<td><c:out value="${listNum }"/></td>
									<td class="al">
										<c:choose>
											<c:when test="${sessionAdmin.AUT_MST_IDX eq 1 }">
												<a href="#none" class="list-title" data-aut_mst_idx="<c:out value="${row.AUT_MST_IDX }"/>">
													<c:out value="${row.AUT_MST_NM }"/>
												</a>
											</c:when>
											<c:otherwise>
												<c:out value="${row.AUT_MST_NM }"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td><ui:formatDate value="${row.AUT_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
									<td><c:out value="${row.AUT_MST_STATE eq 'Y'?'사용':'미사용' }"/></td>
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
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/authManagerForm.do", "target":"_self", "method":"post"}).submit();
	});
	
	// 제목 a Tag 클릭 이벤트
	$(document).on("click", ".list-title", function () {
		var $frm = $("#frm");
		$frm.find("input[name='AUT_MST_IDX']").val($(this).data("aut_mst_idx"));
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/authManagerEdit.do", "target":"_self", "method":"post"}).submit();
	});
	
	// 검색 엔터 이벤트 
	$(document).on("keydown", "#searchAutMstNm", function (e) {
		if(e.keyCode == 13){
			$("#search").trigger("click");
			return false;
		}
	});
	
	// 검색 버튼 클릭 이벤트
	$(document).on("click", "#search", function () {
		var $searchForm = $("#searchForm"); 
		
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/authManagerList.do", "target":"_self", "method":"post"}).submit(); 
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
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/authManagerList.do", "target":"_self", "method":"post"}).submit();
	};
});
//-->
</script>

</body>
</html>
