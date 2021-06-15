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

			<h2 class="title"><span>주문번호검색</span></h2>
			<h3 class="title"><span>목록</span></h3>

            <form name="searchForm" id="searchForm">
				<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				<input type="hidden" name="searchYn" value="Y" />
				
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom:0;">
		            <colgroup>
						<col style="width: 10%;">
						<col style="width: 40%;">
						<col style="width: 10%;">
						<col style="width: 40%;">
		            </colgroup>
					<tbody>
						<tr>
							<th><span>주문통합검색</span></th>
							<td colspan="3">
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
			 									<option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchDlvType}" g="selected"/>>
			 									    <c:out value="${data.CMN_COM_NM}"/>
			 									</option>
			 								</c:forEach>
										</select>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th><span>주문일자</span></th>
							<td colspan="3">
								<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                       			<input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
                       			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
								<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
							</td>
						</tr>
						<tr>
							<th><span>주문자</span></th>
							<td>
								<input type="text" name="searchOrderNm" value="<c:out value="${commandMap.searchOrderNm}"/>" class="text xlarge">
							</td>
							<th><span>수령인명</span></th>
							<td>
								<input type="text" name="searchDlvNm" value="<c:out value="${commandMap.searchDlvNm}"/>" class="text xlarge">    
							</td>
						</tr>
						<tr>
							<th><span>상품품번</span></th>
							<td>
								<input type="text" name="searchProductCd" value="<c:out value="${commandMap.searchProductCd}"/>" class="text xlarge">
							</td>
							<th><span>주문번호</span></th>
							<td>
								<input type="text" name="searchOrderCd" value="<c:out value="${commandMap.searchOrderCd}"/>" class="text xlarge">    
							</td>
						</tr>
						<tr>
							<th><span>상품명</span></th>
							<td colspan="3">
								<input type="text" name="searchProductNm" value="<c:out value="${commandMap.searchProductNm}"/>" class="text xlarge">  
							</td>
						</tr>
						<tr>
							<th><span>아이디</span></th>
							<td>
								<input type="text" name="searchOrderId" value="<c:out value="${commandMap.searchOrderId}"/>" class="text xlarge">
							</td>
							<th><span>연락처</span></th>
							<td>
								<input type="text" name="searchOrderHp" value="<c:out value="${commandMap.searchOrderHp}"/>" class="text xlarge">    
							</td>
						</tr>
					</tbody>
	        	</table><!-- // table -->
		    </form>
		    
			<div class="grid section-button-search">
				<a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
				<a href="javascript:search();" class="button small primary"><span>검색</span></a>
			</div>
			
			<form id="frm" name="frm">
			    <div class="grid section-button-list btn_many">
					<div class="col-1-2 text-left">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
						<span class="pages">
							(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
						</span>
					</div>
				</div>
				<table class="table-col table-b">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" name="allCheck" id="allCheck" class="checkbox checkAll"></th>
							<th>주문일시<br>(주문번호)</th>
							<th>주문자</th>
							<th>수령인</th>
							<th>이미지</th>
							<th>상품/옵션정보</th>
							<th>상품가격</th>
							<th>수량</th>
							<th>결제금액</th>
							<th>결제수단</th>
							<th>배송구분</th>
							<th>주문상태</th>
						</tr>
					</thead>
					<tbody id="orderList">
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
												<input type="checkbox" name="ORD_MST_CDs" value="<c:out value="${data.ORD_MST_CD }" />" class="checkbox checkRow"/>
											</td>
											<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
										        <p><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy-MM-dd HH:mm"/></p>
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
													(<c:out value="${data.ORD_MST_ORD_ID}"/>)
											    </c:if>
											    <c:if test="${data.ORD_MST_ORD_ID eq '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/><br/>(비회원)</c:if>
											</td>
											<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
												<c:out value="${data.ORD_DLV_NM}"/>
											</td>
										</c:if>
											<td class="border-left">
												<img src="${cdnDomain}${data.PRODUCT_THUM_IMG}"/>
											</td>
											<td>
												<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${data.ORD_PRD_MST_CD }" />" target="_blank" title="새 창으로 열립니다.">
												<c:out value="${data.PRD_MST_NM}"></c:out><br>
				                                (<c:out value="${data.ORD_PRD_MST_CD}"></c:out>)
				                                </a><br>
				                                COLOR : <c:out value="${data.ORD_PRD_COLOR_VAL}"></c:out><br>
				                                SIZE : <c:out value="${data.ORD_PRD_SIZE_VAL}"></c:out><br>
				                                 <c:if test="${data.OPT_DTL_NM != null}">
				                                <c:out value="${data.OPT_DTL_NM}"></c:out><br>
				                                 </c:if>
											</td>
											<td><fmt:formatNumber value="${data.ORD_PRD_ORD_PRC}" type="number"/></td>
											<td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>
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
												</td>
									        </c:if>
									        <td class="delivery"> <!-- 배송구분 / ERP 재고 수량 -->
												${data.ORD_PRD_DLV_TYPE_NM}
											</td>
									        <td>
									            <p>
									                <c:if test="${data.BACK_STATE_NM == null or data.BACK_STATE_NM == ''}">${data.ORD_PRD_ORD_STATE_NM}</c:if>
									                <c:if test="${data.BACK_STATE_NM != null or data.BACK_STATE_NM != ''}">${data.BACK_STATE_NM}</c:if>
									            </p>
											</td>
										
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
				</table>
			</form>
			
			<div class="section-pagination">
				<h4 class="sr-only">목록 페이징</h4>
				<div class="wrap">
					<ui:paging paging="${paging }" jsFunction="goPage" />
				</div>
			</div>
			<div class="section-button">
				<div class="wrap text-center">
					<a href="javascript:;" id="closePopup" class="button" onclick="self.close()"><span>취소</span></a>
					<a href="javascript:;" id="orderApply" class="button primary"><span>선택</span></a>
				</div>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script type="text/javascript">
$(function(){
	//체크박스 전체 선택
	$.checkBoxSelect("checkAll", "checkRow");

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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/order/searchVendorOrderPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
	// 페이지 이동
	goPage = function (cPage) 
	{
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/searchVendorOrderPopup.do", "target":"_self", "method":"post"}).submit();
	};
	
    // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };
    
    //선택 클릭 이벤트
    $(document).on("click", "#orderApply", function (){
    	var ordMstCd = "";
    	var params = new Array();
		var $checkObj = $.find("#orderList input[name='ORD_MST_CDs']:checked");
		if( $checkObj.length == 0 ){
			alert("주문을 선택하여 주십시오.");
			return;
		}
		if( $checkObj.length > 1 ){
			alert("주문번호는 1개만 선택 가능합니다.");
			return;
		}
		$.each($checkObj, function(index,item){
			var map = new Object();
			map.ORD_MST_CD = $(this).val();
			params.push(map);
		});
		
		window.opener.fnResultVendorOrder(params);   	
		self.close();
    });
});

</script>

</body>
</html>
