<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
	<a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
	<%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->

	<aside id="navigation"><!-- navigation -->
		<nav>
			<%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</nav>
	</aside><!-- // navigation -->

	<div id="body"><!-- body -->

		<section id="contents"><!-- contents -->

			<div id="breadcrumb"><!-- breadcrumb -->
				<a href="#none"><i class="icon-home em"></i> HOME</a>
				&gt;
				<a href="#none">통계</a>
				&gt;
				<span>매장별통계</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">매장별통계</h3>

				<div class="tab-a justified"><!-- tab -->
					<ul class="tab">
						<li><a href="<c:out value="${serverDomain}" />/am/stats/orderMallStatsShopList.do">배송매장</a></li>
						<li class="active"><a href="#none">미니샵매장</a></li>
					</ul>
				</div><!-- // tab -->

				<div class="title-box">
                    <h4 class="title">검색</h4>
					<div class="right">
						<a href="javascript:search();" class="button button-b"><span>검색</span></a>
						<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
					</div>
				</div>

				<div class="section-form"><!-- section-form-a -->
					
					<form id="searchForm" name="searchForm">
						<input type="hidden" name="searchYn" value="Y" />
					<div class="form-group">
						<label class="label"><span>조회기간</span></label>
						<div class="field">
							<input type="text" class="text datepicker s-datepicker" name="searchStartDate" id="searchStartDate" value="<c:out value="${commandMap.searchStartDate}"/>" /> ~
							<input type="text" class="text datepicker e-datepicker" name="searchEndDate" id="searchEndDate" value="<c:out value="${commandMap.searchEndDate}"/>" />
							<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>1개월</span></a>
                            (날짜형식: YYYY-MM-DD)
						</div>
					</div>
					
	                <div class="form-group">
	                    <label class="label"><span>미니샵매장</span></label>
	                    <div class="field">
	                    	<input id="store1" type="radio" name="searchBcncCd" class="radio" <c:if test="${empty commandMap.searchBcncCd}">checked="checked"</c:if> value=""/>
                            <label for="store1">전체</label>	
                            <input id="store2" type="radio" name="searchBcncCd" class="radio" <c:if test="${not empty commandMap.searchBcncCd}">checked="checked"</c:if> value="${commandMap.searchBcncCd}"/>
                            <label for="store2">매장선택</label>       
                            <input type="text" id="searchBcncNm" name="searchBcncNm" value="${commandMap.searchBcncNm }" readonly="readonly"/> 
                            <a href="javascript:searchMiniShop();" class="button button-b small js-modal" title="새 창 으로 열립니다."><span>찾기</span></a>
                    	</div>
	                </div>

					</form>
				</div><!-- // section-form-a -->

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
								<th>매장명</th>
								<th>매장코드</th>
								<th>결제금액</th>
								<th>결제건수</th>
								<th>취소/반품금액</th>
								<th>취소/반품건수</th>
								<th>수수료율</th>
								<th>수수료액</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						    <c:when test="${not empty list}">
								<c:forEach items="${list}" var="data" varStatus="i">
									<tr>
										<td><a href="javascript:goDetail('<c:out value="${data.ORD_MST_BCNC_CD}"/>');"><c:out value="${data.ORD_PRD_BCNC_NM}"/></a></td>
										<td><c:out value="${data.ORD_MST_BCNC_CD}"/></td>
										<td><fmt:formatNumber value="${data.PAY_PAYMENT_PRICE}" type="number"/></td>
										<td><fmt:formatNumber value="${data.PAY_ORD_MST_CNT}" type="number"/></td>
										<td><fmt:formatNumber value="${data.CANCEL_PAYMENT_PRICE}" type="number"/></td>
										<td><fmt:formatNumber value="${data.CANCEL_ORD_MST_CNT}" type="number"/></td>
										<td><fmt:formatNumber value="${data.MNI_SHP_RATE}" type="number"/></td>
										<td><fmt:formatNumber value="${data.MNI_SHP_PRICE}" type="number"/></td>
									</tr>
								</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<c:if test="${commandMap.searchYn eq 'Y'}">
							    	<tr>
										<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
									</tr>
						    	</c:if>
						    	<c:if test="${commandMap.searchYn ne 'Y'}">
							    	<tr>
										<td colspan="8">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
									</tr>
						    	</c:if>
						    </c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div><!-- // col list -->
				
				<form id="frm" name="frm">
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                <input type="hidden" name="searchBcncCd" value="<c:out value="${commandMap.searchBcncCd }"/>"/>
				</form>
				
			</div><!-- // contents-inner -->

		</section><!-- // contents -->
		

	</div><!-- // body -->

	<footer><!-- footer -->
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	// 검색 엔터 이벤트 
	$('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });

	// 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 

        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/stats/orderMallStatsMiniShopList.do", "target":"_self", "method":"get"}).submit();
    };
    
    // 엑셀다운
    goExcelDown = function () 
    {
    	if("${commandMap.searchYn }" != "Y"){
    		alert("검색을 해주십시요.");
    		return;
    	}
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/stats/orderStatsMiniShopListExcel.do", "target":"_self", "method":"get"}).submit();
    };
    
     $(document).on("change","input[name=searchBcncCd]", function(){
    	if($(this).val() == ""){
    		$("#searchBcncNm").val("");
    		$("#store2").val("");
    	}
    });
    
    fnResultStore = function (obj)
    {
    	$("#store2").prop("checked",true);
    	$("#store2").val(obj.SHOP_CD);
    	$("#searchBcncNm").val(obj.SHOP_NM);
    	return true;
    }
    
    // 상세내역
    goDetail = function (bcncCd)
    {
    	var searchStartDate = $("#frm").find("input[name=searchStartDate]").val();
    	var searchEndDate = $("#frm").find("input[name=searchEndDate]").val();
    	popup('<c:out value="${serverDomain}" />/am/stats/orderStatsMinishopDetailPopup.do?searchBcncCd='+ bcncCd + '&searchStartDate='+ searchStartDate + '&searchEndDate='+searchEndDate, "1000","500","yes","_MinishopDeatilPopup");
    }
    
    
    // 미니샵 검색  
    searchMiniShop = function ()
    {
    	popup('<c:out value="${serverDomain}" />/am/site/searchStorePopup.do',"600","500","no","_SearchMiniShopPopup");
    };
    
});
</script>
</body>
</html>