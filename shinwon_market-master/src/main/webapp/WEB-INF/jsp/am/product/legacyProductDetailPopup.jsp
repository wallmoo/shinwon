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
	<h1 class="title">기간계 상품 상세</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
		<div class="title-box">
			<h4 class="title">기본정보</h4>
		</div>
		<form id="frm" name="frm">
			<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
			<input type="hidden" id="CTM_MST_CD" name="CTM_MST_CD" value="" />
		</form>
		<div class="table-a">
			<!-- col list -->
			<table class="core tdleft">
				<colgroup>
					<col style="width: 15%;" />
					<col style="width: 35%;" />
					<col style="width: 15%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody id="erpProductInfo">
					<tr>
						<th><span>기간계 상품코드 </span></th>
						<td><c:out value="${erpProductInfo.productInfo.ERP_MST_CD }" /></td>
						<th><span>기간계 상품명</span></th>
						<td><c:out value="${erpProductInfo.productInfo.ERP_MST_NM }" /></td>
					</tr>
					<tr>
						<th><span>메이커 </span></th>
						<td><c:out value="${erpProductInfo.productInfo.ERP_MST_MAK }" /></td>
						<th><span>품목</span></th>
						<td><c:out value="${erpProductInfo.productInfo.ERP_MST_NFI }" /></td>
					</tr>
					<tr>
						<th><span>표시판가</span></th>
						<td><fmt:formatNumber value="${erpProductInfo.productInfo.ERP_MST_DSP_PRC }" groupingUsed="true" /></td>
						<th><span>사업구분 </span></th>
						<td><c:out value="${erpProductInfo.productInfo.ERP_MST_CPR_GBN }" /></td>
					</tr>
					<tr>
						<th><span>평균원가</span></th>
						<td><fmt:formatNumber value="${erpProductInfo.productInfo.ERP_MST_AVE_BUY_PRC }" groupingUsed="true" /></td>
						<th><span>출하가 </span></th>
						<td><fmt:formatNumber value="${erpProductInfo.productInfo.ERP_MST_SHIP_PRC }" groupingUsed="true" /></td>
					</tr>
					<tr>
						<th><span>판매기준가 </span></th>
						<td><fmt:formatNumber value="${erpProductInfo.productInfo.ERP_MST_STD_SELL_PRC }" groupingUsed="true" /></td>
						<th><span>소비자가 </span></th>
						<td><fmt:formatNumber value="${erpProductInfo.productInfo.ERP_MST_SELL_PRC }" groupingUsed="true" /></td>
					</tr>
					<tr>
						<th><span>상품등급</span></th>
						<td><c:out value="${erpProductInfo.productInfo.ERP_MST_GRD }" /></td>
						<th><span>상품도입일 </span></th>
						<td><ui:formatDate value="${erpProductInfo.productInfo.ERP_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
					</tr>
					<tr>
						<th><span>거래처명</span></th>
						<td colspan=3><a href="javascript:goCustomerDetail('<c:out value="${erpProductInfo.productInfo.ERP_MST_CPR_CD }" />');"><c:out value="${erpProductInfo.productInfo.ERP_MST_CPR_NM }" />(<c:out value="${erpProductInfo.productInfo.ERP_MST_CPR_CD }" />)</a></td>
					</tr>		
				</tbody>
			</table>
		</div>
		
		<div class="title-box">
			<h4 class="title"> 상품정보</h4>
		</div>
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: auto;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<th><span>상품코드 </span></th>
					<th><span>상품명 </span></th>
					<th><span>상품가격 </span></th>
					<th><span>검색가 </span></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="list" items="${list }" varStatus="status">
								<tr>
									<td><a href="javascript:goDetail('<c:out value="${list.PRD_MST_CD }" />');"><c:out value="${list.PRD_MST_CD }" /></a></td>
									<td><a href="javascript:goDetail('<c:out value="${list.PRD_MST_CD }" />');"><c:out value="${list.PRD_MST_NM }" /></a></td>
									<td><fmt:formatNumber value="${list.PRD_MST_PRC }" groupingUsed="true" />원</td>
									<td><fmt:formatNumber value="${list.PRD_MST_SCH_PRC }" groupingUsed="true" />원</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan=4>등록된 상품이 없습니다.</td></tr>
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
 	
 	//상품 상세페이지 팝업
    goDetail = function (prdMstCd)
    {
        var $frm = $("#frm");
        $frm.find("#PRD_MST_CD").val(prdMstCd);
        popup('',"1100","800","no","_ProductDetailPopup");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductDetailPopup.do", "target":"popup_ProductDetailPopup", "method":"post"}).submit();
        self.close();
    };
    
  	//거래처정보 상세페이지 팝업
    goCustomerDetail = function (ctmMstCd)
    {
        var $frm = $("#frm");
        $frm.find("#CTM_MST_CD").val(ctmMstCd);
        popup('',"700","600","no","_CustomerDetailPopup");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/customerDetailPopup.do", "target":"popup_CustomerDetailPopup", "method":"post"}).submit();
    };
 	
});
</script>
</body>
</html>
