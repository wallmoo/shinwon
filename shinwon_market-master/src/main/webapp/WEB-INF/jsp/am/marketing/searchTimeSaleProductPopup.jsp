<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style>
    .table-row.table-a th, .table-row.table-a td{text-align:center;}
</style>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">

            <h2 class="title"><span>상품검색</span></h2>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>상품코드</span></th>
                            <td colspan="3">
                                <input type="text" name="searchPrdMstErpCd" class="text xlarge" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>">
                            </td>
                        </tr>
                        <tr>
                            <th><span>타임세일제목</span></th>
                            <td>
                              <input type="text" class="text xlarge" name="searchTimeSaleNm" value="<c:out value="${commandMap.searchTimeSaleNm }"/>"/>
                            </td>
                            <th><span>상태</span></th>
                            <td class="text-left">
                                <select name="searchPrdMstSellState" class="select">
                                    <option value="">전체</option>
                                    <option value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_ING }" g="selected"/>>판매중</option>
									<option value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_STOP }" g="selected"/>>미판매</option>
									<option value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_TEMPOUT }" g="selected"/>>품절상품</option>
									<option value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />" <ui:select v="${commandMap.searchPrdMstSellState}" t="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" g="selected"/>>일부품절상품</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span>상품명</span></th>
                            <td>
                              <input type="text" class="text xlarge" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                            </td>
                            <th><span>브랜드</span></th>
                            <td>
                              <input type="text" class="text xlarge" name="searchPrdMstBrandNm" value="<c:out value="${commandMap.searchPrdMstBrandNm }"/>"/>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="javascript:search();" class="button small primary"><span>검색</span></a>
            </div>

            <form id="frm" name="frm">
            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
            	<input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
            	<input type="hidden" name="searchTimeSaleNm" value="<c:out value="${commandMap.searchTimeSaleNm }"/>"/>
            	<input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>"/>
            	<input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
            	<input type="hidden" name="searchPrdMstBrandNm" value="<c:out value="${commandMap.searchPrdMstBrandNm }"/>"/>
            	
                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                        <span class="pages">
                            (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                        </span>
                    </div>

                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll"></th>
                            <th>타임스페셜제목</th>
                            <th>상품코드</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>일반(Tag가)</th>
                            <th>판매가</th>
                            <th>판매상태</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody id="productList">
                    	<c:choose>
							<c:when test="${not empty list}">
								<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="item" items="${list }" varStatus="status">
									<tr>
			                            <td><input type="checkbox" class="checkbox" id="PRD_MST_ERP_CD_${item.PRD_MST_ERP_CD}" name="PRD_MST_ERP_CDs" value="${item.PRD_MST_ERP_CD }^${item.PRD_MST_CD}^${item.PRD_MST_NM}^${item.PRD_IMAGE}^${item.TIM_SAL_DSP_YN}^${item.TIM_SAL_USE_YN}^${item.TIM_SAL_REG_DT}^${item.PRD_MST_SEL_STATE}"></td>
			                            <td><c:out value="${item.TIM_SAL_NM }"/></td>
			                            <td class="border-left"><a href="#"><c:out value="${item.PRD_MST_ERP_CD }"/></a></td>
			                            <td><span class="thumbnail_img"><img src="${cdnDomain }${item.PRD_IMAGE}"></span></td>
			                            <td>
			                            	<a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${item.PRD_MST_CD}&ADMIN=Y" target="_blank">
			                            		<c:out value="${item.PRD_MST_NM }"/>
			                            	</a>
		                            	</td>
			                            <td><c:out value="${item.PRD_MST_PRC }"/></td>
			                            <td><c:out value="${item.SALED_PRICE }"/></td>
			                            <td>
			                            	<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" ><span >판매중</span></c:if>
											<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_READY}" ><span >등록대기</span></c:if>
											<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span >품절상품</span></c:if>
											<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span >미판매</span></c:if>
			                            </td>
			                            <td><c:out value="${item.TIM_SAL_REG_DT }"></c:out></td>
			                        </tr>
		                        <c:set var="listNum" value="${listNum-1}" />
								</c:forEach>
							</c:when>
						</c:choose>
						
                        
                    </tbody>
                </table>
                </form>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="javascript:self.close();" id="closePopup" class="button button-a"><span>취소</span></a>
                        <a href="javascript:;" id="productApply" class="button button-b primary"><span>선택</span></a>
                    </div>
                </div><!-- // section-button -->

        </div>
    </div>
</div>

<footer><!-- footer -->
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</footer><!-- // footer -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js" /></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {

	search = function() 
	{
		var $searchForm = $("#searchForm"); 
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/searchTimeSaleProductPopup.do", "target":"_self", "method":"post"}).submit(); 
	};
	
	$(document).on("click", "#productApply", function (){
		var $checkObj = $.find("#productList input[name='PRD_MST_ERP_CDs']:checked");
		if( $checkObj.length > 1 ){
			alert("상품을 1개만 선택하여 주십시오.");
			return;  
		}
		if($checkObj.length<=0){
			alert('선택된 상품이 없습니다.')
			return;
		}
		var params = new Array();
		var myArray;
		var obj;
		
		$.each($checkObj, function(index,item){
			myArray = $(this).val().split('^');
			obj = new Object();
			obj.PRD_MST_ERP_CD 				= myArray[0];
			obj.PRD_MST_CD 			= myArray[1];
			obj.PRD_MST_NM 			= myArray[2];
			obj.PRD_IMAGE 				= myArray[3];
			obj.TIM_SAL_DSP_YN 	= myArray[4];
			obj.TIM_SAL_USE_YN 		= myArray[5];
			obj.TIM_SAL_REG_DT = myArray[6];
			obj.PRD_MST_SEL_STATE = myArray[7];
			
			params.push(obj); //만들어진  object를 배열에 추가
		
		});
		
		window.opener.fnResultTimeSaleProduct(params);   	
		self.close();
	});
	
	$(document).on("click","#closePopup",function()
	{
		self.close();
	});

});

</script>
</body>
</html>
