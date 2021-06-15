<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">체험단 활동내역 (<c:out value="${commandMap.MEM_MST_MEM_ID }"/>)</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container">

	<div id="contents">
	    <form id="searchForm" name="searchForm">
            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            <input type="hidden" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>" />             
		</form>
		 
		<div class="title-box">
			<h4 class="title">목록</h4>
		</div>
		
		<form id="frm" name="frm">
		
		<div class="sort pull-right" style="margin-top: -30px;">
			<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
		</div>

		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width:  5%" />
					<col style="width:  10%" />
					<col style="width: auto;" />
					<col style="width:  25%"/>
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>KINGER<br/>CODE</th>
						<th>제목/서브제목</th>
						<th>활동기간</th>
					</tr>
				</thead>
				<tbody id="tbodyProductList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td><c:out value="${listNum }"/></td>
							<td><c:out value="${item.EXP_MST_CD }" /></td>
							<td><c:out value="${item.EXP_MST_NM}" />/<c:out value="${item.EXP_MST_SUB_NM}" /></td>
							<td><ui:formatDate value="${item.EXP_MST_ATV_ST_DT }" pattern="yyyy.MM.dd"/>~<ui:formatDate value="${item.EXP_MST_ATV_ED_DT }" pattern="yyyy.MM.dd"/></td>
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	 
				    	<tr>
							<td colspan="4">체험단 활동 내역이 없습니다.</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>			
		</div><!-- // col list -->
		
			                	                
	    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	        
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerActivePopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/kingerActivePopup.do", "target":"_self", "method":"post"}).submit();
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
