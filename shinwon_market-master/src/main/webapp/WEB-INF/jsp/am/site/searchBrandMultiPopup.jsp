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
                <h3 class="title"><span>브랜드 검색</span></h3>
            </div><!-- // push-guide -->
            
            <form id="searchForm" name="searchForm">
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
	            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				<input type="hidden" name="searchYn" value="Y" />   
	        
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: %;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr><!-- row -->
		                    <th><span>브랜드명</span></th>
		                    <td>
		                        <input type="text" class="text" id="searchBrandNm" name="searchBrandNm" value="<c:out value="${commandMap.searchBrandNm }"/>" />
		                    </td>
		                </tr>
		            </tbody>
		        </table><!-- // table -->
		    </form>
		    
		    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
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
        	
	        	<table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
						<col style="width: 20%;" />
						<col style="width: 80%;" />
	                </colgroup>
	                <thead>
	                    <tr>
							<th>브랜드코드</th>
							<th>브랜드명</th>
	                    </tr>
	                </thead>
	                <tbody id="tbodyBrandList">
	                   <c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><c:out value="${item.BND_MST_IDX }"/></td>
									<td><a class="brandSelect" href="javascript:void(0)"><c:out value="${item.BND_MST_BRAND_NM }" /></a></td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<c:if test="${commandMap.searchYn eq 'Y'}">
						    	<tr>
									<td colspan="3">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    	</c:if>
						    	<c:if test="${commandMap.searchYn ne 'Y'}">
						    	<tr>
									<td colspan="3">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
						    	</c:if>
						    </c:otherwise>
						</c:choose>
	                </tbody>
	            </table><!-- // table -->
            
	           	<input type="hidden" name="searchBrandNm" value="<c:out value="${commandMap.searchBrandNm }"/>"/>        	                
			    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
			    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
		    
		    </form>

            <div class="section-pagination"><!-- section pagination -->
                <h4 class="sr-only">목록 페이징</h4>
                <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div>
            </div><!-- // section pagination -->
	        
			<div class="grid section-button-search"><!-- section button -->
				<a href="#none" id="closePopup" class="button small"><span>닫기</span></a>
			</div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script type="text/javascript">
$(document).ready(function () 
{
	
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/searchBrandMultiPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/site/searchBrandMultiPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 선택 클릭 이벤트
    $(document).on("click", "#brandApply", function () 
    {
    	var $checkObj = $.find("#tbodyBrandList input[name='BND_MST_IDXs']:checked");

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
    		obj.BND_MST_IDX 		= myArray[0];	// 브랜드코드
    		obj.BND_MST_BRAND_NM 	= myArray[1];	// 브랜드명
    		obj.BND_MST_USE_YN      = myArray[2];	// 브랜드 사용 여부
    		
    		params.push(obj); //만들어진  object를 배열에 추가
    	});
    	
    	if(	window.opener.fnResultBrand(params) )    	
    		self.close();
    });
 	
 	// 브랜드명 클릭 이벤트
 	$(document).on("click", ".brandSelect", function () {
    	  	
    	var params = new Array();
    	var obj;
    		obj = new Object();
    		obj.BND_MST_IDX 		= $(this).parent().prev().text();	// 브랜드코드
    		obj.BND_MST_BRAND_NM 	= $(this).text();	// 브랜드명
    		obj.BND_MST_USE_YN      = "${BND_MST_USE_YN}";	// 브랜드 사용 여부
    		
    		params.push(obj); //만들어진  object를 배열에 추가
    	
    	if(	window.opener.fnResultBrand(params) )    	
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
