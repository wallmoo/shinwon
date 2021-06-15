<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">매장별재고조회</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">재고조회</h4>

			<div class="right">
				<a href="javascript:search();" class="button button-b"><span>검색</span></a>
				<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
			</div>			
		</div>

		<div class="section-form"><!-- section-form-a -->

        <form id="searchForm" name="searchForm">
        	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            <input type="hidden" name="searchPrmWrdState" value='Y' />
            <input type="hidden" name="searchYn" value="Y" />
 			<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
 			<input type="hidden" name="PRD_MST_CD" value="${commandMap.PRD_MST_CD }" />
			<div class="form-group">
				<label class="label"><span>상품코드</span></label>
				<div class="field">
				 	${product.PRD_MST_CD } / ${product.PRD_MST_NM }
				</div>
			</div>

			<div class="form-group">
				<label class="label"><span>매장선택</span></label>
				<div class="field">
					<input type="radio" id="searchOption1" name="searchOption" class="checkbox channelType" value="1" <c:if test="${commandMap.searchOption eq 1}">checked="checked"</c:if> />
					<label for="searchOption1">매장명</label>
					<input type="text" class="text" id="searchOptionStoreName" name="searchOptionStoreName" value="<c:out value="${commandMap.searchOptionStoreName }"/>" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="searchOption2" name="searchOption" class="checkbox channelType" value="2" <c:if test="${commandMap.searchOption eq 2}">checked="checked"</c:if> />
					<label for="searchOption2">전국</label>
					&nbsp;&nbsp;
					<input type="radio" id="searchOption3" name="searchOption" class="checkbox channelType" value="3" <c:if test="${commandMap.searchOption eq 3}">checked="checked"</c:if> />
					<label for="searchOption3">지역별</label>
					<select class="select" id="searchOptionStoreArea" name="searchOptionStoreArea" >
					<c:forEach var="item" items="${listStoreArea}">
						<option value="${item.AREA_NM}" <ui:select v="${commandMap.searchOptionStoreArea }" t="${item.AREA_NM }" g="selected"/>><c:out value="${item.AREA_NM}" /></option>
                    </c:forEach>
                    </select>															
				</div>
			</div>
		</form>
		
		</div><!-- // section-form-a -->


		<div class="title-box">
			<h4 class="title">리스트</h4>
		</div>

				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: 25%;" />
							<cols style="width: auto;" />
						</colgroup>
						<thead>
							<c:set var="nOptionLength" value="${fn:length(listOptionName)}" />
							<tr>
								<th rowspan="2">NO</th>
								<th rowspan="2">매장명</th>
								<th colspan="${nOptionLength }">재고현황</th>
							</tr>
							<tr>
							<c:choose>
							<c:when test="${not empty listOptionName}">
							<c:forEach var="item" items="${listOptionName }" varStatus="status">							
							<th>${item.PRD_OPT_NM }</th>
							</c:forEach>
							</c:when>
							</c:choose>
							</tr>
							
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${not empty listStoreStock}">
						<c:set var="listNum" value="${paging.listNum}" />
						<c:forEach var="item" items="${listStoreStock }" varStatus="status">
							<tr>
								<td>${listNum}</td>
								<td>${item.CORNER_NM} (${item.PHONE_NO1 }) <br />${item.ADDR1 }</td>
								<c:choose>
								<c:when test="${not empty listOptionName}">
								<c:forEach var="itemOption" items="${listOptionName }" varStatus="status">	
								<td>${item[fn:trim(itemOption.OPT_ORDER)] }<c:if test="${empty item[fn:trim(itemOption.OPT_ORDER)] }">0</c:if></td>
								</c:forEach>
								</c:when>
								</c:choose>
							</tr>
						<c:set var="listNum" value="${listNum-1}" />
						</c:forEach>
						</c:when>
						<c:otherwise>
						<c:if test="${param.searchYn eq 'Y'}">
							<tr>
								<td colspan="${nOptionLength+2 }">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
							</tr>
						</c:if>
						<c:if test="${param.searchYn ne 'Y'}">
							<tr>
								<td colspan="${nOptionLength+2 }">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
							</tr>
						</c:if>
						</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div><!-- // col list -->

                <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
                <input type="hidden" name="searchYn" value="Y" />
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            	<input type="hidden" name="PRD_MST_CD" value="${commandMap.PRD_MST_CD }" />
            	<input type="hidden" name="searchOption" value="${commandMap.searchOption }" />
            	<input type="hidden" name="searchOptionStoreName" value="${commandMap.searchOptionStoreName }" />
            	<input type="hidden" name="searchOptionStoreArea" value="${commandMap.searchOptionStoreArea }" />
                    
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
		<div class="section-button-popup"><!-- section button -->
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
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/viewStoreStockPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/viewStoreStockPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    $(document).on("click", "input[name=searchOption]", function ()
    {
		switch($(this).val()){
		case '1':
			$("#searchOptionStoreArea").val('');
			$("#searchOptionStoreArea").attr("disabled",true);
			$("#searchOptionStoreName").attr("disabled",false);
			break;
		case '2':
			$("#searchOptionStoreName").val('');
			$("#searchOptionStoreName").attr("disabled",true);
			$("#searchOptionStoreArea").val('');
			$("#searchOptionStoreArea").attr("disabled",true);			
			break;
		case '3':
			$("#searchOptionStoreName").val('');
			$("#searchOptionStoreName").attr("disabled",true);
			$("#searchOptionStoreArea").attr("disabled",false);
			break;
		}		
	});    
    
    $("#searchOption${commandMap.searchOption}").click();
 	
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});
});
//]]>
</script>
</body>
</html>
