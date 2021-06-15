<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
	<a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

	<aside id="navigation"><!-- navigation -->
		<nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</nav>
	</aside><!-- // navigation -->

	<div id="body"><!-- body -->

		<section id="contents"><!-- contents -->

			<div id="breadcrumb"><!-- breadcrumb -->
				<a href="#none"><i class="icon-home em"></i> HOME</a>
				&gt;
				<a href="#none">상품관리</a>
				&gt;
				<span>상품등록</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">상품등록</h3>

                <form id="searchForm" name="searchForm">
	                <input type="hidden" name="searchErpPrdMstCd" value="<c:out value="${commandMap.searchErpPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>"/>
	                <input type="hidden" name="searchPrdMstNmPos" value="<c:out value="${commandMap.searchPrdMstNmPos }"/>"/>
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
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
	                <input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	                
	                <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
                    
                    <input type="hidden" id="PRD_CTG_ENV"  name="PRD_CTG_ENV" value="${commandMap.PRD_CTG_ENV}" />
                    
                </form>
                
                <form id="frm" name="frm">
	                <input type="hidden" name="searchErpPrdMstCd" value="<c:out value="${commandMap.searchErpPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>"/>
	                <input type="hidden" name="searchPrdMstNmPos" value="<c:out value="${commandMap.searchPrdMstNmPos }"/>"/>
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
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
	                <input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
                    
                    <input type="hidden" id="PRD_MST_ONLINE_YN" name="PRD_MST_ONLINE_YN" value="N" />
                    <input type="hidden" id="PRD_MST_SEL_STATE_OLD" name="PRD_MST_SEL_STATE_OLD" value="" />
                    <input type="hidden" id="COMP_CD" name="COMP_CD" value="" />
                    <input type="hidden" id="PRD_MST_SHOP_CD" name="PRD_MST_SHOP_CD" value="" />
                    <input type="hidden" id="PRD_MST_SHOP_NM" name="PRD_MST_SHOP_NM" value="" />
                    
                    <input type="hidden" id="product_image_env" name="product_image_env" value="" /> <!-- 상품 이미지 순번 정보 - 팝업 등록에서 사용함 -->

					<h4 class="title">기본정보 (<span><em class="strong">*</em> 필수항목</span>)</h4>

					<div class="table-a">
						<!-- col list -->
						<table class="core tdleft">
							<colgroup>
								<col style="width: 15%;" />
								<col style="width: 35%;" />
								<col style="width: 15%;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody id="erpProductInfo">
								<tr>
									<th><span>ERP 제품코드 <em class="strong">*</em></span></th>
									<td>
									</td>
									<th>제품명</th>
									<td></td>
								</tr>
								<tr>
									<th><span>매장선택 <em class="strong">*</em></span></th>
									<td>
										<input type="text" id="PRD_MST_SHOP_TEXT" name="PRD_MST_SHOP_TEXT" class="text" style="width:50%" value="" maxlength="66"  />
										<a href="javascript:searchMiniShop()" class="button button-b small js-modal" title="새 창 으로 열립니다.">
											<span>찾기</span>
										</a>									
									</td>
									<th><span>온라인상품코드 <em class="strong">*</em></span></th>
									<td>
										<input type="text" id="PRD_MST_CD" name="PRD_MST_CD" class="text" style="width:70%" value="" maxlength="66"  />
										<a href="javascript:searchOnlineProduct()" class="button button-b small js-modal" title="새 창 으로 열립니다.">
											<span>찾기</span>
										</a>
									</td>  
								</tr>

								<tr>
									<th><span>몰상품명 <em class="strong">*</em></span></th>
									<td></td>
									<th>업체구분</th>
									<td></td>
								</tr>
								<tr>
									<th>품종</th>
									<td></td>
									<th>시즌</th>
									<td></td>
								</tr>
								<tr>
									<th>기획년도</th>
									<td></td>
									<th>성별</th>
									<td></td>
								</tr>
								<tr>
									<th>제품라인</th>
									<td></td>
									<th>생산제품형태</th>
									<td></td>
								</tr>
								<tr>
									<th>기획구분1</th>
									<td></td>
									<th>기획구분2</th>
									<td></td>
								</tr>
								<tr>
									<th>신상품기준년월</th>
									<td></td>
									<th>라이센스유무</th>
									<td></td>
								</tr>								
								<tr>
									<th>등록일시</th>
									<td></td>
									<th>수정일시</th>
									<td></td>
								</tr>								
							</tbody>
						</table>
					</div>
					<!-- // col list -->


					<div class="title-box">
						<h4 class="title"> 옵션정보</h4>
					</div>

					<div class="table-a"><!-- col list -->
						<table class="core">
							<colgroup>
								<col style="width: 25%;" />
								<col style="width: 25%;" />
								<col style="width: 25%;" />
								<col style="width: auto;" />
							</colgroup>
							<thead>
								<tr>
									<th>COLOR</th>
									<th>SIZE</th>
									<th>매장재고</th>
									<th>품절처리</th>
								</tr>
							</thead>
							<tbody id="productOptionList">
								<tr>
									<td colspan="4">옵션이 존재하지 않습니다.</td>
								</tr>
							</tbody>
						</table>
					</div><!-- // col list -->
					
					<div class="title-box">
						<h4 class="title"> 전시정보 (<span><em class="strong">*</em> 필수항목</span>)</h4>
					</div>
					
					<div class="table-a">
						<!-- col list -->
						<table class="core tdleft">
							<colgroup>
								<col style="width: 15%;" />
								<col style="width: 35%;" />
								<col style="width: 15%;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>쇼핑채널 <em class="strong">*</em></span></th>
									<td>
										<input type="checkbox" class="checkbox" name="PRD_MST_CNL_PC_YN" id="PRD_MST_CNL_PC_YN" value="Y" /><label for="PRD_MST_CNL_PC_YN" > PC</label>
										<input type="checkbox" class="checkbox" name="PRD_MST_CNL_MB_YN" id="PRD_MST_CNL_MB_YN" value="Y" /><label for="PRD_MST_CNL_MB_YN" > MOBILE</label>
									</td>
									<th><span>판매상태 <em class="strong">*</em></span></th>
									<td>
										<select class="select" id="PRD_MST_SEL_STATE" name="PRD_MST_SEL_STATE" >
											<option value="">선택</option>
											<option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />">판매중</option>
											<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" >품절상품</option>
											<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />">미판매</option>
										</select>
								    </td>
								</tr>
								<tr>
									<th><span>ACTIVITY <em class="strong">*</em></span></th>
									<td colspan="3">
									<c:choose>
									<c:when test="${not empty activityList}">
    	                            <c:forEach var="act" items="${activityList}" varStatus="status">
										<input type="checkbox" class="checkbox" id="PRD_MST_ACTIVITY_${act.RNUM}" name="PRD_MST_ACTIVITY" value="${act.CMN_COM_IDX}" /><label for="PRD_MST_ACTIVITY_${act.RNUM}" > ${act.CMN_COM_NM}</label>
                        		    </c:forEach>
                        	    	</c:when>
                        	    	</c:choose>
									</td>
								</tr>
								
								<tr id="pc_category">
									<th><span>PC카테고리 <em class="strong">*</em></span></th>
									<td colspan="3" class="left">
										<div id="divCategory"><!-- 카테고리 -->
											<div class="section-button"><!-- section button -->
												<a href="#none" id="goCategoryDelete_${Code.CATEGORY_TYPE_PC}" class="button button-a small"><span>선택삭제</span></a>
												<a id="goCategoryPopup" href="javascript:registPopup('${Code.CATEGORY_TYPE_PC}');" class="button button-b small js-modal" title="새 창 으로 열립니다."><span>카테고리 추가</span></a>

											</div><!-- // section button -->

											<div class="table-a"><!-- col list -->
												<table class="core" id="tableCategory">
													<colgroup>
														<col style="width: 40px;" />
														<col style="width: auto;" />
													</colgroup>
													<thead>
														<tr>
															<th><input type="checkbox" class="checkbox checkAll_${Code.CATEGORY_TYPE_PC}" /></th>
															<th>카테고리 경로</th>
														</tr>
													</thead>
													<tbody id="applyCategoryList_${Code.CATEGORY_TYPE_PC}">
					   	        	                    <tr id="categoryNodata_${Code.CATEGORY_TYPE_PC}"><!-- row -->
															<td colspan="2">카테고리를 추가해 주세요.</td>
					       	    	                    </tr>
													</tbody>
												</table>
											</div><!-- // col list -->
										</div><!-- // 카테고리 -->
									</td>
								</tr>
								<tr id="mobile_category">
									<th><span>모바일카테고리 <em class="strong">*</em></span></th>
									<td colspan="3" class="left">
										<div id="divCategory"><!-- 카테고리 -->
											<div class="section-button"><!-- section button -->
												<a href="#none" id="goCategoryDelete_${Code.CATEGORY_TYPE_MOBILE}" class="button button-a small"><span>선택삭제</span></a>
												<a id="goCategoryPopup" href="javascript:registPopup('${Code.CATEGORY_TYPE_MOBILE}');" class="button button-b small js-modal" title="새 창 으로 열립니다."><span>카테고리 추가</span></a>

											</div><!-- // section button -->

											<div class="table-a"><!-- col list -->
												<table class="core" id="tableCategory">
													<colgroup>
														<col style="width: 40px;" />
														<col style="width: auto;" />
													</colgroup>
													<thead>
														<tr>
															<th><input type="checkbox" class="checkbox checkAll_${Code.CATEGORY_TYPE_MOBILE}" /></th>
															<th>카테고리 경로</th>
														</tr>
													</thead>
													<tbody id="applyCategoryList_${Code.CATEGORY_TYPE_MOBILE}">						                           
					   	        	                    <tr id="categoryNodata_${Code.CATEGORY_TYPE_MOBILE}"><!-- row -->
															<td colspan="2">카테고리를 추가해 주세요.</td>
					       	    	                    </tr>
													</tbody>
												</table>
											</div><!-- // col list -->
										</div><!-- // 카테고리 -->	
									</td>
								</tr>
								<tr>
									<th>정상가</th>
									<td id="PrdNormalPrice"> 원</td>
									<th>판매가</th>
									<td id="PrdSellPrice"> 원 / 할인율 : %</td>
								</tr>
								<tr>
									<th>상품아이콘</th>
									<td colspan="3" class="left">* [EVENT] 아이콘은 기획전에 상품이 등록된 경우 자동으로 나타납니다.<br />
										<div class="table-a">
											<!-- col list -->
											<table class="core">
												<colgroup>
													<col style="width: 15%;" />
													<col style="width: 20%;" />
													<col style="width: auto;" />
													<col style="width: 15%;" />
												</colgroup>
												<tbody>
												<c:choose>
												<c:when test="${not empty iconList}">
												<c:set var="listNum" value="${paging.listNum}" />
												<c:forEach var="item" items="${iconList }" varStatus="status">
													<c:if test="${fn:length(Code.PRODUCT_ICON_NM[item.NO]) > 0 }">
													<input type="hidden" name="ICN_MST_IDX" value="${item.ICN_MST_IDX}" />
													<input type="hidden" name="ICN_MST_TYPE" value="${item.NO}" />
													<tr>
														<th>${Code.PRODUCT_ICON_NM[item.NO]}</th>
														<td>
															<div class="field">
																<input type="radio" id="ICN_MST_USE_YN1_${item.NO}" class="radio" name="ICN_MST_USE_YN_${item.NO}" value="Y" <ui:select v="${item.ICN_MST_USE_YN }" t="Y" g="checked"/> />
																<label for="ICN_MST_USE_YN1_${item.NO}">사용</label>
																<input type="radio" id="ICN_MST_USE_YN2_${item.NO}" class="radio" name="ICN_MST_USE_YN_${item.NO}" value="N" <ui:select v="${item.ICN_MST_USE_YN }" t="N" g="checked"/> />
																<label for="ICN_MST_USE_YN2_${item.NO}">미사용</label>
															</div></td>
														<td>노출기간 : 
															<input type="text" class="text datepicker s-datepicker" id="ICN_MST_ST_DT_${item.NO}" name="ICN_MST_ST_DT_${item.NO}" value="" />
															 ~
															<input type="text" class="text datepicker e-datepicker" id="ICN_MST_ED_DT_${item.NO}" name="ICN_MST_ED_DT_${item.NO}" value="" />
															(날짜형식: YYYY-MM-DD)
														</td>
														<td><input type="checkbox" id="ICN_MST_DT_YN_${item.NO}" name="ICN_MST_DT_YN_${item.NO}" value="Y" /><label for="ICN_MST_DT_YN_${item.NO}" > 제한없음</label></td>
													</tr>
													</c:if>
												</c:forEach>
					                            </c:when>
					                            </c:choose>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<th>계절입력</th>
									<td colspan="3">
										<div class="table-b">
											<!-- col list -->
											<table class="core">
										 		<colgroup>
													<col style="width: 15%;" />
													<col style="width: 15%;" />
													<col style="width: 15%;" />
													<col style="width: 15%;" />
													<col style="width: 15%;" />
													<col style="width: auto;" />
												</colgroup>
												<tr>
													<td colspan="6"><input type="checkbox" class="checkbox" name="PRD_MST_MONTH_ALL" id="PRD_MST_MONTH_ALL" value="Y" /><label for="PRD_MST_MONTH_ALL" > ALL</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_1" name="PRD_MST_SESN_MONTH" value="1" /><label for="PRD_MST_SESN_MONTH_1" > 1월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_2" name="PRD_MST_SESN_MONTH" value="2" /><label for="PRD_MST_SESN_MONTH_2" > 2월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_3" name="PRD_MST_SESN_MONTH" value="3" /><label for="PRD_MST_SESN_MONTH_3" > 3월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_4" name="PRD_MST_SESN_MONTH" value="4" /><label for="PRD_MST_SESN_MONTH_4" > 4월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_5" name="PRD_MST_SESN_MONTH" value="5" /><label for="PRD_MST_SESN_MONTH_5" > 5월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_6" name="PRD_MST_SESN_MONTH" value="6" /><label for="PRD_MST_SESN_MONTH_6" > 6월</label></td>
												</tr>
												<tr>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_7" name="PRD_MST_SESN_MONTH" value="7" /><label for="PRD_MST_SESN_MONTH_7" > 7월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_8" name="PRD_MST_SESN_MONTH" value="8" /><label for="PRD_MST_SESN_MONTH_8" > 8월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_9" name="PRD_MST_SESN_MONTH" value="9" /><label for="PRD_MST_SESN_MONTH_9" > 9월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_10" name="PRD_MST_SESN_MONTH" value="10" /><label for="PRD_MST_SESN_MONTH_10" > 10월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_11" name="PRD_MST_SESN_MONTH" value="11" /><label for="PRD_MST_SESN_MONTH_11" > 11월</label></td>
													<td><input type="checkbox" class="checkbox" id="PRD_MST_SESN_MONTH_12" name="PRD_MST_SESN_MONTH" value="12" /><label for="PRD_MST_SESN_MONTH_12" > 12월</label></td>
												</tr>
										 	</table>
									 	</div>
									</td>
								</tr>

							</tbody>
						</table>
					</div><!-- // col list -->
					
					<div class="title-box">
						<h4 class="title"> 추가/기술정보</h4>
					</div>
					
					<div class="table-a">
						<!-- col list -->
						<table class="core tdleft">
							<colgroup>
								<col style="width: 15%;" />
								<col style="width: 35%;" />
								<col style="width: 15%;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th>
										홍보문구<br/>
										<a href="javascript:fnSearchPopup('SellingPoint')" class="button button-b small" title="새 창 으로 열립니다."><span>항목찾기</span></a>
									</th>
									<td>
										<input type="hidden" id="PRD_PRM_IDX" name="PRD_PRM_IDX" value="${productInfo.PRM_IDX}" />
										<div id="PRD_PRM_TEXT">${productInfo.PRM_TEXT}</div>
										<input type="checkbox" id="LI_PRD_PRM_IDX" name="LI_PRD_PRM_IDX" value="${productInfo.PRM_IDX}" />
										<label for="LI_PRD_PRM_IDX">삭제</label>
									</td>
									<th>
										사이즈가이드<br/>
										<a href="javascript:fnSearchPopup(${Code.PRODUCT_GUIDE_SIZE})" class="button button-b small" title="새 창 으로 열립니다.">
										<span>항목찾기</span></a>
									</th>
									<td>
										<input type="hidden" id="PRD_SZG_IDX" name="PRD_SZG_IDX" value="${productInfo.PRD_SZG_IDX}" />
										<div id="PRD_SZG_TITLE">${productInfo.PRD_SZG_TITLE}</div>
										<input type="checkbox" id="LI_PRD_SZG_IDX" name="LI_PRD_SZG_IDX" value="${productInfo.PRD_SZG_IDX}" />
										<label for="LI_PRD_SZG_IDX">삭제</label>
									</td>
								</tr>
								<tr>
									<th>
										세탁&취급안내<br/>
										<a href="javascript:fnSearchPopup(${Code.PRODUCT_GUIDE_WASH})" class="button button-b small" title="새 창 으로 열립니다.">
										<span>항목찾기</span></a>
									</th>
									<td>
										<input type="hidden" id="PRD_WASH_IDX" name="PRD_WASH_IDX" value="${productInfo.PRD_WASH_IDX}" />
										<div id="PRD_WASH_TITLE">${productInfo.PRD_WASH_TITLE}</div>
										<input type="checkbox" id="LI_PRD_WASH_IDX" name="LI_PRD_WASH_IDX" value="${productInfo.PRD_WASH_IDX}" />
										<label for="LI_PRD_WASH_IDX">삭제</label>										
									</td>								
									<th>
										기술정보<br/>
										<a href="javascript:fnSearchPopup('TechInfo')" class="button button-b small" title="새 창 으로 열립니다.">
										<span>항목찾기</span></a>
									</th>
									<td>
										<div class="field" id="tdPrdTechInfoHeight">
											<ul id="ulProductTechInfo" style="width: 300px;">
											<c:set var="prdTechInfoHeight" value="100" />
											<c:choose>
											<c:when test="${not empty techInfoList}">
											<c:forEach var="item" items="${techInfoList }" varStatus="status">
												<li class="ui-state-default" style="padding: 5px 10px; margin-top: 2px;">
													${item.BRD_SHG_TITLE } 
													<input type="hidden" id="PRD_SHG_IDX_${item.PRD_BRD_SHG_IDX }" name="PRD_SHG_IDXs" value="${item.PRD_BRD_SHG_IDX }" />
													<input type="checkbox" id="LI_DEL_PRD_SHG_IDX_${item.PRD_BRD_SHG_IDX }" name="LI_DEL_PRD_SHG" value="${item.PRD_BRD_SHG_IDX }" />
													<label for="LI_DEL_PRD_SHG_IDX_${item.PRD_BRD_SHG_IDX }">삭제</label>
												</li>
											<c:set var="prdTechInfoHeight" value="${prdTechInfoHeight + 30 }" />
											</c:forEach>
											</c:when>
											</c:choose>
											</ul>
										</div>
									</td>
								</tr>	
							</tbody>
						</table>
						<!-- // col list -->
					</div>

					<div id="menuViewTab" class="tab-a justified" style="margin-top: 20px; border-bottom:#000000 solid 3px"><!-- tab -->
	                    <ul class="tab">
							<li class="active"><a href="#none" data-tab_no="tab1" >상품이미지 <em class="strong">*</em></a></li>
	                        <li><a href="#none" data-tab_no="tab2" id="descTab">상품상세설명 <em class="strong">*</em></a></li>
	                        <li><a href="#none" data-tab_no="tab3" >연관상품</a></li>
	                        <li><a href="#none" data-tab_no="tab4" >상품고시정보 <em class="strong">*</em></a></li>
	                        <li><a href="#none" data-tab_no="tab5" >배송/반품/교환 안내 <em class="strong">*</em></a></li>
	                        <li><a href="#none" data-tab_no="tab6" >품질보증AS안내</a></li>
	                    </ul>
	                </div>

					<div id="tab1">				
						<!--// 상품 이미지 등록 관련 코드 추가, 이상준, 시작 -->
						<h4 class="title">상품이미지</h4>
						<div class="section-form"><!-- section-form-a -->
						
							<div class="edit-product-image"><!--  edit-product-image  -->
							
								<div class="default"><!--  default  -->
	
									<h5 class="title">대표 이미지 ( 337px * 337px )</h5>
									
									<div class="clearfix">
										<div class="fleft thumb">
											<a href="javascript:;"><img src="<c:out value="${serverDomain}" />/am/img/blank.png" alt="blank" class="pic" id="product_pic_0" /></a>
										</div>
										<div class="fleft">
											<ul class="list-a">
												<li>대표이미지 등록 시 PC와  MOBILE 에 상세, 목록, 축소 이미지에 자동 리사이징 되어 들어갑니다.</li>
												<li>비율이 맞지 않는 이미지를 올리면 이미지가 일부 잘릴 수 있습니다.</li>
												<li>등록이미지 : 1M 이하 / gif, png, jpg(jpeg)</li>
												<li>새로운 이미지를 등록 할 경우 기존 등록된 이미지는 자동 삭제 됩니다.</li>
											</ul>
											<p class="action">
												<a href="javascript:registProductImage('0');" class="button button-a small"><span>이미지 등록</span></a>
											</p>
										</div>
									</div>
								
								</div><!--  // default  -->
								
								<div class="optional"><!--  optional -->
								
									<h5 class="title">추가 이미지 ( 337px * 337px  )</h5>
									
									<ul class="list-a">
										<li>등록된 추가 이미지는 상품 상세 페이지에 대표이미지와 함께  나타나는 이미지 입니다.</li>
										<li>비율이 맞지 않는 이미지를 올리면 이미지가 일부 잘릴 수 있습니다.</li>
										<li>등록이미지 : 1M 이하 / gif, png, jpg(jpeg)</li>
										<li>새로운 이미지를 등록 할 경우 기존 등록된 이미지는 자동 삭제 됩니다.</li>
									</ul>
									
									<div class="gridfix list">
										<c:set var="img_idx" value="0" /> 
										<c:forEach begin="1" end="7" var="env">
										<c:if test="${ env > imageList[img_idx].PRD_IMG_IDX }"><c:set var="img_idx" value="${img_idx+1}" /></c:if>
										<div class="col">
											<div class="module">
												<a href="javascript:removeOptionalImage('<c:out value="${env}"/>');" class="delete"><img src="<c:out value="${serverDomain}" />/am/img/ico_close.png" alt="" /></a>
												<a href="javascript:;"><img src="<c:out value="${serverDomain}" />/am/img/blank.png" alt="blank" class="pic" id="product_pic_<c:out value="${env}"/>" /></a>
												<p class="action">
													<a href="javascript:registProductImage('<c:out value="${env}"/>');" class="button button-a small"><span>이미지 등록</span></a>
												</p>
											</div>
										</div>									
										</c:forEach>
									</div>	
									
									<div id="product_image_hidden_inform">
									<c:choose>
									<c:when test="${not empty imageList}">
									<c:forEach var="imgrow" items="${imageList }" varStatus="status">
									<input type="hidden" name="_product_image" value="${imgrow.PRD_IMG_IDX}|${imgrow.PRD_IMG_SORT}|${imgrow.PRD_IMG_ATT_PATH}|${imgrow.PRD_IMG_URL_PATH}|${imgrow.PRD_IMG_SYS_NM}|${imgrow.PRD_IMG_ATT_SIZE}|${imgrow.PRD_IMG_ORG_NM}|${imgrow.PRD_IMG_ALT_TEXT}" style="width:100%;" class="product_image_hidden_inform_${imgrow.PRD_IMG_IDX}" id="product_image_hidden_inform_${imgrow.PRD_IMG_IDX}-${imgrow.PRD_IMG_SORT}"/>
									</c:forEach>
									</c:when>
									</c:choose>
									</div>
									
								</div><!--  // optional -->
								
							</div><!--  // edit-product-image  -->
	
						</div><!-- // section-form-a -->
					
					</div>

<script type="text/javascript">
var v_env = '';

// 상품이미지 등록 팝업
function registProductImage(env){
	v_env = env;
	$('#product_image_env').val(env);
 	popup('',"600","300","no","_RegistProductImagePopup"); // 'popup_RegistProductImagePopup'
	$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/productImageForm.do", "target":"popup_RegistProductImagePopup", "method":"post"}).submit();
}

// 이미지 등록결과 반영 - 이미지등록 팝업에서 호출
function resultExec(result){
	
	var img_layer_html = '';
	var product_image_val = '';
	
	var cdnDomain = "${cdnDomain}";
	
	$.each(result.data.imgList, function(i, item) {
		
		product_image_val = v_env;
		product_image_val += "|" + i;
		// [2] 서버디렉토리
		product_image_val += "|" + item.webpath;
		// [3] HTTP경로
		product_image_val += "|" + cdnDomain + item.webpath + item.filename;
		// [4] 이미지파일명
		product_image_val += "|" + item.filename;
		// [5] 이미지사이즈
		product_image_val += "|" + item.size;
		// [6] 원본파일명
		product_image_val += "|" + item.fileOrgName;	
		// [7] 파일 설명
		product_image_val += "|" + item.altText;
		
		img_layer_html += '<input type="hidden" name="_product_image" value="'+product_image_val+'" style="width:100%;" class="product_image_hidden_inform_'+v_env+'" id="product_image_hidden_inform_'+v_env+'-'+i+'"/>';
		
		//-- 대표이미지만 노출합니다.
		if(i==0){
			$('#product_pic_'+v_env).attr('src', cdnDomain + item.webpath + item.filename);
		}
	});
	
	// 기존 파일정보 제거
	$('.product_image_hidden_inform_'+v_env).remove();
	
	// 첨부파일 부가정보(hidden form) 등록  
	$('#product_image_hidden_inform').html( $('#product_image_hidden_inform').html() + img_layer_html );
}

// 추가 이미지 삭제
var no_image_src = '<c:out value="${serverDomain}" />/am/img/blank.png';
function removeOptionalImage(env){
	
	// 서버상의 이미지 삭제, AJAX로 호출합니다
	$('.product_image_hidden_inform_'+env).each(
			
			function(index){
			    $.ajax({
	                async : false,
	                type : "POST",
	                data : {"image_info":$(this).val()},
	                url : "<c:out value="${serverDomain}" />/am/product/upload/productImageRemoveJson.do",
	                success : function (data) 
	                {
	                    if(data.resultYn == "N")
	                    {
	                       // TODO nothing
	                    }
	                },
	                error : function (err)
	                {
	                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                }
	            });
			}
	);
	
	// 화면에서 상품이미지 삭제
	$('.product_image_hidden_inform_'+env).remove();
	// 첨부파일 부가정보(hidden form) 제거
	$('#product_pic_'+env).attr('src', no_image_src);
}
</script>

				
					<!--// 상품 이미지 등록 관련 코드 추가, 이상준, 끝 -->

					<div id="tab2" style="display:none">
					<h4 class="title">상품 상세설명</h4>
	
						<div class="section-form"><!-- section-form-a -->
		
							<div class="form-group">
								<label class="label"><span>상품 상세설명</span></label>
								<div class="field">
									<textarea class="textarea" id="PRD_MST_DETAIL_DESC" name="PRD_MST_DETAIL_DESC">${productInfo.PRD_MST_DETAIL_DESC}</textarea>
									<ui:editor objId="#PRD_MST_DETAIL_DESC"/>
								</div>
							</div>
		
							<div class="form-group">
								<label class="label"><span>셀링 포인트</span></label>
								<div class="field">
									<textarea class="textarea" id="PRD_MST_DETAIL_TXT" name="PRD_MST_DETAIL_TXT" maxlength="1000"><c:out value="${productInfo.PRD_MST_DETAIL_TXT }" /></textarea>
								</div>
							</div>
						</div><!-- // section-form-a -->
					</div>
				
					<div id="tab3" style="display:none">				
						<h4 class="title">연관상품</h4>
	
							<div class="section-form"><!-- section-form-a -->
								<div class="section-button"><!-- section button -->
								<a href="#none" id="goProductDelete" class="button button-a small"><span>선택삭제</span></a>
								<a href="<c:out value="${serverDomain}" />/am/product/searchProductPopup.do" class="button button-b small js-modal" data-width="900" data-height="800" data-scroll="true" target="_blank" title="새 창 으로 열립니다."><span>상품검색</span></a>
							</div><!-- // section button -->
	
							<div class="table-a"><!-- col list -->
							<table class="core">
							<colgroup> 
								<col style="width: 3%;" />
								<col style="width: 12%;" />
								<col style="width: auto;" />
								<col style="width: 8%;" />
								<col style="width: 8%;" />
								<col style="width: 8%;" />
								<col style="width: 10%;" />
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" class="checkbox checkAll" /></th>
									<th>상품코드</th>
									<th>상품명</th>
									<th>정상가</th>
									<th>판매가</th>
									<th>판매상태</th>
									<th>쇼핑채널</th>
								</tr>
							</thead>
							<tbody id="RelatedProducts">
							<c:choose>
							    <c:when test="${not empty relatedList}">
							    	<c:forEach var="item" items="${relatedList }" varStatus="status">
									<tr>
										<td><input type="checkbox" class="checkbox checkRow" id="REL_PRD_MST_CD_${item.PRD_MST_CD}" name="REL_PRD_MST_CD"  value="${item.PRD_MST_CD}" /></td>
										<td><label for="REL_PRD_MST_CD_${item.PRD_MST_CD}" ><c:out value="${item.PRD_MST_CD }" /></label><input type="hidden" name="REL_PRD_MST_CDs" value="${item.PRD_MST_CD}"/></td>
										<td class="left">
										<c:if test="${not empty item.PRM_TEXT}" >[<c:out value="${item.PRM_TEXT }" />]<br /></c:if>
										<a href="javascript:goView('<c:out value="${item.PRD_MST_CD }" />');"><c:out value="${item.PRD_MST_NM }" /></a>
										</td>								
										<td><fmt:formatNumber value="${item.PRD_MST_NORMAL_PRICE }" groupingUsed="true" /></td>
										<td><fmt:formatNumber value="${item.PRD_MST_SELL_PRICE }" groupingUsed="true" /></td>
										<td>
										    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" ><span class="label label-b">판매중</span></c:if>
										    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span class="label label-a">품절상품</span></c:if>
										    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span class="label label-a">미판매</span></c:if>
										</td>
										<td>
											<c:choose>
												<c:when test="${item.PRD_MST_CNL_MB_YN eq 'Y' and item.PRD_MST_CNL_PC_YN eq 'Y'}">전체
												</c:when>
												<c:otherwise>
													<c:if test="${item.PRD_MST_CNL_PC_YN eq 'Y'}" >PC</c:if>
													<c:if test="${item.PRD_MST_CNL_MB_YN eq 'Y'}" >MOBILE</c:if>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
							    	</c:forEach>
							    </c:when>
							    <c:otherwise>
								    <tr id="productNodata"><!-- row -->
										<td colspan="8">등록된 연관 상품이 없습니다.</td>
									</tr>
							    </c:otherwise>
							</c:choose>
							</tbody>
						</table>
						</div><!-- // col list -->
								
						</div><!-- // section-form-a -->
					</div>
				
					<div id="tab4" style="display:none">
					
						<h4 class="title">상품고시정보</h4>
		
						<div class="section-form"><!-- section-form-a -->
		                
							<div class="form-group">
								<label class="label"><span>고시정보상태</span></label>
								<div class="field">
		                            <input type="radio" name="PRD_INF_USE_YN" id="PRD_INF_USE_YN_Y" value="Y" class="radio" checked="checked"/>
		                            <label for="PRD_INF_USE_YN_Y">보이기</label>
		                            <input type="radio" name="PRD_INF_USE_YN" id="PRD_INF_USE_YN_N" value="N" class="radio"  />
		                            <label for="PRD_INF_USE_YN_N">숨기기</label>
								</div>
							</div>
		
							<div class="form-group">
								<label class="label"><span>고시정보 제목</span></label>
								<div class="field">
									<input type="hidden" id="PRD_INF_IDX" name="PRD_INF_IDX" value="${productInfo.PRD_INF_IDX}" />
									<div id="PRD_INF_TITLE"></div>
									<a href="javascript:fnSearchPopup(${Code.PRODUCT_GUIDE_INFO})" class="button button-b small" title="새 창 으로 열립니다.">
									<span>고시정보찾기</span></a>
								</div>
							</div>
							
							<div class="form-group">
								<label class="label"><span>고시정보내용</span></label>
								<div class="field" id="PRD_INF_CONTENTS">
									지정된 고시정보내용없음.
								</div>
							</div>
		                    
						</div><!-- // section-form-a -->
					</div>
				
				
					<div id="tab5" style="display:none">				
						<h4 class="title">배송/반품/교환 안내</h4>
						<div class="section-form"><!-- section-form-a -->
							
							<div class="form-group">
								<label class="label"><span>안내 상태</span></label>
								<div class="field">
		                            <input type="radio" name="PRD_SHP_USE_YN" id="PRD_SHP_USE_YN_Y" value="Y" class="radio" checked="checked"/>
		                            <label for="PRD_SHP_USE_YN_Y">보이기</label>
		                            <input type="radio" name="PRD_SHP_USE_YN" id="PRD_SHP_USE_YN_N" value="N" class="radio" />
		                            <label for="PRD_SHP_USE_YN_N">숨기기</label>
								</div>
							</div>
		
							<div class="form-group">
								<label class="label"><span>안내 제목</span></label>
								<div class="field">
									<input type="hidden" id="PRD_SHP_IDX" name="PRD_SHP_IDX" value="${productInfo.PRD_SHP_IDX}" />
									<div id="PRD_SHP_TITLE"></div>
									<a href="javascript:fnSearchPopup(${Code.PRODUCT_GUIDE_SHIPPING})" class="button button-b small" title="새 창 으로 열립니다.">
									<span>안내정보찾기</span></a>
								</div>
							</div>
							
							<div class="form-group">
								<label class="label"><span>안내 내용</span></label>
								<div class="field" id="PRD_SHP_CONTENTS">
									지정된 안내내용없음.
								</div>
							</div>
						
						</div><!-- // section-form-a -->
					</div>
				
				
					<div id="tab6" style="display:none">				
						<h4 class="title">품질보증/AS 안내</h4>
						<div class="section-form"><!-- section-form-a -->
							
							<div class="form-group">
								<label class="label"><span>안내 상태</span></label>
								<div class="field">
		                            <input type="radio" name="PRD_ASG_USE_YN" id="PRD_ASG_USE_YN_Y" value="Y" class="radio" checked="checked"/>
		                            <label for="PRD_ASG_USE_YN_Y">보이기</label>
		                            <input type="radio" name="PRD_ASG_USE_YN" id="PRD_ASG_USE_YN_N" value="N" class="radio" />
		                            <label for="PRD_ASG_USE_YN_N">숨기기</label>
								</div>
							</div>

							<div class="form-group">
								<label class="label"><span>안내 제목</span></label>
								<div class="field">
									<input type="hidden" id="PRD_ASG_IDX" name="PRD_ASG_IDX" value="${productInfo.PRD_ASG_IDX}" />
									<div id="PRD_ASG_TITLE"></div>
									<a href="javascript:fnSearchPopup(${Code.PRODUCT_GUIDE_AS})" class="button button-b small" title="새 창 으로 열립니다.">
									<span>안내정보찾기</span></a>
								</div>
							</div>
							
							<div class="form-group">
								<label class="label"><span>안내 내용</span></label>
								<div class="field" id="PRD_ASG_CONTENTS">
									지정된 안내내용없음.
								</div>
							</div>
					
						</div><!-- // section-form-a -->
					</div>

                </form>
                
				<div class="section-button"><!-- section button -->
					<a href="#none" class="button button-a" id="goList" ><span>목록</span></a>				
					<a href="#none" class="button button-b" id="goRegist" ><span>저장</span></a>
					<!-- <a href="#none" class="button button-a" id="goRemove" ><span>삭제</span></a>  -->
				</div><!-- // section button -->

			</div><!-- // contents-inner -->

		</section><!-- // contents -->

	</div><!-- // body -->

	<footer><!-- footer -->
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<!-- template -->
<script id="erpProductInfoTemplate" type="text/x-jquery-tmpl">
<tr>
	<th><span>매장선택 <em class="strong">*</em></span></th>
	<td>
		<input type="text" id="PRD_MST_SHOP_TEXT" name="PRD_MST_SHOP_TEXT" class="text" style="width:50%" value="" maxlength="66"  />
		<a href="javascript:pageReflash();" class="button button-b small js-modal" title="화면 새로고침">
		<span>초기화</span>
		</a>
	</td>
	<th><span>온라인상품코드 <em class="strong">*</em></span></th>
	<td>
		<input type="text" id="PRD_MST_CD" name="PRD_MST_CD" class="text" style="width:70%" value="\${PRD_MST_CD}" maxlength="66"  />
		<a href="javascript:pageReflash();" class="button button-b small js-modal" title="화면 새로고침"><span>초기화</span></a>
	</td>
</tr>
<tr>
	<th>몰상품명</th>
	<td><input type="text" id="PRD_MST_NM" name="PRD_MST_NM" class="text" style="width:70%" value="\${PRD_MST_NM}" maxlength="66"  /></td>
	<th>업체구분</th>
	<td>\${PRD_MST_BRAND_NM}</td>
</tr>
<tr>
	<th>품종</th>
	<td>\${PRD_MST_ITEM_KND_NM}</td>
	<th>시즌</th>
	<td>\${PRD_MST_SSON_NM}</td>
</tr>
<tr>
	<th>기획년도</th>
	<td>\${PRD_MST_PLAN_YEAR}</td>
	<th>성별</th>
	<td>\${PRD_MST_ZGENDIND_NM}</td>
</tr>
<tr>
	<th>제품라인</th>
	<td>\${PRD_MST_GDS_LN_NM}</td>
	<th>생산제품형태</th>
	<td>\${PRD_MST_GOOD_STLE_NM}</td>
</tr>
<tr>
	<th>기획구분1</th>
	<td>\${PRD_MST_PLAN_1_DIV_NM}</td>
	<th>기획구분2</th>
	<td>\${PRD_MST_PLAN_2_DIV_NM}</td>
</tr>
<tr>
	<th>신상품기준년월</th>
	<td>\${PRD_MST_BASED_YM}</td>
	<th>라이센스유무</th>
	<td>\${PRD_MST_LICN_YN}</td>
</tr>
<tr>
	<th>등록일시</th>
	<td>\${PRD_MST_ERP_REG_DATE}</td>
	<th>수정일시</th>
	<td>\${PRD_MST_ERP_UPD_DATE}</td>
</tr>
</script>

<script id="productOptionTemplate" type="text/x-jquery-tmpl">
<tr>  
	<td>
		<input type="hidden" name="PRD_OPT_COLOR_CD" value="\${PRD_OPT_COLR_CD}"/>
		<input type="hidden" name="PRD_OPT_SIZE_CD" value="\${PRD_OPT_SIZE_CD}"/>
		\${PRD_OPT_COLR_NM}
	</td>
	<td>\${PRD_OPT_SIZE_NM}</td>
	<td><c:out value="\${PRD_OPT_STOCK_CNT}" /> 개</td>
	<td><input type="radio" id="PRD_OPT_SUSPEND_SALE_N_\${RNUM}" name="PRD_OPT_SUSPEND_SALE_\${PRD_OPT_COLR_CD}\${PRD_OPT_SIZE_CD}" class="checkbox channelType" value="N" checked="checked"/>
		<label for="PRD_OPT_SUSPEND_SALE_N_\${RNUM}">판매중</label>
		<input type="radio" id="PRD_OPT_SUSPEND_SALE_Y_\${RNUM}" name="PRD_OPT_SUSPEND_SALE_\${PRD_OPT_COLR_CD}\${PRD_OPT_SIZE_CD}" class="checkbox channelType" value="Y" />
		<label for="PRD_OPT_SUSPEND_SALE_Y_\${RNUM}">품절</label>
	</td>
</tr>
</script>

<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" id="REL_PRD_MST_CD_\${PRD_MST_CD}" name="REL_PRD_MST_CD" value="\${PRD_MST_CD}"/></td>
	<td>\${CMN_BRD_NM}</td>
	<td>\${PRD_MST_CD}<input type="hidden" name="REL_PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
	<td class="left">
	\${PRM_TEXT}
	<a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_NM}</a>
	</td>
	<td>\${PRD_MST_NORMAL_PRICE}</td>
	<td>\${PRD_MST_SELL_PRICE}</td>
	<td><span class="label label-\${PRD_MST_SEL_STATE_CLASS}">\${PRD_MST_SEL_STATE}</span></td>
	<td>\${PRD_MST_CHANNEL_TYPE}</td>
</tr>
</script>

<script id="categoryTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow_\${PRD_CTG_ENV}" name="PRD_CTG_IDXs_\${PRD_CTG_ENV}" value="\${CTG_IDX}"/></td>
	<td class="left">\${CTG_PATH}<input type="hidden" name="PRD_CTG_IDXs" value="\${CTG_IDX}"/></td>
</tr>
</script>

<script id="productCategoryTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow_\${PRD_CTG_ENV}" name="PRD_CTG_IDXs_\${PRD_CTG_ENV}" value="\${DSP_CTG_IDX}"/></td>
	<td class="left">\${PRD_CTG_PATH}<input type="hidden" name="PRD_CTG_IDXs" value="\${DSP_PRD_CTG_IDX}"/></td>
</tr>
</script>

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function () 
{
    
    // 온라인 상품  검색 팝업 
 	searchOnlineProduct = function ()
 	{ 		
		// 미니샵이 먼저 선택되어야 선택 가능 
		var shopCd = $("#PRD_MST_SHOP_CD").val();
		if(shopCd == '')
		{
			alert("매장을 선택 하십시요.");
			return;
		}
 		popup('<c:out value="${serverDomain}" />/am/product/searchOnlineProductPopup.do?searchParentShopCd='+shopCd,"900","800","no","_SearchErpPopup");
	};
    
	// 제품 검색 한번 하고 난 후에는 화면 리로딩 시킴 
	pageReflash = function()
	{
		var $frm = $("#searchForm");
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/shopProductForm.do", "target":"_self", "method":"post"}).submit();	
	};
	
	// 팝업에서 선택한 상품 코드 
    fnOnlineProduct = function(prdMstCd)
    {
    	fnSelectOnlineProductInfoAjax(prdMstCd);
    };
	
	// 선택한 온라인 상품 데이터 검색 --> 값 바꾸면 싹 초기화 하는것부터 합시다아~
    fnSelectOnlineProductInfoAjax = function(prdMstCd) {
    	
    	if(prdMstCd == '' || prdMstCd == null) return false;
    	
        $.ajax({
            type : "POST",
            async:true,
            dataType :"json",
            url : '<c:out value="${serverDomain}"/>/am/product/onlineProductInfoAjax.do',
            data : {
                'PRD_MST_CD'       : prdMstCd
            },        
            success : function (data){
				// 제품 정보 테이블 
            	$("#erpProductInfo > tr ").remove();	
            	$("#erpProductInfoTemplate").tmpl( data.rslt.productInfo).appendTo( "#erpProductInfo" );
            	
            	// 쇼핑채널 
            	if(data.rslt.productInfo.PRD_MST_CNL_PC_YN == 'Y')
            	{
            		$("#PRD_MST_CNL_PC_YN").attr("checked", true);
            	}
            	else
            	{
            		$("#PRD_MST_CNL_PC_YN").attr("checked", false);	
            	}// if - else
            	if(data.rslt.productInfo.PRD_MST_CNL_MB_YN == 'Y')
            	{
            		$("#PRD_MST_CNL_MB_YN").attr("checked", true);
            	}
            	else
            	{
            		$("#PRD_MST_CNL_MB_YN").attr("checked", false);	
            	}// if - else
            	setViewCategory();
            	// 판매상태 
            	$("#PRD_MST_SEL_STATE").val(data.rslt.productInfo.PRD_MST_SEL_STATE);
            	
            	// activity 리스트 
            	var $frm = $("#frm"); 
            	var $activity = $frm.find("input[id^=PRD_MST_ACTIVITY]");
	        	$activity.each(function()
	        	{
	        		var strArray = $(this).attr("id").split('_');
	            	var opt_idx = strArray[strArray.length-1];
					if(data.rslt.activityList[opt_idx-1].ACT_SELECT == "Y")
					{
						$(this).attr("checked", true);
					}
					else
					{
						$(this).attr("checked", false);
					}
	        	});

            	// 카테고리 
            	// row 삭제 
            	$("#applyCategoryList_P > tr ").remove();
            	if(data.rslt.categoryListP.length > 0)
            	{   
            		$("#productCategoryTemplate").tmpl(data.rslt.categoryListP).appendTo("#applyCategoryList_P");
            	}
            	// 기본 row 삭제 
        		$("#applyCategoryList_M > tr ").remove();
            	if(data.rslt.categoryListM.length > 0)
            	{	
            		$("#productCategoryTemplate").tmpl(data.rslt.categoryListM).appendTo("#applyCategoryList_M");
            	}
            	
            	// 상품 아이콘  iconList
            	if(data.rslt.iconList.length > 0)
            	{	
            		var iconIdx;
            		for(iconIdx in data.rslt.iconList )
            		{
            			if(data.rslt.iconList[iconIdx].ICN_MST_USE_YN == 'Y')
            			{
            				$("#ICN_MST_USE_YN1_"+data.rslt.iconList[iconIdx].NO).attr("checked", true);
            			}
            			else
            			{
            				$("#ICN_MST_USE_YN2_"+data.rslt.iconList[iconIdx].NO).attr("checked", true);	
            			}// if- else
            			$("#ICN_MST_ST_DT_"+data.rslt.iconList[iconIdx].NO).val(data.rslt.iconList[iconIdx].ICN_MST_ST_DT);
            			$("#ICN_MST_ED_DT_"+data.rslt.iconList[iconIdx].NO).val(data.rslt.iconList[iconIdx].ICN_MST_ED_DT);
            			if(data.rslt.iconList[iconIdx].ICN_MST_DT_YN == 'Y')
            			{
            				$("#ICN_MST_DT_YN_"+data.rslt.iconList[iconIdx].NO).attr("checked", true);
            			}
            				
            		}// for - end
            	}
            	
            	// 계절입력 
            	var $months = $frm.find("input[id^=PRD_MST_SESN_MONTH_]");
            	if(data.rslt.productInfo.PRD_MST_MONTH_ALL == 'Y')
            	{
            		$("#PRD_MST_MONTH_ALL").attr("checked", true);
           			$months.each(function(){
           				$(this).attr("disabled",true);
           	    	});	            		
            	} 
            	else
            	{
            		$("#PRD_MST_MONTH_ALL").attr("checked", false);
           			$months.each(function(){
           				$(this).attr("disabled",false);
           	    	});
            	}// if - else
            		
            	// 월 선택 리스트 arrMonth
            	if(data.rslt.arrMonth.length > 0)
            	{	
            		var monthIdx = 0;
            		var chkIdx = 0;
            		for(monthIdx in data.rslt.arrMonth )
            		{
            			chkIdx = Number(monthIdx)+1;	
            			if(data.rslt.arrMonth[monthIdx] == 'Y')
            			{	
            				$("#PRD_MST_SESN_MONTH_"+chkIdx).attr("checked", true);
            			}
            			else
            			{
            				$("#PRD_MST_SESN_MONTH_"+chkIdx).attr("checked", false);
            			}// if- else            				
            		}// for - end
            	}
            	
            	// 제품 가격 항목들 
				if(data.rslt.productInfo != null)
				{
	            	
	            	$("#PrdNormalPrice").html(setComma(data.rslt.productInfo.PRD_MST_NORMAL_PRICE) + "원");
	            	$("#PrdSellPrice").html(setComma(data.rslt.productInfo.PRD_MST_SELL_PRICE) + "원 / 할인율 : "+data.rslt.productInfo.PRD_MST_DISC_RT+"%");
				}
            	
            	// 홍보문구 
            	$("#PRD_PRM_IDX").val(data.rslt.productInfo.PRM_IDX);
            	$("#PRD_PRM_TEXT").html(data.rslt.productInfo.PRM_TEXT);
            	
            	// 사이즈가이드
            	$("#PRD_SZG_IDX").val(data.rslt.productInfo.PRD_SZG_IDX);
            	$("#PRD_SZG_TITLE").html(data.rslt.productInfo.PRD_SZG_TITLE);            	
            	
            	// 세탁 & 취급 안내 
            	$("#PRD_WASH_IDX").val(data.rslt.productInfo.PRD_WASH_IDX);
            	$("#PRD_WASH_TITLE").html(data.rslt.productInfo.PRD_WASH_TITLE);            	
            	
            	// 기술정보
            	$("#ulProductTechInfo").html("");
            	if(data.rslt.techInfoList.length > 0)
            	{
            		var techIdx;
            		for(techIdx in data.rslt.techInfoList) 
            		{
                		$("#ulProductTechInfo").append('<li class="ui-state-default" style="padding: 5px 10px; margin-top: 2px;">'+data.rslt.techInfoList[techIdx].BRD_SHG_TITLE
    					+'<input type="checkbox" id="LI_DEL_PRD_SHG_IDX_'+data.rslt.techInfoList[techIdx].PRD_BRD_SHG_IDX+'" name="LI_DEL_PRD_SHG" value="'+data.rslt.techInfoList[techIdx].PRD_BRD_SHG_IDX+'" />'
    					+'<label for="LI_DEL_PRD_SHG_IDX_'+data.rslt.techInfoList[techIdx].PRD_BRD_SHG_IDX+'">삭제</label>'
    					+'<input type="hidden" id="PRD_SHG_IDX_'+data.rslt.techInfoList[techIdx].PRD_BRD_SHG_IDX+'" name="PRD_SHG_IDXs" value="'+data.rslt.techInfoList[techIdx].PRD_BRD_SHG_IDX+'" /></li>');	
            		} // for - end 
            	}// if
            	
            	// 상품이미지 
            	if(data.rslt.imageList.length > 0)
            	{
            		var img_layer_html = '';
            		var product_image_val = '';
            		
            		var cdnDomain = "${cdnDomain}";
            		
            		$.each(data.rslt.imageList, function(i, item) {
            			
            			product_image_val = item.PRD_IMG_IDX;
            			product_image_val += "|" + i;
            			// [2] 서버디렉토리
            			product_image_val += "|" + item.PRD_IMG_ATT_PATH;
            			// [3] HTTP경로
            			product_image_val += "|" + cdnDomain + item.PRD_IMG_ATT_PATH + item.PRD_IMG_SYS_NM;
            			// [4] 이미지파일명
            			product_image_val += "|" + item.PRD_IMG_SYS_NM;
            			// [5] 이미지사이즈
            			product_image_val += "|" + item.PRD_IMG_ATT_SIZE;
            			// [6] 원본파일명
            			product_image_val += "|" + item.PRD_IMG_ORG_NM;	
            			// [7] 파일 설명
            			product_image_val += "|" + item.PRD_IMG_ALT_TEXT;
            			
            			img_layer_html += '<input type="hidden" name="_product_image" value="'+product_image_val+'" style="width:100%;" class="product_image_hidden_inform_'+item.PRD_IMG_IDX+'" id="product_image_hidden_inform_'+item.PRD_IMG_IDX+'-'+i+'"/>';
            			
            			//-- 대표이미지만 노출합니다.
            			if(item.PRD_IMG_ATT_SIZE==0){
            				$('#product_pic_'+item.PRD_IMG_IDX).attr('src', cdnDomain + item.PRD_IMG_ATT_PATH + item.PRD_IMG_SYS_NM);
            			}
            			// 기존 파일정보 제거
                		$('.product_image_hidden_inform_'+item.PRD_IMG_IDX).remove();
            		});

            		// 첨부파일 부가정보(hidden form) 등록  
            		$('#product_image_hidden_inform').html( $('#product_image_hidden_inform').html() + img_layer_html );
            	}
            	
            	
            	// 상품 상세 설명 + sellingpoint
            	oEditors.getById["PRD_MST_DETAIL_DESC"].exec("SET_IR", ['']); // 에디터 초기화 
                oEditors.getById["PRD_MST_DETAIL_DESC"].exec("PASTE_HTML", [data.rslt.productInfo.PRD_MST_DETAIL_DESC]);
            	$("textarea#PRD_MST_DETAIL_TXT").val(data.rslt.productInfo.PRD_MST_DETAIL_TXT);
            	
            	// 연관상품
            	if(data.rslt.relatedList.length > 0)
            	{
            		// TR삭제
	        		$("#RelatedProducts > tr").remove();
	            	$("#productTemplate").tmpl( data.rslt.relatedList ).appendTo( "#RelatedProducts" );
            	}
            	
            	// 상품 고시정보 
            	if(data.rslt.productInfo.PRD_INF_USE_YN == 'Y')
            	{
            		$("#PRD_INF_USE_YN_Y").attr("checked", true);
            	}
            	else
            	{
            		$("#PRD_INF_USE_YN_N").attr("checked", true);	
            	}
            	$("#PRD_INF_IDX").val(data.rslt.productInfo.PRD_INF_IDX);
            	$("#PRD_INF_TITLE").html("");
            	$("#PRD_INF_CONTENTS").html("지정된 안내내용없음.");
            	fnSubGuideAjax(data.rslt.productInfo.PRD_INF_IDX);
            	
            	// 배송/교환/반품 안내 
            	if(data.rslt.productInfo.PRD_SHP_USE_YN == 'Y')
            	{
            		$("#PRD_SHP_USE_YN_Y").attr("checked", true);
            	}
            	else
            	{
            		$("#PRD_SHP_USE_YN_N").attr("checked", true);	
            	}
            	$("#PRD_SHP_IDX").val(data.rslt.productInfo.PRD_SHP_IDX);
            	$("#PRD_SHP_TITLE").html("");
            	$("#PRD_SHP_CONTENTS").html("지정된 안내내용없음.");
            	fnSubGuideAjax(data.rslt.productInfo.PRD_SHP_IDX);

            	// 품질보증 /AS 안내 
            	if(data.rslt.productInfo.PRD_ASG_USE_YN == 'Y')
            	{
            		$("#PRD_ASG_USE_YN_Y").attr("checked", true);
            	}
            	else
            	{
            		$("#PRD_ASG_USE_YN_N").attr("checked", true);	
            	}
            	$("#PRD_ASG_IDX").val(data.rslt.productInfo.PRD_ASG_IDX);  
            	$("#PRD_ASG_TITLE").html("");
            	$("#PRD_ASG_CONTENTS").html("지정된 안내내용없음.");   
            	fnSubGuideAjax(data.rslt.productInfo.PRD_ASG_IDX);
            	
            	// 미니샵 종속 정보 
            	setStoreProductInfo();
            	
            },
            error : function(err){alert('error : ' + err.status ); }
        });
    }
	
	// 미니샵 검색  
    searchMiniShop = function ()
    {

    	popup('<c:out value="${serverDomain}" />/am/site/searchStorePopup.do',"600","500","no","_SearchMiniShopPopup");
    };
	
	// 팝업에서 선택한 매장 
    fnResultStore = function(obj)
    {
    	if(obj.SHOP_CD == '' || obj.SHOP_CD == null) return false;
    	
    	$("#PRD_MST_SHOP_CD").val(obj.SHOP_CD);
    	$("#PRD_MST_SHOP_NM").val(obj.SHOP_NM);
    	$("#PRD_MST_SHOP_TEXT").val(obj.SHOP_NM);
    	
    	return true;
    };
	
    
    // 매장기준의 상품 정보 
    setStoreProductInfo = function()
    {
    	$.ajax({
            type : "POST",
            async:true,
            dataType :"json",
            url : '<c:out value="${serverDomain}"/>/am/product/miniShopProductInfoAjax.do',
            data : {
                'PRD_PRD_MST_CD'   : $("#frm").find("#PRD_MST_CD").val()
                ,'SHOP_CD'		   : $("#PRD_MST_SHOP_CD").val()
                ,'COMP_CD'		   : $("#PRD_MST_ERP_COMP_CD").val()
            },        
            success : function (data){
            	// 미니샵 매장명 표시 
            	$("#PRD_MST_SHOP_TEXT").val($("#PRD_MST_SHOP_NM").val());
            	
				// 제품 옵션 테이블
				if(data.rslt.optionList.length > 0)
				{
	            	$("#productOptionList > tr ").remove();	
	            	$("#productOptionTemplate").tmpl( data.rslt.optionList).appendTo( "#productOptionList" );
	            	
	            	// 품절처리 선택 
	            	var $obj = $("#productOptionList input[id^=PRD_OPT_SUSPEND_SALE_Y_]");
	            	$.each($obj, function(){
	            		var strArray = $(this).attr("id").split('_');
	            		var opt_idx = strArray[strArray.length-1];
	            		
	            		if(data.rslt.optionList[opt_idx-1].PRD_OPT_SUSPEND_SALE == "Y")
	            		{
	            			$(this).attr("checked", true);
	            		}
	            	});					
				}
            },
            error : function(err){alert('error : ' + err.status ); }
        });
    	
    	return true;
    };
	
 	//체크박스 전체 선택
  	$.checkBoxSelect("checkAll_${Code.CATEGORY_TYPE_PC}", "checkRow_${Code.CATEGORY_TYPE_PC}");
    $.checkBoxSelect("checkAll_${Code.CATEGORY_TYPE_MOBILE}", "checkRow_${Code.CATEGORY_TYPE_MOBILE}");
	
	//카테고리 선택 영역 설정 
	setViewCategory = function(){
		
		$("#pc_category").show();
		$("#mobile_category").show();
		if($("input:checkbox[id=PRD_MST_CNL_PC_YN]").is(":checked") == false)
		{
			$("#pc_category").hide();
		}
		if($("input:checkbox[id=PRD_MST_CNL_MB_YN]").is(":checked") == false)
		{
			$("#mobile_category").hide();
		} 
	};
    
    // 쇼핑채널 변경시
    $(document).on("click", "#PRD_MST_CNL_PC_YN", function () 
    {
    	setViewCategory();
    });   
    
    $(document).on("click", "#PRD_MST_CNL_MB_YN", function () 
    {
    	setViewCategory();
    });
    
    // 검색 팝업 호출 (searchForm 사용)
 	fnSearchPopup = function (type)
 	{ 		
 		var url = "";
 		var popupName = "";
 		var width = 0;
 		var height = 0;
    	
    	popupName = "+_Search"+type;
 		width = 800;
 		height = 600;
    	if( type == "SellingPoint") // 홍보문구 
    	{
     		url = "<c:out value="${serverDomain}" />/am/product/searchSellingPointProductPopup.do;
    	}
    	else if(type == "TechInfo") // 기술정보 
    	{
     		url = "<c:out value="${serverDomain}" />/am/board/searchShoppingGuideBoardPopup.do;  		
    	}
    	else //사이즈 가이드, 세탁& 취급안내, 고시정보, 배송/반품/교환 안내, 품질보증/AS 안내
    	{ 
    		url = "<c:out value="${serverDomain}" />/am/product/searchGuidePopup.do?gCode="+type+"&M=0;  
    	}
 		popup(url,width,height,"no",popupName);
	};
        
    
    // 카테고리팝업호출
 	registPopup = function ( env )
 	{ 		
 		popup('',"700","300","no","_CategoryPopup");
 		$("#PRD_CTG_ENV").val( env );
 		$("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchCategoryPopup.do", "target":"popup_CategoryPopup", "method":"post"}).submit();
	};
 	
  	//카테고리 검색 결과
    fnResultCategory = function(params)
    {
    	var bCheck = true;
    	var $obj = $("#applyCategoryList_"+params.PRD_CTG_ENV+" input[name='PRD_CTG_IDXs_"+params.PRD_CTG_ENV+"']");
    	$.each($obj, function(){
    		if( params.CTG_IDX == $(this).val() ){
    			alert("["+params.CTG_PATH+"] 이미 선택된 카테고리입니다.");
    			bCheck = false;
    			return false;
    		}
    	});
    	
    	if( bCheck )
    	{
    		//기본TR삭제 
        	$("#categoryNodata_"+params.PRD_CTG_ENV).remove();
    		
    		var idx = $("#applyCategoryList_"+params.PRD_CTG_ENV).find("tr").length;
        	params.IDX = ++idx;
        	
    	    $("#categoryTemplate").tmpl(params).appendTo("#applyCategoryList_"+params.PRD_CTG_ENV);
    	}
    	return true;
    };
    

    // 사용상품 카테고리 선택삭제 이벤트
    $(document).on("click", "a[id^=goCategoryDelete]", function () 
    {
    	var strArray = $(this).attr("id").split('_');
		var env = strArray[strArray.length-1];
		
    	if( $(".checkRow_"+env+":checked").length == 0 ){
    		alert("삭제할 카테고리를 선택하여 주십시오.");
    		return;
    	}
    	
    	$(".checkRow_"+env+":checked").each(function(i,item){
    		$(item).parentsUntil("tbody").remove();
    	});
        
        if ( $("#applyCategoryList_"+env).children("tr").length == 0 )
        {
        	$("#applyCategoryList_"+env).append('<tr id="categoryNodata_'+env+'"><td colspan="2">카테고리를 검색해 주세요.</td></tr>');
        }
        
        //체크박스 전체 선택
        $(".checkAll_"+env).prop("checked", false);        
    });
    
 	// 사용상품 카테고리 선택삭제 이벤트
    $(document).on("click", "input[name=LI_DEL_PRD_SHG]", function () {
    	$(this).parent().remove();
    });
    
	//계절입력 영역 설정
	setViewSesnArea = function(){
		
		// 선택월 ALL 선택 여부에 따른 설정 
		var $frm = $("#frm"); 
		var $months = $frm.find("input[id^=PRD_MST_SESN_MONTH_]");
		if($("input:checkbox[id=PRD_MST_MONTH_ALL]").is(":checked") == true)
		{
			$months.each(function(){
				$(this).attr("disabled",true);
	    	});	
		}
		else
		{	
			$months.each(function(){
				$(this).attr("disabled",false);
	    	});	
		}
	};
	
	// 아이콘 사용중 설정시
    $(document).on("click", "input[name^=ICN_MST_USE_YN_]", function ()
   	{
    	var strArray = $(this).attr("id").split('_');
		var icn_idx = strArray[strArray.length-1];
		
    	if ( $("#ICN_MST_ST_DT_"+icn_idx).val().length != 10
    		|| $("#ICN_MST_ED_DT_"+icn_idx).val().length != 10 )
    	{
    		$("#ICN_MST_DT_YN_"+icn_idx).attr("checked", true);
    	}
   	});

	
    // 상품 아이콘 날짜 설정
    $(document).on("change", "input[type=text][name^=ICN_MST_][name*=_DT_]", function ()
    {    	
		var strArray = $(this).attr("id").split('_');
		var icn_idx = strArray[strArray.length-1];
		if ( $("#ICN_MST_ST_DT_"+icn_idx).val().length == 10
			&& $("#ICN_MST_ED_DT_"+icn_idx).val().length == 10 )
		{
			$("#ICN_MST_DT_YN_"+icn_idx).attr("checked", false);
		}
    });
        
 	// 상품아이콘 제한없음 클릭
 	$(document).on("click", "input[name^=ICN_MST_DT_YN_]", function ()
    {    	
		if( $(this).is(":checked") == true ){			
			var strArray = $(this).attr("id").split('_');
			var opt_idx = strArray[strArray.length-1];
			$("#ICN_MST_ST_DT_"+opt_idx).val('');
			$("#ICN_MST_ED_DT_"+opt_idx).val('');
		}
    });
	
	// 계절입력 ALL 클릭 
 	$(document).on("click", "#PRD_MST_MONTH_ALL", function ()
    {    
 		setViewSesnArea();
    });

    // 폼체크
    $("#frm").validate({
        rules: {
        	PRD_MST_NM : { required:true },  				  // 몰 상품명 
        	PRD_MST_SEL_STATE : { required:true }                // 판매상태
        },
        messages: {
        	PRD_MST_NM: { required: "몰상품명은 필수입력입니다."},
        	PRD_MST_SEL_STATE: { required: "판매상태를 선택하십시오."}
        }
    });
    
    // tab 변경 
	$("#menuViewTab").on("click", "a", function () {
 		
 		var this_tab_no = $(this).data('tab_no');
 		
 		$(this).parent().parent().find('a').each( function(i,item){
 			if( this_tab_no == $(item).data("tab_no") ){
 				$("#"+$(item).data("tab_no")).show();
 				$(item).parent().attr("class","active");	
 			}	
 			else{
 				$("#"+$(item).data("tab_no")).hide();
 				$(item).parent().attr("class","");
 			}
 		});
 	});
    
	// 홍보문구 검색결과
    fnResultSellingPointProduct = function(params)
    {
    	$("#PRD_PRM_IDX").val(params.PRM_IDX);
    	$("#PRD_PRM_TEXT").html(params.PRM_WRD_TXT);
    };
    
 	// 사이즈가이드, 상품고시정보, 배송반품교환안내, 품질AS안내, 세탁&취급안내  검색결과
    fnResultGuide = function(params)
    {
    	var GDS_CAT = params.GDS_CAT;
    	var GDS_IDX = params.GDS_IDX;
    	var GDS_TITLE = params.GDS_TITLE;
    	
    	
    	if( GDS_CAT == '${Code.PRODUCT_GUIDE_SHIPPING}'){
    		// 배송반품교환안내
	    	$("#PRD_SHP_IDX").val(GDS_IDX);
	    	$("#PRD_SHP_TITLE").html(GDS_TITLE);  

	    	// 본문 가져오기.
	    	fnSubGuideAjax(GDS_IDX);    	
    	}
    	else if( GDS_CAT == '${Code.PRODUCT_GUIDE_AS}'){
    		// 품질AS안내
	    	$("#PRD_ASG_IDX").val(GDS_IDX);
	    	$("#PRD_ASG_TITLE").html(GDS_TITLE);  

	    	// 본문 가져오기.
	    	fnSubGuideAjax(GDS_IDX);    	
    	}
		else if( GDS_CAT == '${Code.PRODUCT_GUIDE_INFO}'){
			// 상품고시정보
	    	$("#PRD_INF_IDX").val(GDS_IDX);
	    	$("#PRD_INF_TITLE").html(GDS_TITLE);      		
	    	
	    	// 본문 가져오기.
	    	fnSubGuideAjax(GDS_IDX);
    	}
		else if( GDS_CAT == '${Code.PRODUCT_GUIDE_SIZE}'){
			// 사이즈가이드
			if( params.M == '0'){
		    	$("#PRD_SZG_IDX").val(GDS_IDX);
		    	$("#PRD_SZG_TITLE").html(GDS_TITLE);
			}
			else{
				$("#PRD_SZM_IDX").val(GDS_IDX);
		    	$("#PRD_SZM_TITLE").html(GDS_TITLE);
			}
    	}
		else if( GDS_CAT == '${Code.PRODUCT_GUIDE_WASH}'){
			// 세탁&취급안내
	    	$("#PRD_WASH_IDX").val(GDS_IDX);
	    	$("#PRD_WASH_TITLE").html(GDS_TITLE);
    	}
    };
    
    //  홍보문구 삭제 이벤트 
    $(document).on("click", "#LI_PRD_PRM_IDX", function () {
    	$("#PRD_PRM_IDX").val("");
    	$("#PRD_PRM_TEXT").html("");
    	$("#LI_PRD_PRM_IDX").prop("checked",false); 
    });
    
    // 사이즈 가이드
    $(document).on("click", "#LI_PRD_SZG_IDX", function () {
    	$("#PRD_SZG_IDX").val("");
    	$("#PRD_SZG_TITLE").html("");
    	$("#LI_PRD_SZG_IDX").prop("checked",false); 
    });
    
    //  세탁 & 취급 안내  
    $(document).on("click", "#LI_PRD_WASH_IDX", function () {
    	$("#PRD_WASH_IDX").val("");
    	$("#PRD_WASH_TITLE").html("");
    	$("#LI_PRD_WASH_IDX").prop("checked",false); 
    });
    
    // 상품정보  조회
    fnSubGuideAjax = function( idx ) {

    	if(idx == '' || idx == null) return false;
    	
        $.ajax({
            type : "POST",
            async:true,
            dataType :"json",
            url : '<c:out value="${serverDomain}"/>/am/product/subGuideAjax.do',
            data : {
                'BRD_GDS_IDX'       : idx
            },        
            success : function (data){
            	fnViewContent( data );
            },
            error : function(err){alert('error : ' + err.status ); }
        });
    }
    
    fnViewContent = function (data){

    	var content_id = "";
    	var title_id = "";

    	if( data.rslt.BRD_GDS_CAT == '${Code.PRODUCT_GUIDE_SHIPPING}'){
    		// 배송반품교환안내
    		content_id = "PRD_SHP_CONTENTS";
    		title_id = "PRD_SHP_TITLE";    		
    	}
    	else if( data.rslt.BRD_GDS_CAT == '${Code.PRODUCT_GUIDE_AS}'){
    		// 품질AS안내
    		content_id = "PRD_ASG_CONTENTS";
    		title_id = "PRD_ASG_TITLE";  	
    	}
		else if( data.rslt.BRD_GDS_CAT == '${Code.PRODUCT_GUIDE_INFO}'){
			// 상품고시정보
    		content_id = "PRD_INF_CONTENTS";
    		title_id = "PRD_INF_TITLE";
    	}
		else if( data.rslt.BRD_GDS_CAT == '${Code.PRODUCT_GUIDE_SIZE}'){
			// 사이즈가이드
    		content_id = "PRD_SZG_CONTENTS";
    	}
    	
    	$("#"+content_id).html(data.rslt.BRD_GDS_CONTENTS);
    	if( title_id.length > 0  ){
    		$("#"+title_id).html(data.rslt.BRD_GDS_TITLE);
    	}
    }

 	// 상품기술정보 슬라이드
    $("#ulProductTechInfo").sortable({
        revert: true,
        cursor: "crosshair"
    });
    $("ul, li").disableSelection();
    
 	// 상품 기술정보 추가
    fnResultProductTechInfo = function(params){
    	
    	var arrData = params.split(",");
    	
    	$.each(arrData, function(index, value){

    		var idx_text = value.split(":"); 
        	if( $("#PRD_SHG_IDX_"+idx_text[0]).length > 0 ){
       		}
        	else{    	
        		$("#ulProductTechInfo").append('<li class="ui-state-default" style="padding: 5px 10px; margin-top: 2px;">'+idx_text[1]
        											+'<input type="checkbox" id="LI_DEL_PRD_SHG_IDX_'+idx_text[0]+'" name="LI_DEL_PRD_SHG" value="'+idx_text[0]+'" />'
        											+'<label for="LI_DEL_PRD_SHG_IDX_'+idx_text[0]+'">삭제</label>'
        											+'<input type="hidden" id="PRD_SHG_IDX_'+idx_text[0]+'" name="PRD_SHG_IDXs" value="'+idx_text[0]+'" /></li>');
    		}	
    	});    	
    };
	
    // 연관상품 - 상품 중복체크
    fnDuplicationChk = function( selectObj ){
		var bReturn = true;
    	var $obj = $("#RelatedProducts input[name='\${PRD_MST_CD}']");
    	$.each($obj, function(){
    		if( selectObj == $(this).val() ){
    			bReturn = false;
    			return false;
    		}
    	});
    	return bReturn;
    };
    
    // 연관상품 - 상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
    	
    	var bCheck = true;
    	
    	//상품중복체크
    	$.each( params, function( index, el ){
//    		if( !fnDuplicationChk( el.PRD_MST_CD )){
			if( $("#REL_PRD_MST_CD_"+el.PRD_MST_CD).length > 0 ){ 
    			alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
				bCheck = false;
    			return false;
    		}
    	});
    	
    	if( !bCheck ){
    		return false;
    	}

    	var list_length = 0;
    	if( $("#RelatedProducts").children("tr").length > 0 ){
    		list_length = $("#RelatedProducts").find("input[type=checkbox]").length;
    	}
    	
    	if( ( eval(params.length) + list_length ) >  5 ){
    		alert('등록 가능 최대 상품수를 초과하였습니다. \r\n다시 선택해주세요.');
    		return false;
    	}
    	
    	
    	if( bCheck ){
        	//기본TR삭제
        	$("#productNodata").remove();
        	//배열재정의
        	var arrayObj = new Array();
    		var obj;
    		$.each(params, function(index,item){
        		obj = new Object();
        		obj.PRD_MST_CD 				= item.PRD_MST_CD;
        		obj.PRD_MST_NM 			= item.PRD_MST_NM;
        		obj.PRD_CTG_PATH 			= item.PRD_CTG_PATH;
        		obj.CMN_BRD_NM 				= item.CMN_BRD_NM;
        		obj.PRD_MST_NORMAL_PRICE 	= setComma(item.PRD_MST_NORMAL_PRICE);
        		obj.PRD_MST_SELL_PRICE      = setComma(item.PRD_MST_SELL_PRICE);
        		obj.PRD_MST_SEL_STATE 		= item.PRD_MST_SEL_STATE;
        		if(item.PRD_MST_CNL_PC_YN == "Y" && item.PRD_MST_CNL_MB_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE ="전체";
        		}
        		else if(item.PRD_MST_CNL_PC_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE="PC";	
        		}
        		else if(item.PRD_MST_CNL_MB_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE="MOBILE";	
        		}
        		obj.serverDomain 			= '<c:out value="${serverDomain}" />';
        		if ( item.PRD_MST_SEL_STATE_CODE == '<c:out value="${Code.PRODUCT_SELL_STATE_ING}" />' )
        		{
        		    obj.PRD_MST_SEL_STATE_CLASS = "b";
        		}
        		else
        		{
        		    obj.PRD_MST_SEL_STATE_CLASS = "a";
        		}
        		obj.imgpath 		        = item.PRD_IMG_THUM_URL;

        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        	});
    		$( "#productTemplate" ).tmpl( arrayObj ).appendTo( "#RelatedProducts" );
    	}
    	return true;
    };

    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", "#goProductDelete", function () 
    {
    	if( $(".checkRow:checked").length == 0 ){
    		alert("삭제할 상품을 선택하여 주십시오.");
    		return;
    	}
        $("#RelatedProducts").children("tr").each(function()
        {
        	if ( $(this).find("input[name=REL_PRD_MST_CD]").is(":checked") )
        	{
        		$(this).remove();
        	}
        });
        
        if ( $("#RelatedProducts").children("tr").length == 0 )
        {
        	$("#RelatedProducts").append('<tr id="productNodata"><td colspan="8">등록된 연관 상품이 없습니다.</td></tr>');
        }
        //체크박스 전체 선택
        $(".checkAll").prop("checked", false);
        
    });   
    
    // 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
      	var $frm = $("#searchForm"); 
      	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/basicProductList.do", "target":"_self", "method":"post"}).submit();
    });    
    
 	// 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){

        	// 쇼핑채널 필수입력 체크 
        	if(!$("#PRD_MST_CNL_PC_YN").is(":checked") && !$("#PRD_MST_CNL_MB_YN").is(":checked"))
        	{
        		alert("쇼핑채널은 필수 입력값입니다.");
        		return;        		
        	}
        	
        	// activity 필수 입력 체크 
        	var $activity = $frm.find("input[id^=PRD_MST_ACTIVITY]");
        	var selAct = 0;
        	$activity.each(function(){
				if($(this).is(":checked"))
				{
					selAct ++;
				}
        	});
        	if(selAct == 0)
        	{
        		alert("ACTIVITY는 필수 입력값입니다.");
        		return;
        	}
        	
        	// 쇼핑채널별 카테고리 필수입력 체크
        	if($("#PRD_MST_CNL_PC_YN").is(":checked"))
        	{
        		if($("input[name=PRD_CTG_IDXs_${Code.CATEGORY_TYPE_PC}]").length == 0)
        		{
            		alert("PC카테고리는 필수 입력값입니다.");
            		return;           			
        		}
        	}
        	if($("#PRD_MST_CNL_MB_YN").is(":checked"))
        	{
        		if($("input[name=PRD_CTG_IDXs_${Code.CATEGORY_TYPE_MOBILE}]").length == 0)
        		{
            		alert("모바일카테고리는 필수 입력값입니다.");
            		return;           			
        		}        		
        	}
        	
            if (confirm( "등록 하시겠습니까?")) 
            {
            	// 카테고리 삭제
            	if( $("#pc_category").css("display")=='none'){
            		$("#pc_category").empty();
            	}
            	else if( $("#mobile_category").css("display")=='none'){
            		$("#mobile_category").empty();       
            	}
            	
            	try { oEditors.getById["PRD_MST_DETAIL_DESC"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ } //editor 내용을 PRD_MST_DETAIL_DESC TEXTAREA의 VALUE 값으로 만든다.
            	
            	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/basicProductRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });    
    
    
	// -- 화면 로딩 기초 셋팅 --
	
	// 카테고리 / 선택월 view 셋팅 
	setViewCategory();
	setViewSesnArea();
	
	// 상품 상세설명 클릭시 에디터 height 값 적용(display:none 일때 에디터가 제대로 보이지 않는 증상 해결)
	$(document).on("click","#descTab",function(){
		showSmartEditor("PRD_MST_DETAIL_DESC", 200);
	});
	// -- 화면 로딩 기초 셋팅 -- 
	

});


</script>
</body>
</html>