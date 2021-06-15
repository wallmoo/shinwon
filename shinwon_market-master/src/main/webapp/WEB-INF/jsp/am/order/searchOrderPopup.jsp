<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">주문검색</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">검색</h4>

			<div class="right">
				<a href="javascript:search();" class="button button-b"><span>검색</span></a>
				<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
			</div>
		</div>

		<div class="section-form"><!-- section-form-a -->

        <form id="searchForm" name="searchForm">
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />        
            <input type="hidden" name="searchYn" value="Y" />
            
			<div class="form-group">
				<div class="col">
					<label class="label"><span>주문일자</span></label>
					<div class="field">
						<input type="text" class="text datepicker s-datepicker" name="searchStartDate" id="searchStartDate" value="<c:out value="${commandMap.searchStartDate}"/>" /> ~
						<input type="text" class="text datepicker e-datepicker" name="searchEndDate" id="searchEndDate" value="<c:out value="${commandMap.searchEndDate}"/>" />
						<!-- <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a> -->
						<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                           <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                           <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                           <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                           <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
                           (날짜형식: YYYY-MM-DD)
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col">
					<label class="label"><span>주문번호</span></label>
					<div class="field">
						<input type="text" class="text short" name="searchOrderCd" value="<c:out value="${commandMap.searchOrderCd}"/>"/> 
					</div>
				</div>					
			</div>
			
			<div class="form-group">
				<div class="col">
					<label class="label"><span>주문자/주문자ID</span></label>
					<div class="field">
						<input type="text" class="text short" name="searchOrderNm" value="<c:out value="${commandMap.searchOrderNm}"/>"/> 
						/
						<input type="text" class="text short" name="searchOrderId" value="<c:out value="${commandMap.searchOrderId}"/>"/> 
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col">
					<label class="label"><span>주문상태</span></label>
					<div class="field">
						<select class="select" id="searchOrdPrdOrderState" name="searchOrdPrdOrderState">
							<option value="">주문상태 선택</option>
								<c:forEach items="${orderStateCodeList}" var="data">
									<option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchOrdPrdOrderState}" g="selected"/>>
									    <c:out value="${data.CMN_COM_NM}"/>
									</option> 
								</c:forEach> 
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="label"><span>주문매체</span></label>
				<div class="field">
					<input type="radio" id="searchOrdType1" name="searchOrdType" class="checkbox" value="" <c:if test="${empty commandMap.searchOrdType }">checked="checked"</c:if> />
					<label for="searchOrdType1">전체</label>
					<input type="radio" id="searchOrdType2" name="searchOrdType" class="checkbox" value="${Code.MEMBER_JOIN_TYPE_PC }" <c:if test="${commandMap.searchOrdType eq Code.MEMBER_JOIN_TYPE_PC}">checked="checked"</c:if> />
					<label for="searchOrdType2">PC</label>
					<input type="radio" id="searchOrdType3" name="searchOrdType" class="checkbox" value="${Code.MEMBER_JOIN_TYPE_MOBILE }" <c:if test="${commandMap.searchOrdType eq Code.MEMBER_JOIN_TYPE_MOBILE}">checked="checked"</c:if> />
					<label for="searchOrdType3">MOBILE</label>
				</div>
			</div>
					
		</form>

		</div><!-- // section-form-a -->

		<div class="title-box">
			<h4 class="title">리스트</h4>
		</div>

		<form id="frm" name="frm">
				
		<div class="table-a"><!-- col list -->
			<table class="core">
				<thead>
					<tr>
						<th><input type="checkbox" class="checkbox checkAll"/></th>
						<th>주문일시<br/>(주문번호)</th>
						<th>주문자</th>
						<th>상품코드<br/>(기간계코드)</th>
						<th>상품명</th>
						<th>수량</th>
						<th>결제금액</th>
						<th>주문상태</th>
						<th>주문매체</th>
					</tr>
				</thead>
				<tbody id="tbodyOrderList">
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
									<input type="checkbox" name="ordMstCds" value="<c:out value="${data.ORD_MST_CD }" />" class="checkbox checkRow"/>
								</td>
								<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
							        <p><a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" title="새 창 으로 열립니다."><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm"/></a></p>
							        <p>(<a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" title="새 창 으로 열립니다."><c:out value="${data.ORD_MST_CD}"/></a>)</p>
							        <c:if test="${not empty data.ORD_MST_PRE_CD}">
										<p>재결제</p>
									</c:if>
								</td>
								<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
								    <c:if test="${data.ORD_MST_ORD_ID ne '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/><br/>(<c:out value="${data.ORD_MST_ORD_ID}"/>)</c:if>
								    <c:if test="${data.ORD_MST_ORD_ID eq '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/><br/>(비회원)</c:if>
								</td>
						    </c:if>
						    	<td>
						    		<a href="javascript:goProductView('<c:out value="${data.ORD_PRD_MST_CD }" />');">
										<c:out value="${data.ORD_PRD_MST_CD}"/>
										<c:choose>
											<c:when test="${data.ORD_PRD_OPT_DTL_IDX gt 0}">
												<c:if test="${not empty data.OPT_DTL_ERP_CD}">
													<br/>(<c:out value="${data.OPT_DTL_ERP_CD}"/>)
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${not empty data.PRD_MST_ERP_CD}">
													<br/>(<c:out value="${data.PRD_MST_ERP_CD}"/>)
												</c:if>
											</c:otherwise>
										</c:choose>
									</a>
								</td>
								<td>
									<c:if test="${not empty data.ORD_PRD_ORG_IDX}" > 
							        	<img src="<c:out value="${serverDomain}"/>/am/img/ico_reply.png" alt="교환" style="width:17px;" />
							        </c:if>
									
									<c:choose>
						    			<c:when test="${data.ORD_PRD_SLT_YN eq 'N' }"><%-- 마스터 or 필수옵션인 경우 --%>
						    				<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${data.ORD_PRD_MST_CD}&ADMIN=Y" target="_blank">
												<c:out value="${data.PRD_MST_NM}"/>
											</a>
											<c:if test="${data.ORD_PRD_OPT_DTL_IDX gt 0 }"><%-- 필수옵션인 경우 --%>
												<br/>
												(옵션)
												<c:out value="${data.OPT_DTL_NM }"/>
											</c:if>
						    			</c:when>
						    			<c:when test="${data.ORD_PRD_SLT_YN ne 'N' }"><%-- 선택옵션인 경우 --%>
						    				(옵션)
						    				<c:out value="${data.OPT_DTL_NM }"/>
						    			</c:when>
						    		</c:choose>
									
								</td>
								<td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>
								
								<c:if test="${firstProd eq 'Y'}" > 	
									<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
										<fmt:formatNumber value="${data.CALCULATED_PAYMENT_PRICE}" type="number"/>
									</td>
						        </c:if>
						        
					        	<td class="delivery">
						            <p>
						                <c:out value="${data.ORD_PRD_ORD_STATE_NM}"/>
						            </p>	
	                           		<c:if test="${not empty data.ORD_PRD_IVC_NO }">
	                           				<p>(<a href="javascript:goDeliveryView('<c:out value="${data.DLV_CPN_URL }" /><c:out value="${data.ORD_PRD_IVC_NO }" />');" class="underline"><strong><c:out value="${data.ORD_PRD_IVC_NO }" /></strong></a>)</p>
	                           		</c:if>
								</td>
								
								<c:if test="${firstProd eq 'Y'}" > 	
									<td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
										<c:out value="${data.ORD_MST_ORD_TYPE eq 'P' ? 'PC' : 'MOBILE' }"/>
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
			</table>
		</div><!-- // col list -->
		
        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
        <input type="hidden" name="searchOrdPrdOrderState" value="<c:out value="${commandMap.searchOrdPrdOrderState }"/>"/>
        <input type="hidden" name="searchOrderNm" value="<c:out value="${commandMap.searchOrderNm }"/>"/>
        <input type="hidden" name="searchOrderCd" value="<c:out value="${commandMap.searchOrderCd }"/>"/>
        <input type="hidden" name="searchOrderId" value="<c:out value="${commandMap.searchOrderId }"/>"/>
        <input type="hidden" name="searchOrdType" value="<c:out value="${commandMap.searchOrdType }"/>"/>
		<input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />		
		
		<div class="pagination"><!-- pagination -->
			<ui:paging paging="${paging}" jsFunction="goPage" />
              </div><!-- // pagination -->

		<div class="bbs-status"><!-- bbs status -->
			<div class="sort">
				<ui:pageSizeBox value="${paging.pageSize}" name="pageSize" type="" jsFunction="goPage"/>
			</div>
			<div class="page">
				총 <strong class="em">${paging.totalRecordCount}</strong>건, ${paging.cPage} of ${paging.totalPageCount} page
			</div>
		</div><!-- // bbs status -->
		
		</form>
        
        <div class="section-button-popup"><!-- section button -->
			<a href="#none" id="orderApply" class="button button-b"><span>선택</span></a>
			<a href="#none" id="closePopup" class="button button-b"><span>취소</span></a>
		</div>
	</div><!-- // contents -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {
	
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

        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/order/searchOrderPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/searchOrderPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
	 // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };
    
 	// 상품 상세페이지 이동
    goProductView = function (prdMstCd)
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD="+prdMstCd, "target":"_blank", "method":"post"}).submit();
    };
    
    // 선택 클릭 이벤트
    $(document).on("click", "#orderApply", function () 
    {
    	var $checkObj = $.find("#tbodyOrderList input[name='ordMstCds']:checked");
    	var searchType = $("#searchType").val();
    	
    	if( $checkObj.length == 0 ){
    		alert("주문을 선택하여 주십시오.");
    		return;
    	}
    	
    	/* if(searchType =="D"){
    		if( $checkObj.length > 1 ){
        		alert("주문을 1개만 선택하여 주십시오.");
        		return;
        	}
    	} */
    	  	
    	var params = new Array();
    	var obj;
    	$.each($checkObj, function(index,item){
    		var $ordMstCd = $(this).val();
    		obj = new Object();
    		obj.ORD_MST_CD 				= $ordMstCd;	//주문번호
    		
    		params.push(obj); //만들어진  object를 배열에 추가
    	});
    	
    	// 검증
    	$.each( params, function( index, el ){
    		alert(el.ORD_MST_CD);
    	});
    	
    	if(	window.opener.fnResultOrder(params) )    	
    		self.close();
    });
    
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
});
//]]>
</script>
</body>
</html>
