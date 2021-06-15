<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<div class="modal"><!-- modal -->
	
	<div class="modal-wrapper"><!-- modal-wrapper -->
	
		<div class="modal-inner"><!-- modal-inner -->
		
			<h2 class="title"><span>코드확인</span></h2>
			<h3 class="title"><span>쿠폰정보</span></h3>
			
			<form id="searchForm" name="searchForm">
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
	            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	            <input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>" />             
			</form>
			 <form id="excelForm" name="excelForm">
	            <input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>" />             
			</form>
			
			<table cellspacing="0" class="table-col table-b"><!-- table -->
                <colgroup>
                    <col style="width: 15%;" />
                    <col style="width: 15%;" />
                    <col style="width: auto;" />
                    <col style="width: 15%;" />
                    <col style="width: 15%;" />
                    <col style="width: 20%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><span>쿠폰번호</span></th>
                        <th><span>쿠폰종류</span></th>
                        <th><span>쿠폰명</span></th>
                        <th><span>할인구분</span></th>
                        <th><span>할인금액(율)</span></th>
                        <th><span>발급수량</span></th>
                       </tr>
                       <tr>
                       	<td><span><c:out value="${row.CPN_MST_IDX}"/></span></td>
                        <td><span><c:out value="${row.CMN_COM_NM }"/></span></td>
                        <td><span><c:out value="${row.CPN_MST_TITLE}"/></span></td>
                        <td><span>
                        	<c:if test="${row.CPN_MST_SAL_GBN eq 'A'}">정율</c:if>
							<c:if test="${row.CPN_MST_SAL_GBN eq 'B'}">정액</c:if>
                        </span></td>
                        <td><span><c:out value="${row.CPN_MST_SAL_PRC}"/></span></td>
                        <td><span><c:out value="${row.CPN_MST_ISU_CNT}"/></span></td>
                       </tr>
                       <tr>
                    </tr>
                </tbody>
            </table><!-- // table -->
			
			<h3 class="title"><span>코드정보</span></h3>
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
					<div class="section-button-search">
					<a href="#none" id="excelDown" class="button button-b small"><span>엑셀다운로드</span></a>
	          		</div>
	          	</div>
	          	
	          	
				<table cellspacing="0" class="table-col table-b">
					<colgroup>
						<col style="width: 8%;" />
						<col style="width: auto;"/>
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>코드</th>
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
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/onlineCouponCodeCheckPopup.do", "target":"_self", "method":"post"}).submit();
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
