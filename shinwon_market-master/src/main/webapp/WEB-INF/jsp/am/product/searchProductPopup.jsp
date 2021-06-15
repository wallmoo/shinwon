<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
		<div class="modal-inner">
			<h3 class="title"><span>상품검색</span></h3>
			<form id="searchForm" name="searchForm">   
				<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				<input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
				<input type="hidden" name="searchPrdYn" value="Y" />
				<input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
				<input type="hidden" id="searchStore" name="searchStore" value="<c:out value="${Code.ONLINE_SHOP_CODE }"/>" />
				<input type="hidden" id="searchType" name="searchType" value="<c:out value="${commandMap.searchType }"/>" />
				<input type="hidden" id="searchPrdType" name="searchPrdType" value="<c:out value="${commandMap.searchPrdType }"/>" />
				<input type="hidden" id="id_caller"  value="<c:out value="${commandMap.caller }"/>" />
				 <input type="hidden" name="searchYn" value="Y" />
				<table class="table-row table-a">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: 35%;" />
						<col style="width: 15%;" />
						<col style="width: 35%;" />
					</colgroup>
					<tbody>
						<tr>
							<th><label for="">상품코드</label></th>
							<td colspan="3">
								<textarea name="searchPrdMstCd" id="searchPrdMstCd" class="text xlarge" value="<c:out value="${commandMap.searchPrdMstCd }"/>"><c:out value="${commandMap.searchPrdMstCd }"/></textarea>
							</td>
						</tr>
						<tr>
							<th><label for="searchPrdMstNm">상품명</label></th>
							<td>
								<input type="text" class="text xlarge" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
							</td>
							<th><label for="">상태</th>
							<td>
								<select name="searchPrdMstSellState" id="searchPrdMstSellState" class="select xlarge">
									<option value="">전체</option>
									<option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_ING }" g="selected"/>>판매중</option>
									<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_STOP }" g="selected"/>>미판매</option>
									<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_TEMPOUT }" g="selected"/>>품절상품</option>
									<option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" g="selected"/>>일부품절상품</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="searchPrdCtgEnv">카테고리</label></th>
							<td colspan="3">
								<select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" >
									<option value="">1차 카테고리</option>
								</select>
								<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" >
									<option value="">2차 카테고리</option>
								</select>
								<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
									<option value="">3차 카테고리</option>
								</select>
							</td>
						</tr>
						<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
						<tr>
							<th><label for="">브랜드</label></th>
							<td><input type="text" name="searchPrdMstBrandNm" id="searchPrdMstBrandNm" value="<c:out value="${commandMap.searchPrdMstBrandNm }"/>" class="text xlarge"></td>
							<th><label for="">시즌</label></th>
							<td>
								<select class="select" name="searchPrdMstSeason" id="searchPrdMstSeason">
									<option value="">전체</option>
									<option value="${Code.COMMON_PRODUCT_SEASON_FW}" <ui:select v="${commandMap.searchPrdMstSeason}" t="${Code.COMMON_PRODUCT_SEASON_FW}" g="selected"/>>F/W</option>
									<option value="${Code.COMMON_PRODUCT_SEASON_SS}" <ui:select v="${commandMap.searchPrdMstSeason}" t="${Code.COMMON_PRODUCT_SEASON_SS}" g="selected"/>>S/S</option>
								</select>
							</td>
						</tr>
						</c:if>
						
						<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
						<tr>
							<th><label for="">시즌</label></th>
							<td colspan="3">
								<select class="select" name="searchPrdMstSeason" id="searchPrdMstSeason">
									<option value="">전체</option>
									<option value="${Code.COMMON_PRODUCT_SEASON_FW}" <ui:select v="${commandMap.searchPrdMstSeason}" t="${Code.COMMON_PRODUCT_SEASON_FW}" g="selected"/>>F/W</option>
									<option value="${Code.COMMON_PRODUCT_SEASON_SS}" <ui:select v="${commandMap.searchPrdMstSeason}" t="${Code.COMMON_PRODUCT_SEASON_SS}" g="selected"/>>S/S</option>
								</select>
							</td>
						</tr>
						</c:if>
						
						<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
						<tr>
							<th><label for="">입점업체</label></th>
							<td colspan="3">
								<input type="text" name="searchPrdMstVdrNm" id="searchPrdMstVdrNm" value="<c:out value="${commandMap.searchPrdMstVdrNm }"/>" class="text xlarge">
							</td>
						</tr>
						</c:if>
					</tbody>
				</table><!-- // table -->
			</form>
			
			<div class="grid section-button-search"><!-- 검색 하단 버튼 -->
				<a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
				<a href="javascript:search();" class="button small primary"><span>검색</span></a>
			</div><!-- // 검색 하단 버튼 -->
			
			<form id="frm" name="frm">
				
				<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
					<div class="col-1-2 text-left">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
						<span class="pages">
							(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
						</span>
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
							<th rowspan="2"><input type="checkbox" class="checkbox checkAll" id="allCheck" name="allCheck" /></th>
							<th rowspan="2">이미지</th>
							<th rowspan="2">상품품번</th>
							<th rowspan="2">상품명</th>
							<th rowspan="2">일반가</th>
							<th rowspan="2">판매가</th>
							<th>브랜드</th>
							<th rowspan="2">판매상태</th>
						</tr>
						<tr>
							<th>입점업체</th>
						</tr>
					</thead>
					<tbody id="tbodyProductList">
						<c:choose>
							<c:when test="${not empty list}">
								<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td rowspan="2">
										<input type="checkbox" class="checkbox checkRow" id="PRD_MST_CD_${item.PRD_MST_CD}" name="PRD_MST_CDs" value="${item.PRD_MST_CD}^${item.PRD_MST_NM}^${item.PRD_CTG_PATH}^${item.CMN_BRD_NM}^${item.PRD_MST_PRC}^${item.PRD_MST_SCH_PRC}^${item.PRD_MST_SEL_STATE}^${item.PRD_MST_CNL_PC_YN}^${item.PRD_MST_CNL_MB_YN}^${cdnDomain}${item.IMG_THUMBNAIL}^${item.PRD_MST_SEL_CNT}^${item.PRD_MST_DLV_FEE}^${item.PRD_MST_DPL_STATE}^${item.PRD_MST_REG_DT}^${cdnDomain}${item.PRD_IMAGE}^${item.PRD_NOW_DST_PRICE}^${item.PRD_MST_VDR_NM}^${item.PRD_IMAGE_ALT}^${item.BND_MST_BRAND_NM}^${item.PRD_MST_SALE_RATE}" />
										<input type="hidden" name="APPLY_IDXs" value="${item.PRD_MST_CD}" />
									</td>
									<td rowspan="2">
										<img name = "PRD_IMAGE" src="<c:out value="${cdnDomain}" />${item.PRD_IMAGE }" alt="">
									</td>
									<td rowspan="2">
										<a href="javascript:goView('<c:out value="${item.PRD_MST_CD }" />');" class="underline"  title="새 창 으로 열립니다.">
											<c:out value="${item.PRD_MST_CD }" />
										</a>
									</td>
									<td rowspan="2">
										<a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${item.PRD_MST_CD}&ADMIN=Y" target="_blank">
											<c:out value="${item.PRD_MST_NM }" />
										</a>
									</td>								
									<td rowspan="2"><fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" /></td>
									<td rowspan="2"><fmt:formatNumber value="${item.PRD_NOW_DST_PRICE }" groupingUsed="true" /></td>
									<td>
										${item.BND_MST_BRAND_NM}
									</td>
									<td rowspan="2">
										<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" ><span >판매중</span></c:if>
										<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_READY}" ><span >등록대기</span></c:if>
										<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span >품절상품</span></c:if>
										<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span >미판매</span></c:if>
									</td>
								</tr>
								<tr>
									<td>${item.PRD_MST_VDR_NM}</td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:if test="${commandMap.searchPrdYn eq 'Y'}">
								<tr>
									<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
								</c:if>
								<c:if test="${commandMap.searchPrdYn ne 'Y'}">
								<tr>
									<td colspan="8">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
								</c:if>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table><!-- // table -->
			
				<input type="hidden" name="searchErpPrdMstCd" value="<c:out value="${commandMap.searchErpPrdMstCd }"/>"/>
				<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
				<input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
				<input type="hidden" name="searchPrdCtgBrand" value="<c:out value="${commandMap.searchPrdCtgBrand }"/>" />
				<input type="hidden" name="searchPrdCtgEnv" value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" />	                
				<input type="hidden" name="searchPrdCtgDepth1" value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
				<input type="hidden" name="searchPrdCtgDepth2" value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
				<input type="hidden" name="searchPrdCtgDepth3" value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
				<input type="hidden" name="searchPrdCtgDepth4" value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" />
				<input type="hidden" name="searchPrdMstChannelType" value="<c:out value="${commandMap.searchPrdMstChannelType }"/>" />
				<input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
				<input type="hidden" name="searchPlanYear" value="<c:out value="${commandMap.searchPlanYear }"/>" />
				<input type="hidden" name="searchProductLine" value="<c:out value="${commandMap.searchProductLine }"/>" />
				<input type="hidden" name="searchProductSesn" value="<c:out value="${commandMap.searchProductSesn }"/>" />
				<input type="hidden" name="searchKind" value="<c:out value="${commandMap.searchKind }"/>" />
				<input type="hidden" name="searchTextStart" value="<c:out value="${commandMap.searchTextStart }"/>" />
				<input type="hidden" name="searchTextEnd" value="<c:out value="${commandMap.searchTextEnd }"/>" />
				<input type="hidden" name="searchStore" value="<c:out value="${commandMap.searchStore }"/>" />
				<input type="hidden" name="searchStoreName" value="<c:out value="${commandMap.searchStoreName }"/>" />
				<input type="hidden" name="searchPrdSsonCd" value="<c:out value="${commandMap.searchPrdSsonCd }"/>" />	                	                
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
				<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
				<input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
				<input type="hidden" name="searchPrdYn" value="<c:out value="${commandMap.searchPrdYn }"/>" />
				<input type="hidden" id="searchPrdType" name="searchPrdType" value="<c:out value="${commandMap.searchPrdType }"/>" />
				<input type="hidden" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
				
				<input type="hidden" id="searchPrdMstBrandNm" name="searchPrdMstBrandNm" value="<c:out value="${commandMap.searchPrdMstBrandNm }"/>" />
				<input type="hidden" id="searchPrdMstSeason" name="searchPrdMstSeason" value="<c:out value="${commandMap.searchPrdMstSeason }"/>" />
				<input type="hidden" id="searchPrdMstVdrNm" name="searchPrdMstVdrNm" value="<c:out value="${commandMap.searchPrdMstVdrNm }"/>" />
			
			</form>

			<div class="section-pagination"><!-- section pagination -->
				<h4 class="sr-only">목록 페이징</h4>
				<div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
					<ui:paging paging="${paging }" jsFunction="goPage" />
				</div>
			</div><!-- // section pagination -->
			
			<div class="grid section-button-search"><!-- section button -->
				<button type="button" id="productApply" class="button small primary"><span>선택</span></button>
				<button type="button" id="closePopup" class="button small" onclick="self.close()"><span>취소</span></button>
			</div>
		</div>
	</div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
window.onload = function () {
	  opener.SearchProductPop = this;  //자식 창이 뜰때 opener에 popup이라는 변수에 this를 지정해주며, 부모창에서 'popup'으로 자식창의 함수를 호출함.
	 }

$(document).ready(function () 
{	
	//체크박스 전체 선택
	$.checkBoxSelect("checkAll", "checkRow");

	// 카테고리 설정
	if( $("#frm").find("input[name='searchPrdCtgEnv']").val() != ""){
		getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
	}
	if( $("#frm").find("input[name='searchPrdCtgIdx']").val() == "")
	{
//    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>");
	}
	else
	{
		getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
		getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
		getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
		getCategoryList("searchPrdCtgDepth4", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
		getCategoryList("searchPrdCtgDepth5", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${commandMap.searchPrdCtgDepth5}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
	}

	// 카테고리 변경 이벤트
	$(document).on("change", "#searchPrdCtgEnv", function () 
	{
		getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth4", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth5", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${commandMap.searchPrdCtgDepth5}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
	});
	$(document).on("change", "#searchPrdCtgDepth1", function () 
	{
		getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
	});
	$(document).on("change", "#searchPrdCtgDepth2", function () 
	{
		getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
	});
	$(document).on("change", "#searchPrdCtgDepth3", function () 
	{
		getCategoryList("searchPrdCtgDepth4", $("#searchPrdCtgDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
	});
	$(document).on("change", "#searchPrdCtgDepth4", function () 
	{
		getCategoryList("searchPrdCtgDepth5", $("#searchPrdCtgDepth4 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
	});
	
	// 검색 엔터 이벤트 
	$('#searchForm').find("input").not(".datepicker").keydown(function (e) 
	{
		if(e.keyCode == 13)
		{
			search();
		}
	});
	
	// 검색폼 초기화
	searchClear = function(formId){
		
	    $("#"+formId).find("input[type=text]").val("");
	    $("#"+formId).find("select").find("option:eq(0)").prop("selected", true);
	    $("#"+formId).find(":checkbox").prop("checked", false);
	    $("#"+formId).find("textarea").val("");
	    
	    var tmpRadioNm = "";
	    
	    $.each($("#"+formId).find(":radio"),function(idx,item){
	        if(tmpRadioNm != $(item).attr("name")){
	            $("#"+formId).find("input[name=" + $(item).attr("name") + "]:eq(0)").prop("checked", true);
	        }
	        tmpRadioNm = $(item).attr("name");
	    });
	}
	
	// 검색
	search = function() 
	{
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
		$searchForm.find("#searchPrdCtgIdx").val(searchCategoryIdx);
		
		$("#searchPrdMstChannelType").attr("disabled",false);
		$("#searchPrdCtgEnv").attr("disabled",false);
		
		//$searchForm.find("input[name='cPage']").val("1");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductPopup.do?caller=" + $('#id_caller').val(), "target":"_self", "method":"post"}).submit(); 
	};
	
	// 페이지 이동
	goPage = function (cPage) 
	{
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchProductPopup.do", "target":"_self", "method":"post"}).submit();
	};
	
	// 상품 상세페이지 이동 (새창)
	goView = function (prdMstCd)
	{
		var $frm = $("#frm");
		$frm.find("input[name='PRD_MST_CD']").val(prdMstCd);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
	};
	
	// 상세검색 보기/접기 
	$("div[name=searchDetail]").each( function(){
		$(this).css("display", "${commandMap.searchDetailY }" );
		$("a[id=toggleSearchDetail]").children("span").html("${commandMap.searchDetailY }"=="none"?"상세검색 보기":"상세검색 접기");
	});
	
	$(document).on("click", "a[id=toggleSearchDetail]", function ()
	{
		
		var display = $("#searchForm #searchDetailY").val();
		display = ("none"==display)?"":"none";
		
		$("div[name=searchDetail]").each( function(){
			$(this).css("display", display );
		});
		
		if( display == "none"){
			$("#searchPrdMstChannelType1").prop("checked",  true);
			$("#searchPrdMstSellState1").prop("checked", true);
			$("#searchPrdIcn1").attr("checked", false);
			$("input:checkbox[name=searchPrdIcn]").attr("checked", false);	
			$("#searchPrdMstDvlpYear").val("");
			$("#searchPrdMstGdsSctnCd").find("option:first").attr("selected", "selected"); 
			$("#searchPrdSsonCd").val("");
		}
		$("input[name=searchDetailY]").val(display);
		
		$(this).children("span").html(display=="none"?"상세검색 보기":"상세검색 접기");
	});
	
	
	
	// 선택 클릭 이벤트
	$(document).on("click", "#productApply", function () 
	{
		var caller = $('#id_caller').val();
	
		var $checkObj = $.find("#tbodyProductList input[name='PRD_MST_CDs']:checked");
		var searchType = $("#searchType").val();
		if( $checkObj.length == 0 ){
			alert("상품을 선택하여 주십시오.");
			return;
		}
		
		if(searchType =="D"){
			if( $checkObj.length > 1 ){
				alert("상품을 1개만 선택하여 주십시오.");
				return;  
			}
		}
			
		var params = new Array();
		var obj;
		var myArray;
		if($checkObj.length<=0){
			alert('선택된 상품이 없습니다.')
			return;
		}
		$.each($checkObj, function(index,item){
			
			myArray = $(this).val().split('^');
			obj = new Object();
			obj.PRD_MST_CD 				= myArray[0];	//상품코드
			obj.PRD_MST_NM 			= myArray[1];		//상품명
			obj.PRD_CTG_PATH 			= myArray[2];	//뎁스 카테고리명 나열
			obj.CMN_BRD_NM 				= myArray[3];	//브랜드명
			obj.PRD_MST_PRC 	= myArray[4];			//상품가격
			obj.PRD_MST_SCH_PRC 		= myArray[5];	//검색가격
			
			obj.PRD_MST_SEL_STATE_CODE = myArray[6];	//판매상태
			if( myArray[6] =="<c:out value='${Code.PRODUCT_SELL_STATE_ING}'/>" ){
				obj.PRD_MST_SEL_STATE 		= "판매중";
			}else if( myArray[6] =="<c:out value='${Code.PRODUCT_SELL_STATE_TEMPOUT}'/>" ){
				obj.PRD_MST_SEL_STATE 		= "품절상품";
			}else{
				obj.PRD_MST_SEL_STATE 		="미판매";
			}
			
			obj.PRD_MST_CNL_PC_YN  = myArray[7];		//PC채널 사용유무
			obj.PRD_MST_CNL_MB_YN  = myArray[8];		//MOBILE채널 사용유무

			
			// 신규추가
			obj.PRD_IMG_THUM_URL = myArray[9];			//썸네일 이미지
			obj.SEARCH_THPE = searchType;				//상품검색타입
			obj.PRD_MST_SEL_CNT = myArray[10];			//상품판매수량
			obj.PRD_MST_DLV_FEE = myArray[11];			//배송비
			obj.PRD_MST_DPL_STATE = myArray[12];		//전시여부
			obj.PRD_MST_REG_DT = myArray[13];
			obj.PRD_IMAGE = myArray[14];
			obj.PRD_NOW_DST_PRICE = myArray[15];		//판매가
			obj.PRD_MST_VDR_NM = myArray[16];			//입점업체명
			obj.PRD_IMAGE_ALT = myArray[17];			//대체텍스트
			obj.BND_MST_BRAND_NM = myArray[18];			//브랜드명
			obj.PRD_MST_SALE_RATE = myArray[19];		//할인율
			params.push(obj); //만들어진  object를 배열에 추가
		});
		
		
		window.opener.fnResultProduct(params,caller);   	
		self.close();
	});
	
	alertMsg = function (msg){
		alert(msg);
	}
	
	$(document).on("click","#closePopup",function()
	{
		self.close();
	});    
		
});
</script>
</body>
</html>
