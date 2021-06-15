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

				<h2 class="title"><span>매장관리</span></h2>

				<h3 class="title"><span>목록</span></h3>

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
								<th><span>키워드검색</span></th>

								<td colspan="3">
									<select class="select" name="searchKeywordType">
										<option value="">전체</option>
										<option value="storeNm" <c:if test="${commandMap.searchKeywordType eq 'storeNm'}">selected="selected"</c:if>>매장명</option>
										<option value="storeTel3" <c:if test="${commandMap.searchKeywordType eq 'storeTel3'}">selected="selected"</c:if>>전화번호 뒷자리</option>
									</select>
									<input type="text" class="text" style="width: 80%;" id="searchKeyword" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" />
								</td>
							</tr>
							<tr>
								<th><span>지역 </span></th>
								<td>
									<select class="select" name="searchAreaCode" id="searchAreaCode">
										<option value="">전체</option>
										<c:if test="${not empty codes.AREA_CD }">
											<c:forEach var="row" items="${codes.AREA_CD }" varStatus="i">
												<option value="<c:out value="${row.CMN_COM_IDX }"/>"<ui:select v="${commandMap.searchAreaCode}" t="${row.CMN_COM_IDX }" g="selected"/>><c:out value="${row.CMN_COM_NM }" /></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
								
								<th><span>사용설정 </span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" id="staet1" class="radio" name="searchStoreUseYN" value="" <ui:select v="${commandMap.searchStoreUseYN }" t="" g="checked"/> />
											<label for="staet1">전체</label>
										</li>
										<li>
											<input type="radio" id="staet2" class="radio" name="searchStoreUseYN" value="Y" <ui:select v="${commandMap.searchStoreUseYN }" t="Y" g="checked"/> />
											<label for="staet2">사용</label>
										</li>
										<li>
											<input type="radio" id="staet3" class="radio" name="searchStoreUseYN" value="N" <ui:select v="${commandMap.searchStoreUseYN }" t="N" g="checked"/> />
											<label for="staet3">미사용</label>
										</li>
									</ul>
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
					<input type="hidden" name="searchAreaCode" value="<c:out value="${commandMap.searchAreaCode }"/>"/>
					<input type="hidden" name="searchKeywordType" value="<c:out value="${commandMap.searchKeywordType }"/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
					<input type="hidden" name="searchStoreUseYN" value="<c:out value="${commandMap.searchStoreUseYN }"/>"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" id="SEL_SHP_IDX" name="SEL_SHP_IDX" value="" />

					<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages">
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>

						<div class="col-1-2 text-right">
							<a href="javascript:goDelete();" class="button small"><span>매장삭제</span></a>
							<a href="javascript:goForm();" class="button small primary"><span>매장등록</span></a>
						</div>
					</div><!-- // 목록 상단 버튼 -->

					<form id="frm" name="frm">
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
							<col style="width: auto;" />
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" class="checkbox checkAll" /></th>
								<th>번호</th>
								<th>지역</th>
								<th>매장명</th>
								<th>매장운영시간</th>
								<th>전화번호</th>
								<th>사용설정</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty list }">
									<c:set var="listNum" value="${paging.listNum}" />
									<c:forEach var="row" items="${list }" varStatus="i">
										<tr>
											<td class="checkInp"><input type="checkbox" class="checkbox checkRow" value="<c:out value="${row.SEL_SHP_IDX }"/>"/></td>
											<td><c:out value="${listNum }"/></td>
											<td><c:out value="${row.SEL_SHP_STATE }"/></td>
											<td>
												<a href="#" class="list-title" data-sel_shp_idx="${row.SEL_SHP_IDX }">
													<c:out value="${row.SEL_SHP_NM }"/>
												</a>
											</td>
											<td>
												<c:out value="${row.SHP_ST_HH }"/>:<c:out value="${row.SHP_ST_MM }"/> ~
	                            				<c:out value="${row.SHP_ED_HH }"/>:<c:out value="${row.SHP_ED_MM }"/>
											</td>
											<td><c:out value="${row.SEL_SHP_TEL1 }"/>-<c:out value="${row.SEL_SHP_TEL2 }"/>-<c:out value="${row.SEL_SHP_TEL3 }"/></td>
											<td>
												<c:if test="${row.SEL_SHP_USE_YN eq 'Y'}">
													사용
												</c:if>
												<c:if test="${row.SEL_SHP_USE_YN eq 'N'}">
													미사용
												</c:if>
											</td>
										</tr>
										<c:set var="listNum" value="${listNum-1}" />
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
					</form>
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
	
	$(document).on(	"click",".list-title",function() {
		var $frm = $("#frm");
		$frm.find("input[name='SEL_SHP_IDX']").val($(this).data("sel_shp_idx"));
		$frm.attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/display/sellerStoreEdit.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
	});
	
	// 검색
	search = function()
	{
		var $searchForm = $("#searchForm");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/sellerStoreList.do", "target":"_self", "method":"post"}).submit();
	};

	// 페이지 이동
	goPage = function (cPage)
	{
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/sellerStoreList.do", "target":"_self", "method":"post"}).submit();
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
	goForm = function ()
	{
		var $frm = $("#frm");
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/sellerStoreForm.do", "target":"_self", "method":"post"}).submit();
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
	
	goDelete = function(){
		//SELLER_LIST
		 var $frm = $('#frm');
		 var num = 0 ;
		 var checkList = $frm.find('input[type=checkbox].checkRow');
		 for(var i=0;i<checkList.length;i++){
			 var dom = $(checkList[i]);
			 if(dom.is(":checked")){
				 num = num *1 +1 ;
			 }
		 }
		 
		 if ( num == 0 ){
			 alert( '1개 이상의 매장을 선택하세요' );
			 return ;
		 }		 
		 
		if (confirm("해당 매장정보를 삭제하시겠습니까?")) {
			
			 var $frm = $('#frm');
			 var num = 0 ;
			 var checkList = $frm.find('input[type=checkbox].checkRow');
			 for(var i=0;i<checkList.length;i++){
				 var dom = $(checkList[i]);
				 if(dom.is(":checked")){
					 $frm.append('<input type="hidden" name="targetSellerList" value="'+dom.val()+'">');
				 }
			 }

			 $frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/sellerStoreDelete.do", "target":"_self", "method":"post"}).submit();				 

		} 
	};
});
//-->
</script>

</body>
</html>
