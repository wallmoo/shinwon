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
				<span>상품관리</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">상품관리</h3>
				<form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
                    <c:choose>
						<c:when test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
			                <div class="section-form"><!-- section-form-a -->
			                    <div class="form-group">
			                        <div class="col col-md-1-2">
			                            <label class="label"><span>상품코드</span></label>
			                            <div class="field">
			                                <input type="text" class="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" /> 
			                            </div>
			                        </div>
			                        <div class="col col-md-1-2">
			                            <label class="label"><span>입점업체</span></label>
			                            <div class="field">
			                                <select class="select" id="searchPrdMstVdrIdx" name="searchPrdMstVdrIdx" >
			    								<option value="">전체</option>
			    								<c:if test="${not empty vendorList }">
				                                    <c:forEach var="authRow" items="${vendorList }" varStatus="i">
				                                        <option value="<c:out value="${authRow.VDR_MST_IDX }"/>" <ui:select v="${commandMap.searchPrdMstVdrIdx}" t="${authRow.VDR_MST_IDX }" g="selected"/> ><c:out value="${authRow.VDR_MST_NM }"/></option>
				                                    </c:forEach>
				                                </c:if>
			    							</select>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <div class="col col-md-1-2">
			                            <label class="label"><span>상품명</span></label>
			                            <div class="field">
			                                <input type="text" class="text" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
			                            </div>
			                        </div>
			                        <div class="col col-md-1-2">
			                            <label class="label"><span>진열/판매/승인</span></label>
			                            <div class="field">
			                                <select class="select" name="searchPrdMstDplState" id="searchPrdMstDplState">
												<option value="">전체</opton>
												<option value="Y" <ui:select v="${commandMap.searchPrdMstDplState}" t="Y" g="selected"/>>YES</option>
												<option value="N" <ui:select v="${commandMap.searchPrdMstDplState}" t="N" g="selected"/>>NO</option>
											</select>
			                                <select class="select" name="searchPrdMstSellState" id="searchPrdMstSellState">
												<option value="">전체</opton>
												<option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_ING }" g="selected"/>>판매중</option>
												<option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" g="selected"/> >일시품절</option>
												<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_TEMPOUT }" g="selected"/> >품절상품</option>
												<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_STOP }" g="selected"/>>미판매</option>
											</select>
			                                <select class="select" name="searchPrdMstApvState" id="searchPrdMstApvState">
												<option value="">전체</opton>
												<option value="D" <ui:select v="${commandMap.searchPrdMstApvState}" t="D" g="selected"/>>대기</option>
												<option value="A" <ui:select v="${commandMap.searchPrdMstApvState}" t="A" g="selected"/>>승인</option>
												<option value="C" <ui:select v="${commandMap.searchPrdMstApvState}" t="C" g="selected"/>>거절</option>
											</select>
			                            </div>
			                        </div>
			                    </div>
			                </div><!-- // section-form-a -->
						</c:when>
						<c:otherwise>
							<div class="section-form"><!-- section-form-a -->
			                    <div class="form-group">
			                        <div class="col col-md-1-2">
			                            <label class="label"><span>상품코드</span></label>
			                            <div class="field">
			                                <input type="text" class="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" /> 
			                            </div>
			                        </div>
			                        <div class="col col-md-1-2">
			                            <label class="label"><span>입점업체</span></label>
			                            <div class="field">
			                                <c:out value="${vendorManagerInfo.VDR_MST_NM }" />
			                            </div>
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <div class="col col-md-1-2">
			                            <label class="label"><span>상품명</span></label>
			                            <div class="field">
			                                <input type="text" class="text" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
			                            </div>
			                        </div>
			                        <div class="col col-md-1-2">
			                            <label class="label"><span>진열/판매/승인</span></label>
			                            <div class="field">
			                                <select class="select" name="searchPrdMstDplState" id="searchPrdMstDplState">
												<option value="">전체</opton>
												<option value="Y" <ui:select v="${commandMap.searchPrdMstDplState}" t="Y" g="selected"/>>YES</option>
												<option value="N" <ui:select v="${commandMap.searchPrdMstDplState}" t="N" g="selected"/>>NO</option>
											</select>
			                                <select class="select" name="searchPrdMstSellState" id="searchPrdMstSellState">
												<option value="">전체</opton>
												<option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_ING }" g="selected"/>>판매중</option>
												<option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" g="selected"/> >일시품절</option>
												<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_TEMPOUT }" g="selected"/> >품절상품</option>
												<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_STOP }" g="selected"/>>미판매</option>
											</select>
			                                <select class="select" name="searchPrdMstApvState" id="searchPrdMstApvState">
												<option value="">전체</opton>
												<option value="D" <ui:select v="${commandMap.searchPrdMstApvState}" t="D" g="selected"/>>대기</option>
												<option value="A" <ui:select v="${commandMap.searchPrdMstApvState}" t="A" g="selected"/>>승인</option>
												<option value="C" <ui:select v="${commandMap.searchPrdMstApvState}" t="C" g="selected"/>>거절</option>
											</select>
			                            </div>
			                        </div>
			                    </div>
			                </div><!-- // section-form-a -->
						</c:otherwise>
					</c:choose>
				</form>
                <div class="section-button search">
                    <a href="javascript:search();" class="button button-b"><span>검색</span></a>
                </div>
				
				<form id="frm" name="frm">
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
                    <c:choose>
						<c:when test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX ne Code.SCM_ADMINISTRATOR_IDX}">
	                		<!-- col list -->
			                <div class="table-a">
			                    <table class="core">
			                    <colgroup>
			                        <col style="width: 8%;" />  
			                        <col style="width: 30%" />
			                        <col style="width: auto;" />
			                    </colgroup>
			                    <thead>
			                        <th><input type="checkbox" class="checkbox checkAll"/></th>
			                        <th>상품코드<br />기간계코드</th>
			                        <th>상품정보</th>
			                    </thead>
			                    <tbody>
			                    	<c:choose>
									    <c:when test="${not empty list}">
									    	<c:set var="listNum" value="${paging.listNum}" />
									    	<c:forEach var="item" items="${list }" varStatus="status">
									    		<input type="hidden" name="PRD_MST_PC_CPN_UNT_${item.PRD_MST_CD }" id="PRD_MST_PC_CPN_UNT_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_PC_CPN_UNT}"/>" />
									    		<input type="hidden" name="PRD_MST_PC_CPN_PRC_${item.PRD_MST_CD }" id="PRD_MST_PC_CPN_PRC_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_PC_CPN_PRC}"/>" />
									    		<input type="hidden" name="PRD_MST_MB_CPN_UNT_${item.PRD_MST_CD }" id="PRD_MST_MB_CPN_UNT_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_MB_CPN_UNT}"/>" />
									    		<input type="hidden" name="PRD_MST_MB_CPN_PRC_${item.PRD_MST_CD }" id="PRD_MST_MB_CPN_PRC_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_MB_CPN_PRC}"/>" />
						                        <tr>
						                            <td><input type="checkbox" name="PRD_MST_CDs" value="<c:out value="${item.PRD_MST_CD }" />" class="checkbox checkRow"/></td>
						                            <td>
						                                <p><c:out value="${item.PRD_MST_CD}"/></p>
						                                <p>[<c:out value="${item.PRD_MST_VDR_NM}" />]</p>
						                            </td>
						                            <td>
						                                <p>
						                                	<input type="hidden" class="text" name="PRD_MST_NM_${item.PRD_MST_CD }" id ="PRD_MST_NM_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_NM}" />" maxlength="100"  />
						                                	<c:choose>
						                                		<c:when test="${fn:length(item.PRD_MST_NM) > 50 }">
						                                			<c:out value="${fn:substring(item.PRD_MST_NM,0,50)}" />
						                                		</c:when>
						                                		<c:otherwise>
						                                			<c:out value="${item.PRD_MST_NM}" />
						                                		</c:otherwise>
						                                	</c:choose>
						                                </p>
						                                <p class="right">
						                                    <label for="priceSell1">판매가</label>
						                                    <input type="text" class="text" name="PRD_MST_PRC_${item.PRD_MST_CD }" id="PRD_MST_PRC_${item.PRD_MST_CD }" value="<fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" />" /> 원
						                                </p>
						                                <p class="right">
						                                    <label for="priceSearch1">검색가</label>
						                                    <input type="text" class="text" name="PRD_MST_SCH_PRC_${item.PRD_MST_CD }" id="PRD_MST_SCH_PRC_${item.PRD_MST_CD }" value="<fmt:formatNumber value="${item.PRD_MST_SCH_PRC }" groupingUsed="true" />" /> 원
						                                </p>
						                                <p class="right">
						                                    <label for="priceShip1">배송비</label>
						                                    <input type="text" class="text" name="PRD_MST_DLV_FEE_${item.PRD_MST_CD }" id="PRD_MST_DLV_FEE_${item.PRD_MST_CD }" value="<fmt:formatNumber value="${item.PRD_MST_DLV_FEE }" groupingUsed="true" />"  /> 원
						                                </p>
						                                <p class="right">
						                                    <label for="amount1">판매수량</label>
						                                    <input type="text" class="text" name="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" id="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" value="<fmt:formatNumber value="${item.PRD_MST_SEL_CNT }" groupingUsed="true" />" /> 원
						                                </p>
						                                <p class="right">
						                                    <select class="select" id="PRD_MST_DPL_STATE_${item.PRD_MST_CD }" name="PRD_MST_DPL_STATE_${item.PRD_MST_CD }" >
																<option value="Y" <c:if test="${item.PRD_MST_DPL_STATE eq 'Y'}"> selected=true</c:if>>YES</option>
																<option value="N" <c:if test="${item.PRD_MST_DPL_STATE eq 'N'}"> selected=true</c:if> >NO</option>
															</select>
						                                    <select name="PRD_MST_SEL_STATE_${item.PRD_MST_CD }" id="PRD_MST_SEL_STATE_${item.PRD_MST_CD }" class="select">
																<option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />"  <c:if test="${Code.PRODUCT_SELL_STATE_ING eq item.PRD_MST_SEL_STATE}"> selected=true</c:if> >판매중</option>
																<option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <c:if test="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT eq item.PRD_MST_SEL_STATE}"> selected=true</c:if> >일시품절</option>
																<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <c:if test="${Code.PRODUCT_SELL_STATE_TEMPOUT eq item.PRD_MST_SEL_STATE}"> selected=true</c:if> >품절상품</option>
																<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <c:if test="${Code.PRODUCT_SELL_STATE_STOP eq item.PRD_MST_SEL_STATE}"> selected=true</c:if> >미판매</option>
															</select>
						                                    <select class="select" id="PRD_MST_APV_STATE_${item.PRD_MST_CD }" name="PRD_MST_APV_STATE_${item.PRD_MST_CD }" >
																<option value="D" <c:if test="${item.PRD_MST_APV_STATE eq 'D'}"> selected=true</c:if> >대기</option>
																<option value="A" <c:if test="${item.PRD_MST_APV_STATE eq 'A'}"> selected=true</c:if> >승인</option>
																<option value="C" <c:if test="${item.PRD_MST_APV_STATE eq 'C'}"> selected=true</c:if> >거절</option>
															</select>
						                                </p>
						                            </td>
						                        </tr>
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
			                </div>
			            </c:when>
						<c:otherwise>
							<!-- col list -->
			                <div class="table-a">
			                    <table class="core">
			                    <colgroup>
			                        <col style="width: 8%;" />  
			                        <col style="width: 30%" />
			                        <col style="width: auto;" />
			                    </colgroup>
			                    <thead>
			                        <th><input type="checkbox" class="checkbox checkAll"/></th>
			                        <th>상품코드<br />기간계코드</th>
			                        <th>상품정보</th>
			                    </thead>
			                    <tbody>
			                    	<c:choose>
									    <c:when test="${not empty list}">
									    	<c:set var="listNum" value="${paging.listNum}" />
									    	<c:forEach var="item" items="${list }" varStatus="status">
									    		<input type="hidden" name="PRD_MST_PC_CPN_UNT_${item.PRD_MST_CD }" id="PRD_MST_PC_CPN_UNT_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_PC_CPN_UNT}"/>" />
									    		<input type="hidden" name="PRD_MST_PC_CPN_PRC_${item.PRD_MST_CD }" id="PRD_MST_PC_CPN_PRC_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_PC_CPN_PRC}"/>" />
									    		<input type="hidden" name="PRD_MST_MB_CPN_UNT_${item.PRD_MST_CD }" id="PRD_MST_MB_CPN_UNT_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_MB_CPN_UNT}"/>" />
									    		<input type="hidden" name="PRD_MST_MB_CPN_PRC_${item.PRD_MST_CD }" id="PRD_MST_MB_CPN_PRC_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_MB_CPN_PRC}"/>" />
						                        <tr>
						                            <td><input type="checkbox" name="PRD_MST_CDs" value="<c:out value="${item.PRD_MST_CD }" />" class="checkbox checkRow"/></td>
						                            <td>
						                                <p><c:out value="${item.PRD_MST_CD}"/></p>
						                                <p>[<c:out value="${item.PRD_MST_VDR_NM}" />]</p>
						                            </td>
						                            <td>
						                                <p>
						                                	<input type="hidden" class="text" name="PRD_MST_NM_${item.PRD_MST_CD }" id ="PRD_MST_NM_${item.PRD_MST_CD }" value="<c:out value="${item.PRD_MST_NM}" />" maxlength="100"  />
						                                	<c:choose>
						                                		<c:when test="${fn:length(item.PRD_MST_NM) > 50 }">
						                                			<c:out value="${fn:substring(item.PRD_MST_NM,0,50)}" />
						                                		</c:when>
						                                		<c:otherwise>
						                                			<c:out value="${item.PRD_MST_NM}" />
						                                		</c:otherwise>
						                                	</c:choose>
						                                </p>
						                                <p class="right">
						                                    <label for="priceSell1">판매가</label>
						                                    <input type="text" class="text" name="PRD_MST_PRC_${item.PRD_MST_CD }" id="PRD_MST_PRC_${item.PRD_MST_CD }" value="<fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" />" /> 원
						                                </p>
						                                <p class="right">
						                                    <label for="priceSearch1">검색가</label>
						                                    <input type="text" class="text" name="PRD_MST_SCH_PRC_${item.PRD_MST_CD }" id="PRD_MST_SCH_PRC_${item.PRD_MST_CD }" value="<fmt:formatNumber value="${item.PRD_MST_SCH_PRC }" groupingUsed="true" />" /> 원
						                                </p>
						                                <p class="right">
						                                    <label for="priceShip1">배송비</label>
						                                    <input type="text" class="text" name="PRD_MST_DLV_FEE_${item.PRD_MST_CD }" id="PRD_MST_DLV_FEE_${item.PRD_MST_CD }" value="<fmt:formatNumber value="${item.PRD_MST_DLV_FEE }" groupingUsed="true" />" disabled="disabled" /> 원
						                                </p>
						                                <p class="right">
						                                    <label for="amount1">판매수량</label>
						                                    <input type="text" class="text" name="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" id="PRD_MST_SEL_CNT_${item.PRD_MST_CD }" value="<fmt:formatNumber value="${item.PRD_MST_SEL_CNT }" groupingUsed="true" />" /> 원
						                                </p>
						                                <p class="right">
						                                    <select class="select" id="PRD_MST_DPL_STATE_${item.PRD_MST_CD }" name="PRD_MST_DPL_STATE_${item.PRD_MST_CD }" >
																<option value="Y" <c:if test="${item.PRD_MST_DPL_STATE eq 'Y'}"> selected=true</c:if>>YES</option>
																<option value="N" <c:if test="${item.PRD_MST_DPL_STATE eq 'N'}"> selected=true</c:if> >NO</option>
															</select>
						                                    <select name="PRD_MST_SEL_STATE_${item.PRD_MST_CD }" id="PRD_MST_SEL_STATE_${item.PRD_MST_CD }" class="select">
																<option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />"  <c:if test="${Code.PRODUCT_SELL_STATE_ING eq item.PRD_MST_SEL_STATE}"> selected=true</c:if> >판매중</option>
																<option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <c:if test="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT eq item.PRD_MST_SEL_STATE}"> selected=true</c:if> >일시품절</option>
																<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <c:if test="${Code.PRODUCT_SELL_STATE_TEMPOUT eq item.PRD_MST_SEL_STATE}"> selected=true</c:if> >품절상품</option>
																<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <c:if test="${Code.PRODUCT_SELL_STATE_STOP eq item.PRD_MST_SEL_STATE}"> selected=true</c:if> >미판매</option>
															</select><br/>
						                                    승인여부 : <c:out value="${item.PRD_MST_APV_STATE_NM }" />
						                                </p>
						                            </td>
						                        </tr>
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
			                </div>
						</c:otherwise>
					</c:choose>
				</form>
                <div class="section-button search">
                	<c:choose>
	                	<c:when test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
	                    	<a href="#none" id="productModify" class="button"><span>수정</span></a>
	                    </c:when>
	                    <c:otherwise>
							<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
								<a href="#none" id="productVdrModify" class="button button-a"><span>수정요청</span></a>
							</c:if>
						</c:otherwise>
					</c:choose>
                </div>
                
                <div class="pagination"><!-- pagination -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->


                <div class="bbs-status"><!-- bbs status -->
                    <div class="page">
                        총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
                    </div>
                    <div class="sort">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
					</div>
                </div><!-- // bbs status -->

                </form>
                

            </div><!-- // contents-inner -->

		</section><!-- // contents -->
              
	</div><!-- // body -->

    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    //체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");
  

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
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/basicProductList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductList.do", "target":"_self", "method":"post"}).submit();
    };
    
    
 	// 상품 수정
    $(document).on("click", "#productModify", function () {
    	if( $(".checkRow:checked").length == 0 ){
    		alert("수정 할 상품을 선택해 주십시오.");
    		return;
    	}
    	
    	var prdMstCd = "";
    	$(".checkRow:checked").each(function(){
    		prdMstCd = $(this).val();
    		if(prdMstCd != ""){
    			if($("input[name=PRD_MST_NM_"+prdMstCd+"]").val() == ""){
    				alert("변경 할 상품명을 입력해주세요.");
    				$("input[name=PRD_MST_NM_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val() == ""){
    				alert("변경 할 판매가를 입력해주세요.");
    				$("input[name=PRD_MST_PRC_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if(getInt($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val()) < 0){
    				alert("변경 할 판매가를 정수로 입력해주세요.");
    				$("input[name=PRD_MST_PRC_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val() == ""){
    				alert("변경 할 검색가를 입력해주세요.");
    				$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if(getInt($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val()) < 0){
    				alert("변경 할 검색가를 정수로 입력해주세요.");
    				$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if($("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val() == ""){
    				alert("변경 할 배송비를 입력해주세요.");
    				$("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if(getInt($("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val()) < 0){
    				alert("변경 할 배송비를 정수로 입력해주세요.");
    				$("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val() == ""){
    				alert("변경 할 판매가능수량을 입력해주세요.");
    				$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if(getInt($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val()) < 0){
    				alert("변경 할 판매가능수량을 정수로 입력해주세요.");
    				$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").focus();
    				return false;
    			}
    		}
    	});
    	if (confirm( "수정 하시겠습니까?")) 
        {
	        //콤마제거
	        $(".checkRow:checked").each(function(){
	        	prdMstCd = $(this).val();
	        	$("input[name=PRD_MST_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_PC_CPN_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_PC_CPN_PRC_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_MB_CPN_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_MB_CPN_PRC_"+prdMstCd+"]").val()));
	        });
	        
    		var $frm = $("#frm"); 
	       	$frm.attr({"action": "<c:out value="${serverDomain}" />/am/product/basicProductListModify.do", "target":"_self", "method":"post"}).submit(); 
        }
    });
 	
 	// 입점업체 상품 수정
    $(document).on("click", "#productVdrModify", function () {
    	if( $(".checkRow:checked").length == 0 ){
    		alert("수정 할 상품을 선택해 주십시오.");
    		return;
    	}
    	
    	var prdMstCd = "";
    	$(".checkRow:checked").each(function(){
    		prdMstCd = $(this).val();
    		if(prdMstCd != ""){
    			if($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val() == ""){
    				alert("변경 할 판매가를 입력해주세요.");
    				$("input[name=PRD_MST_PRC_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if(getInt($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val()) < 0){
    				alert("변경 할 판매가를 정수로 입력해주세요.");
    				$("input[name=PRD_MST_PRC_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val() == ""){
    				alert("변경 할 검색가를 입력해주세요.");
    				$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if(getInt($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val()) < 0){
    				alert("변경 할 검색가를 정수로 입력해주세요.");
    				$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val() == ""){
    				alert("변경 할 판매가능수량을 입력해주세요.");
    				$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").focus();
    				return false;
    			}
    			if(getInt($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val()) < 0){
    				alert("변경 할 판매가능수량을 정수로 입력해주세요.");
    				$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").focus();
    				return false;
    			}
    		}
    	});
    	if (confirm( "수정 하시겠습니까?")) 
        {
	        //콤마제거
	        $(".checkRow:checked").each(function(){
	        	prdMstCd = $(this).val();
	        	$("input[name=PRD_MST_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_PRC_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_SCH_PRC_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_DLV_FEE_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_SEL_CNT_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_PC_CPN_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_PC_CPN_PRC_"+prdMstCd+"]").val()));
	        	$("input[name=PRD_MST_MB_CPN_PRC_"+prdMstCd+"]").val(removeComma($("input[name=PRD_MST_MB_CPN_PRC_"+prdMstCd+"]").val()));
	        });
	        
    		var $frm = $("#frm"); 
	       	$frm.attr({"action": "<c:out value="${serverDomain}" />/am/product/basicProductListModify.do", "target":"_self", "method":"post"}).submit(); 
        }
    });
 	
    
});

</script>
</body>
</html>