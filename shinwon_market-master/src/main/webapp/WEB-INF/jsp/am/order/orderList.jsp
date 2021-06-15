<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">

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

                <h2 class="title"><span>${title }</span></h2>
                <hr>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span><c:out value="${orderStateNm}"/></span></h3>
                </div><!-- // section-title -->

				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" name="searchYn" value="Y" />

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
	                            <th><span>주문통합검색</span></th>
	                            <td colspan=5>
									<select class="select" id="searchOrdPrdOrderState" name="searchOrdPrdOrderState">
										<option value="">주문상태 선택</option>
		 								<c:forEach items="${orderStateCodeList}" var="data">
		 									<option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchOrdPrdOrderState}" g="selected"/>>
		 									    <c:out value="${data.CMN_COM_NM}"/>
		 									</option>
		 								</c:forEach>
									</select>
									<c:choose>
										<c:when test="${path eq 'CleanKing'}">
											<input type="hidden" id="searchDlvType" name="searchDlvType" value="${commandMap.searchDlvType}"/>
										</c:when>
										<c:otherwise>
											<select class="select" id="searchDlvType" name="searchDlvType">
												<option value="">배송구분 선택</option>
				 								<c:forEach items="${codes.DLV_TYPE}" var="data">
				 									<option value="${data.CMN_COM_IDX}" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchDlvType}" g="selected"/>>
				 									    ${data.CMN_COM_NM}
				 									</option>
				 								</c:forEach>
											</select>
										</c:otherwise>
									</c:choose>
	                            </td>
							</tr>
							<tr>
	                            <th><span>주문일자</span></th>
	                            <td colspan=5>
	                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                       			<input type="text" name="searchStartDate" id="searchStartDate" class="text" value="${commandMap.searchStartDate }" readonly="readonly" data-target-end="#searchEndDate"/> ~
	                       			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                                <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="${commandMap.searchEndDate }" readonly="readonly" data-target-start="#searchStartDate"/>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            </td>
							</tr>							
							<tr>
	                            <th><span>주문자</span></th>
	                            <td>
	                                <input type="text" class="text" name="searchOrderNm" value="${commandMap.searchOrderNm}"/>
	                            </td>
	                            <th><span>수령인명</span></th>
	                            <td>
	                                <input type="text" class="text" name="searchDlvNm" value="${commandMap.searchDlvNm}"/>
	                            </td>
	                            <th><span>아이디</span></th>
	                            <td>
	                                <input type="text" class="text" name="searchOrderId" value="${commandMap.searchOrderId}"/>
	                            </td>
	                        </tr>
							<tr>
	                            <th><span>상품코드</span></th>
	                            <td>
	                                <input type="text" class="text" name="searchProductCd" value="${commandMap.searchProductCd}"/>
	                            </td>
	                            <th><span>연락처</span></th>
	                            <td>
	                                <input type="text" class="text" name="searchOrderHp" value="${commandMap.searchOrderHp}"/>
	                            </td>
	                            <th><span>주문번호</span></th>
	                            <td>
	                                <input type="text" class="text" name="searchOrderCd" value="${commandMap.searchOrderCd}"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>입점업체</span></th>
	                            <td>
	                                <c:if test="${empty commandMap.ADM_MST_SUB_IDX }"><%-- 입점업체 관리자 아닌 경우 --%>
										<select class="select" id="searchVendor" name="searchVendor">
											<option value="">선택</option>
											<c:forEach var="item" items="${vendorList}">
												<option value="${item.VDR_MST_IDX}" <c:if test="${commandMap.searchVendor eq item.VDR_MST_IDX}">selected="selected"</c:if>><c:out value="${item.VDR_MST_NM}"/></option>
											</c:forEach>
										</select>
									</c:if>

									<c:if test="${not empty commandMap.ADM_MST_SUB_IDX && commandMap.ADM_MST_SUB_IDX gt 0}"><%-- 입점업체 관리자인 경우 --%>
										<c:forEach var="item" items="${vendorList}">
											<c:if test="${commandMap.ADM_MST_SUB_IDX eq item.VDR_MST_IDX}">${item.VDR_MST_NM}</c:if>
										</c:forEach>
									</c:if>
	                            </td>
                                <th><span>브랜드</span></th>
                                <td>
                                    <select class="select">
                                        <option value="">선택</option>
                                    </select>
                                </td>
                                <!-- 2020.06.09 코드값이 없음 -->
                                <th><span>회원구분</span></th>
                                <td>
                                    <select class="select" name="ADM_TYPE_NUM">
                                    	<option value="5">전체</option>
                                        <option value="1">회원</option>
                                        <option value="2">비회원</option>
                                        <option value="0">임직원</option>
                                        <!-- <option value="">제휴사</option> -->
                                    </select>
                                </td>
	                        </tr>
	                        <tr>
	                        	<th><span>카테고리</span></th>
                                <td colspan="3">
                                    <select class="select">
                                        <option value="">선택</option>
                                    </select>
                                    <select class="select">
                                        <option value="">선택</option>
                                    </select>
                                </td>
                                <th><span>상품유형</span></th>
                                <td>
                                    <select class="select">
                                        <option value="">전체</option>
                                    </select>
                                </td>
	                        </tr>
                            <tr>
                                <th><span>상품명</span></th>
                                <td colspan="3">
                                    <input type="text" class="text xlarge" name="searchProductNm" value="<c:out value="${commandMap.searchProductNm}"/>">
                                </td>
                                <th><span></span></th>
                                <td></td>
                            </tr>
	                        <tr>
                                <c:if test="${empty commandMap.ADM_MST_SUB_IDX }"><%-- 입점업체 관리자 아닌 경우 --%>
                                   <th><span>결제수단</span></th>
                                   <td colspan="3">
                                       <select class="select" id="searchPayType" name="searchPayType">
                                           <option value="">선택</option>
                                           <c:forEach items="${codes.PAY_TYPE}" var="data">
                                               <option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchPayType}" g="selected"/>>
                                                   <c:out value="${data.CMN_COM_NM}"/>
                                               </option>
                                           </c:forEach>
                                       </select>
                                       &nbsp;&nbsp;
                                       <%-- <input type="checkbox" id="searchCashbagUsed" name="searchCashbagUsed" class="checkbox" value="Y" <c:if test="${commandMap.searchCashbagUsed eq 'Y'}">checked="checked"</c:if> />
                                       <label for="searchCashbagUsed">OK CASHBAG 사용</label> --%>
                                       <input type="checkbox" id="searchMileageUsed" name="searchMileageUsed" class="checkbox" value="Y" <c:if test="${commandMap.searchMileageUsed eq 'Y'}">checked="checked"</c:if> />
                                       <label for="searchMileageUsed">포인트 사용</label>
                                   </td>
                               </c:if>
                                <th><span>주문경로</span></th>
	                            <td>
	                                <input type="radio" id="searchOrdType1" name="searchOrdType" class="checkbox" value="" <c:if test="${empty commandMap.searchOrdType }">checked="checked"</c:if> />
									<label for="searchOrdType1">전체</label>
									<input type="radio" id="searchOrdType2" name="searchOrdType" class="checkbox" value="${Code.USER_ENV_TYPE_PC }" <c:if test="${commandMap.searchOrdType eq Code.USER_ENV_TYPE_PC}">checked="checked"</c:if> />
									<label for="searchOrdType2">PC</label>
									<input type="radio" id="searchOrdType3" name="searchOrdType" class="checkbox" value="${Code.USER_ENV_TYPE_MOBILE }" <c:if test="${commandMap.searchOrdType eq Code.USER_ENV_TYPE_MOBILE}">checked="checked"</c:if> />
									<label for="searchOrdType3">MOBILE</label>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	            </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:search();" class="button small primary"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->

                <c:if test="${not empty path}">
					<div class="section-form"><!-- section-form-a -->
						<div class="form-group" style="margin : 5px;">
							<c:choose>
								<c:when test="${path eq 'PayReady'}">
									* 입금대기 주문만 확인 가능하며, 입금완료된 주문은 자동으로 <span style="font-weight: bold;">결제완료 목록으로 이동</span>합니다. <br/>
									* 입금기한(주문일 +3일) 내 입금되지 않은 주문은 자동 주문취소되어 <span style="font-weight: bold;">취소관리 목록으로 이동</span>합니다.
								</c:when>
								<c:when test="${path eq 'Pay'}">
									* 결제완료 주문만 확인 가능하며, <span style="font-weight: bold;">배송준비중 </span>처리해 주세요.<br/>
									* 배송준비중 처리된 주문은 배송준비중 상태로 변경되며, 배송관리 목록으로 이동됩니다.
								</c:when>
								<c:when test="${path eq 'Send'}">
									* 배송준비중, 배송보류, 배송중, 배송완료 상태의 주문을 확인할 수 있습니다. <br/>
									* 구매확정 처리된 주문은 <span style="font-weight: bold;">구매확정 목록으로 이동</span>합니다.
								</c:when>
								<c:when test="${path eq 'Fix'}">
									* 구매확정 상태의 주문을 확인할 수 있습니다.
								</c:when>
								<c:when test="${path eq 'Cancel'}">
									* 승인 즉시 취소(환불)가 불가능한 주문에 대한 입금 완료 후, 취소완료 처리를 위한 관리 목록입니다.<br/>
									* 주문취소, 취소접수, 취소완료 상태의 주문을 확인할 수 있습니다.
								</c:when>
								<c:when test="${path eq 'Swap'}">
									* 교환접수, 교환대기중, 교환승인, 교환배송중, 교환완료, 교환불가, 교환취소 상태의 주문을 확인할 수 있습니다.
								</c:when>
								<c:when test="${path eq 'Back'}">
									* 반품접수, 반품대기중, 반품승인, 반품완료, 반품불가, 반품취소 상태의 주문을 확인할 수 있습니다. <br/>
									* 신용카드, 계좌이체 /가상계좌 일부는  반품완료 시 즉시 결제취소 됩니다. <br/>
									* <span style="color: red;">즉시 결제취소(환불)가 불가능한 주문은 반품완료 시 환불접수 처리되며, </span>환불관리 목록에서도 확인 가능합니다.

								</c:when>
								<c:when test="${path eq 'Refund'}">
									* 환불접수, 환불완료 상태의 주문을 확인할 수 있으며, 환불처리 상태만 변경됩니다.
								</c:when>
								<c:when test="${path eq 'ScmCancel'}">
									* 입점업체에서 취소요청한 주문목록입니다. 주문상세에서 주문취소처리를 해주시면 됩니다.
								</c:when>
								<c:when test="${path eq 'OpenMarket'}">
									* 샵링커를 통해 주문수집된 <span style="font-weight: bold;">오픈마켓 주문만 조회</span>할 수 있습니다.
								</c:when>
								<c:when test="${path eq 'ScmOrder'}">
									* 입점업체 주문 목록입니다.
								</c:when>
								<c:when test="${path eq 'CleanKing'}">
									* 클린킹 주문 목록입니다.
								</c:when>
							</c:choose>
						</div>
					</div>
				</c:if>

				<form id="frm" name="frm">
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                    <div class="col-1-2 text-left">
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
	                    </div>
	                    <div class="col-1-2 text-right">
                            <a href="#" class="button small btn_invoice_batch"><span>송장일괄등록</span></a>
	                        <a href="javascript:goExcelDown();" class="button small primary"><span>엑셀 다운로드</span></a>
	                    </div>
	                </div><!-- // 목록 상단 버튼 -->
                    <div class="div_area cf">
                        <div class="div_area_left">
                            <a href="#" class="button small"><span>송장일괄샘플</span></a>
                        </div>
                        <div class="div_area_right">
                            <input type="file" id="batchRegistrationFile">
                            <button type="button" class="button small" id="batchRegistration"><span>일괄업데이트</span></button>
                        </div>
                    </div>

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: 3%;" />
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
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <c:if test="${commandMap.searchBack eq 'Y'}"><%-- 반품관리인 경우 --%>
	                    	<col style="width: auto;" />
	                    </c:if>
	                    <c:if test="${commandMap.showDateYn eq 'Y'}">
							<col style="width: auto;" />
						</c:if>
						<c:if test="${commandMap.searchScmCancel eq 'Y'}"><%-- 입점업체 취소요청인 경우 --%>
							<col style="width: auto;" />
						</c:if>
	                </colgroup>
	                <thead>
	                    <tr>
                            <th><input type="checkbox" class="checkbox checkAll" id="allCheck" name="allCheck"></th>
	                        <th>주문일시<br/>(주문번호)</th>
							<th>주문자</th>
							<th>수령인</th>
							<th>입점업체</th>
                            <th>브랜드</th>
                            <th>상품유형</th>
                            <th>이미지</th>
							<th>상품명/옵션정보</th>
							<th>상품가격</th>
							<th>수량</th>
							<th>할인금액</th>
							<th>배송비</th>
							<th>결제금액</th>
							<th>결제수단</th>
							<th>주문경로</th>
							<th>배송구분</th>
							<th>주문상태</th>
							<c:if test="${commandMap.showDateYn eq 'Y'}">
								<th>처리일자</th>
							</c:if>
							<c:if test="${commandMap.searchScmCancel eq 'Y'}"><%-- 입점업체 취소요청인 경우 --%>
								<th>요청일자/사유</th>
							</c:if>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
						    <c:when test="${not empty list}">
						        <c:set var="firstProd" value="Y"/>
								<c:set var="prevOrdMstCd" value=""/>
								<c:forEach items="${list}" var="data" varStatus="i">
									<!-- 같은 주문은 같은 색으로 음영처리 -->
									<c:if test="${data.ORD_MST_CD ne prevOrdMstCd}" >
								        <c:set var="firstProd" value="Y"/>
										<c:choose>
											<c:when test="${'N' ne sectionYn}">
											    <c:set var="sectionYn" value="N"/>
											</c:when>
											<c:otherwise>
											    <c:set var="sectionYn" value="Y"/>
											</c:otherwise>
										</c:choose>
									</c:if>
									<tr <c:if test="${'Y' eq sectionYn}" >class="section"</c:if>>
									<c:if test="${firstProd eq 'Y'}" >
										<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
											<input type="checkbox" name="toExcelDownOrdCds" value="<c:out value="${data.ORD_MST_CD }" />" class="checkbox checkRow"/>
										</td>
										<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
									        <p><a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" title="새 창 으로 열립니다."><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm"/></a></p>
									        <p><a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" title="새 창 으로 열립니다."><c:out value="${data.ORD_MST_CD}"/></a></p>
									        <c:if test="${not empty data.ORD_MST_PRE_CD}">
												<p>재결제(<c:out value="${data.ORD_MST_PRE_CD }"/>)</p>
											</c:if>
											<c:if test="${data.ORD_MST_CNL_YN eq 'Y' }">
												<p style="color: red;">취소요청</p>
											</c:if>
										</td>
										<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
										    <c:if test="${data.ORD_MST_ORD_ID ne '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/><br/>
										    	<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${data.ORD_MST_ORD_ID }" />');" title="새 창 으로 열립니다.">
										    		(<c:out value="${data.ORD_MST_ORD_ID}"/>)
										    	</a>
										    </c:if>
										    <c:if test="${data.ORD_MST_ORD_ID eq '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/><br/>(비회원)</c:if>
										</td>
										<td rowspan="${data.ORD_PRD_CNT }">
											<c:out value="${data.ORD_DLV_NM}"/>
										</td>
								    </c:if>
								    	<td class="border-left">${data.VDR_MST_NM}</td>
								    	<td>${data.BND_MST_BRAND_NM}</td>
										<td>
											<c:choose>
												 <c:when test = "${data.PRD_MST_TYPE eq 'G'}">일반</c:when>
												 <c:when test = "${data.PRD_MST_TYPE eq 'S'}">세트</c:when>
												 <c:when test = "${data.PRD_MST_TYPE eq 'B'}">묶음</c:when>
												 <c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
										<%-- <td>
									        <c:if test="${empty data.ORD_PRD_ORG_IDX or data.ORD_PRD_ORG_IDX eq 0}" >
										        <ui:brand brandCD="${data.PRD_MST_BRAND_CD}"/>
										    </c:if>
									        <c:if test="${not empty data.ORD_PRD_ORG_IDX and data.ORD_PRD_ORG_IDX ne 0}" >
										        <img src="<c:out value="${serverDomain}"/>/am/img/ico_reply.png">
										    </c:if>
										</td> --%>
										<td><img src="${cdnDomain}${data.PRODUCT_THUM_IMG}"/></td>
										<td>
											<a href="#">${data.PRD_MST_NM}</a><br>
			                                <a href="#">(${data.ORD_PRD_MST_CD})</a><br>
			                                COLOR : ${data.ORD_PRD_COLOR_VAL}<br>
			                                SIZE : ${data.ORD_PRD_SIZE_VAL}<br>
			                                <c:if test="${data.OPT_DTL_NM != null}">${data.OPT_DTL_NM}</c:if>
										</td>
										<td><fmt:formatNumber value="${data.ORD_PRD_ORD_PRC}" type="number"/></td>
										<td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>
										<c:if test="${firstProd eq 'Y'}" >
											<c:set var="discount">${data.ALL_POINT + data.CALCULATED_DC_COUPON }</c:set>
											<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
												<c:if test="${discount > 0 }">
													전체:<fmt:formatNumber value="${data.TOT_DC_AMT}" type="number"/><br/>----------
												</c:if>
												<c:if test="${discount == 0 }">0</c:if>
												<%-- <br/>즉시할인:<fmt:formatNumber value="${data.TOT_ORD_IST_CPN_PRC}" type="number"/> --%>
												<%-- <br/>포인트:<fmt:formatNumber value="${not empty data.ORD_MST_DC_MLG ? data.ORD_MST_DC_MLG : 0}" type="number"/> --%>
												<%-- <br/>캐쉬백:<fmt:formatNumber value="${data.ORD_MST_DC_OCB_PIT}" type="number"/> --%>
												<c:if test="${data.CALCULATED_DC_COUPON > 0 }">
													<br/>쿠폰:<fmt:formatNumber value="${data.CALCULATED_DC_COUPON}" type="number"/>
												</c:if>
												<c:if test="${data.PROMOTION > 0 }">
													<br/>프로모션할인:<fmt:formatNumber value="${data.PROMOTION}" type="number"/>
												</c:if>
												<c:if test="${data.E_POINT > 0 }">
													<br/>E포인트:<fmt:formatNumber value="${data.E_POINT}" type="number"/>
												</c:if>
												<c:if test="${data.TOT_POINT > 0 }">
													<br/>통합포인트:<fmt:formatNumber value="${data.TOT_POINT}" type="number"/>
												</c:if>
												<c:if test="${data.SW_POINT > 0 }">
													<br/>임직원 할인금액:<fmt:formatNumber value="${data.SW_POINT}" type="number"/>
												</c:if>
											</td>
										</c:if>

										<c:choose>
											<c:when test="${data.ORD_PRD_DLV_BND_YN eq 'Y' and data.VDR_ROWNUM eq 1}">
					                          	<td rowspan="${data.VDR_IDX_CNT}">
					                          		<fmt:formatNumber value="${data.TOT_PRD_DLV_CHARGE}" type="number"/>
					                     	  	</td>
					                        </c:when>
					                        <c:when test="${data.ORD_PRD_DLV_BND_YN ne 'Y'}">
					                          	<td>
					                          		<fmt:formatNumber value="${data.TOT_PRD_DLV_CHARGE}" type="number"/>
					                     	  	</td>
					                        </c:when>
				                        </c:choose>

										<c:if test="${firstProd eq 'Y'}" >
											<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
												<fmt:formatNumber value="${data.CALCULATED_PAYMENT_PRICE}" type="number"/>
												<c:if test="${data.TOT_ORD_DLV_ADD_CHARGE gt 0}">
													<br/>(추가 배송비 : <fmt:formatNumber value="${data.TOT_ORD_DLV_ADD_CHARGE}" type="number"/>)
												</c:if>
											</td>
											<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
												<c:out value="${data.ORD_MST_PAY_TYPE_NM}"/>

												<%-- 에스크로인 경우 구매확인/거절 여부 표시 --%>
												<c:if test="${data.ORD_MST_ECR_CFM_YN eq 'Y' }">
													<br/>(에스크로 구매확인)
												</c:if>
												<c:if test="${data.ORD_MST_ECR_CFM_YN eq 'N' }">
													<br/>(에스크로 구매거절)
												</c:if>

												<%-- <c:if test="${not empty data.PAYDATE and data.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT}">
													<br/>----------
													<br/>
													<ui:formatDate value="${data.PAYDATE}" pattern="MM/dd HH:mm"/>
												</c:if> --%>
											</td>
											<%-- <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />"><fmt:formatNumber value="${data.ORD_MST_DLV_CAG}" type="number"/></td>
											<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />"><fmt:formatNumber value="${data.ORD_MST_PAY_PRC}" type="number"/></td> --%>
											<%-- <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />"><c:out value="${data.ORD_MST_ORD_TYPE}"/></td> --%>
								        </c:if>

								        <td>
								        	<c:choose>
												 <c:when test = "${data.ORD_MST_ORD_TYPE  eq 'P'}">
												 	PC
												 </c:when>
												 <c:when test = "${data.ORD_MST_ORD_TYPE  eq 'M'}">
												 	모바일
												 </c:when>
												 <c:otherwise>
										         	-
										         </c:otherwise>
											</c:choose>
								        </td>
										<td class="delivery"> <!-- 배송구분 / ERP 재고 수량 -->
											${data.ORD_PRD_DLV_TYPE_NM}
											<c:if test="${not empty data.PRD_STOCK }">
												<br />(재고:${data.PRD_STOCK })
											</c:if>
											<c:if test="${data.ORD_PRD_DLV_TYPE eq Code.DLV_TYPE_PARCEL_SGS }">
												<p><a class="button button-a xsmall setDlvType"
													 data-ORD_MST_CD="${data.ORD_MST_CD }" data-ORD_PRD_MST_CD="${data.ORD_PRD_MST_CD }"
													 data-COLOR="${data.ORD_PRD_COLOR }" data-SIZE="${data.ORD_PRD_SIZE }">매장발송</a></p>
											</c:if>
										</td>
							        	<td>
								            <p>
								                <c:if test="${data.BACK_STATE_NM == null or data.BACK_STATE_NM == ''}">${data.ORD_PRD_ORD_STATE_NM}</c:if>
								                <c:if test="${data.BACK_STATE_NM != null or data.BACK_STATE_NM != ''}">${data.BACK_STATE_NM}</c:if>
								            </p>
<%-- 			                           		<c:if test="${not empty data.ORD_PRD_IVC_NO }"> --%>
<%-- 			                           				<p>(<a href="javascript:goDeliveryView('<c:out value="${data.DLV_CPN_URL }" /><c:out value="${data.ORD_PRD_IVC_NO }" />');" class="underline"><strong><c:out value="${data.ORD_PRD_IVC_NO }" /></strong></a>)</p> --%>
<%-- 			                           		</c:if> --%>
										</td>
										<c:if test="${commandMap.showDateYn eq 'Y'}">
											<td><ui:formatDate value="${data.RECENT_ORD_PRD_DT}" pattern="yyyy.MM.dd"/></td>
										</c:if>
										<c:if test="${commandMap.searchScmCancel eq 'Y'}">
											<td>
												<c:choose>
													<c:when test="${not empty data.ORD_PRD_SCM_CNL_YN }">
														<span style="color: red;">
															<ui:formatDate value="${data.ORD_PRD_SCM_CNL_DT}" pattern="yyyy.MM.dd"/><br/>
															[<c:out value="${data.ORD_PRD_SCM_CNL_DESC }"/>]
														</span>
													</c:when>
													<c:otherwise>
														-
													</c:otherwise>
												</c:choose>
											</td>
										</c:if>
									</tr>
									<c:set var="prevOrdMstCd" value="${data.ORD_MST_CD}"/>
						            <c:set var="firstProd" value="N"/>
								</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<c:if test="${commandMap.searchYn eq 'Y'}">
							    	<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
									</tr>
						    	</c:if>
						    	<c:if test="${commandMap.searchYn ne 'Y'}">
							    	<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
									</tr>
						    	</c:if>
						    </c:otherwise>
						</c:choose>
	                </tbody>
	                </table><!-- // table -->

	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="searchDateType" value="<c:out value="${commandMap.searchDateType }"/>"/>
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchOrder" value="<c:out value="${commandMap.searchOrder }"/>"/>
	                <input type="hidden" name="searchMD" value="<c:out value="${commandMap.searchMD }"/>" />
	                <input type="hidden" name="searchOrdPrdOrderState" value="<c:out value="${commandMap.searchOrdPrdOrderState }"/>"/>
	                <input type="hidden" name="searchDlvType" value="<c:out value="${commandMap.searchDlvType }"/>"/>

	                <input type="hidden" name="searchOrderNm" value="<c:out value="${commandMap.searchOrderNm }"/>"/>
	                <input type="hidden" name="searchDlvNm" value="<c:out value="${commandMap.searchDlvNm }"/>"/>
	                <input type="hidden" name="searchOrderCd" value="<c:out value="${commandMap.searchOrderCd }"/>"/>
	                <input type="hidden" name="searchSlipNo" value="<c:out value="${commandMap.searchSlipNo }"/>"/>
	                <input type="hidden" name="searchProductCd" value="<c:out value="${commandMap.searchProductCd }"/>"/>
	                <input type="hidden" name="searchErpProductCd" value="<c:out value="${commandMap.searchErpProductCd }"/>"/>
	                <input type="hidden" name="searchProductNm" value="<c:out value="${commandMap.searchProductNm }"/>"/>
	                <input type="hidden" name="searchOrderId" value="<c:out value="${commandMap.searchOrderId }"/>"/>
	                <input type="hidden" name="searchOrderHp" value="<c:out value="${commandMap.searchOrderHp }"/>"/>

	                <input type="hidden" name="searchPaymentPrice1" value="<c:out value="${commandMap.searchPaymentPrice1 }"/>"/>
	                <input type="hidden" name="searchPaymentPrice2" value="<c:out value="${commandMap.searchPaymentPrice2 }"/>"/>
	                <input type="hidden" name="searchProductType" value="<c:out value="${commandMap.searchProductType }"/>"/>
	                <input type="hidden" name="searchProduct" value="<c:out value="${commandMap.searchProduct }"/>"/>

	                <input type="hidden" name="searchOrdType" value="<c:out value="${commandMap.searchOrdType }"/>"/>
	                <input type="hidden" name="searchPayType" value="<c:out value="${commandMap.searchPayType }"/>"/>
					<input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />

					<input type="hidden" name="searchChannel1" value="<c:out value="${commandMap.searchChannel1 }"/>" />
					<input type="hidden" name="searchChannel2" value="<c:out value="${commandMap.searchChannel2 }"/>" />
					<input type="hidden" name="searchSysRetailPrd" value="<c:out value="${commandMap.searchSysRetailPrd }"/>" />
					<input type="hidden" name="searchCashbagUsed" value="<c:out value="${commandMap.searchCashbagUsed }"/>" />
					<input type="hidden" name="searchMileageUsed" value="<c:out value="${commandMap.searchMileageUsed }"/>" />

					<input type="hidden" name="searchLngDiv24" value="<c:out value="${commandMap.searchLngDiv24 }"/>" />
					<input type="hidden" name="searchLngDiv36" value="<c:out value="${commandMap.searchLngDiv36 }"/>" />

					<input type="hidden" name="searchCancelRequest" value="<c:out value="${commandMap.searchCancelRequest }"/>" />

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

<form id="prdFrm" name="prdFrm">
	<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value=""/>
	<input type="hidden" id="searchPrdMstErpCd" name="searchPrdMstErpCd" value=""/>
</form>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/papaparse.min.js"></script>
<script>
$(function() {
	
	// 매장발송 버튼 클릭시 (2020.06.22 추가)
	$('.setDlvType').click(function() {
		if(confirm("입점사에 택배 발송 요청 하시겠습니까?")){
			var data = "ORD_ORD_MST_CD=" + $(this).data('ord_mst_cd');
			data += "&ORD_PRD_MST_CD=" + $(this).data('ord_prd_mst_cd');
			data += "&ORD_PRD_COLOR=" + $(this).data('color');
			data += "&ORD_PRD_SIZE=" + $(this).data('size');
			$.ajax({
				url : "/am/order/updateDeliveryTypeAjax.do?" + data,
				dataType : "json",
				async : false,
				success : function(data){
					if(data.result == "success"){
						alert("처리되었습니다.")
						location.reload();
					}else{
						alert("오류가 발생했습니다.");
					}
				},
				error : function(err){
					alert("오류가 발생했습니다.\n[" + err.status + "]");
				}
			});
		}
	});
	
	$('#batchRegistration').click(function(){
	    var validExts = new Array(".csv");
		var file = document.getElementById('batchRegistrationFile');
	    var fileExt = file.value;
	    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
	 
	    if (fileExt && validExts.indexOf(fileExt) < 0) {
	        alert(validExts.toString() + "이외의 타입은 사용 하실 수 없습니다");
	        return false;
	    }	 
	
	    var reader = new FileReader();
	    reader.onload = function (sender) {
	        var data = Papa.parse(sender.target.result);
			var row = []; 
			var param = [];
			var array = [];
	        if (fileExt === ".csv") {
	            row = data.data;
				var header = row[0];
				var orderIdIndex = -1;
				var deleveryCompanyIndex = -1;
				var deleveryNumberIndex = -1;
				var productCodeIndex = -1;
				var colorValueIndex = -1;
				var sizeValueIndex = -1;
				var optValueIndex = -1;
				for(var j=0;j<header.length;j++){
					if(header[j]=='주문번호'){
						orderIdIndex = j;
					}
					else if(header[j]=='택배사'){
						deleveryCompanyIndex = j;
					}
					else if(header[j]=='송장번호'){
						deleveryNumberIndex = j;
					}
					else if(header[j]=='상품품번'){
						productCodeIndex = j;
					}
					else if(header[j]=='색상'){
						colorValueIndex = j;
					}
					else if(header[j]=='사이즈'){
						sizeValueIndex = j;
					}
					else if(header[j]=='추가옵션'){
						optValueIndex = j;
					}
				}
				
				if( orderIdIndex<0 || deleveryCompanyIndex<0 || deleveryNumberIndex<0 || productCodeIndex<0){
					alert('내용이 올바르지 않습니다.');
					return;
				}
				
				//헤더를 제외해야하므로 1부터 시작
				for(var i=1;i<row.length;i++){
					if(!Array.isArray(row[i]) || row[i].length<=1){continue;}
					var obj = {};
					param = row[i];
					obj.ORD_ORD_MST_CD = param[orderIdIndex];
					obj.ORD_DLV_CPN_IDX = param[deleveryCompanyIndex];
					obj.ORD_PRD_IVC_NO = param[deleveryNumberIndex];
					obj.ORD_PRD_MST_CD = param[productCodeIndex];
					obj.ORD_PRD_COLOR_VAL = param[colorValueIndex];
					obj.ORD_PRD_SIZE_VAL = param[sizeValueIndex];
					obj.OPT_DTL_NM = param[optValueIndex];
					array.push(obj);
				}
				$.ajax({
					method:'POST',
					data:{list:JSON.stringify(array)},
					url:'/am/order/batchRegistrationAjax.do',
					success:function(response){
						console.log(response);
					}
				})
				console.log(array);
	        }
	    };
		console.log(reader.readAsText(file.files[0], "EUC-KR"));
	});
    // 송장일광등록
    $('.btn_invoice_batch').on('click', function(){
        $('.div_area').toggleClass('active');
    });

	// 경로 설정
	var path = "<c:out value="${path}"/>";

	// 주문상태 disabled 처리
	if(path == "PayReady" || path == "Pay" || path == "Fix"){
		$("#searchOrdPrdOrderState").prop("disabled",true);
	}

	//체크박스 전체 선택
    //$.checkBoxSelect("checkAll", "checkRow");
	    
      	$("#allCheck").click(function(){
     	if($("#allCheck").prop("checked")) {
     		$("#frm").find("input[type='checkbox']").prop("checked", true);
     	} else {
     		$("#frm").find("input[type='checkbox']").prop("checked", false);
     	}
    	})
    	

	//선택채널이 있는 경우 리스트 가져온다.
	<c:if test="${commandMap.searchChannel1 eq 'channel'}">
		getSubChannelListAjax();
	</c:if>

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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/order/order"+ path +"List.do", "target":"_self", "method":"post"}).submit();
    };

    // 페이지 이동
    goPage = function (cPage)
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/order"+ path +"List.do", "target":"_self", "method":"post"}).submit();
    };

    // 엑셀다운
    goExcelDown = function ()
    {
    	if("${paging.totalRecordCount}" > 10000){
    		alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
    		return;
    	}else if("${paging.totalRecordCount}" == 0){
    		alert("저장할 내역이 없습니다.");
    		return;
    	}

        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderListExcel.do", "target":"_self", "method":"post"}).submit();
    };

    // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
    	//goSearchDelivery(url);
        popup(url, "550", "700", "yes", "deliveryView");
    };

 	// 채널 선택시 하위 채널 리스트
    $(document).on("change", "#searchChannel1", function ()
    {
        if($(this).val() == "channel"){
        	getSubChannelListAjax();
        }else{
        	$("#searchChannel2").html("<option value=\"\">선택없음</option>");
        	//$("#searchChannel2").hide();
        }
    });

 	// 상품 상세페이지 이동
    goProductView = function (prdMstCd)
    {
        var $prdFrm = $("#prdFrm");
        $("#PRD_MST_CD").val(prdMstCd);
        $prdFrm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
    };

  	//erp 상품 상세페이지 팝업
    goErpPrdDetail = function (erpMstCd)
    {
        var $prdFrm = $("#prdFrm");
        $("#searchPrdMstErpCd").val(erpMstCd);
        popup('',"1100","800","no","_ErpMstPrdDetailPopup");
        $prdFrm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/legacyErpProductDetailPopup.do", "target":"popup_ErpMstPrdDetailPopup", "method":"post"}).submit();
    };
});

// 하위 채널 리스트
function getSubChannelListAjax(){
	$.ajax({
		type:"post",
		url : "<c:out value="${serverDomain}" />/am/order/getSubChannelListAjax.do",
		data : null,
		dataType : "json",
		async : false,
		success : function(data){
			var htmlStr = "<option value=\"\">선택</option>";
			var searchChannel2 = "${commandMap.searchChannel2}";

			//하위 채널 리스트
			$.each(data.list, function(i, item){
				var selected = "";
				if(item.CHN_DTL_CD == searchChannel2){
					selected = "selected=\"selected\"";
				}

				htmlStr += "<option value=\""+ item.CHN_DTL_CD +"\" "+ selected +"> "+ item.CHN_DTL_NM +"</option>";
			});
			$("#searchChannel2").html(htmlStr);
			//$("#searchChannel2").show();
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
}
//-->
</script>

</body>
</html>
