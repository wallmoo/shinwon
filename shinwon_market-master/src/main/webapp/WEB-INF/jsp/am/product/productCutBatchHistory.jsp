<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">상품전시기준(품절)관리 - 품절처리 상품</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">[ <c:out value="${list[0].CMN_BRD_NM }" /> ] 품절상품 이력조회 </h4>
			<div class="right">
				<a href="javascript:search();" class="button button-b"><span>검색</span></a>
				<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
			</div>
		</div>

		<div class="section-form"><!-- section-form-a -->
				
            <form id="searchForm" name="searchForm">
            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
			<input type="hidden" name="searchYn" value="Y" />
            <input type="hidden" name="PRD_CUT_HISTORY_IDX" value="${commandMap.PRD_CUT_HISTORY_IDX }" />             

				<div class="form-group">
					<label class="label"><span>상품코드</span></label>
					<div class="field">
 						<input type="text" class="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" /> 
					</div>
				</div>

				<div class="form-group">
					<label class="label"><span>상품명</span></label>
					<div class="field">
						<input type="text" class="text" id="searchPrdMstNmKor" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>" />
					</div>
				</div>

				<div class="form-group">
					<label class="label"><span>현재판매상태</span></label>
					<div class="field">
						<input type="radio" id="searchPrdMstSellState1" name="searchPrdMstSellState" class="checkbox channelType" value="" <c:if test="${empty commandMap.searchPrdMstSellState}">checked="checked"</c:if> />
						<label for="searchPrdMstSellState1">전체</label>
						<input type="radio" id="searchPrdMstSellState2" name="searchPrdMstSellState" class="checkbox channelType" value="${Code.PRODUCT_SELL_STATE_ING }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_ING}">checked="checked"</c:if> />
						<label for="searchPrdMstSellState2">판매중</label>
						<input type="radio" id="searchPrdMstSellState3" name="searchPrdMstSellState" class="checkbox channelType" value="${Code.PRODUCT_SELL_STATE_STOP }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_STOP}">checked="checked"</c:if> />
						<label for="searchPrdMstSellState3">미판매<%--판매중지 --%></label>
						<input type="radio" id="searchPrdMstSellState4" name="searchPrdMstSellState" class="checkbox channelType" value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_TEMPOUT}">checked="checked"</c:if> />
						<label for="searchPrdMstSellState4">품절상품<%--일시품절 --%></label>
						<input type="radio" id="searchPrdMstSellState5" name="searchPrdMstSellState" class="checkbox channelType" value="${Code.PRODUCT_SELL_STATE_READY }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_READY}">checked="checked"</c:if> />
						<label for="searchPrdMstSellState5">등록대기상품<%--등록대기상품 --%></label>
					</div>
				</div>
										
				<div class="form-group">
					<label class="label"><span>개발년도</span></label>
					<div class="field">
 						<input type="text" class="text" id="searchPrdMstDvlpYear" name="searchPrdMstDvlpYear" value="<c:out value="${commandMap.searchPrdMstDvlpYear }"/>" /> 
					</div>
				</div>
				
				<div class="form-group">
					<label class="label"><span>상품구분</span></label>
					<div class="field">
						<select class="select" id="searchPrdMstGdsSctnCd" name="searchPrdMstGdsSctnCd" >
							<option value="">전체</option>
                               <c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
                                   <option value="${prdGdsSctnItem.CMN_COM_ETC1}" <ui:select v="${commandMap.searchPrdMstGdsSctnCd }" t="${prdGdsSctnItem.CMN_COM_ETC1 }" g="selected"/>><c:out value="${prdGdsSctnItem.CMN_COM_NM }" /></option>
                               </c:forEach>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="label"><span>계절코드</span></label>
					<div class="field">
 						<input type="text" class="text" id="searchPrdSsonCd" name="searchPrdSsonCd" value="<c:out value="${commandMap.searchPrdSsonCd }"/>" /> 
					</div>
				</div>	
				
				<div class="form-group">
					<label class="label"><span>배치작업기간</span></label>
					<div class="field">
						<input type="text" class="text datepicker s-datepicker" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />" /> ~
						<input type="text" class="text datepicker e-datepicker" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />" />
						<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                        <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                        <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                        <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                        (날짜형식: YYYY-MM-DD)
					</div>
				</div>
			</form>
		</div><!-- // section-form-a -->
		
		<div class="title-box">
			<h4 class="title">품절상품 목록</h4>
		</div>
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 40px" />
					<col style="width: 120px" />
					<col />
					<col style="width: 80px" />
					<col style="width: 100px" />
					<col style="width: 100px" />
					<col style="width: 100px" />
					<col style="width: 80px" />
					<col style="width: 80px" />
					<col style="width: 80px" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>물류센터</th>
						<th>소비자가격</th>
						<th>판매가격</th>
						<th>할인율</th>
						<th>판매상태</th>
						<th>쇼핑채널</th>
						<th>작업일자</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${not empty list}">
				<c:set var="listNum" value="${paging.listNum}" />
				<c:forEach var="item" items="${list }" varStatus="status">
					<tr>
						<td><c:out value="${listNum }" /></td>
						<td><c:out value="${item.PRD_MST_CD }" /></td>
						<td class="left"><img
							src="<c:out value="${img_domain }${item.IMG_THUMBNAIL}" />"
							class="thumbnail" align="left" /> <c:if
								test="${not empty item.PRM_TEXT}">[<c:out
									value="${item.PRM_TEXT }" />]<br />
							</c:if> <b>[<c:out value="${item.CMN_BRD_NM }" />]	</b>
							<br /><a 
							href="javascript:goView('<c:out value="${item.PRD_MST_CD }" />');"><c:out
									value="${item.PRD_MST_NM }" /></a></td>
						<td>${item.PRD_MST_DIS_CENTER_NM}</td>
						<td><fmt:formatNumber
								value="${item.PRD_MST_CONSUMER_PRICE }" groupingUsed="true" /></td>
						<td>일반:<fmt:formatNumber
								value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /><br />
							임직원:<fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_OWN }"
								groupingUsed="true" /><br /> 계열사:<fmt:formatNumber
								value="${item.PRICE_MEMBER_GROUP_SUB }" groupingUsed="true" /><br />
							VIP:<fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_VIP }"
								groupingUsed="true" />
						</td>
						<td>일반: ${item.PROD_PERAMT1_MEMBER_GROUP_MALL } %<br />
							임직원: ${item.PROD_PERAMT1_MEMBER_GROUP_OWN } %<br /> 계열사:
							${item.PROD_PERAMT1_MEMBER_GROUP_SUB } %<br /> VIP:
							${item.PROD_PERAMT1_MEMBER_GROUP_VIP } %
						</td>
						<td><c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}">
								<span class="label label-b">판매중</span>
							</c:if> <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_READY}">
								<span class="label label-a">등록대기</span>
							</c:if> <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}">
								<span class="label label-a">품절상품</span>
							</c:if> <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}">
								<span class="label label-a">미판매</span>
							</c:if></td>
						<td><c:if test="${item.PRD_MST_CHANNEL_TYPE eq Code.CHANNEL_TYPE_CD_PC}">PC</c:if>
							<c:if test="${item.PRD_MST_CHANNEL_TYPE eq Code.CHANNEL_TYPE_CD_MOBILE}">MOBILE</c:if>
							<c:if test="${item.PRD_MST_CHANNEL_TYPE eq Code.CHANNEL_TYPE_CD_PCMOBILE}">전체</c:if>
						</td>
						<td><ui:formatDate value="${item.PRD_CUT_REG_DT }" pattern="yyyy.MM.dd" /><br /><ui:formatDate value="${item.PRD_CUT_REG_DT }" pattern="HH:mm:ss" /></td>
					</tr>
				<c:set var="listNum" value="${listNum-1}" />
				</c:forEach>
				</c:when>
				<c:otherwise>
				<c:if test="${param.searchYn eq 'Y'}">
					<tr>
						<td colspan="10">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
					</tr>
				</c:if>
				<c:if test="${param.searchYn ne 'Y'}">
					<tr>
						<td colspan="10">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
					</tr>
				</c:if>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->

		<form id="frm" name="frm">
		<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	    <input type="hidden" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>"/>
	    <input type="hidden" name="searchPrdMstChannelType" value="<c:out value="${commandMap.searchPrdMstChannelType }"/>" />
	    <input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
	    <input type="hidden" name="searchPrdMstDvlpYear" value="<c:out value="${commandMap.searchPrdMstDvlpYear }"/>" />
	    <input type="hidden" name="searchPrdMstGdsSctnCd" value="<c:out value="${commandMap.searchPrdMstGdsSctnCd }"/>" />
	    <input type="hidden" name="searchPrdSsonCd" value="<c:out value="${commandMap.searchPrdSsonCd }"/>" />	                	                
	    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	    <input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
	    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
		<input type="hidden" name="PRD_CUT_HISTORY_IDX" value="${commandMap.PRD_CUT_HISTORY_IDX }" />
		<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" /> 

		<div class="pagination">
		<!-- pagination -->
			<ui:paging paging="${paging }" jsFunction="goPage" />
		</div>
		<!-- // pagination -->


		<div class="bbs-status">
		<!-- bbs status -->
			<div class="page">
				Page : <strong class="em"><c:out value="${paging.cPage }" /></strong>
				/ <c:out value="${paging.totalPageCount }" /> page
			</div>
			<div class="sort">
				Total : <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>
			</div>
		</div>
		<!-- // bbs status -->

		</form>
		
		<div class="section-button-popup"><!-- section button -->
			<a href="#none" id="closePopup" class="button button-b"><span>확인</span></a>
		</div>
	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {

    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"/am/product/productCutBatchHistory.do", "target":"_self", "method":"post"}).submit();
    };
    
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});
 	
 	// 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/productCutBatchHistory.do", "target":"_self", "method":"post"}).submit(); 
    };
    
 	// 상품 상세페이지 이동 (새창)
    goView = function (prdMstCd)
    {
        var $frm = $("#frm");
        $frm.find("input[name='PRD_MST_CD']").val(prdMstCd);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
    };
});
//]]>
</script>
</body>
</html>
