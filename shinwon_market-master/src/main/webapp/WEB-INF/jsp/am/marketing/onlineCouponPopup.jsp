<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<div class="modal"><!-- modal -->
	
	<div class="modal-wrapper"><!-- modal-wrapper -->
	
		<div class="modal-inner"><!-- modal-inner -->
		
			<h2 class="title"><span>발급수량내역</span></h2>
			<h3 class="title"><span>쿠폰정보</span></h3>
			
			<form id="searchForm" name="searchForm">
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
	            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	            <input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>" />             
			</form>
			 <form id="excelForm" name="excelForm">
	            <input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>" />             
			</form>
			
			<table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 15%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><span>쿠폰번호</span></th>
                        <td><span><c:out value="${commandMap.CPN_MST_IDX}"/></span></td>
                       </tr>
                       <tr>
                        <th><span>고객쿠폰명</span></th>
                        <td><span><c:out value="${row.CPN_MST_TITLE}"/></span></td>
                       </tr>
                       <tr>
                        <th><span>유효기간</span></th>
                        <td>
                            <c:choose>
								<c:when test="${row.CPN_MST_ISU_DAY_GBN eq 'A'}">
									<ui:formatDate value="${row.CPN_MST_USE_ST_DT }" pattern="yyyy.MM.dd"/> ~
		                           	<ui:formatDate value="${row.CPN_MST_USE_ED_DT }" pattern="yyyy.MM.dd"/>
								</c:when>
								<c:when test="${row.CPN_MST_ISU_DAY_GBN eq 'B'}">
									<span>
										<c:if test="${row.CPN_MST_GBN eq 'G'}">등록</c:if>
										<c:if test="${row.CPN_MST_GBN ne 'G'}">발급</c:if>일로부터</span>&nbsp;<c:out value="${row.CPN_MST_USE_DAY }"/><span>일</span>
								</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
                        </td>
                    </tr>
                </tbody>
            </table><!-- // table -->
			
			<h3 class="title"><span>발급내역</span></h3>
			<form id="frm" name="frm">
		        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		        <input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>"/> 
		        
				<div class="grid section-button-list"><!-- 목록 상단 -->
					<div class="col-1-2 text-left">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
						<span class="pages">
							(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
						</span>
					</div>		
	          	</div>
	          	<div class="section-button-search">
					<a href="#none" id="excelDown" class="button button-b small"><span>엑셀다운로드</span></a>
	          	</div>
	          	
				<table cellspacing="0" class="table-col table-b">
					<colgroup>
						<col style="width: 8%;" />
						<col style="width: auto;"/>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>쿠폰번호</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
					    <c:when test="${not empty list}">
							<c:set var="listNum" value="${paging.listNum}" />
					    	<c:forEach var="item" items="${list }" varStatus="status">
							<tr>
								<td><c:out value="${listNum }" /></td>
								<td><c:out value="${item.CPN_PTN_SHP_NO }" /></td>
							</tr>
							<c:set var="listNum" value="${listNum-1}" />
					    	</c:forEach>
					    </c:when>
					    <c:otherwise>
							<tr>
								<td colspan="3">등록 된 데이터가 없습니다.</td>
							</tr>
					    </c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<div class="section-pagination"><!-- section pagination -->
	            	<h4 class="sr-only">목록 페이징</h4>
	            	<div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                	<ui:paging paging="${paging }" jsFunction="goPage" />
	            	</div>
	        	</div><!-- // section pagination -->
	        </form>
        
        </div><!-- // modal-inner -->
        
	</div><!-- // modal-wrapper -->
	
</div><!-- // modal -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/onlineCouponPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
       $("#excelForm").attr({"action": "<c:out value="${serverDomain}" />/am/marketing/onlineCouponExcelDownloadPopup.do", "target":"_self", "method":"post"}).submit(); 
    });
 	
});
//]]>
</script>
</body>
</html>
