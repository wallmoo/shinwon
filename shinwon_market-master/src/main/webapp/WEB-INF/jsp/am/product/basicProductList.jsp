<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>
</head>
<body>
	<!-- body class, 중요 -->

	<div id="header">
		<!-- header -->
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp"%>
	</div>
	<!-- // header -->

	<div id="container">
		<!-- container -->

		<div id="aside" class="aside left">
			<!-- aside -->
			<%@ include file="/WEB-INF/jsp/am/include/left.jsp"%>
		</div>
		<!-- // aside -->
	
		<div id="wrapper">
			<!-- wrapper -->

			<div id="breadcrumb"></div>
			<!-- breadcrumb -->

			<div id="contents">
				<!-- contents -->

				<div class="container">

					<h2 class="title">
						<span>상품관리</span>
					</h2>

					<form id="sumForm" name="sumForm">
						<input type="hidden" id="searchPrdMstSellState" name="searchPrdMstSellState" />
						<input type="hidden" name="searchYn" value="Y" />
						<input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
						<input type="hidden" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
						<input type="hidden" id="searchPrdMstVdrIdx" name="searchPrdMstVdrIdx" value="<c:out value="${commandMap.searchPrdMstVdrIdx }"/>" />
						<input type="hidden" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
						<input type="hidden" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
						<input type="hidden" id="searchPrdMstDplState" name="searchPrdMstDplState" value="<c:out value="${commandMap.searchPrdMstDplState }"/>" />
						<input type="hidden" id="searchPrdMstApvState" name="searchPrdMstApvState" value="<c:out value="${commandMap.searchPrdMstApvState }"/>" />
						<input type="hidden" id="searchPrdMstSeason" name="searchPrdMstSeason" value="<c:out value="${commandMap.searchPrdMstSeason }"/>" />
						<input type="hidden" id="searchPrdMstBrand" name="searchPrdMstBrand" value="<c:out value="${commandMap.searchPrdMstBrand }"/>" />
						<input type="hidden" id="searchPrdMstType" name="searchPrdMstType" value="<c:out value="${commandMap.searchPrdMstType }"/>" />
						<input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
						
						<div class="tab-list">
							<!-- tab-list -->
							<ul>
								<li <c:if test="${empty commandMap.searchPrdMstSellState }">class="in"</c:if>><a href="javascript:goProductList('');"><span>전체상품<small>(<fmt:formatNumber value="${summary.all}" groupingUsed="true" />)</small></span></a></li>
								<li <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_ING}">class="in"</c:if>><a href="javascript:goProductList('${Code.PRODUCT_SELL_STATE_ING }');"><span>판매중<small>(<fmt:formatNumber value="${summary[Code.PRODUCT_SELL_STATE_ING]}" groupingUsed="true" />)</small></span></a></li>
								<li <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_STOP}">class="in"</c:if>><a href="javascript:goProductList('${Code.PRODUCT_SELL_STATE_STOP }');"><span>미판매<small>(<fmt:formatNumber value="${summary[Code.PRODUCT_SELL_STATE_STOP]}" groupingUsed="true" />)</small></span></a></li>
								<li <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_TEMPOUT}">class="in"</c:if>><a href="javascript:goProductList('${Code.PRODUCT_SELL_STATE_TEMPOUT }');"><span>품절상품<small>(<fmt:formatNumber value="${summary[Code.PRODUCT_SELL_STATE_TEMPOUT]}" groupingUsed="true" />)</small></span></a></li>
								<li <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT}">class="in"</c:if>><a href="javascript:goProductList('${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }');"><span>일부품절상품<small>(<fmt:formatNumber value="${summary[Code.PRODUCT_SELL_STATE_OP_TEMPOUT]}" groupingUsed="true" />)</small></span></a></li>
							</ul>
						</div>
						<!-- // tab-list -->
					</form>

					<div class="section-title">
						<!-- section-title -->
						<h3 class="title">
							<span>목록</span>
						</h3>
					</div>
					<!-- // section-title -->
					<form id="detailForm" name="detailForm">
						<input type="hidden" name="PRD_MST_CD">
					</form>
					
					<form id="searchForm" name="searchForm">
						<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
						<input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
						<input type="hidden" name="searchYn" value="Y" />
						<input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
						<table class="table-row table-a" style="margin-bottom: 0;">
							<!-- table -->
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 24%;">
								<col style="width: 10%;">
								<col style="width: 23%;">
								<col style="width: 10%;">
								<col style="width: 23%;">
							</colgroup>
							<tbody>
								<c:choose>
									<c:when test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
										<tr>
											<!-- row -->
											<th><span>상품코드</span></th>
											<td><textarea name="searchPrdMstCd" id="searchPrdMstCd" class="textarea h_28px"><c:out value="${commandMap.searchPrdMstCd }"/></textarea></td>
											<th><span>상품명</span></th>
											<td><input type="text" class="text xlarge" id="searchPrdMstNm"
												name="searchPrdMstNm"
												value="<c:out value="${commandMap.searchPrdMstNm }"/>" /></td>
                                              
											<th><span>입점업체</span></th>
											<td>
												<select name="searchPrdMstVdrIdx" id="searchPrdMstVdrIdx" class="select">
													<option value="">전체</option>
													<c:if test="${not empty vendorList }">
														<c:forEach var="authRow" items="${vendorList }" varStatus="i">
															<option value="<c:out value="${authRow.VDR_MST_IDX }"/>"<ui:select v="${commandMap.searchPrdMstVdrIdx}" t="${authRow.VDR_MST_IDX }" g="selected"/>><c:out value="${authRow.VDR_MST_NM }" /></option>
														</c:forEach>
													</c:if>
												</select>
											</td>
                                            
										</tr>
										<tr>
											<th><span>등록일</span></th>
											<td>
												<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
												<input type="text" name="searchStartDate" id="searchStartDate" class="text small" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate" /> ~ 
												<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
												<input type="text" name="searchEndDate" id="searchEndDate" class="text small" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate" />
											</td>
											<th><span>상태</span></th>
											<td>
												<select class="select small" name="searchPrdMstSellState" id="searchPrdMstSellState">
													<option value="">전체</option>
													<option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_ING }" g="selected"/>>판매중</option>
													<option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" g="selected"/>>일시품절</option>
													<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_TEMPOUT }" g="selected"/>>품절상품</option>
													<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_STOP }" g="selected"/>>미판매</option>
												</select>
											</td>
											<th><span>진열</span></th>
											<td>
												<select class="select small" name="searchPrdMstDplState" id="searchPrdMstDplState">
													<option value="">전체</option>
													<option value="Y" <ui:select v="${commandMap.searchPrdMstDplState}" t="Y" g="selected"/>>YES</option>
													<option value="N" <ui:select v="${commandMap.searchPrdMstDplState}" t="N" g="selected"/>>NO</option>
												</select>
											</td>
										</tr>
										<tr>
											<th><span>승인</span></th>
											<td>
												<select class="select" name="searchPrdMstApvState" id="searchPrdMstApvState">
													<option value="">전체</option>
													<option value="D" <ui:select v="${commandMap.searchPrdMstApvState}" t="D" g="selected"/>>대기</option>
													<option value="A" <ui:select v="${commandMap.searchPrdMstApvState}" t="A" g="selected"/>>승인</option>
													<option value="C" <ui:select v="${commandMap.searchPrdMstApvState}" t="C" g="selected"/>>보류</option>
												</select>
											</td>
											<th><span>시즌</span></th>
											<td>
												<select class="select" name="searchPrdMstSeason" id="searchPrdMstMdId">
													<option value="">전체</option>
													<c:if test="${not empty seasonList }">
														<c:forEach var="authRow" items="${seasonList }" varStatus="i">
															<option value="<c:out value="${authRow.CMN_COM_IDX }"/>" <ui:select v="${commandMap.searchPrdMstMdId}" t="${authRow.CMN_COM_IDX }" g="selected"/>>
																<c:out value="${authRow.CMN_COM_ETC1 }" />
															</option>
														</c:forEach>
													</c:if>
												</select>
											</td>
											<th><span>브랜드</span></th>
											<td>
												<select class="select" name="searchPrdMstBrand" id="searchPrdMstBrand">
													<option value="">전체</option>
													<c:choose>
														<c:when test="${not empty brandList}">
															<c:forEach var="brandList" items="${brandList }" varStatus="status">
																<option value="<c:out value="${brandList.BND_MST_IDX }" />"
																	<ui:select v="${commandMap.searchPrdMstBrand }" t="${brandList.BND_MST_IDX }" g="selected"/>><c:out value="${brandList.BND_MST_BRAND_NM }" />
																</option>
															</c:forEach>
														</c:when>
													</c:choose>
												</select>
											</td>
										</tr>
										<tr>
											<th><span>상품유형</span></span></th>
											<td colspan="5">
												<select class="select" name="searchPrdMstType">
													<option value="">전체</option>
													<option value="G" <ui:select v="${commandMap.searchPrdMstType}" t="G" g="selected"/>>일반상품</option>
													<option value="B" <ui:select v="${commandMap.searchPrdMstType}" t="B" g="selected"/>>묶음상품</option>
													<option value="S" <ui:select v="${commandMap.searchPrdMstType}" t="S" g="selected"/>>세트상품</option>
												</select>
											</td>
										</tr>
										<tr>
											<th><span>카테고리</span></th>
											<td colspan=5>
												<!-- 
												<select class="select" id="searchPrdCtgEnv" name="searchPrdCtgEnv">
													<option value="">미선택</option>
													<option value="<c:out value="${Code.CATEGORY_TYPE_PC }" />" <ui:select v="${commandMap.searchPrdCtgEnv }" t="${Code.CATEGORY_TYPE_PC }" g="selected"/>>PC</option>
													<option value="<c:out value="${Code.CATEGORY_TYPE_MOBILE }" />" <ui:select v="${commandMap.searchPrdCtgEnv }" t="${Code.CATEGORY_TYPE_MOBILE }" g="selected"/>>MOBILE</option>
												</select>
												-->
												<select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1">
													<option value="">1차카테고리</option>
												</select>
												<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2">
													<option value="">2차카테고리</option>
												</select>
												<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3">
													<option value="">3차카테고리</option>
												</select>
												<small class="desc"> * 카테고리 검색은 업체구분를 먼저 선택해주세요.</small>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<!-- row -->
											<th><span>상품코드</span></th>
											<td><textarea name="searchPrdMstCd" id="searchPrdMstCd" class="textarea h_28px"><c:out value="${commandMap.searchPrdMstCd }"/></textarea></td>
											<th><span>상품명</span></th>
											<td colspan="3">
												<input type="text" class="text xlarge" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
											</td>
											<!--
                                                <th><span>입점업체</span></th>
                                                <td>
    												<select name="searchPrdMstVdrIdx" id="searchPrdMstVdrIdx" class="select">
    													<option value="">전체</option>
    													<c:if test="${not empty vendorList }">
    														<c:forEach var="authRow" items="${vendorList }" varStatus="i">
    															<option value="<c:out value="${authRow.VDR_MST_IDX }"/>" <ui:select v="${commandMap.searchPrdMstVdrIdx}" t="${authRow.VDR_MST_IDX }" g="selected"/>><c:out value="${authRow.VDR_MST_NM }" /></option>
    														</c:forEach>
    													</c:if>
    												</select>
    											</td>
                                            -->
										</tr>
										<tr>
											<th><span>등록일</span></th>
											<td>
												<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
												<input type="text" name="searchStartDate" id="searchStartDate" class="text small" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate" /> ~ 
												<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
												<input type="text" name="searchEndDate" id="searchEndDate" class="text small" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate" />
											</td>
                                            <th><span>상태</span></th>
                                            <td>
                                                <select class="select" name="searchPrdMstSellState" id="searchPrdMstSellState">
                                                    <option value="">전체</option>
                                                    <option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_ING }" g="selected"/>>판매중</option>
                                                    <option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" g="selected"/>>일시품절</option>
                                                    <option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_TEMPOUT }" g="selected"/>>품절상품</option>
                                                    <option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_STOP }" g="selected"/>>미판매</option>
                                                </select>
                                            </td>
											<th><span>진열</span></th>
											<td>
												<select class="select" name="searchPrdMstDplState" id="searchPrdMstDplState">
													<option value="">전체</option>
													<option value="Y" <ui:select v="${commandMap.searchPrdMstDplState}" t="Y" g="selected"/>>YES</option>
													<option value="N" <ui:select v="${commandMap.searchPrdMstDplState}" t="N" g="selected"/>>NO</option>
												</select>
											</td>

										</tr>
										<tr>
											<th><span>승인</span></th>
											<td><select class="select" name="searchPrdMstApvState"
												id="searchPrdMstApvState">
													<option value="">전체</option>
													<option value="D"	<ui:select v="${commandMap.searchPrdMstApvState}" t="D" g="selected"/>>대기</option>
													<option value="A"	<ui:select v="${commandMap.searchPrdMstApvState}" t="A" g="selected"/>>승인</option>
													<option value="C"	<ui:select v="${commandMap.searchPrdMstApvState}" t="C" g="selected"/>>보류</option>
											</select></td>
                                            <th><span>시즌</span></th>
                                            <td colspan="3">
                                                <select class="select" name="searchPrdMstSeason" id="searchPrdMstMdId">
                                                    <option value="">전체</option>
                                                    <c:if test="${not empty seasonList }">
                                                        <c:forEach var="authRow" items="${seasonList }" varStatus="i">
                                                            <option value="<c:out value="${authRow.CMN_COM_IDX }"/>" <ui:select v="${commandMap.searchPrdMstMdId}" t="${authRow.CMN_COM_IDX }" g="selected"/>>
                                                                <c:out value="${authRow.CMN_COM_ETC1 }" />
                                                            </option>
                                                        </c:forEach>
                                                    </c:if>
                                                </select>
                                            </td>
                                            <!--  
    											<th><span>수정요청</span></th>
    											<td colspan=3><select class="select"
    												name="searchVdrApvApvState" id="searchVdrApvApvState">
    													<option value="">전체</option>
    													<option value="D"
    														<ui:select v="${commandMap.searchVdrApvApvState}" t="D" g="selected"/>>대기</option>
    													<option value="C"
    														<ui:select v="${commandMap.searchVdrApvApvState}" t="C" g="selected"/>>거절</option>
    											</select></td>
                                            -->
										</tr>
                                        <tr>
                                            <th><span>상품유형</span></span></th>
                                            <td colspan="5">
                                                <select class="select" name="searchPrdMstType">
                                                    <option value="">전체</option>
                                                    <option value="G" <ui:select v="${commandMap.searchPrdMstType}" t="G" g="selected"/>>일반상품</option>
                                                    <option value="B" <ui:select v="${commandMap.searchPrdMstType}" t="B" g="selected"/>>묶음상품</option>
                                                    <option value="S" <ui:select v="${commandMap.searchPrdMstType}" t="S" g="selected"/>>세트상품</option>
                                                </select>
                                            </td>
                                        </tr>
										<tr>
											<th><span>카테고리</span></th>
											<td colspan=5>
												<!--  
												<select class="select" id="searchPrdCtgEnv" name="searchPrdCtgEnv">
													<option value="">미선택</option>
													<option value="<c:out value="${Code.CATEGORY_TYPE_PC }" />" <ui:select v="${commandMap.searchPrdCtgEnv }" t="${Code.CATEGORY_TYPE_PC }" g="selected"/>>PC</option>
													<option value="<c:out value="${Code.CATEGORY_TYPE_MOBILE }" />" <ui:select v="${commandMap.searchPrdCtgEnv }" t="${Code.CATEGORY_TYPE_MOBILE }" g="selected"/>>MOBILE</option>
												</select>
												-->
												<select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1"> <option value="">대분류선택</option>
												</select>
												<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2">
													<option value="">중분류선택</option>
												</select>
												<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3">
													<option value="">소분류선택</option>
												</select>
                                            	<small class="desc"> * 카테고리 검색은 업체구분를 먼저 선택해주세요.</small>
                                           	</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<!-- // table -->
					</form>

					<div class="grid section-button-search">
						<!-- 검색 하단 버튼 -->
						<a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
						<a href="javascript:search();" class="button small primary"><span>검색</span></a>
					</div>
					<!-- // 검색 하단 버튼 -->

					<form id="frm" name="frm">
						<input type="hidden" name="productData" id="productData"/>
						<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
						<input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
						<input type="hidden" name="searchPrdMstVdrIdx" value="<c:out value="${commandMap.searchPrdMstVdrIdx }"/>" />
						<input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
						<input type="hidden" name="searchPrdCtgEnv" value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" />
						<input type="hidden" name="searchPrdCtgDepth1" value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
						<input type="hidden" name="searchPrdCtgDepth2" value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
						<input type="hidden" name="searchPrdCtgDepth3" value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
						<input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
						<input type="hidden" name="searchPrdMstDplState" value="<c:out value="${commandMap.searchPrdMstDplState }"/>" />
						<input type="hidden" name="searchPrdMstApvState" value="<c:out value="${commandMap.searchPrdMstApvState }"/>" />
						<input type="hidden" name="searchPrdMstMdId" value="<c:out value="${commandMap.searchPrdMstMdId }"/>" />
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
						<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
						<input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
						<input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
						
						<input type="hidden" name="batchPrdMstDplState"   id="batchPrdMstDplState"  />
						<input type="hidden" name="batchPrdMstEmpUseYn"   id="batchPrdMstEmpUseYn"  />
						<input type="hidden" name="batchPrdMstPrtUseYn"   id="batchPrdMstPrtUseYn"  />
						<input type="hidden" name="batchPrdMstNaverUseYn" id="batchPrdMstNaverUseYn"/>
						<input type="hidden" name="batchPrdMstDaumUseYn"  id="batchPrdMstDaumUseYn" />																		
						
						<div class="grid section-button-list btn_many">
							<!-- 목록 상단 버튼 -->
							<div class="col-1-2 text-left">
								<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage" />
								<span class="pages">
									(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
								</span>
								<!-- 슈퍼관리자만 등록 가능 -->
								<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
									<a href="#none" id="productCopy" class="button small"><span>복사</span></a>
									<a href="#none" id="productModify" class="button small"><span>수정</span></a>
									<a href="#none" id="productDelete" class="button small"><span>삭제</span></a>
								</c:if>
								<!-- 입점업체 등록 가능 -->
								<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
									<a href="#none" id="productVdrCopy" class="button small"><span>복사</span></a>
									<a href="#none" id="productVdrModify" class="button small"><span>수정</span></a>
									<a href="#none" id="productVdrDelete" class="button small"><span>삭제</span></a>
								</c:if>
								<a href="#none" id="excelDown" class="button small"><span>엑셀 내려받기</span></a>
                                <!-- 슈퍼관리자만 등록 가능 -->
                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
								    <a href="javascript:categoryChangePopup();" class="button small" title="새창으로 열림"><span>카테고리 변경</span></a>
                                </c:if>
							</div>
							<div class="col-1-2 text-right">
								<!-- 슈퍼관리자만 등록 가능 -->
								<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
									<a href="javascript:tagBatchEditPopup();" class="button small primary"><span>태그 일괄수정</span></a>
									<a href="javascript:productBatchEditPopup();" class="button small primary"><span>상품 일괄수정</span></a>
									<button type="button" id="batchRegistButton" class="button small primary"><span>상품 일괄등록</span></button>
									<a href="javascript:goForm();" class="button small primary"><span>상품등록</span></a>
								</c:if>
								<!-- 입점업체 등록 가능 -->
								<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
									<a href="javascript:tagBatchEditPopupvdr();" class="button small primary"><span>태그 일괄수정</span></a>
									<a href="javascript:productBatchEditPopup();" class="button small primary"><span>상품 일괄수정</span></a>
									<a href="javascript:goForm();" class="button small primary"><span>상품 일괄등록</span></a>
									<a href="javascript:goForm();" class="button small primary"><span>입점업체 상품등록</span></a>
								</c:if>
							</div>
						</div>
						<!-- // 목록 상단 버튼 -->

						<c:choose>
							<c:when test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX ne Code.SCM_ADMINISTRATOR_IDX}">
								<table cellspacing="0" class="table-col table-b">
									<!-- table -->
									<colgroup>
										<col style="width:40px;">
										<col style="width:70px;">
										<col style="width:80px;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:auto;">
										<col style="width:80px;">
										<col style="width:70px;">
										<col style="width:80px;">
									</colgroup>
									<thead>
										<tr>
											<th rowspan="2"><input type="checkbox" class="checkbox checkAll" /></th>
											<th rowspan="2">NO</th>
											<th rowspan="2">이미지</th>
											<th rowspan="2">상품명<br />(상품코드)</th>
											<th rowspan="2">상품품번</th>
											<th colspan="2">판매가</th>
											<th colspan=2>배송비</th>
											<th>네이버쇼핑</th>
											<th rowspan="2">할인율</th>
											<th rowspan="2">임직원 할인</th>
											<th rowspan="2">제휴사 할인</th>
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
										<c:forEach var="item" items="${list}" varStatus="status">
											<tr>
												<td rowspan="2"><input type="checkbox" name="PRD_MST_CDs" value="<c:out value="${item.PRD_MST_CD }" />" class="checkbox checkRow"></td>
                                                
												<td rowspan="2">
													<div class="tbl_line">
														${listNum}
													</div>
													<div class="tbl_line">
														<a href="javascript:goView('${item.PRD_MST_CD }');">[수정]</a>
													</div>
												</td>
												<td rowspan="2"><span class="thumbnail_img"><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${item.PRD_IMAGE }"></span></td>
												<td rowspan="2">
													<div class="tbl_line">
														<input type="text" class="text xlarge" name="PRD_MST_NM_${item.PRD_MST_CD }" value="${item.PRD_MST_NM }">
													</div>
													<div class="tbl_line">
														<a href="javascript:goDetail('${item.PRD_MST_CD }');">(${item.PRD_MST_CD})</a>
														<!--  
                                                            <input type="hidden" name="PRD_MST_CD" value="${item.PRD_MST_CD }"/> 
                                                        -->
													</div>
												</td>
												<td rowspan="2">
													<c:choose>
														<c:when test="${not empty item.PRD_MST_ERP_CD }"><a href="javascript:goView('${item.PRD_MST_CD}');">(${item.PRD_MST_ERP_CD })</a></c:when>
														<c:otherwise>-</c:otherwise>
													</c:choose>
												</td>
												<td colspan="2"><input type="text" name="PRD_MST_PRC_${item.PRD_MST_CD }" class="text small" value="${item.PRD_NOW_DST_PRICE }" readonly="readonly"></td>
												<td colspan="2">
													<input type="text" class="text" name="PRD_MST_DLV_FEE_${item.PRD_MST_CD }" id="PRD_MST_DLV_FEE_${item.PRD_MST_CD }" value="${item.PRD_MST_DLV_FEE}"/>
												</td>
												<td>
													<select class="select small" name="NAVER_USE_${item.PRD_MST_CD }" id="NAVER_USE_${item.PRD_MST_CD }">
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
														<input type="text" class="text small" name="PRD_MST_SALE_RATE_${item.PRD_MST_CD }" value="${item.PRD_MST_SALE_RATE}" onchange="onChangeProductPrice('${item.PRD_MST_PRC }', '${item.PRD_MST_CD }')">
													</div>
												</td>
												<td rowspan="2">
													<select class="select small" name="PRD_MST_EMP_USE_YN_${item.PRD_MST_CD }" id="PRD_MST_EMP_USE_YN_${item.PRD_MST_CD }" >
														<option value="Y" <c:if test="${item.PRD_MST_EMP_USE_NM eq 'YES'}">selected</c:if>>YES</option>
														<option value="N" <c:if test="${item.PRD_MST_EMP_USE_NM eq 'NO'}">selected</c:if>>NO</option>
													</select>
												</td>
												<td rowspan="2">
													<select class="select small" name="PRD_MST_PRT_USE_YN_${item.PRD_MST_CD }" id="PRD_MST_PRT_USE_YN_${item.PRD_MST_CD }">
														<option value="Y" <c:if test="${item.PRD_MST_PRT_USE_NM eq 'YES'}">selected</c:if>>YES</option>
														<option value="N" <c:if test="${item.PRD_MST_PRT_USE_NM eq 'NO'}">selected</c:if>>NO</option>
													</select>
												</td>
												<td>${item.BND_MST_BRAND_NM}</td>
												<td rowspan="2">${item.PRD_MST_TYPE_NM }</td>
												<td rowspan="2">${item.PRD_MST_REG_DT }</td>
											</tr>
											<tr>
												<td style="border-left:1px solid #e9e9e9;">
													<select class="select small" name="PRD_MST_DPL_STATE_${item.PRD_MST_CD }" id="PRD_MST_DPL_STATE_${item.PRD_MST_CD }">
														<option value="Y" <c:if test="${item.PRD_MST_DPL_STATE eq 'Y'}">selected</c:if>>YES</option>
														<option value="N" <c:if test="${item.PRD_MST_DPL_STATE eq 'N'}">selected</c:if>>NO</option>
													</select>
												</td>
												<td>
													<select class="select small" name="PRD_MST_SEL_STATE_${item.PRD_MST_CD }" id="PRD_MST_SEL_STATE_${item.PRD_MST_CD }">
														<option value="I" <c:if test="${item.PRD_MST_SEL_STATE eq 'I'}">selected</c:if>>판매중</option>
														<option value="S" <c:if test="${item.PRD_MST_SEL_STATE eq 'S'}">selected</c:if>>미판매</option>
														<option value="T" <c:if test="${item.PRD_MST_SEL_STATE eq 'T'}">selected</c:if>>품절</option>
														<option value="O" <c:if test="${item.PRD_MST_SEL_STATE eq 'O'}">selected</c:if>>일부품절</option>
													</select>
												</td>
												<td>
													<select class="select small" name="PRD_MST_APV_STATE_${item.PRD_MST_CD }" id="PRD_MST_APV_STATE_${item.PRD_MST_CD }" data-prd_mst_apv_state="${item.PRD_MST_APV_STATE}">
														<option value="A" <c:if test="${item.PRD_MST_APV_STATE eq 'A'}">selected</c:if>>승인</option>
														<option value="D" <c:if test="${item.PRD_MST_APV_STATE eq 'D'}">selected</c:if>>대기</option>
														<option value="C" <c:if test="${item.PRD_MST_APV_STATE eq 'C'}">selected</c:if>>거절</option>
													</select>
												</td>
												<td>
													<c:if test="${item.BND_MST_BRAND_TYPE eq 'I'}">
														<input type="text" class="text small" name="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" id="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" value="${item.PRD_MST_SEL_CNT }" readonly="readonly">
													</c:if>
													<c:if test="${item.BND_MST_BRAND_TYPE eq 'O'}">
														<input type="text" class="text small" name="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" id="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" value="${item.PRD_MST_SEL_CNT }">
													</c:if>
												</td>
												<td>
													<select class="select small" name="DAUM_USE_${item.PRD_MST_CD }" id="DAUM_USE_${item.PRD_MST_CD }">
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
												<td class="td_no_result0"  colspan='16' >${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
											</tr>
										</c:if>
										<c:if test="${param.searchYn ne 'Y'}">
											<tr>
												<td class="td_no_result0" colspan='16'  >${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
											</tr>
										</c:if>
									</c:otherwise>
									</c:choose>
									</tbody>
								</table>
								<!-- // table -->
							</c:when>
							<c:otherwise>
								
								<!-- // table -->
                                <table cellspacing="0" class="table-col table-b">
                                    <!-- table -->
                                    <colgroup>
                                        <col style="width:40px;">
                                        <col style="width:70px;">
                                        <col style="width:80px;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:auto;">
                                        <col style="width:80px;">
                                        <col style="width:70px;">
                                        <col style="width:80px;">
                                        <col style="width:80px;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th rowspan="2"><input type="checkbox"
                                                class="checkbox checkAll" /></th>
                                            <th rowspan="2">NO</th>
                                            <th rowspan="2">이미지</th>
                                            <th rowspan="2">상품명<br />(상품코드)</th>
                                            <th rowspan="2">상품품번</th>
                                            <th colspan="2">판매가</th>
                                            <th colspan=2>배송비</th>
                                            <th>네이버쇼핑</th>
                                            <th rowspan="2">할인율</th>

                                            <th rowspan="2">상품유형</th>
                                            <th rowspan="2">등록일</th>
                                            <th rowspan="2">보류사유</th>
                                        </tr>
                                        <tr>
                                            <th style="border-left: 1px #e9e9e9 solid;">진열</th>
                                            <th>판매</th>
                                            <th>승인</th>
                                            <th>판매가능수량</th>
                                            <th>다음 쇼핑노하우</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody id="prdList">
                                    <c:choose>
                                    <c:when test="${not empty list}">
                                        <c:set var="listNum" value="${paging.listNum}" />
                                        <c:forEach var="item" items="${list}" varStatus="status">
                                        <tr>
                                        <td rowspan="2"><input type="checkbox" name="PRD_MST_CDs" value="<c:out value="${item.PRD_MST_CD }" />" class="checkbox checkRow"></td>
                                        <td rowspan="2">
                                            <div class="tbl_line">
                                                ${listNum}
                                            </div>
                                            <div class="tbl_line">
                                                <a href="javascript:goView('${item.PRD_MST_CD }');">[수정]</a>
                                            </div>
                                        </td>
                                        <td rowspan="2"><span class="thumbnail_img"><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${item.PRD_IMAGE }"></span></td>
                                        <td rowspan="2">
                                            <div class="tbl_line">
                                                <input type="text" class="text xlarge" name="PRD_MST_NM_${item.PRD_MST_CD }" value="${item.PRD_MST_NM }">
                                            </div>
                                            <div class="tbl_line">
                                           		<c:choose>
													<c:when test="${not empty item.PRD_MST_CD }"><a href="javascript:goView('${item.PRD_MST_CD}');">(${item.PRD_MST_CD })</a></c:when>
													<c:otherwise>-</c:otherwise>
												</c:choose>
                                            </div>
                                        </td>
                                        <td rowspan="2"><a href="javascript:goView('${item.PRD_MST_CD}');">${item.PRD_MST_ERP_CD}</a></td>
                                        <td colspan="2"><input type="text" name="PRD_MST_PRC_${item.PRD_MST_CD }" class="text small" value="${item.PRD_NOW_DST_PRICE }" readonly="readonly"></td>
                                        <td colspan="2">
                                            <input type="text" class="text" name="PRD_MST_DLV_FEE_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_DLV_FEE}" />">
                                            <!-- <select class="select small" name="PRD_MST_DLV_FEE">
                                                <c:forEach var="row" items="${deleveryFeeList }" varStatus="i">
                                                    <option value="${row.CMN_COM_IDX }" <c:if test="${item.PRD_MST_DLV_FEE eq row.CMN_COM_NM}">selected</c:if>>${row.CMN_COM_NM }</option>
                                                </c:forEach>
                                            </select>
                                             -->
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
                                                <input type="text" class="text small" name="PRD_MST_SALE_RATE_${item.PRD_MST_CD }"  value="${item.PRD_MST_SALE_RATE}">
                                            </div>
                                        </td>
                                        
                                        <td rowspan="2">${item.PRD_MST_TYPE_NM }</td>
                                        <td rowspan="2">${item.PRD_MST_REG_DT }</td>
                                        <td rowspan="2">
                                            <c:if test="${item.PRD_MST_APV_STATE eq 'C'}">
                                                <a class="button button-a" href="javascript:goPendingHistoryPopup('${item.PRD_MST_CD }');">보류사유</a>
                                             </c:if>
                                        </td>
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
                                                <option value="S" <c:if test="${item.PRD_MST_SEL_STATE eq 'S'}">selected</c:if>>미판매</option>
                                                <option value="T" <c:if test="${item.PRD_MST_SEL_STATE eq 'T'}">selected</c:if>>품절</option>
                                                <option value="O" <c:if test="${item.PRD_MST_SEL_STATE eq 'O'}">selected</c:if>>일부품절</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="select small" name="PRD_MST_APV_STATE_${item.PRD_MST_CD }" readonly="readonly" disabled="disabled">
                                                <option value="A" <c:if test="${item.PRD_MST_APV_STATE eq 'A'}">selected</c:if>>승인</option>
                                                <option value="D" <c:if test="${item.PRD_MST_APV_STATE eq 'D'}">selected</c:if>>대기</option>
                                                <option value="C" <c:if test="${item.PRD_MST_APV_STATE eq 'C'}">selected</c:if>>거절</option>
                                            </select>
                                        </td>
                                        <td>
                                       		<input type="text" class="text small" name="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" value="${item.PRD_MST_SEL_CNT }">
										</td>
                                        <td>
                                            <select class="select small" name="DAUM_USE_${item.PRD_MST_CD }">
                                                <option value="Y" <c:if test="${item.DAUM_USE eq 'YES'}">selected</c:if>>YES</option>
                                                <option value="N" <c:if test="${item.DAUM_USE eq 'NO'}">selected</c:if>>NO</option>
                                            </select>
                                            
                                        </td>
                                    </tr>
                                    <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                    
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${param.searchYn eq 'Y'}">
                                            <tr>
                                                <td class="td_no_result0" colspan='16' >${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${param.searchYn ne 'Y'}">
                                            <tr>
                                                <td class="td_no_result0" colspan='16' >${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
                                            </tr>
                                        </c:if>
                                    </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
							</c:otherwise>
						</c:choose>
					</form>

					<div class="grid section-button-list btn_many">
							<div class="col-1-2 text-left">
								<a href="#none" id="" class="button small changeStatus"><span>진열 ON</span></a>
								<a href="#none" id="" class="button small changeStatus"><span>진열 OFF</span></a>
                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
								    <a href="#none" id="" class="button small changeStatus"><span>임직원할인ON</span></a>
								    <a href="#none" id="" class="button small changeStatus"><span>임직원할인OFF</span></a>
								    <a href="#none" id="" class="button small changeStatus"><span>제휴사할인ON</span></a>
                                    <a href="#none" id="" class="button small changeStatus"><span>제휴사할인OFF</span></a>
								    <a href="#none" id="" class="button small changeStatus"><span>네이버 ON</span></a>
    								<a href="#none" id="" class="button small changeStatus"><span>네이버 OFF</span></a>
    								<a href="#none" id="" class="button small changeStatus"><span>다음 ON</span></a>
    								<a href="#none" id="" class="button small changeStatus"><span>다음 OFF</span></a>
                                </c:if>
							</div>
							<div class="col-1-2 text-right">
                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
    								<a href="" class="button small primary changeStatus"><span>상품명 업데이트</span></a>
    								<a href="" class="button small primary changeStatus"><span>이미지 업데이트</span></a>
    								<a href="" class="button small primary changeStatus"><span>재고 업데이트</span></a>
                                </c:if>
							</div>
						</div>

					<div class="section-pagination">
						<!-- section pagination -->
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<!-- 개발 시 wrap 이하 모듈 시작 -->
							<ui:paging paging="${paging }" jsFunction="goPage" />
						</div>
					</div>
					<!-- // section pagination -->
				</div>
			</div>
			<!-- // contents -->
		</div>
		<!-- // wrapper -->
		<!-- quickmenu-->
		<div id="quickmenu" class="aside right">
			<%@ include file="/WEB-INF/jsp/am/include/quick.jsp"%>
		</div>
		<!-- // quickmenu -->

	</div>
	<!-- // container -->

	<div id="footer">
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp"%>
	</div>
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>
	<%@ include file="/WEB-INF/jsp/am/include/script.jsp"%>
	
	<script>
		$(function() {
			$('#batchRegistButton').on('click',function(){
				popup('/am/product/batchProductRegistPopup.do', "1100", "800", "no", "batchProductRegistPopup");
			});
			
			//체크박스 전체 선택
			$.checkBoxSelect("checkAll", "checkRow");

			// 카테고리 설정
			if ($("#frm").find("input[name='searchPrdCtgEnv']").val() != "") {
				getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
			}

			if ($("#frm").find("input[name='searchPrdCtgIdx']").val() != "") { getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
				getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
				getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
			}

			$(document).on("change", "#searchPrdCtgEnv", function() {
				getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
				getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
				getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
			});

			$(document).on("change", "#searchPrdCtgDepth1", function() {
				getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
				getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
			});

			$(document).on("change", "#searchPrdCtgDepth2", function() {
				getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
			});

			// 아이콘 전체선택
			$(document).on("click", "#searchPrdIcn1", function() {
				if ($("input:checkbox[id=searchPrdIcn1]").is(":checked") == true) {
					$("input:checkbox[name=searchPrdIcn]").attr("checked", true);
				}
			});

			$(document).on("click", "input[name=searchPrdIcn]", function() {
				if ($(this).is(":checked") == false) {
					$("input:checkbox[id=searchPrdIcn1]").attr("checked", false);
				}
			});

			// 검색 엔터 이벤트
			$('#searchForm').find("input").not(".datepicker").keydown(function(e) {
				if (e.keyCode == 13) {
					search();
				}
			});

			// 검색
			search = function() {
				var $searchForm = $("#searchForm");

				// 상품 카테고리 검색 조건
				var searchCategoryIdx = "";
				var tempCategoryIdx = "";

				tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth1 option:selected").val();
				if (tempCategoryIdx != '') {
					searchCategoryIdx = tempCategoryIdx;
				}

				tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth2 option:selected").val();
				if (tempCategoryIdx != '') {
					searchCategoryIdx = tempCategoryIdx;
				}

				tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth3 option:selected").val();
				if (tempCategoryIdx != '') {
					searchCategoryIdx = tempCategoryIdx;
				}

				$searchForm.find("#searchPrdCtgIdx").val(searchCategoryIdx);

				// 구간 검색 값 체크
				if ($searchForm.find("#searchTextStart").val() != "" && $searchForm.find("#searchTextEnd").val() == "") {
					alert("구간검색은 시작값과 종료값 모두를 입력하셔야 합니다.");
					$searchForm.find("#searchTextEnd").focus();
					return;
				}

				if ($searchForm.find("#searchTextStart").val() == "" && $searchForm.find("#searchTextEnd").val() != "") {
					alert("구간검색은 시작값과 종료값 모두를 입력하셔야 합니다.");
					$searchForm.find("#searchTextStart").focus();
					return;
				}

				$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
				$searchForm.attr({"action" : "<c:out value="${serverDomain}" />/am/product/basicProductList.do", "target" : "_self", "method" : "post"}).submit();
			};

			// 상단 요약 클릭
			goProductList = function(prdSellState) {
				var $frm = $("#sumForm");
				$frm.find("#searchPrdMstSellState").val(prdSellState);
				$frm.attr({"action" : "<c:out value="${serverDomain}"/>/am/product/basicProductList.do", "target" : "_self", "method" : "post"}).submit();
			};

			// 페이지 이동
			goPage = function(cPage) {
				var $frm = $("#frm");
				$frm.find("input[name='cPage']").val(cPage);
				$frm.attr({"action" : "<c:out value="${serverDomain}"/>/am/product/basicProductList.do", "target" : "_self", "method" : "post" }).submit();
			};

			// 상품 등록페이지 이동
			goForm = function() {
				var $frm = $("#frm");
				$frm.attr({"action" : "<c:out value="${serverDomain}"/>/am/product/basicProductForm.do", "target" : "_self", "method" : "post"}).submit();
			};

			// 상품 수정
			goView = function(prdMstCd) {
				var $frm = $("#frm");
				$frm.find('#PRD_MST_CD').val(prdMstCd);
				$frm.attr({"action" : "<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target" : "_self", "method" : "post"}).submit();
			};

			// 상품 상세페이지 이동 (프론트)
			goPreview = function(prdMstCd) {
				var openNewWindow = window.open("about:blank");
				openNewWindow.location.href = "<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=" + prdMstCd;
			};

			//상품 상세페이지 팝업
			goDetail = function(prdMstCd) {
				$('#detailForm input').val(prdMstCd);
				$('#detailForm').attr('action','<c:out value="${serverDomain}"/>/am/product/basicProductDetailPopup.do');
				$('#detailForm').attr('target','popup_ProductDetailPopup');
				$('#detailForm').attr('method','POST');
				popup('', "1100", "800", "no", "_ProductDetailPopup");
				$('#detailForm').submit();
			};

			//카테고리 변경 팝업
			categoryChangePopup = function() {
				if($("#prdList").find("input[type=checkbox]:checked").length==0){
					alert("상품을 선택해주세요.");
					return;
				}
				popup('', "1100", "800", "no", "_CategoryChangePopup");
				$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchProductCategoryChangePopup.do", "target":"popup_CategoryChangePopup", "method":"post"}).submit();
			};
			
			//보류사유 팝업
			goPendingHistoryPopup = function(prdMstCd) {
				$('#detailForm input').val(prdMstCd);
				$('#detailForm').attr('action','<c:out value="${serverDomain}"/>/am/product/pendingHistoryPopup.do');
				$('#detailForm').attr('target','popup_PendingHistoryPopup');
				$('#detailForm').attr('method','POST');
				popup('', "1100", "800", "no", "_PendingHistoryPopup");
				$('#detailForm').submit();
			};
			
			getSelectedProductList = function(){
				return $("#prdList").find("input[type=checkbox]:checked");
			}
			
			//태그 일괄수정 팝업
			tagBatchEditPopup = function() {
				if($("#prdList").find("input[type=checkbox]:checked").length==0){
					alert("상품을 선택해주세요.");
					return;
				}
				
				var tagUpdatePopup = popup('', "900", "500", "no", "_TagBatchEditPopup");
				$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/product/tagBatchEditPopup.do", "target":"popup_TagBatchEditPopup",  "method":"post"}).submit();	
			};
			
			tagBatchEditPopupvdr = function() {
				if($("#prdList").find("input[type=checkbox]:checked").length==0){
					alert("상품을 선택해주세요.");
					return;
				}
				
				var tagUpdatePopup = popup('', "900", "500", "no", "_TagBatchEditPopup");
				$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/product/tagBatchEditPopup.do", "target":"popup_TagBatchEditPopup",  "method":"post"}).submit();	
			};			
			
			fnSelectTagPopupResult = function(tagData){
				if(tagData == null || tagData.length<1){
					alert("선택된 태그가 없습니다.");
					return;
				}
				
				//console.log ( 'tagData : ' + tagData ) ;
				
				
				$.ajax({
	                async : false,
	                type : "POST",
	                data : {"tagData":tagData},
	                url : "<c:out value="${serverDomain}" />/am/product/tagBatchModify.do",
	                success : function (data) 
	                {
	                    if(data.resultCode != "200")
	                    {
	                    	alert("오류가 발생하였습니다.");
	                    }
	                    else{
	                    	alert("성공적으로 수정하였습니다.");
	                    }
	                },
	                error : function (err)
	                {
	                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                }
	            });
			}

			//상품 일괄수정 팝업
			productBatchEditPopup = function() {
				popup('', "1100", "800", "no", "_ProductBatchEditPopup");
				$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/product/productBatchEdit.do", "target":"popup_ProductBatchEditPopup", "method":"post"}).submit();
			};

			// 엑셀 다운로드
			$(document).on("click", "#excelDown", function() {
				if ("${paging.totalRecordCount}" > 10000) {
					alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
					return;
				} else if ("${paging.totalRecordCount}" == 0) {
					alert("저장할 내역이 없습니다.");
					return;
				}
				if ("${commandMap.searchYn }" != "Y") {
					alert("검색을 해주시기 바랍니다.");
					return;
				}
				
				var $searchForm = $("#frm");
				$searchForm.attr({"action" : "<c:out value="${serverDomain}" />/am/product/basicProductListExcelDownload.do","target" : "_self", "method" : "post"}).submit();
			});

			// 상품 수정
			$(document).on("click","#productModify",	function() {
				if ($(".checkRow:checked").length == 0) {
					alert("수정 할 상품을 선택해 주십시오.");
					return;
				}

				var prdMstCd = "";
				var result = true;
				
				$(".checkRow:checked").each(function() {
					prdMstCd = $(this).val();
					
					if (prdMstCd != "") {
						if ($("input[name=PRD_MST_NM_"+ prdMstCd + "]").val() == "") {
							alert("변경 할 상품명을 입력해주세요.");
							$("input[name=PRD_MST_NM_"+ prdMstCd+ "]").focus();
							result = false;
							return false;
						}
						
						if ($("input[name=PRD_MST_PRC_"	+ prdMstCd + "]").val() == "") {
							alert("변경 할 판매가를 입력해주세요.");
							$("input[name=PRD_MST_PRC_"	+ prdMstCd+ "]").focus();
							result = false;
							return false;
						}
						
						if (getInt($("input[name=PRD_MST_PRC_" + prdMstCd + "]").val()) < 0) {
							alert("변경 할 판매가를 정수로 입력해주세요.");
							$("input[name=PRD_MST_PRC_"+ prdMstCd+ "]").focus();
							result = false;
							return false;
						}
						
						if ($("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").val() == "") {
							alert("변경 할 검색가를 입력해주세요.");
							$("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").focus();
							result = false;
							return false;
						}
						
						if (getInt($("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").val()) < 0) {
							alert("변경 할 검색가를 정수로 입력해주세요.");
							$("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").focus();
							result = false;
							return false;
						}
						
						if ($("input[name=PRD_MST_DLV_FEE_" + prdMstCd + "]").val() == "") {
							alert("변경 할 배송비를 입력해주세요.");
							$("input[name=PRD_MST_DLV_FEE_" + prdMstCd + "]").focus();
							result = false;
							return false;
						}
						
						if (getInt($("input[name=PRD_MST_DLV_FEE_" + prdMstCd + "]").val()) < 0) {
							alert("변경 할 배송비를 정수로 입력해주세요.");
							$("input[name=PRD_MST_DLV_FEE_"+ prdMstCd + "]").focus();
							result = false;
							return false;
						}
						
						if ($("input[name=PRD_MST_SEL_CNT_"+ prdMstCd+ "]").val() == "") {
							alert("변경 할 판매가능수량을 입력해주세요.");
							$("input[name=PRD_MST_SEL_CNT_"+ prdMstCd + "]").focus();
							result = false;
							return false;
						}
						
						if (getInt($("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").val()) < 0) {
							alert("변경 할 판매가능수량을 정수로 입력해주세요.");
							$("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").focus();
							result = false;
							return false;
						}
						if ($("input[name=PRD_MST_PC_CPN_PRC_" + prdMstCd + "]").val() != "" || $("input[name=PRD_MST_MB_CPN_PRC_" + prdMstCd + "]").val() != "") {
							if ($("select[name=PRD_MST_CPN_OWN_" + prdMstCd + "]").val() == "") {
								alert("즉시쿠폰 주최 업체를 선택해주세요.");
								$("select[name=PRD_MST_CPN_OWN_" + prdMstCd + "]").focus();
								result = false;
								return false;
							}
						}
					}
				});

				if (result) {
					if (confirm("수정 하시겠습니까?")) {
						//콤마제거
						$(".checkRow:checked").each(function() {
							
							prdMstCd = $(this).val();
							
							$("input[name=PRD_MST_PRC_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_PRC_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_DLV_FEE_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_DLV_FEE_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_PC_CPN_PRC_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_PC_CPN_PRC_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_MB_CPN_PRC_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_MB_CPN_PRC_" + prdMstCd + "]").val()));
							
						});

						var $frm = $("#frm");
						$frm.attr({"action" : "<c:out value="${serverDomain}" />/am/product/basicProductListModify.do", "target" : "_self", "method" : "post"}).submit();
					}
				}
			});

			// 입점업체 상품 수정
			$(document).on("click", "#productVdrModify", function() {
				if ($(".checkRow:checked").length == 0) {
					alert("수정 할 상품을 선택해 주십시오.");
					return;
				}

				var prdMstCd = "";
				var needRejectPopup = false;
				$(".checkRow:checked").each(function() {
					
					prdMstCd = $(this).val();
					if (prdMstCd != "") {
						if ($("input[name=PRD_MST_PRC_" + prdMstCd + "]").val() == "") {
							alert("변경 할 판매가를 입력해주세요.");
							$("input[name=PRD_MST_PRC_" + prdMstCd + "]").focus();
							return false;
						}
						if (getInt($("input[name=PRD_MST_PRC_"+ prdMstCd + "]").val()) < 0) {
							alert("변경 할 판매가를 정수로 입력해주세요.");
							$("input[name=PRD_MST_PRC_" + prdMstCd + "]").focus();
							return false;
						}
						if ($("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").val() == "") {
							alert("변경 할 검색가를 입력해주세요.");
							$("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").focus();
							return false;
						}
						if (getInt($("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").val()) < 0) {
							alert("변경 할 검색가를 정수로 입력해주세요.");
							$("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").focus();
							return false;
						}
						if ($("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").val() == "") {
							alert("변경 할 판매가능수량을 입력해주세요.");
							$("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").focus();
							return false;
						}
						if (getInt($("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").val()) < 0) {
							alert("변경 할 판매가능수량을 정수로 입력해주세요.");
							$("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").focus();
							return false;
						}
						
						var orgState = $("#PRD_MST_APV_STATE_"+prdMstCd).data("prd_mst_apv_state");
						var curState = $("#PRD_MST_APV_STATE_"+prdMstCd).val();
						if("C" == curState && orgState != curState){
							needRejectPopup = true;
						}
					}
				});

				if(needRejectPopup){
					alert("보류 사유를 먼저 등록해야합니다.");
					changeProductHoldState();
					return;
				}
				
				if (confirm("수정 하시겠습니까?")) {
					//콤마제거
					$(".checkRow:checked").each(function() {
						prdMstCd = $(this).val();
							$("input[name=PRD_MST_PRC_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_PRC_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_SCH_PRC_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_DLV_FEE_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_DLV_FEE_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_SEL_CNT_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_PC_CPN_PRC_" + prdMstCd + "]").val(removeComma($("input[name=PRD_MST_PC_CPN_PRC_" + prdMstCd + "]").val()));
							$("input[name=PRD_MST_MB_CPN_PRC_" + prdMstCd + "]").val( removeComma($("input[name=PRD_MST_MB_CPN_PRC_" + prdMstCd + "]").val()));
						});
	
					var $frm = $("#frm");
					$frm.attr({"action" : "<c:out value="${serverDomain}" />/am/product/basicProductListModify.do", "target" : "_self", "method" : "post"}).submit();
				}
			});

			// 상품 삭제
			$(document).on("click", "#productDelete", function() {
				if ($(".checkRow:checked").length == 0) {
					alert("삭제 할 상품을 선택해 주십시오.");
					return;
				}

				if (confirm("삭제 하시겠습니까?")) {
					var $frm = $("#frm");
					$frm.attr({"action" : "<c:out value="${serverDomain}" />/am/product/basicProductDelete.do", "target" : "_self", "method" : "post"}).submit();
				}
			});
			
			// 입점업체 상품 삭제
			$(document).on("click", "#productVdrDelete", function() {
				if ($(".checkRow:checked").length == 0) {
					alert("삭제 할 상품을 선택해 주십시오.");
					return;
				}

				if (confirm("삭제 하시겠습니까?")) {
					var $frm = $("#frm");
					$frm.attr({"action" : "<c:out value="${serverDomain}" />/am/product/basicProductDelete.do", "target" : "_self", "method" : "post"}).submit();
				}
			});

			// 상품 복사
			$(document).on("click", "#productCopy", function() {
				if ($(".checkRow:checked").length == 0) {
					alert("복사 할 상품을 선택해 주십시오.");
					return;
				}

				if ($(".checkRow:checked").length > 1) {
					alert("복사 할 상품을 1개만 선택해 주십시오.");
					return;
				}

				if (confirm("복사 하시겠습니까?")) {
					$("#PRD_MST_CD").val($(".checkRow:checked").val());
					var $frm = $("#frm");
					$frm.attr({"action" : "<c:out value="${serverDomain}"/>/am/product/basicProductForm.do", "target" : "_self", "method" : "post"}).submit();
				}
			});
			
			//입점업체 상품 복사
			$(document).on("click", "#productVdrCopy", function() {
				if ($(".checkRow:checked").length == 0) {
					alert("복사 할 상품을 선택해 주십시오.");
					return;
				}

				if ($(".checkRow:checked").length > 1) {
					alert("복사 할 상품을 1개만 선택해 주십시오.");
					return;
				}

				if (confirm("복사 하시겠습니까?")) {
					$("#PRD_MST_CD").val($(".checkRow:checked").val());
					var $frm = $("#frm");
					$frm.attr({"action" : "<c:out value="${serverDomain}"/>/am/product/basicProductForm.do", "target" : "_self", "method" : "post"}).submit();
				}
			});
		});
		
		$(document).on("click",".changeStatus",function(){
			var arrayObj = new Array();
			var btnNM= $(this).children()[0].textContent;
			test4 = btnNM;
			if($("#prdList").find("input[type=checkbox]:checked").length==0){
				alert("상품을 선택해주세요.");
				return;
			}
			$("#prdList").find("input[name=PRD_MST_CDs]:checked").each(function(){
				
				
				var obj = new Object();
				var firstTr = $(this).parent().parent();
				var secondTr = $(this).parent().parent().next();
				
				obj.PRD_MST_CD = firstTr.find("input[name=PRD_MST_CD]").val();
				obj.PRD_MST_CD = $(this).val();
				
				
				if(btnNM == "진열 ON"){
					obj.PRD_MST_DPL_STATE = "Y";
					$("#batchPrdMstDplState").val('Y');
				}
				else if(btnNM == "진열 OFF"){
					obj.PRD_MST_DPL_STATE = "N";
					$("#batchPrdMstDplState").val('N');					
				}
				else if(btnNM == "임직원할인ON"){
					obj.PRD_MST_EMP_USE_YN = "Y";
					$("#batchPrdMstEmpUseYn").val('Y');
					
				}
				else if(btnNM == "임직원할인OFF"){
					obj.PRD_MST_EMP_USE_YN = "N";
					$("#batchPrdMstEmpUseYn").val('N');					
				}
				else if(btnNM == "제휴사할인ON"){
					obj.PRD_MST_PRT_USE_YN = "Y";
					$("#batchPrdMstPrtUseYn").val('Y');					
				}
				else if(btnNM == "제휴사할인OFF"){
					obj.PRD_MST_PRT_USE_YN = "N";
					$("#batchPrdMstPrtUseYn").val('N');					
				}
				else if(btnNM == "네이버 ON"){
					obj.PRD_MST_NAVER_USE_YN = "Y";
					$("#batchPrdMstNaverUseYn").val('Y');					
				}
				else if(btnNM == "네이버 OFF"){
					obj.PRD_MST_NAVER_USE_YN = "N";
					$("#batchPrdMstNaverUseYn").val('N');					
				}
				else if(btnNM == "다음 ON"){
					obj.PRD_MST_DAUM_USE_YN = "Y";
					$("#batchPrdMstDaumUseYn").val('Y');						
				}
				else if(btnNM == "다음 OFF"){
					obj.PRD_MST_DAUM_USE_YN = "N";
					$("#batchPrdMstDaumUseYn").val('N');					
				}
				else if(btnNM == "상품명 업데이트"){
					obj.PRD_MST_NM = firstTr.find("input[name=PRD_MST_NM]").val();
				}
				else if(btnNM == "재고 업데이트"){
					obj.PRD_MST_SEL_CNT = secondTr.find("input[name=PRD_MST_SEL_CNT]").val();
				}
				arrayObj.push(obj);
			});
			$("#productData").val(JSON.stringify(arrayObj));
			
			//return;
			var $frm = $("#frm");
			$frm.attr({"action" : "<c:out value="${serverDomain}"/>/am/product/basicProductStatusListModify.do", "target" : "_self", "method" : "post"}).submit();
		});
		
		// 상품 보류
		changeProductHoldState = function(){
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
			

		}
		
		fnResultHoldPopup = function(){
			alert('정상적으로 처리되었습니다.');
			search();
			
		};
		
		$(document).on("click",".changeAllStatus",function(){
			var arrayObj = new Array();
			var validation = true;
			if($("#prdList").find("input[type=checkbox]:checked").length==0){
				alert("상품을 선택해주세요.");
				return;
			}
			
			$("#prdList").find("input[type=checkbox]:checked").each(function(){
				var obj = new Object();
				var firstTr = $(this).parent().parent();
				var secondTr = $(this).parent().parent().next();
				obj.PRD_IMAGE = firstTr.find("img[name=PRD_IMAGE]").attr("src");
				obj.PRD_MST_CD = firstTr.find("input[name=PRD_MST_CD]").val();
				obj.PRD_MST_NM = firstTr.find("input[name=PRD_MST_NM]").val();
				obj.PRD_MST_PRC = firstTr.find("input[name=PRD_MST_PRC]").val();
				obj.PRD_MST_SALE_RATE = firstTr.find("input[name=PRD_MST_SALE_RATE]").val();
				obj.PRD_MST_SEL_CNT = secondTr.find("input[name=PRD_MST_SEL_CNT]").val();
				obj.PRD_MST_DLV_FEE = firstTr.find("select[name=PRD_MST_DLV_FEE] option:selected").val();
				obj.PRD_MST_UNT = firstTr.find("select[name=PRD_MST_UNT] option:selected").val();
				obj.PRD_MST_EMP_USE_YN = firstTr.find("select[name=PRD_MST_EMP_USE_YN] option:selected").val();
				obj.PRD_MST_PRT_USE_YN = firstTr.find("select[name=PRD_MST_PRT_USE_YN] option:selected").val();
				obj.PRD_MST_NAVER_USE_YN = firstTr.find("select[name=NAVER_USE] option:selected").val();
				obj.PRD_MST_DAUM_USE_YN = secondTr.find("select[name=DAUM_USE] option:selected").val();
				obj.PRD_MST_DPL_STATE = secondTr.find("select[name=PRD_MST_DPL_STATE] option:selected").val();
				obj.PRD_MST_SEL_STATE = secondTr.find("select[name=PRD_MST_SEL_STATE] option:selected").val();
				obj.PRD_MST_APV_STATE = secondTr.find("select[name=PRD_MST_APV_STATE] option:selected").val();
				arrayObj.push(obj);
				if(obj.PRD_MST_NM.trim() == ""){
					alert("상품명을 입력해주세요.");
					validation = false;
					return false;
				}
				if(obj.PRD_MST_PRC.trim() == ""){
					alert("판매가을 입력해주세요.");
					validation = false;
					return false;
				}
				if(obj.PRD_MST_SALE_RATE.trim() == ""){
					alert("할인율을 입력해주세요.");
					validation = false;
					return false;
				}
				if(obj.PRD_MST_SEL_CNT.trim() == ""){
					alert("판매가능수량을 입력해주세요.");
					validation = false;
					return false;
				}
			});
			if(validation){
				$("#productData").val(JSON.stringify(arrayObj));
				var $frm = $("#frm");
				$frm.attr({"action" : "<c:out value="${serverDomain}"/>/am/product/basicProductModify.do", "target" : "_self", "method" : "post"}).submit();
			}
		});
		
		function onChangeProductPrice(originPrice, productCode){
			if ($("select[name=PRD_MST_UNT_" + productCode + "] option:selected").val() == "R") {
				var rate = parseInt($("input[name=PRD_MST_SALE_RATE_" + productCode + "]").val());
				if (rate > 100) {
					rate = 100;
				}
				$("input[name=PRD_MST_SALE_RATE_" + productCode + "]").val(rate);
				$("input[name=PRD_MST_PRC_" + productCode + "]").val(originPrice * (100 - rate) / 100);
			}else {
				var sale = $("input[name=PRD_MST_SALE_RATE_" + productCode + "]").val();
				var salePrice = parseInt(originPrice) - parseInt(sale);
				if(salePrice<0){ 
					sale = originPrice;
					salePrice = 0;
				}
				$("input[name=PRD_MST_SALE_RATE_" + productCode + "]").val(sale);
				$("input[name=PRD_MST_PRC_" + productCode + "]").val(salePrice);
			}
		}
	//-->
	</script>
</body>
</html>
