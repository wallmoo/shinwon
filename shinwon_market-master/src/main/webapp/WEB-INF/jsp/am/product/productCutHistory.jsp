<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">상품전시기준(품절)관리</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">[ <ui:brand brandCD="${commandMap.PRD_CUT_BRAND_CD}"/> ] 상품전시(품절) 기준  변경이력 조회</h4>
		</div>
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 11%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
					<col />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">변경시각</th>
						<c:choose>
						<c:when test="${not empty prdGdsSctnList}">
						<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
							<th>${prdGdsSctnItem.CMN_COM_NM }</th>
						</c:forEach>
						</c:when>
						</c:choose>
						<th rowspan="2">변경사유</th>
						<th rowspan="2">품절상품</th>
						</tr>
						<tr>
						<c:choose>
						<c:when test="${not empty prdGdsSctnList}">
						<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
							<th>수량(개) /<br /> 매장(%)</th>
						</c:forEach>
						</c:when>
						</c:choose>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${not empty list}">
				<c:forEach var="item" items="${list }" varStatus="status">
					<tr>
						<td><ui:formatDate value="${item.PRD_CUT_REG_DT }" pattern="yyyy.MM.dd" /><br /><ui:formatDate value="${item.PRD_CUT_REG_DT }" pattern="HH:mm:ss" /></td>
						<c:choose>
						<c:when test="${not empty prdGdsSctnList}">
						<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
						<c:set var="cnt" value="${prdGdsSctnItem.CMN_COM_ETC1}_CNT" />
						<c:set var="rate" value="${prdGdsSctnItem.CMN_COM_ETC1}_RATE" />
						<td>${item[cnt] } / ${item[rate] }</td>
						</c:forEach>
						</c:when>
						</c:choose>
						<td class="left">${item.PRD_CUT_REG_NOTE }</td>
						<td><c:choose><c:when test="${item.STOP_CNT > 0 }" ><a href="/am/product/productCutBatchHistory.do?PRD_CUT_HISTORY_IDX=${item.PRD_CUT_HISTORY_IDX }" class="button button-b small js-modal" data-width="900" data-height="700" data-scroll="true" target="_blank" title="새 창 으로 열립니다."><span>보기</span></a></c:when>
						<c:otherwise>-</c:otherwise></c:choose></td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
					</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->

		<form id="frm" name="frm">
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
		<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
		<input type="hidden" name="PRD_MST_CD" value="${commandMap.PRD_MST_CD }" /> 

		<div class="pagination">
		<!-- pagination -->
			<ui:paging paging="${paging }" jsFunction="goPage" />
		</div>
		<!-- // pagination -->


		<div class="bbs-status">
		<!-- bbs status -->
			<div class="page">
				Page : <strong class="em"><c:out value="${paging.cPage }" /></strong>
				/ <c:out value="${paging.totalPageCount }" /> page
			</div>
			<div class="sort">
				Total : <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>
			</div>
		</div>
		<!-- // bbs status -->

		</form>
		
		<div class="section-button-popup"><!-- section button -->
			<a href="#none" id="closePopup" class="button button-b"><span>확인</span></a>
		</div>
	</div><!-- // contents -->

</div><!-- // container -->

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
        $frm.attr({"action":"/am/product/productCutHistory.do", "target":"_self", "method":"post"}).submit();
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
