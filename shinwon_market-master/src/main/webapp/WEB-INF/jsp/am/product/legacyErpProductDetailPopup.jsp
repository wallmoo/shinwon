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
<body class="popup">

<header><!-- header -->
	<h1 class="title">기간계 상품 가격/재고 상세</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
		<form id="searchForm" name="searchForm">
		<input type="hidden" id="searchPrdMstErpCd" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }" />" />
		<input type="hidden" name="CTM_MST_CD" id="CTM_MST_CD" />
		<div class="table-a">

		<div class="title-box">
			<h4 class="title"> 기간계 상품 가격(<c:out value="${commandMap.searchPrdMstErpCd }" />)</h4>
		</div>
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
				</colgroup>
				<thead>
					<th><span>표시판가 </span></th>
					<th><span>판매기준가 </span></th>
					<th><span>평균매입원가 </span></th>
					<th><span>최근입고단가(300010) </span></th>
					<th><span>최근입고단가(502010) </span></th>
				</thead>
				<tbody>
					<tr>
						<td><fmt:formatNumber value="${erpPrdPrcTotal.ERP_DSP_PRC }" groupingUsed="true" /></td>
						<td><fmt:formatNumber value="${erpPrdPrcTotal.ERP_BPUPRC }" groupingUsed="true" /></td>
						<td><fmt:formatNumber value="${erpPrdPrcTotal.ERP_AVG_BUY_PRC }" groupingUsed="true" /></td>
						<td><fmt:formatNumber value="${erpPrdPrcTotal.ERP_LAT_STK_PRC_30010 }" groupingUsed="true" /></td>
						<td><fmt:formatNumber value="${erpPrdPrcTotal.ERP_LAT_STK_PRC_502010 }" groupingUsed="true" /></td>
					</tr>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: 25%;" />
				</colgroup>
				<thead>
					<th><span>당월판매수량 </span></th>
					<th><span>당월판매액 </span></th>
					<th><span>당월원가 </span></th>
					<th><span>거래처 </span></th>
				</thead>
				<tbody>
					<tr>
						<td><fmt:formatNumber value="${erpPrdPrcTotal.ERP_NOW_SOLD_CNT }" groupingUsed="true" /></td>
						<td><fmt:formatNumber value="${erpPrdPrcTotal.ERP_NOW_SOLD_PRC }" groupingUsed="true" /></td>
						<td><fmt:formatNumber value="${erpPrdPrcTotal.ERP_NOW_SOLD_AVE_PRC }" groupingUsed="true" /></td>
						<td><a href="javascript:goCustomerDetail('<c:out value="${erpPrdPrcTotal.ERP_IBVEND }" />');"><c:out value="${erpPrdPrcTotal.ERP_ABALPH }" />(<c:out value="${erpPrdPrcTotal.ERP_IBVEND }" />)</a></td>
					</tr>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="title-box">
			<h4 class="title"> 지점 판매 현황</h4>
		</div>
		
		<div class="title-box">
			<h4 class="title"> 기간별
				<input type="text" name="searchStartDate" id="searchStartDate" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchStartDate }"/>"/> ~
                <input type="text" name="searchEndDate" id="searchEndDate" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                (날짜형식: YYYY-MM-DD)
			</h4>
			<a href="javascript:search();" class="button button-b submit"><span>검색</span></a>
		</div>
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 35%;" />
					<col style="width: 34%;" />
					<col style="width: 33%;" />
				</colgroup>
				<thead>
					<th><span>구분 </span></th>
					<th><span>판매수량 </span></th>
					<th><span>판매금액 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty erpPrdOfficeList }">
							<c:forEach var="row" items="${erpPrdOfficeList }" varStatus="i">
								<tr>
									<td><c:out value="${row.MCRP04_NM }" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_CNT }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_PRC }" groupingUsed="true" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan=3>이 상품은 지점 판매 현황이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="title-box">
			<h4 class="title"> 일주일(<c:out value="${commandMap.weekDay }" />)</h4>
		</div>
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 35%;" />
					<col style="width: 34%;" />
					<col style="width: 33%;" />
				</colgroup>
				<thead>
					<th><span>구분 </span></th>
					<th><span>판매수량 </span></th>
					<th><span>판매금액 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty erpPrdOfficeWeekList }">
							<c:forEach var="row" items="${erpPrdOfficeWeekList }" varStatus="i">
								<tr>
									<td><c:out value="${row.MCRP04_NM }" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_CNT }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_PRC }" groupingUsed="true" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan=3>이 상품은 지점 판매 현황이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="title-box">
			<h4 class="title"> 1일부터(<c:out value="${commandMap.oneDay }" />)</h4>
		</div>
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 35%;" />
					<col style="width: 34%;" />
					<col style="width: 33%;" />
				</colgroup>
				<thead>
					<th><span>구분 </span></th>
					<th><span>판매수량 </span></th>
					<th><span>판매금액 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty erpPrdOfficeTodayList }">
							<c:forEach var="row" items="${erpPrdOfficeTodayList }" varStatus="i">
								<tr>
									<td><c:out value="${row.MCRP04_NM }" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_CNT }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_PRC }" groupingUsed="true" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan=3>이 상품은 지점 판매 현황이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="title-box">
			<h4 class="title"> 지점 매출 현황</h4>
		</div>
		
		<div class="title-box">
			<h4 class="title"> 기간별
				<input type="text" name="searchStartDate2" id="searchStartDate2" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchStartDate2 }"/>"/> ~
                <input type="text" name="searchEndDate2" id="searchEndDate2" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchEndDate2 }"/>"/>
                <a href="javascript:fnDateReset('searchEndDate2', 'searchStartDate2');" class="button button-a xsmall"><span>전체</span></a>
                <a href="javascript:fnDateSet('searchEndDate2', 'searchStartDate2', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                <a href="javascript:fnDateSet('searchEndDate2', 'searchStartDate2', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                <a href="javascript:fnDateSet('searchEndDate2', 'searchStartDate2', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                <a href="javascript:fnDateSet('searchEndDate2', 'searchStartDate2', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                (날짜형식: YYYY-MM-DD)
			</h4>
			<a href="javascript:search();" class="button button-b submit"><span>검색</span></a>
		</div>
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 35%;" />
					<col style="width: 34%;" />
					<col style="width: 33%;" />
				</colgroup>
				<thead>
					<th><span>구분 </span></th>
					<th><span>판매수량 </span></th>
					<th><span>판매금액 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty erpPrdOfficeSalesList }">
							<c:forEach var="row" items="${erpPrdOfficeSalesList }" varStatus="i">
								<tr>
									<td><c:out value="${row.MCRP04_NM }" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_CNT }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_PRC }" groupingUsed="true" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan=3>이 상품은 지점 매출 현황이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="title-box">
			<h4 class="title"> 일주일(<c:out value="${commandMap.weekDay }" />)</h4>
		</div>
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 35%;" />
					<col style="width: 34%;" />
					<col style="width: 33%;" />
				</colgroup>
				<thead>
					<th><span>구분 </span></th>
					<th><span>판매수량 </span></th>
					<th><span>판매금액 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty erpPrdOfficeSalesWeekList }">
							<c:forEach var="row" items="${erpPrdOfficeSalesWeekList }" varStatus="i">
								<tr>
									<td><c:out value="${row.MCRP04_NM }" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_CNT }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_PRC }" groupingUsed="true" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan=3>이 상품은 지점 매출 현황이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="title-box">
			<h4 class="title"> 1일부터(<c:out value="${commandMap.oneDay }" />)</h4>
		</div>
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 35%;" />
					<col style="width: 34%;" />
					<col style="width: 33%;" />
				</colgroup>
				<thead>
					<th><span>구분 </span></th>
					<th><span>판매수량 </span></th>
					<th><span>판매금액 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty erpPrdOfficeSalesTodayList }">
							<c:forEach var="row" items="${erpPrdOfficeSalesTodayList }" varStatus="i">
								<tr>
									<td><c:out value="${row.MCRP04_NM }" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_CNT }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${row.TOT_SEL_PRC }" groupingUsed="true" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan=3>이 상품은 지점 매출 현황이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="title-box">
			<h4 class="title"> 정책전달 / 정보사항</h4>
		</div>
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 30%;" />
					<col style="width: 70%;" />
				</colgroup>
				<thead>
					<th><span>정책전달 </span></th>
					<th><span>정보사항 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty erpPrdPolicyList }">
							<c:forEach var="row" items="${erpPrdPolicyList }" varStatus="i">
								<tr>
									<td><ui:formatDate value="${row.ERP_POLICY_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.ERP_POLICY_ED_DT }" pattern="yyyy.MM.dd"/></td>
									<td><c:out value="${row.ERP_POLICY_INFO }" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan=2>이 상품은 정책전달/정보사항이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="title-box">
			<h4 class="title"> 기간계 상품 현재고 사항(<c:out value="${commandMap.searchPrdMstErpCd }" />)</h4>
		</div>
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: 20;" />
					<col style="width: 30%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<th><span>지부 </span></th>
					<th><span>지점 </span></th>
					<th><span>지점전화번호 </span></th>
					<th><span>보유재고 </span></th>
					<th><span>가용재고 </span></th>
					<th><span>입고예정 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty erpPrdStockList }">
							<c:forEach var="erpPrdStockList" items="${erpPrdStockList }" varStatus="status">
								<tr>
									<td><c:out value="${erpPrdStockList.MCRP02_NM}" /></td>
									<td><c:out value="${erpPrdStockList.LIMCU} ( ${erpPrdStockList.MCDC})" /></td>
									<td><c:out value="${erpPrdStockList.LIMCU_HPNO}" /></td>
									<td><fmt:formatNumber value="${erpPrdStockList.LIPQOH }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${erpPrdStockList.LIPCOM }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${erpPrdStockList.LIPREQ }" groupingUsed="true" /></td>
								</tr>
							</c:forEach>
								<tr>
									<td colspan=3 style="background-color:#BDBDBD;">합계</td>
									<td style="background-color:#BDBDBD;"><fmt:formatNumber value="${erpPrdStockTotal.SUM_LIPQOH }" groupingUsed="true" /></td>
									<td style="background-color:#BDBDBD;"><fmt:formatNumber value="${erpPrdStockTotal.SUM_LIPCOM }" groupingUsed="true" /></td>
									<td style="background-color:#BDBDBD;"><fmt:formatNumber value="${erpPrdStockTotal.SUM_LIPREQ }" groupingUsed="true" /></td>	
								</tr>
						</c:when>
						<c:otherwise>
							<tr><td colspan=6>이 상품은 현재고가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->

		<div class="section-button-popup"><!-- section button -->
			<a href="#none" id="closePopup" class="button button-b"><span>닫기</span></a>
		</div>
	</div><!-- // contents -->
	</form>
</div><!-- // container -->



<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () 
{
	
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});
 	
  	//거래처정보 상세페이지 팝업
    goCustomerDetail = function (ctmMstCd)
    {
        var $searchForm = $("#searchForm");
        $searchForm.find("#CTM_MST_CD").val(ctmMstCd);
        popup('',"700","600","no","_CustomerDetailPopup");
        $searchForm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/customerDetailPopup.do", "target":"popup_CustomerDetailPopup", "method":"post"}).submit();
    };
    
 	// 검색
    search = function() 
    {
    	var $searchForm = $("#searchForm");
 		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/legacyErpProductDetailPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
 	
});
</script>
</body>
</html>
