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
<!-- 	    	<h2 class="title"><span>상품 상세보기</span></h2> -->
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>입점업체 검색</span></h3>
            </div><!-- // push-guide -->
            
            <form id="searchForm" name="searchForm">
	             <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	        
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 10%;" />
		                <col style="width: 15%;" />
		                <col style="width: 20%;" />
		                <col style="width: auto;" />
		                
		            </colgroup>
		            <tbody>
		                <tr><!-- row -->
		                    <th><span>업체명</span></th>
		                    <td>
		                       	<input type="text" class="text" id="searchVdrMstNm" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>" />
		                    </td>
		                    <th><span>사업자등록번호</span></th>
		                    <td>
		                        <input type="text" class="text" id="searchVdrMstBusi" name="searchVdrMstBusi" value="<c:out value="${commandMap.searchVdrMstBusi }"/>" maxlength="13" />
		                    </td>
		                    
		                </tr>
		            </tbody>
		        </table><!-- // table -->
		    </form>
		    
		    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                <a href="javascript:search();" class="button small primary"><span>검색</span></a>
            </div><!-- // 검색 하단 버튼 -->
            
            <form id="frm" name="frm">
	            <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                <div class="col-1-2 text-left">
	                    <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                    <span class="pages">
	                    	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                    </span>
	                </div>
	            </div><!-- // 목록 상단 버튼 -->
        	
	        	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
				<input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
				<input type="hidden" name="searchVdrMstBusi" value="<c:out value="${commandMap.searchVdrMstBusi }"/>"/>
	        	<table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 20%;" />
						<col style="width: 20%;" />
						<col style="width: 15%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th><input type="checkbox" class="checkbox checkAll" id="allCheck" name="allCheck" /></th>
							<th>입점업체명</th>
							<th>사업자등록번호</th>
							<th>대표자명</th>
							<th>기간계고객코드</th>
	                    </tr>
	                </thead>
	                <tbody id="tbodyVendorList">
	                    <c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td>
										<input type="checkbox" class="checkbox checkRow" id="VDR_MST_ERP_ID_${item.VDR_MST_ERP_ID}" name="VDR_MST_ERP_IDs" value="${item.VDR_MST_ERP_ID}^${item.VDR_MST_NM}^${item.VDR_MST_USE_YN}" />
									</td>
									<td><c:out value="${item.VDR_MST_NM }"/></td>
									<td>
										<c:out value="${item.VDR_MST_BUSI1 }" />-<c:out value="${item.VDR_MST_BUSI2 }" />-<c:out value="${item.VDR_MST_BUSI3 }" />
									</td>
									<td><c:out value="${item.VDR_MST_CEO_NM }"/></td>
									<td><c:out value="${item.VDR_MST_ERP_ID }"/></td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<tr>
									<td colspan="5">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    </c:otherwise>
						</c:choose>
	                </tbody>
	            </table><!-- // table -->
		    </form>

            <div class="section-pagination"><!-- section pagination -->
                <h4 class="sr-only">목록 페이징</h4>
                <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div>
            </div><!-- // section pagination -->
	        
			<div class="grid section-button-search"><!-- section button -->
				<a href="javascript:;" id="vendorApply" class="button small primary"><span>선택</span></a>
				<a href="#none" id="closePopup" class="button small"><span>취소</span></a>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(function () {
	
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/searchVendorMultiPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/site/searchVendorMultiPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 선택 클릭 이벤트
    $(document).on("click", "#vendorApply", function () 
    {
    	var $checkObj = $.find("#tbodyVendorList input[name='VDR_MST_ERP_IDs']:checked");

    	if( $checkObj.length == 0 ){
    		alert("입점업체를 선택하여 주십시오.");
    		return;
    	}
    	  	
    	var params = new Array();
    	var obj;
    	var myArray;
    	$.each($checkObj, function(index,item){
    		myArray = $(this).val().split('^');
    		obj = new Object();
    		obj.VDR_MST_ERP_ID 		= myArray[0];	// 입점업체 ERP코드
    		obj.VDR_MST_NM 			= myArray[1];	// 입점업체명
    		obj.VDR_MST_USE_YN      = myArray[2];	// 입점업체 사용 여부
    		
    		params.push(obj); //만들어진  object를 배열에 추가
    	});
    	
    	if(	window.opener.fnResultVendor(params) )    	
    		self.close();
    });
    
    // 닫기 버튼 클릭
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
});
</script>
</body>
</html>
