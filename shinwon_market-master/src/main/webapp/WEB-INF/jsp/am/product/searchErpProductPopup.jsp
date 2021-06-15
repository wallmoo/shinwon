<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">제품찾기</h1>
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
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
	            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				<input type="hidden" name="searchErpYn" value="Y" />         
	            <input type="hidden" name="ERP_OPT_IDXs" id="ERP_OPT_IDXs" value="<c:out value="${commandMap.ERP_OPT_IDXs }"/>" />
				<div class="form-group">
					<label class="label"><span>기간계 상품코드</span></label>
					<div class="field">
						<input type="text" class="text" id="searchErpMstCd" name="searchErpMstCd" value="<c:out value="${commandMap.searchErpMstCd }"/>" />
					</div>
				</div>
				<div class="form-group">
					<label class="label"><span>기간계 상품명</span></label>
					<div class="field">
						<input type="text" class="text" id="searchErpMstNm" name="searchErpMstNm" value="<c:out value="${commandMap.searchErpMstNm }"/>" />
					</div>
				</div>
			</form>

		</div><!-- // section-form-a -->

		<div class="title-box">
			<h4 class="title">리스트</h4>
		</div>
		
		<form id="frm" name="frm">
			<input type="hidden" name="ERP_OPT_IDXs" id="ERP_OPT_IDXs" value="<c:out value="${commandMap.ERP_OPT_IDXs }"/>" />
			<input type="hidden" name="searchErpMstCd" id="searchErpMstCd" value="<c:out value="${commandMap.searchErpMstCd }"/>" />
			<input type="hidden" name="searchErpMstNm" id="searchErpMstNm" value="<c:out value="${commandMap.searchErpMstNm }"/>" />
		<div class="sort pull-right" style="margin-top: -30px;">
			<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
		</div>

		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 7%;" />
					<col style="width: 15%;" />
					<col style="width: auto%;" />
					<col style="width: 13%;" />
					<col style="width: 13%;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>기간계 상품코드</th>
						<th>기간계 상품명</th>
						<th>기간계 평균원가</th>
						<th>기간계 표시판가</th>
					</tr>
				</thead>
				<tbody id="tbodyProductList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td>
					    		<c:out value="${item.RNUM }" />
							</td>
							<td>
								<a href="javascript:goParent('<c:out value="${item.ERP_MST_CD }" />');" title="해당 제품을 선택합니다."><c:out value="${item.ERP_MST_CD }" /></a>
							</td>
							<td>
								<a href="javascript:goParent('<c:out value="${item.ERP_MST_CD }" />');" title="해당 제품을 선택합니다."><c:out value="${item.ERP_MST_NM }" /></a>
							</td>
							<td><fmt:formatNumber value="${item.ERP_MST_AVE_BUY_PRC }" groupingUsed="true" /></td>
							<td><fmt:formatNumber value="${item.ERP_MST_DSP_PRC }" groupingUsed="true" /></td>
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	<c:if test="${commandMap.searchErpYn eq 'Y'}">
				    	<tr>
							<td colspan="5">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
						</tr>
				    	</c:if>
				    	<c:if test="${commandMap.searchErpYn ne 'Y'}">
				    	<tr>
							<td colspan="5">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
						</tr>
				    	</c:if>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>			
		</div><!-- // col list -->

		<input type="hidden" name="searchText" value="<c:out value="${commandMap.searchText }"/>"/>        	                
	    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	    <input type="hidden" name="searchErpYn" value="<c:out value="${commandMap.searchErpYn }"/>" />
            
		<div class="pagination"><!-- pagination -->
			<ui:paging paging="${paging }" jsFunction="goPage" />
		</div><!-- // pagination -->

		<div class="bbs-status"><!-- bbs status -->
			<div class="page">
				Page : <strong class="em"><c:out value="${paging.cPage }" /></strong> / <c:out value="${paging.totalPageCount }" /> page
			</div>
			<div class="sort">
				 Total : <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>
			</div>
		</div><!-- // bbs status -->

        </form>
        <!-- section button -->
        <div class="section-button-popup">
			<a href="#none" id="closePopup" class="button button-b"><span>닫기</span></a>
		</div>
	</div><!-- // contents -->

</div><!-- // container -->




<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {

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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchErpProductPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchErpProductPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 제품 선택 
    goParent = function (erpMstCd)
    {
    	if($("#ERP_OPT_IDXs").val() == ""){
    		window.opener.fnResultErpProduct(erpMstCd);
    	}else{
    		window.opener.fnResultErpOptProduct(erpMstCd,$("#ERP_OPT_IDXs").val());
    	}
    	self.close();    	
    };
    
    // 닫기 버튼 클릭
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
});
//]]>
</script>
</body>
</html>
