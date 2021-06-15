<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
.table-col.table-b .select{width:inherit;}
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

				<h2 class="title"><span>입점업체 승인요청</span></h2>

				<div class="section-title"><!-- section-title -->
					<h3 class="title"><span>목록</span></h3>
				</div><!-- // section-title -->
                
                <form id="detailForm" name="detailForm">
                    <input type="hidden" name="PRD_MST_CD">
                </form>
                    
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
					<input type="hidden" name="searchYn" value="Y" />
					<input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />

					<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 24%;">
							<col style="width: 10%;">
							<col style="width: 23%;">
							<col style="width: 10%;">
							<col style="width: 23%;">
						</colgroup>
						<tbody>
							<tr><!-- row -->
								<th><span>상품코드</span></th>
								<td>
									<input type="text" class="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
								</td>
								<th><span>상품명</span></th>
								<td>
									<input type="text" class="text" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
								</td>
								<th><span>입점업체</span></th>
								<td>
									<select class="select" id="searchPrdMstVdrIdx" name="searchPrdMstVdrIdx" >
										<option value="">전체</option>
										<c:if test="${not empty vendorList }">
											<c:forEach var="authRow" items="${vendorList }" varStatus="i">
												<option value="<c:out value="${authRow.VDR_MST_IDX }"/>" <ui:select v="${commandMap.searchPrdMstVdrIdx}" t="${authRow.VDR_MST_IDX }" g="selected"/> ><c:out value="${authRow.VDR_MST_NM }"/></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>등록일</span></th>
								<td>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="searchStartDate" id="searchStartDate" class="text small" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="searchEndDate" id="searchEndDate" class="text small" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
								</td>
								<th><span>상태</span></th>
								<td>
									<select class="select" name="searchPrdMstSellState" id="searchPrdMstSellState">
										<option value="">전체</opton>
										<option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_ING }" g="selected"/>>판매중</option>
										<option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" g="selected"/> >일시품절</option>
										<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_TEMPOUT }" g="selected"/> >품절상품</option>
										<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_STOP }" g="selected"/>>미판매</option>
									</select>
								</td>
								<th><span>진열</span></th>
								<td>
									<select class="select" name="searchPrdMstDplState" id="searchPrdMstDplState">
										<option value="">전체</opton>
										<option value="Y" <ui:select v="${commandMap.searchPrdMstDplState}" t="Y" g="selected"/>>YES</option>
										<option value="N" <ui:select v="${commandMap.searchPrdMstDplState}" t="N" g="selected"/>>NO</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>승인</span></th>
								<td>
									<select class="select" name="searchPrdMstApvState" id="searchPrdMstApvState">
										<option value="all">전체</option>
										<option value="D"
											<ui:select v="${commandMap.searchPrdMstApvState}" t="D" g="selected"/>>대기</option>
										<option value="A"
											<ui:select v="${commandMap.searchPrdMstApvState}" t="A" g="selected"/>>승인</option>
										<option value="C"
											<ui:select v="${commandMap.searchPrdMstApvState}" t="C" g="selected"/>>보류</option>
									</select>
								</td>
								<th><span>MD</span></th>
								<td>
									<select class="select" name="searchPrdMstMdId" id="searchPrdMstMdId">
										<option value="">전체</opton>
										<c:if test="${not empty basicMdList }">
											<c:forEach var="authRow" items="${basicMdList }" varStatus="i">
												<option value="<c:out value="${authRow.VDR_MST_IDX }"/>" <ui:select v="${commandMap.searchPrdMstMdId}" t="${authRow.VDR_MST_IDX }" g="selected"/> ><c:out value="${authRow.VDR_MST_MD_ID }"/></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
								<th><span>브랜드</span></th>
								<td>
									<select class="select" name="searchPrdMstBrand" id="searchPrdMstBrand">
										<option value="">전체</opton>
										<c:choose>
											<c:when test="${not empty brandList}">
												<c:forEach var="brandList" items="${brandList }" varStatus="status">
													<option value="<c:out value="${brandList.VDR_MST_IDX }" />" <ui:select v="${commandMap.searchPrdMstBrand }" t="${brandList.VDR_MST_IDX }" g="selected"/>><c:out value="${brandList.BND_MST_BRAND_NM }" /></option>
												</c:forEach>
											</c:when>
										</c:choose>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>카테고리</span></th>
								<td colspan=5>
									<select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" >
										<option value="">1차카테고리</option>
									</select>
									<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" >
										<option value="">2차카테고리</option>
									</select>
									<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
										<option value="">3차카테고리</option>
									</select>
									<small class="desc"> * 카테고리 검색은 업체구분를 먼저 선택해주세요.</small>
								</td>
							</tr>
						</tbody>
					</table><!-- // table -->
				</form>

				<div class="grid section-button-search"><!-- 검색 하단 버튼 -->
					<a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
					<a href="javascript:search();" class="button small primary"><span>검색</span></a>
				</div><!-- // 검색 하단 버튼 -->

				<form id="frm" name="frm">
					<input type="hidden" name="searchErpPrdMstCd" value="<c:out value="${commandMap.searchErpPrdMstCd }"/>"/>
					<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
					<input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
					<input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
					<input type="hidden" name="searchPrdCtgEnv" value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" />
					<input type="hidden" name="searchPrdCtgDepth1" value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
					<input type="hidden" name="searchPrdCtgDepth2" value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
					<input type="hidden" name="searchPrdCtgDepth3" value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
					<input type="hidden" name="searchPrdCtgDepth4" value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" />
					<input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
					<input type="hidden" name="searchPrdMstDplState" value="<c:out value="${commandMap.searchPrdMstDplState }"/>"/>
					<input type="hidden" name="searchPrdMstApvState" value="<c:out value="${commandMap.searchPrdMstApvState }"/>" />
					<input type="hidden" name="searchPrdMstMdId" value="<c:out value="${commandMap.searchPrdMstMdId }"/>" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
					<input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
					<input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />

					<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
								<span class="pages">
									(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
								</span>
								<a href="#none" id="productApvState" class="button small"><span>승인</span></a>
								<a href="#none" id="productHoldState" class="button small"><span>보류</span></a>
								<a href="#none" id="productModify" class="button small"><span>수정</span></a>
								<a href="#none" id="productDelete" class="button small"><span>삭제</span></a>
						</div>
						<div class="col-1-2 text-right">
							<a href="javascript:goForm();" class="button small primary"><span>상품 일괄수정</span></a>
							<a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
						</div>
					</div><!-- // 목록 상단 버튼 -->

					<table cellspacing="0" class="table-col table-b">
						<!-- table -->
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
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2"><input type="checkbox"
									class="checkbox checkAll" /></th>
								<th rowspan="2">NO</th>
								<th rowspan="2">이미지</th>
								<th rowspan="2">상품명<br />(상품코드)
								</th>
								<th colspan="2">판매가</th>
								<th colspan=2>배송비</th>
								<th>네이버쇼핑</th>
								<th rowspan="2">할인율</th>
								<!-- <th rowspan="2">임직원 할인</th>
								<th rowspan="2">제휴사 할인</th> -->
								<th>브랜드</th>
								<th rowspan="2">상품유형</th>
								<th rowspan="2">등록일</th>
							</tr>
							<tr>
								<th style="border-left: 1px #e9e9e9 solid;">진열</th>
								<th>판매</th>
								<th>승인</th>
								<th>판매가능수량</th>
								<th>다음 쇼핑노하우</th>
								<th>입점업체</th>
							</tr>
						</thead>
						<tbody id="prdList">
							<c:choose>
							<c:when test="${not empty list}">
								<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td rowspan="2"><input type="checkbox" name="PRD_MST_CDs" value="<c:out value="${item.PRD_MST_CD }" />" class="checkbox checkRow" data-cd="${item.PRD_MST_CD}"/></td>
									<td rowspan="2">
										<div class="tbl_line">
											${listNum}
										</div>
										<div class="tbl_line">
											<a href="javascript:goView('${item.PRD_MST_CD}');">[수정]</a>
										</div>
									</td>
									<td rowspan="2"><span class="thumbnail_img"><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${item.PRD_IMAGE }"></span></td>
									<td rowspan="2">
										<div class="tbl_line">
											<input type="text" class="text xlarge" name="PRD_MST_NM_${item.PRD_MST_CD}" value="${item.PRD_MST_NM }">
										</div>
										<div class="tbl_line">
											<a href="javascript:goDetail('${item.PRD_MST_CD }');">(${item.PRD_MST_CD})</a>
											<input type="hidden" name="PRD_MST_CD" value="${item.PRD_MST_CD }"/>
										</div>
									</td>
									<td colspan="2"><input type="text" name="PRD_MST_PRC_${item.PRD_MST_CD }" class="text small" value="<fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" />" readonly></td>
									<td colspan="2">
										<input type="number" class="select small" name="PRD_MST_DLV_FEE_${item.PRD_MST_CD }" value="${item.PRD_MST_DLV_FEE }">
									</td>
									<td>
										<select class="select small" name="NAVER_USE_${item.PRD_MST_CD }">
											<option value="Y" <c:if test="${item.NAVER_USE eq 'YES'}">selected</c:if>>YES</option>
											<option value="N" <c:if test="${item.NAVER_USE eq 'NO'}">selected</c:if>>NO</option>
										</select>
									</td>
									<td rowspan="2">
										<div class="tbl_line">
											<select class="select small" name="PRD_MST_UNT_${item.PRD_MST_CD }">
												<option value="R" <c:if test="${item.PRD_MST_UNT_NM eq '정율'}">selected</c:if>>정율</option>
												<option value="S" <c:if test="${item.PRD_MST_UNT_NM eq '정액'}">selected</c:if>>정액</option>
											</select>
										</div>
										<div class="tbl_line">
											<input type="number" class="text small" name="PRD_MST_SALE_RATE_${item.PRD_MST_CD }" value="${item.PRD_MST_SALE_RATE}">
										</div>
									</td>
									<%-- <td rowspan="2">
										<select class="select small" name="PRD_MST_EMP_USE_YN">
											<option value="Y" <c:if test="${item.PRD_MST_EMP_USE_YN eq 'Y'}">selected</c:if>>YES</option>
											<option value="N" <c:if test="${item.PRD_MST_EMP_USE_YN eq 'N'}">selected</c:if>>NO</option>
										</select>
									</td>
									<td rowspan="2">
										<select class="select small" name="PRD_MST_PRT_USE_YN">
											<option value="Y" <c:if test="${item.PRD_MST_PRT_USE_YN eq 'Y'}">selected</c:if>>YES</option>
											<option value="N" <c:if test="${item.PRD_MST_PRT_USE_YN eq 'N'}">selected</c:if>>NO</option>
										</select>
									</td> --%>
									<td>${item.BND_MST_BRAND_NM}</td>
									<td rowspan="2">${item.PRD_MST_TYPE_NM }</td>
									<td rowspan="2">${item.PRD_MST_REG_DT }</td>
								</tr>
								<tr>
									<td style="border-left:1px solid #e9e9e9;">
										<select class="select small" name="PRD_MST_DPL_STATE_${item.PRD_MST_CD }">
											<option value="Y" <c:if test="${item.PRD_MST_DPL_STATE eq 'Y'}">selected</c:if>>YES</option>
											<option value="N" <c:if test="${item.PRD_MST_DPL_STATE eq 'N'}">selected</c:if>>NO</option>
										</select>
									</td>
									<td>
										<select class="select small" name="PRD_MST_SEL_STATE_${item.PRD_MST_CD }">
											<option value="I" <c:if test="${item.PRD_MST_SEL_STATE eq 'I'}">selected</c:if>>판매중</option>
											<option value="T" <c:if test="${item.PRD_MST_SEL_STATE eq 'T'}">selected</c:if>>품절</option>
											<option value="S" <c:if test="${item.PRD_MST_SEL_STATE eq 'S'}">selected</c:if>>미판매</option>
										</select>
									</td>
									<td>
										<select class="select small" name="PRD_MST_APV_STATE_${item.PRD_MST_CD }" id="PRD_MST_APV_STATE_${item.PRD_MST_CD}" data-prd_mst_apv_state="${item.PRD_MST_APV_STATE}">
											<option value="A" <c:if test="${item.PRD_MST_APV_STATE eq 'A'}">selected</c:if>>승인</option>
											<option value="D" <c:if test="${item.PRD_MST_APV_STATE eq 'D'}">selected</c:if>>대기</option>
											<option value="C" <c:if test="${item.PRD_MST_APV_STATE eq 'C'}">selected</c:if>>보류</option>
										</select>
									</td>
									<td><input type="text" class="text small" name="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" value="${item.PRD_MST_SEL_CNT }" readonly></td>
									<td>
										<select class="select small" name="DAUM_USE_${item.PRD_MST_CD }">
											<option value="Y" <c:if test="${item.DAUM_USE eq 'YES'}">selected</c:if>>YES</option>
											<option value="N" <c:if test="${item.DAUM_USE eq 'NO'}">selected</c:if>>NO</option>
										</select>
									</td>
									<td>${item.PRD_MST_VDR_NM}</td>
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
	//체크박스 전체 선택
	$.checkBoxSelect("checkAll", "checkRow");

	// 카테고리 설정
	if( $("#frm").find("input[name='searchPrdCtgEnv']").val() != ""){
		getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
		
		getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
		getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
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

	// 아이콘 전체선택
	$(document).on("click", "#searchPrdIcn1", function ()
	{
		if($("input:checkbox[id=searchPrdIcn1]").is(":checked") == true) {
			$("input:checkbox[name=searchPrdIcn]").attr("checked", true);
		}
	});

	$(document).on("click", "input[name=searchPrdIcn]", function ()
	{
		if( $(this).is(":checked") == false ) {
			$("input:checkbox[id=searchPrdIcn1]").attr("checked", false);
		}
	});


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

		// 구간 검색 값 체크
		if($searchForm.find("#searchTextStart").val() != "" && $searchForm.find("#searchTextEnd").val() == "")
		{
			alert("구간검색은 시작값과 종료값 모두를 입력하셔야 합니다.");
			$searchForm.find("#searchTextEnd").focus();
			return;
		}
		if($searchForm.find("#searchTextStart").val() == "" && $searchForm.find("#searchTextEnd").val() != "")
		{
			alert("구간검색은 시작값과 종료값 모두를 입력하셔야 합니다.");
			$searchForm.find("#searchTextStart").focus();
			return;
		}


		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/vendorApprovalList.do", "target":"_self", "method":"post"}).submit();
	};

	// 상단 요약 클릭
	goProductList = function (prdSellState)
	{
		var $frm = $("#sumForm");
		$frm.find("#searchPrdMstSellState").val(prdSellState);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/vendorApprovalList.do", "target":"_self", "method":"post"}).submit();
	};

	// 페이지 이동
	goPage = function (cPage)
	{
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/vendorApprovalList.do", "target":"_self", "method":"post"}).submit();
	};

	// 상품 일괄 수정 이동
	goForm = function ()
	{
		var $frm = $("#frm");

		popup('', "1100", "800", "no", "_ProductBatchEditPopup");
		$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductBatchEdit.do", "target":"popup_ProductBatchEditPopup", "method":"post"}).submit();
	};


	// 상품 상세페이지 이동
	goView = function (prdMstCd)
	{
		var $frm = $("#detailForm");
		$frm.find('input').val(prdMstCd);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_self", "method":"post"}).submit();
	};

	// 상품 상세페이지 이동 (프론트)
	goPreview = function (prdMstCd)
	{
		alert("프론트 상세페이지 새창 오픈");
	};

	//상품 상세페이지 팝업
	goDetail = function (prdMstCd)
	{
		$('#detailForm input').val(prdMstCd);
		$('#detailForm').attr('action','<c:out value="${serverDomain}"/>/am/product/vendorApprovalDetailPopup.do');
		$('#detailForm').attr('target','popup_ProductDetailPopup');
		$('#detailForm').attr('method','POST');
		popup('', "1100", "800", "no", "_ProductDetailPopup");
		$('#detailForm').submit();
	};

	// 엑셀 다운로드
	$(document).on("click", "#excelDown", function () {
		if("${paging.totalRecordCount}" > 10000){
			alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
			return;
		}else if("${paging.totalRecordCount}" == 0){
			alert("저장할 내역이 없습니다.");
			return;
		}
		if("${commandMap.searchYn }" != "Y"){
			alert("검색을 해주시기 바랍니다.");
			return;
		}
		var $searchForm = $("#frm");
		$searchForm.attr({"action": "<c:out value="${serverDomain}" />/am/product/vendorApprovalListExcelDownload.do", "target":"_self", "method":"post"}).submit();
	});

	// 팝업에서 선택한 매장
	fnResultErpShop = function(obj)
	{
		$("#searchStore").val(obj.SHOP_CD);
		$("#searchStoreName").val(obj.SHOP_NM);

		return true;
	};

	// 상품 수정
	$(document).on("click", "#productModify", function () {
		if( $(".checkRow:checked").length == 0 ){
			alert("수정 할 상품을 선택해 주십시오.");
			return;
		}

		var prdMstCd = "";
		var result = true;
		var needRejectPopup = false;
		$(".checkRow:checked").each(function(){
			prdMstCd = $(this).val();
			if(prdMstCd != ""){
				if($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val() == ""){
					alert("변경 할 판매가를 입력해주세요.");
					$("input[name=PRD_MST_PRC_"+prdMstCd+"]").focus();
					result = false;
					return false;
				}
				if(getInt($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val()) < 0){
					alert("변경 할 판매가를 정수로 입력해주세요.");
					$("input[name=PRD_MST_PRC_"+prdMstCd+"]").focus();
					result = false;
					return false;
				}
				/*
				if($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val() == ""){
					alert("변경 할 검색가를 입력해주세요.");
					$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").focus();
					result = false;
					return false;
				}
				
				if(getInt($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val()) < 0){
					alert("변경 할 검색가를 정수로 입력해주세요.");
					$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").focus();
					result = false;
					return false;
				}
				*/
				if($("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val() == ""){
					alert("변경 할 배송비를 입력해주세요.");
					$("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").focus();
					result = false;
					return false;
				}
				if(getInt($("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val()) < 0){
					alert("변경 할 배송비를 정수로 입력해주세요.");
					$("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").focus();
					result = false;
					return false;
				}
				if($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val() == ""){
					alert("변경 할 판매가능수량을 입력해주세요.");
					$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").focus();
					result = false;
					return false;
				}
				if(getInt($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val()) < 0){
					alert("변경 할 판매가능수량을 정수로 입력해주세요.");
					$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").focus();
					result = false;
					return false;
				}
				/*
				if($("input[name=PRD_MST_PC_CPN_PRC_"+prdMstCd+"]").val() != "" || $("input[name=PRD_MST_MB_CPN_PRC_"+prdMstCd+"]").val() != ""){
					if($("select[name=PRD_MST_CPN_OWN_"+prdMstCd+"]").val() == ""){
						alert("즉시쿠폰 주최 업체를 선택해주세요.");
						$("select[name=PRD_MST_CPN_OWN_"+prdMstCd+"]").focus();
						result = false;
						return false;
					}
				}
				*/
				var orgState = $("#PRD_MST_APV_STATE_"+prdMstCd).data("prd_mst_apv_state");
				var curState = $("#PRD_MST_APV_STATE_"+prdMstCd).val();
				if("C" == curState && orgState != curState){
					needRejectPopup = true;
				}
			}
		});
		
		if(needRejectPopup){
			alert("보류 사유를 먼저 등록해야합니다.");
			$("#productHoldState").click();
			result = false;
			return;
		}
		
		if(result){
			if (confirm( "수정 하시겠습니까?"))
			{
				//콤마제거
				$(".checkRow:checked").each(function(){
					prdMstCd = $(this).val();
					$("input[name=PRD_MST_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val()));
					//$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val()));
					$("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val()));
					$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val()));
					$("input[name=PRD_MST_SALE_RATE_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_SALE_RATE_"+prdMstCd+"]").val()));
					//$("input[name=PRD_MST_PC_CPN_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_PC_CPN_PRC_"+prdMstCd+"]").val()));
					//$("input[name=PRD_MST_MB_CPN_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_MB_CPN_PRC_"+prdMstCd+"]").val()));
				});
				
				var $frm = $("#frm");
				$frm.attr({"action": "<c:out value="${serverDomain}" />/am/product/vendorApprovalListModify.do", "target":"_self", "method":"post"}).submit();
			}
		}
	});

	// 상품 삭제
	$(document).on("click", "#productDelete", function () {
		if( $(".checkRow:checked").length == 0 ){
			alert("삭제 할 상품을 선택해 주십시오.");
			return;
		}

		if (confirm( "삭제 하시겠습니까?"))
		{
			var $frm = $("#frm");
			$frm.attr({"action": "<c:out value="${serverDomain}" />/am/product/vendorApprovalDelete.do", "target":"_self", "method":"post"}).submit();
		}
	});
	
	// 상품 승인
	$(document).on("click", "#productApvState", function () {
		if( $(".checkRow:checked").length == 0 ){
			alert("승인 할 상품을 선택해 주십시오.");
			return;
		}

		if (confirm("승인 하시겠습니까?"))
		{
			$("#PRD_MST_CD").val($(".checkRow:checked").val());
			var $frm = $("#frm");
			$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/vendorApprovalProductApvModify.do", "target":"_self", "method":"post"}).submit();
		}
	});
	// 상품 보류
	$(document).on("click", "#productHoldState", function () {
		if( $(".checkRow:checked").length == 0 ){
			alert("보류 할 상품을 선택해 주십시오.");
			return;
		}


		var selProductsList = [];
		$(".checkRow:checked").each(function(){
			selProductsList.push({PRD_MST_CD : $(this).data('cd')})
		});

		popup(
				"<c:out value="${serverDomain}" />/am/product/vendorApprovalProductHoldPopup.do?productCodeList=" + encodeURI(JSON.stringify(selProductsList)),
				"900", "500", "yes", "productHoldPopup");
		

	});
	
	fnResultHoldPopup = function(){
		alert('정상적으로 처리되었습니다.');
		search();
		
	};
});
//-->
</script>

</body>
</html>
