<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">미니샵매장 주문현황</h1>
	<a href="javascript:self.close(); pass_alert = true;" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
	
		<h2 class="semantic">미니샵매장 주문현황</h2>
		
		<c:out value="${list[0].ORD_PRD_BCNC_NM}"/> (조회기간 ${commandMap.searchStartDate} ~ ${commandMap.searchEndDate})
		
		<div class="title-box">
           <h4 class="title">조회결과<span style="color:red;">(단위:원, VAT 포함)</span></h4>

			<div class="right">
				<a href="javascript:goExcelDown();" class="button button-b"><span>엑셀 저장</span></a>
			</div>
    	</div>
                
		<div class="table-a"><!-- col list -->
			<table class="core">
				<thead>
					<tr>
						<th>주문일</th>
						<th>주문번호</th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>판매금액</th>
						<th>수량</th>
						<th>주문(취소/반품)금액</th>
						<th>주문상태</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				    <c:when test="${not empty list}">
						<c:forEach items="${list}" var="data" varStatus="i">
							<tr>
								<td><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></td>
								<td><c:out value="${data.ORD_MST_CD}"/></td>
								<td><c:out value="${data.ORD_PRD_MST_CD}"/></td>
								<td><c:out value="${data.PRD_MST_NM}"/></td>
								<td><fmt:formatNumber value="${data.ORD_PRD_SAL_PRC}" type="number"/></td>
								<td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>
								<td><fmt:formatNumber value="${data.ORD_PRD_ORD_PRC}" type="number"/></td>
								<td><c:out value="${data.ORD_PRD_ORD_STATE_NM}"/></td>
							</tr>
						</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	<tr>
							<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="section-button-popup"><!-- section button -->
			<a href="#none" id="closePopup" class="button button-b"><span>닫기</span></a>
		</div>
		
		<form id="frm" name="frm">
            <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
            <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
            <input type="hidden" name="searchBcncCd" value="<c:out value="${commandMap.searchBcncCd }"/>"/>
		</form>
		
	</div><!-- // contents -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
 	$(document).on("click","#closePopup",function(){
 		self.close();
 	});  
 	
 	// 엑셀다운
    goExcelDown = function () 
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/stats/orderStatsMinishopDetailExcel.do", "target":"_self", "method":"get"}).submit();
    };
});
</script>
</body>
</html>