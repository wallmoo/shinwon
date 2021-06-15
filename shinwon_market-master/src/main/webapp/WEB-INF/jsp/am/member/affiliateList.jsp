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

			<h2 class="title"><span>제휴사관리 목록</span></h2>

			<h3 class="title"><span>검색</span></h3>

			<form id="searchForm" name="searchForm" method="post" action="/am/member/affiliateList.do">
				<input type="hidden" name="pageSize" value="" />
				<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: auto;" />
						<col style="width: 10%;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th><span>키워드 검색</span></th>
							<td colspan="3">
								<select class="select" name="searchCocMstSearchType">
									<option value="ALL" <ui:select v="${commandMap.searchCocMstSearchType}" t="ALL" g="selected"/>>전체</option>
									<option value="NAME" <ui:select v="${commandMap.searchCocMstSearchType}" t="NAME" g="selected"/>>제휴사 명</option>
									<option value="DESC" <ui:select v="${commandMap.searchCocMstSearchType}" t="DESC" g="selected"/>>제휴사 설명</option>
								</select>
								<input type="text" name="searchCocMstTitle" class="text large" value="${commandMap.searchCocMstTitle }" placeholder="검색어 입력">
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>스페셜코드</span></th>
							<td>
								<input type="text" name="searchCocSpcCD" id="searchCocSpcCD" class="text large" value="${commandMap.searchCocSpcCD }" placeholder="스페셜코드 입력"/>
							</td>
							<th><span>사용여부</span></th>
							<td>
								<input type="radio" id="stateA" name="searchCocMstUseYn" class="radio" checked="checked" value="" <c:if test="${empty commandMap.searchCocMstUseYn }">checked="checked"</c:if>/>
								<label for="stateA">전체</label>
								<input type="radio"	id="stateB" name="searchCocMstUseYn" class="radio"  value="Y" <c:if test="${commandMap.searchCocMstUseYn eq 'Y' }">checked="checked"</c:if>/>
								<label for="stateB">사용</label>
								<input type="radio" id="stateC" name="searchCocMstUseYn" class="radio"  value="N" <c:if test="${commandMap.searchCocMstUseYn eq 'N' }">checked="checked"</c:if>/>
								<label for="stateC">미사용</label>
							</td>
						</tr>
					</tbody>
				</table><!-- // table -->
			</form>

			<div class="grid section-button-search"><!-- 검색 하단 버튼 -->
				<a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
				<a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
			</div>

			<form id="frm" name="frm">
			   <input type="hidden" name="COC_IDX" value="" />
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
				<input type="hidden" name="searchCocMstSearchType" value="<c:out value="${commandMap.searchCocMstSearchType }"/>" />
				<input type="hidden" name="searchCocMstTitle" value="<c:out value="${commandMap.searchCocMstTitle }"/>" />
				<input type="hidden" name="searchCocSpcCD" value="<c:out value="${commandMap.searchCocSpcCD }"/>" />
				<input type="hidden" name="searchCocMstUseYn" value="<c:out value="${commandMap.searchCocMstUseYn }"/>" />
				
				<h3 class="title"><span>목록</span></h3>

				<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
					<div class="col-1-2 text-left">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
						<span class="pages">
							(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
						</span>
					</div>

					<div class="col-1-2 text-right">
						<a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
						<a href="/am/member/affiliateForm.do" id="goForm" class="button small primary"><span>등록</span></a>
					</div>
				</div><!-- // 목록 상단 버튼 -->

				<table cellspacing="0" class="table-col table-b"><!-- table -->
					<colgroup>
						<col style="width: 70px;" />
						<col style="width: auto;" />
						<col style="width: 100px;" />
						<col style="width: auto;" />
						<col style="width: 70px;" />
						<col style="width: 100px;" />
						<col style="width: 70px;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>제휴사명</th>
							<th>스페셜코드</th>
							<th>제휴사설명</th>
							<th>회원수</th>
							<th>등록일</th>
							<th>사용설정</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="listNum" value="${paging.listNum}" />
						<c:forEach var="item" items="${list}" varStatus="i">
							<tr>
								<td><c:out value="${listNum}"/></td>
								<td class="al">
									<a href="#none" class="list-title" data-coc_idx="${item.COC_IDX}">
										<c:out value="${item.COC_NM}"/>
									</a>
								</td>
								<td><c:out value="${item.COC_SPC_CD}"/></td>
								<td class="al"><c:out value="${item.COC_DES}"/></td>
								<td>
									<a href="javascript:goMemberList('<c:out value="${item.COC_IDX}"/>')"><c:out value="${item.COC_COUNT}"/></a>
								</td>
								<td><ui:formatDate value="${item.COC_REG_DT }" pattern="yyyy.MM.dd"/></td>
								<td>
									<c:if test="${item != null and item.COC_USE_YN eq 'Y' }">
										사용
									</c:if>
									<c:if test="${item != null and item.COC_USE_YN eq 'N' }">
										미사용
									</c:if>
								</td>           
							</tr>
							<c:set var="listNum" value="${listNum-1}" />        	
						</c:forEach>
						
					</tbody>
				</table>

				<div class="section-pagination"><!-- section pagination -->
					<h4 class="sr-only">목록 페이징</h4>
					<div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
						<!-- <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a> -->
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
function goDetail(idx){
	var input = document.createElement("input");
	$(input).attr('name','COC_IDX');
	$(input).attr('type','hidden');
	$(input).val(idx);
	var form = document.createElement("form");
	$(form).attr('method','post');
	$(form).attr('action','/am/member/affiliateDetail.do');
	$(form).append($(input));
	$('body').append($(form));
	$(form).submit();
}
function goMemberList(idx){
	var input = document.createElement("input");
	$(input).attr('type','hidden');
	$(input).val(idx);
	var form = document.createElement("form");
	$(form).attr('method','post');
	$(form).attr('action','/am/member/affiliateDetail.do');
	$(form).append($(input));
	$('body').append($(form));
	$(form).submit();
}

$(function(){
	
	// 제목 a Tag 클릭 이벤트
	$(document).on("click",".list-title",function() {
		var $frm = $("#frm");
		$frm.find("input[name='COC_IDX']").val($(this).data("coc_idx"));
		$frm.attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/member/affiliateDetail.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
	});
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/affiliateList.do", "target":"_self", "method":"post"}).submit(); 
    });
	
	// 페이지 사이즈 변경 이벤트
	$(document).on("change", "select[name='pageSize']",function() {
		goPage(1);
	});

	// 페이지 이동
	goPage = function(cPage) {
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({	"action" : "<c:out value="${serverDomain}" />/am/member/affiliateList.do", "target" : "_self", "method" : "post" }).submit();
	};
	
    // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
		if ("${paging.totalRecordCount}" > 10000) {
			alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
			return;
		} else if ("${paging.totalRecordCount}" == 0) {
			alert("저장할 내역이 없습니다.");
			return;
		}
		var $frm = $("#searchForm");
		$frm.attr({
			"action" : "<c:out value="${serverDomain}" />/am/member/affiliateListExcelDownload.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
    });
    
});
//-->
</script>

</body>
</html>
