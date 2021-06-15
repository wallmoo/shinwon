<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">시간대별 매출현황</h1>
	<a href="javascript:self.close(); pass_alert = true;" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
	
		<h2 class="semantic">시간대별 매출현황</h2>
		
		<ui:formatDate value="${commandMap.targetDate}" pattern="yyyy.MM.dd"/> 판매실적 기준 시간대별 매출현황 입니다.
		
		<div class="title-box">
			<h4 class="title">시간대별 매출현황</h4>
		</div>

		<div class="table-a"><!-- col list -->
			<table class="core">
				<thead>
					<tr>
						<th rowspan="2">업체구분</th>
						<th rowspan="2">시간대</th>
						<th rowspan="2">주문금액</th>
						<th colspan="3">할인금액</th>
						<th rowspan="2">배송비</th>
						<th rowspan="2">일별실적</th>
					</tr>
					<tr>
						<th>쿠폰</th>
						<th>포인트</th>
						<th>OK캐쉬백</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				    <c:when test="${not empty list}">
				    	<tr>
				    		<td colspan="2" style="text-align: right;">합계</td>
				    		<td><fmt:formatNumber value="${list[0].TOT_ORD_MST_ORD_PRC}" type="number"/></td>
				    		<td><fmt:formatNumber value="${list[0].TOT_ORD_MST_DC_CPN}" type="number"/></td>
				    		<td><fmt:formatNumber value="${list[0].TOT_ORD_MST_DC_MLG}" type="number"/></td>
				    		<td><fmt:formatNumber value="${list[0].TOT_ORD_MST_DC_OCB_PIT}" type="number"/></td>
				    		<td><fmt:formatNumber value="${list[0].TOT_ORD_MST_DLV_CAG}" type="number"/></td>
				    		<td><fmt:formatNumber value="${list[0].TOT_REAL_ORD_MST_ORD_PRC}" type="number"/></td>
				    	</tr>
						<c:forEach items="${list}" var="data" varStatus="i">
							<tr>
								<td><c:if test="${i.index eq 0}"><c:out value="${data.ORD_MST_BRAND_NM}"/></c:if></td>
								<td><c:out value="${data.ORDER_DATE }"/></td>
								<td><fmt:formatNumber value="${data.REMAIN_ORD_MST_ORD_PRC}" type="number"/></td>
								<td><fmt:formatNumber value="${data.ORD_MST_DC_CPN}" type="number"/></td>
								<td><fmt:formatNumber value="${data.REMAIN_ORD_MST_DC_MLG}" type="number"/></td>
								<td><fmt:formatNumber value="${data.ORD_MST_DC_OCB_PIT}" type="number"/></td>
								<td><fmt:formatNumber value="${data.ORD_MST_DLV_CAG}" type="number"/></td>
								<td><fmt:formatNumber value="${data.REAL_ORD_MST_ORD_PRC}" type="number"/></td>
							</tr>
						</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	<tr>
							<td colspan="19">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="section-button-popup"><!-- section button -->
			<a href="#none" id="closePopup" class="button button-b"><span>닫기</span></a>
		</div>
		
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
});
</script>
</body>
</html>