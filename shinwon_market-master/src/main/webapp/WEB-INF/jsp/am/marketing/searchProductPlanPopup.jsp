<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">상품코드  <b><c:out value="${commandMap.PRD_MST_CD }"/></b> 기획전내역</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container">

	<div id="contents">

		 
		<div class="section-form"><!-- section-form-a -->

        <form id="searchForm" name="searchForm">
            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            <input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />             
         	 	 
		</form>

		</div><!-- // section-form-a -->
		 
		<div class="title-box">
			<h4 class="title">리스트</h4>
		</div>
		
		<form id="frm" name="frm">
		
		<div class="sort pull-right" style="margin-top: -30px;">
			<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
		</div>

		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width:  20%" />
					<col style="width: auto;" />
					<col style="width:  20%"/>
				</colgroup>
				<thead>
					<tr>
						<th>기획전코드</th>
						<th>기획전명</th>
						<th>진행여부</th>
						
					</tr>
				</thead>
				<tbody id="tbodyProductList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td><c:out value="${item.PLN_MST_IDX }" /></td>
							<td><c:out value="${item.PLN_MST_TITLE }" /></td>
							<td><c:out value="${item.PLN_MST_STATUS }" /></td>								
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	 
				    	<tr>
							<td colspan="3">해당 상품의 기획전이 없습니다.</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>			
		</div><!-- // col list -->
		
			                	                
	    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	    <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="<c:out value="${commandMap.PRD_MST_CD }"/>" />
	        
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
      
	</div>

</div><!-- // container -->




<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {
	
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 

 

        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/searchProductPlanPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/searchProductPlanPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    
  
    
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
});
//]]>
</script>
</body>
</html>
