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

				<h2 class="title"><span>팝업관리</span></h2>

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
								<th><span>전시채널</span></th>

								<td>
									<input type="radio" id="searchPopMstChnGbn1" name="searchPopMstChnGbn" class="checkbox channelType" value="" <c:if test="${empty commandMap.searchPopMstChnGbn }">checked="checked"</c:if> />
									<label for="searchPopMstChnGbn1">전체</label>
									<input type="radio" id="searchPopMstChnGbn2" name="searchPopMstChnGbn" class="checkbox channelType" value="${Code.USER_ENV_TYPE_PC }" <c:if test="${commandMap.searchPopMstChnGbn eq Code.USER_ENV_TYPE_PC}">checked="checked"</c:if> />
									<label for="searchPopMstChnGbn2">PC</label>
									<input type="radio" id="searchPopMstChnGbn3" name="searchPopMstChnGbn" class="checkbox channelType" value="${Code.USER_ENV_TYPE_MOBILE }" <c:if test="${commandMap.searchPopMstChnGbn eq Code.USER_ENV_TYPE_MOBILE}">checked="checked"</c:if> />
									<label for="searchPopMstChnGbn3">MOBILE</label>
								</td>
								<th><span>제목</span></th>
								<td>
									<input type="text" class="text" style="width: 80%;" id="searchTxt" name="searchTxt" value="<c:out value="${commandMap.searchTxt }"/>" />
								</td>
								<th><span>사용상태</span></th>
								<td>
									<input type="radio" id="searchPopMstUseYn1" class="radio" name="searchPopMstUseYn" value="" <ui:select v="${commandMap.searchPopMstUseYn }" t="" g="checked"/> />
									<label for="searchPopMstUseYn1">전체</label>
									<input type="radio" id="searchPopMstUseYn2" class="radio" name="searchPopMstUseYn" value="Y" <ui:select v="${commandMap.searchPopMstUseYn }" t="Y" g="checked"/> />
									<label for="searchPopMstUseYn2">사용</label>
									<input type="radio" id="searchPopMstUseYn3" class="radio" name="searchPopMstUseYn" value="N" <ui:select v="${commandMap.searchPopMstUseYn }" t="N" g="checked"/> />
									<label for="searchPopMstUseYn3">미사용</label>
								</td>
							</tr>
							<tr>

								<th><span>종류</span></th>
								<td>
									<input type="radio" id="searchPopMstTyp1" class="radio" name="searchPopMstTyp" value="" <ui:select v="${commandMap.searchPopMstTyp }" t="" g="checked"/> />
									<label for="searchPopMstTyp1">전체</label>
									<input type="radio" id="searchPopMstTyp2" class="radio" name="searchPopMstTyp" value="P" <ui:select v="${commandMap.searchPopMstTyp }" t="P" g="checked"/> />
									<label for="searchPopMstTyp2">팝업</label>
									<input type="radio" id="searchPopMstTyp3" class="radio" name="searchPopMstTyp" value="L" <ui:select v="${commandMap.searchPopMstTyp }" t="L" g="checked"/> />
									<label for="searchPopMstTyp3">레이어</label>
								</td>
								<th><span>전시기간</span></th>
								<td colspan=3>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />"   readonly="readonly" data-target-end="#searchEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />"  readonly="readonly" data-target-start="#searchStartDate"/>
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
					<a href="javascript:search();" class="button small primary"><span>검색</span></a>
				</div>

				<form id="frm" name="frm">
					<input type="hidden" name="searchPopMstChnGbn" value="<c:out value="${commandMap.searchPopMstChnGbn }"/>"/>
					<input type="hidden" name="searchTxt" value="<c:out value="${commandMap.searchTxt }"/>" />
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
					<input type="hidden" name="searchPopMstUseYn" value="<c:out value="${commandMap.searchPopMstUseYn }"/>"/>
					<input type="hidden" name="searchPopMstTyp" value="<c:out value="${commandMap.searchPopMstTyp }"/>"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" id="POP_MST_IDX" name="POP_MST_IDX" value="" />
					<input type="hidden" name="POP_MST_CHN_GBN" value="" />
					<input type="hidden" name="USE_YN_LIST" id="USE_YN_LIST" value="" />
					<input type="hidden" name="searchPopMstTopYn" value="<c:out value="${commandMap.searchPopMstTopYn }"/>"/>

					<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages">
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>

						<div class="col-1-2 text-right">
							<a href="javascript:goFormPc();" class="button small primary"><span>PC팝업등록</span></a>
							<a href="javascript:goFormMobile();" class="button small primary"><span>MOBILE팝업등록</span></a>
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
							<col style="width: auto;" />
							<col style="width: auto;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>전시채널</th>
								<th>종류</th>
								<th>제목</th>
								<th>전시기간</th>
								<th>진행여부</th>
								<th>사용여부</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty list}">
								<c:set var="listNum" value="${paging.listNum}" />
								<jsp:useBean id="currrTime" class="java.util.Date" />
								<fmt:formatDate value="${currrTime}" var="currTime" pattern="yyyyMMdd" />
								<fmt:parseNumber var="curTime" type="number" value="${currTime}" />

								<c:forEach var="item" items="${list }" varStatus="status">
								<%-- <c:set var="startTime" value="<ui:formatDate value="${item.POP_MST_REG_DT }" pattern="yyyy.MM.dd"/>"/> --%>
								<tr>
									<td>
										<c:out value="${listNum }" />
										<input type="hidden" class="POP_MST_IDX" value="${item.POP_MST_IDX }"/>
									</td>
									<td><c:if test="${item.POP_MST_CHN_GBN eq Code.USER_ENV_TYPE_PC}" >PC</c:if>
										<c:if test="${item.POP_MST_CHN_GBN eq Code.USER_ENV_TYPE_MOBILE}" >MOBILE</c:if></td>
									<td><c:if test="${item.POP_MST_TYP eq 'P'}" >팝업</c:if>
										<c:if test="${item.POP_MST_TYP eq 'L'}" >레이어</c:if></td>
									<td class="left"><a href="javascript:goView('${item.POP_MST_CHN_GBN }', '<c:out value="${item.POP_MST_IDX }" />');"><c:out value="${item.POP_MST_TITLE }" /></a></td>
									<td><ui:formatDate value="${item.POP_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${item.POP_MST_ED_DT }" pattern="yyyy.MM.dd"/></td>
									<td>${item.BNR_PROGRESS}</td>
									<td>
										<select class="select">
											<option value="Y" <c:if test="${item.POP_MST_USE_YN eq 'Y' }">selected</c:if>>사용</option>
											<option value="N" <c:if test="${item.POP_MST_USE_YN eq 'N' }">selected</c:if>>미사용</option>
										</select>
										<!--<c:out value="${item.POP_MST_USE_YN eq 'Y' ? '사용' : '미사용' }"/>-->
									</td>
									<td><ui:formatDate value="${item.POP_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
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
					<div class="grid section-button-list btn_many">
						<div class="text-right">
							<a href="javascript:goRegist();" class="button small primary"><span>저장</span></a>
						</div>
					</div>
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

	// 검색
	search = function()
	{
		var $searchForm = $("#searchForm");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/popupList.do", "target":"_self", "method":"post"}).submit();
	};

	// 페이지 이동
	goPage = function (cPage)
	{
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/popupList.do", "target":"_self", "method":"post"}).submit();
	};

	// 검색어관리 상세페이지 이동
	goView = function ( env, popMstIdx)
	{
		var $frm = $("#frm");
		$frm.find("#POP_MST_IDX").val(popMstIdx);

		if( env == "P"){
			$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/popupEditPc.do", "target":"_self", "method":"post"}).submit();
		}else {
			$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/popupEditMobile.do", "target":"_self", "method":"post"}).submit();
		}
	};

	// 검색어관리 등록페이지 이동
	goFormPc = function ()
	{
		var $frm = $("#frm");
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/popupFormPc.do", "target":"_self", "method":"post"}).submit();
	};

	// 검색어관리 등록페이지 이동
	goFormMobile = function ()
	{
		var $frm = $("#frm");
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/popupFormMobile.do", "target":"_self", "method":"post"}).submit();
	};

	goRegist = function(){
		var $frm = $("#frm");
		var arrayObj = new Array();
		$(".POP_MST_IDX").each(function(){
			var obj = new Object();
			obj.POP_MST_IDX = $(this).val();
			obj.POP_MST_USE_YN = $(this).parent().parent().find(".select option:selected").val();
			arrayObj.push(obj);
		})
		
		$.ajax ({
			   async : false,
			   type : "POST",
			   url : "<c:out value="${serverDomain}" />/am/display/popupListStatusChangeAjax.do",
			   data : {"USE_YN_LIST":JSON.stringify(arrayObj)},
			   dataType : "json",
			   success : function (data) {
				   alert(data.message);
			   },
			   error : function () {
				   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
			   }
			});

	}
});
//-->
</script>

</body>
</html>
