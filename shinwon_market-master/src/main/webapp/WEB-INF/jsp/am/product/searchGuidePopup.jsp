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
<body class="popup">

<header><!-- header -->
	<h1 class="title">${Code.PRODUCT_GUIDE_NM[commandMap.gCode]}</h1>
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
            <input type="hidden" name="searchBrdGdsCat" value="${commandMap.searchBrdGdsCat}" />
			<input type="hidden" name="searchBrdGdsUseYn" value="${commandMap.searchBrdGdsUseYn}" />            
            <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
            <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
            <input type="hidden" name="gCode" value="<c:out value="${commandMap.gCode }"/>" />
            <input type="hidden" name="searchYn" value="Y" />
            <input type="hidden" name="M" value="<c:out value="${commandMap.M }"/>" />
            
			<div class="form-group">
				<label class="label"><span>${Code.PRODUCT_GUIDE_NM[commandMap.gCode]}</span></label>
				<div class="field">
					<input type="text" class="text long" id="searchBrdGdsTitle" name="searchBrdGdsTitle" value="<c:out value="${commandMap.searchBrdGdsTitle }" />" />
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
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>가이드명</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
								    <td><input type="radio" id="GDS_IDX_${item.BRD_GDS_IDX}" name="GDS_IDX" class="radio" value="${item.BRD_GDS_IDX}" /></td>
								    <td><label for="GDS_IDX_${item.BRD_GDS_IDX}" id="LBL_GDS_TXT_${item.BRD_GDS_IDX}"><c:out value="${item.BRD_GDS_TITLE }" /></label></td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<c:if test="${param.searchYn eq 'Y'}">
						    	<tr>
									<td colspan="2">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    	</c:if>
						    	<c:if test="${param.searchYn ne 'Y'}">
						    	<tr>
									<td colspan="2">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
						    	</c:if>
						    </c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div><!-- // col list -->

                <form id="frm" name="frm">
                     <input type="hidden" name="BRD_GDS_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchBrdGdsTitle" value="<c:out value="${commandMap.searchBrdGdsTitle }"/>"/>
                    <input type="hidden" name="searchBrdGdsContents" value="<c:out value="${commandMap.searchBrdGdsContents }"/>"/>
                    <input type="hidden" name="searchBrdGdsUseYn" value="<c:out value="${commandMap.searchBrdGdsUseYn }"/>"/>
                    <input type="hidden" name="searchBrdGdsTopYn" value="<c:out value="${commandMap.searchBrdGdsTopYn }"/>"/>
                    <input type="hidden" name="gCode" value="<c:out value="${commandMap.gCode }"/>" />
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="M" value="<c:out value="${commandMap.M }"/>" />                
                
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



<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchGuidePopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchGuidePopup.do", "target":"_self", "method":"post"}).submit();
    };

 	// 선택 클릭 이벤트
    $(document).on("click", "#productApply", function () 
    {
    	var $checkObj = $.find("input[name='GDS_IDX']:checked");
    	if( $checkObj.length == 0 ){
    		alert("상품을 선택하여 주십시오.");
    		return;
    	}
    	
    	var GDS_IDX = 0; 
    	var GDS_TITLE = "";
    	$.each($checkObj, function(index,item){
    		if( $(this).is(":checked") ){
    			GDS_IDX = $(this).val();
    			GDS_TITLE = $("#LBL_GDS_TXT_"+GDS_IDX).html();
    		}
    	});

        var params = {"GDS_CAT":"${commandMap.gCode}", "GDS_IDX":GDS_IDX, "GDS_TITLE":GDS_TITLE, "M":"${commandMap.M}" };
    	window.opener.fnResultGuide(params);
    	
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
