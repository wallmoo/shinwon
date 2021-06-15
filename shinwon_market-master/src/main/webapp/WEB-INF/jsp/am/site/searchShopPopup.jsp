<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">매장검색</h1>
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
			<input type="hidden" name="searchYn" value="Y" />           
            
			<div class="form-group">
				<label class="label"><span>매장코드/매장명</span></label>
				<div class="field">
					<input type="text" class="text" id="searchShopText" name="searchShopText" value="<c:out value="${commandMap.searchShopText }"/>" />
				</div>
			</div>
		
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
					<col style="width: 20%;" />
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th>매장코드</th>
						<th>매장명</th>
					</tr>
				</thead>
				<tbody id="tbodyShopList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td><c:out value="${item.BCNC_CD }" /></td>
							<td class="left">
								<a href="javascript:goReturn('<c:out value="${item.COMP_CD }" />','<c:out value="${item.BCNC_CD }" />','<c:out value="${item.BCNC_NM }" />','<c:out value="${item.MLT_SHOP_CD }" />');"><c:out value="${item.BCNC_NM }" /></a>
							</td>								
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	<c:if test="${commandMap.searchYn eq 'Y'}">
				    	<tr>
							<td colspan="2">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
						</tr>
				    	</c:if>
				    	<c:if test="${commandMap.searchYn ne 'Y'}">
				    	<tr>
							<td colspan="2">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
						</tr>
				    	</c:if>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>			
		</div><!-- // col list -->

		<input type="hidden" name="searchShopText" value="<c:out value="${commandMap.searchShopText }"/>"/>              	                
	    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
            
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
        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/searchShopPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/site/searchShopPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 매장 선택 
    goReturn = function (compCd, bcncCd,bcncNm,mltShopCd)
    {
        var obj = new Object();
        obj.COMP_CD = compCd;
        obj.SHOP_CD = bcncCd;
        obj.SHOP_NM = bcncNm;
        obj.MULTI_SHOP_CD = mltShopCd;

        if(	window.opener.fnResultErpShop(obj) )    	
    		self.close();
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
