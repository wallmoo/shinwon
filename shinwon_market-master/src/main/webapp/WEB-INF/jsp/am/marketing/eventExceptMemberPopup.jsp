<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">당첨자 제외 회원</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container">

	<div id="contents">

		 
	        <form id="searchForm" name="searchForm">
            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            <input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />             
         	 	 
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
					<col style="width:  15%" />
					<col style="width:  15%" />
					<col style="width: auto;" />
					<col style="width:  10%"/>
					<col style="width:  15%"/>
					<col style="width:  13%"/>
					<col style="width:  13%"/>
				</colgroup>
				<thead>
					<tr>
						<th>기간계고객코드</th>
						<th>아이디</th>
						<th>회원이름</th>
						<th>성별</th>
						<th>회원등급</th>
						<th>가입구분</th>
						<th>가입매체</th>
					</tr>
				</thead>
				<tbody id="tbodyProductList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td><c:out value="${item.MEM_MST_ERP_ID }" /></td>
							<td><c:out value="${item.MEM_MST_MEM_ID }" /></td>
							<td><c:out value="${item.MEM_MST_MEM_NM }" /></td>
							<td>	
								<c:if test="${item.MEM_MST_SEX eq 'M' }">
									남자
								</c:if>
								<c:if test="${item.MEM_MST_SEX eq 'F' }">
									여자
								</c:if>
							</td>
							<td><c:out value="${item.MEM_GRD_NM }" /></td>
							<td><c:out value="${item.MEM_MST_MEM_GBN }" /></td>
							<td><c:out value="${item.MEM_MST_JIN_CHN }" /></td>
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	 
				    	<tr>
							<td colspan="7">당첨자 제외 회원이 없습니다.</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>			
		</div><!-- // col list -->
		<span style="color:red">! 당첨자 제외 대상 선정 및 해제는 회원관리>회원정보에서 관리 가능합니다.</span>
			                	                
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventExceptMemberPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/eventExceptMemberPopup.do", "target":"_self", "method":"post"}).submit();
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
