<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">홍보문구찾기</h1>
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
            <input type="hidden" name="searchPrmWrdState" value='Y' />
            <input type="hidden" name="searchYn" value="Y" />
			<div class="form-group">
				<label class="label"><span>홍보문구</span></label>
				<div class="field">
					<input type="text" class="text long" id="searchPrmWrdTxt" name="searchPrmWrdTxt" value="<c:out value="${commandMap.searchPrmWrdTxt }" />" />
				</div>
			</div>

			<div class="form-group">
				<label class="label"><span>전시기간</span></label>
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
			<h4 class="title">리스트</h4>
		</div>

				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: auto;" />
							<col style="width: 25%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>홍보문구</th>
								<th>전시기간</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${not empty list}">
						<c:set var="listNum" value="${paging.listNum}" />
						<c:forEach var="item" items="${list }" varStatus="status">
							<tr>
								<td><input type="radio" id="PRM_IDX_${item.PRM_WRD_IDX}" name="PRM_IDX" class="radio" value="${item.PRM_WRD_IDX}" /></td>
								<td><label for="PRM_IDX_${item.PRM_WRD_IDX}" id="LBL_PRM_TXT_${item.PRM_WRD_IDX}"><c:out value="${item.PRM_WRD_TXT }" /></label></td>
								<td><ui:formatDate value="${item.PRM_WRD_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${item.PRM_WRD_ED_DT }" pattern="yyyy.MM.dd"/></td>
							</tr>
						<c:set var="listNum" value="${listNum-1}" />
						</c:forEach>
						</c:when>
						<c:otherwise>
						<c:if test="${param.searchYn eq 'Y'}">
							<tr>
								<td colspan="3">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
							</tr>
						</c:if>
						<c:if test="${param.searchYn ne 'Y'}">
							<tr>
								<td colspan="3">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
							</tr>
						</c:if>
						</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div><!-- // col list -->

                <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
                <input type="hidden" name="searchPrmWrdTxt" value="<c:out value="${commandMap.searchPrmWrdTxt }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchPrmWrdState" value="<c:out value="${commandMap.searchPrmWrdState }"/>"/>
                <input type="hidden" name="searchYn" value="Y" />
                                 
                <input type="hidden" id="PRM_WRD_IDX" name="PRM_WRD_IDX" value="" />
                    
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
			<a href="#none" id="productApply" class="button button-b"><span>선택</span></a>
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchSellingPointProductPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchSellingPointProductPopup.do", "target":"_self", "method":"post"}).submit();
    };

 	// 선택 클릭 이벤트
    $(document).on("click", "#productApply", function () 
    {
    	var $checkObj = $.find("input[name='PRM_IDX']:checked");
    	if( $checkObj.length == 0 ){
    		alert("상품을 선택하여 주십시오.");
    		return;
    	}
    	
    	var PRM_IDX = 0; 
    	var PRM_WRD_TXT = "";
    	$.each($checkObj, function(index,item){
    		if( $(this).is(":checked") ){
    			PRM_IDX = $(this).val();
    			if(PRM_IDX!=0)
    				PRM_WRD_TXT = $("#LBL_PRM_TXT_"+PRM_IDX).html();
    		}
    	});

        var params = {"PRM_IDX":PRM_IDX, "PRM_WRD_TXT":PRM_WRD_TXT };
    	window.opener.fnResultSellingPointProduct(params);
    	
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
