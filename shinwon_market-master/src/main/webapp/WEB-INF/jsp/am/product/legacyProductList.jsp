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
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

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
                <a href="#none">상품관리</a>
                &gt;
                <span>기간계 상품관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">기간계 상품목록</h3>

                <div class="title-box">
                    <h4 class="title">검색</h4>

                </div>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchYn" value="Y" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>

	                    <div class="form-group">
	                        <label class="label"><span>기간계 모델명</span></label>
	                        <div class="field">
	                            <input type="text" class="text long" name="searchErpMstCd" id="searchErpMstCd" value="<c:out value="${commandMap.searchErpMstCd }"/>"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>기간계 상품명</span></label>
	                        <div class="field">
	                            <input type="text" class="text long" name="searchErpMstNm" id="searchErpMstNm" value="<c:out value="${commandMap.searchErpMstNm }"/>"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>쇼핑몰 등록여부</span></label>
	                        <div class="field">
	                            <select name="searchPrdMstYn" id="searchPrdMstYn" class="select">
	                            	<option value="">전체</option>
	                            	<option value="Y" <ui:select v="${commandMap.searchPrdMstYn}" t="Y" g="selected"/>>YES</option>
	                            	<option value="N" <ui:select v="${commandMap.searchPrdMstYn}" t="N" g="selected"/>>NO</option>
	                            </select>
	                        </div>
	                    </div>

	                    <div class="form-group">
	                        <label class="label"><span>기간계 등록일자</span></label>
	                        <div class="field">
	                            <input type="text" name="searchStartDate" id="searchStartDate" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchStartDate }"/>"/> ~
	                            <input type="text" name="searchEndDate" id="searchEndDate" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                            <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            (날짜형식: YYYY-MM-DD)
	                    	</div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>사업구분</span></label>
	                        <div class="field">
	                            <select name="searchErpMstCprGbn" id="searchErpMstCprGbn" class="select">
	                            	<option value="">전체</option>
	                            	<option value="가전" <ui:select v="${commandMap.searchErpMstCprGbn}" t="가전" g="selected"/>>가전</option>
	                            	<option value="IT" <ui:select v="${commandMap.searchErpMstCprGbn}" t="IT" g="selected"/>>IT</option>
	                            	<option value="모바일" <ui:select v="${commandMap.searchErpMstCprGbn}" t="모바일" g="selected"/>>모바일</option>
	                            	<option value="기타" <ui:select v="${commandMap.searchErpMstCprGbn}" t="기타" g="selected"/>>기타</option>
	                            </select>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>품목</span></label>
	                        <div class="field">
	                            사업부 
                       			<select class="select" id="searchItmCtgDepth1" name="searchItmCtgDepth1" >
									<option value="">전체</option>
								</select>
								그룹 
                       			<select class="select" id="searchItmCtgDepth2" name="searchItmCtgDepth2" >
									<option value="">전체</option>
								</select>
								품목그룹 
                       			<select class="select" id="searchItmCtgDepth3" name="searchItmCtgDepth3" >
									<option value="">전체</option>
								</select>
	                        </div>
	                    </div>
						
						<div class="form-group">
	                        <label class="label"><span>품목의 항목</span></label>
	                        <div class="field" id="applyItemCategoryList">
	                           <span id="itemCategoryNodata"></span>
	                        </div>
	                    </div>
                    </form>
                </div><!-- // section-form-a -->
                
                <div class="section-button search">
					<a href="#none" id="search" class="button button-b"><span>검색</span></a>
					<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                </div>
                

                <form id="frm" name="frm">
	                <input type="hidden" name="cPage"             value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="searchStartDate"   value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate"     value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchErpMstCd"  value="<c:out value="${commandMap.searchErpMstCd }"/>"/>
	                <input type="hidden" name="searchErpMstNm" value="<c:out value="${commandMap.searchErpMstNm }"/>"/>
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
	                <input type="hidden" name="searchPrdMstYn" value="<c:out value="${commandMap.searchPrdMstYn }"/>" />
	                <input type="hidden" name="searchErpMstCprGbn" value="<c:out value="${commandMap.searchErpMstCprGbn }"/>" />
	                <input type="hidden" name="searchErpMstNfis" value="<c:out value="${commandMap.searchErpMstNfis }"/>" />
					<input type="hidden" name="searchPrdMstErpCd" id="searchPrdMstErpCd" value="" />
				<div class="title-box">                
	                <h4 class="title">리스트</h4>
	                
		            <div class="right">
	                    <a href="#none" id="excelDown" class="button button-b"><span>엑셀 저장</span></a>
	                </div>
				</div>	                
				
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 8%;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>품목</th>
                                <th>기간계<br/>모델명</th>
                                <th>기간계<br/>상품명</th>
                                <th>평균원가</th>
                                <th>판매기준가</th>
                                <th>출하가</th>
                                <th>기간계<br/>판매수량<br/>(1개월)</th>
                                <th>기간계<br/>매출수량<br/>(1개월)</th>
                                <th>기간계<br/>등록일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
			                                <td><c:out value="${row.ERP_MST_NFI }"/></td>
			                                <td><a href="javascript:goErpDetail('<c:out value="${row.ERP_MST_CD }"/>');"><c:out value="${row.ERP_MST_CD }"/></a></td>
			                                <td><c:out value="${row.ERP_MST_NM }"/></td>
			                                <td><a href="javascript:goErpPrdDetail('<c:out value="${row.ERP_MST_CD }"/>');"><fmt:formatNumber value="${row.ERP_MST_AVE_BUY_PRC }" groupingUsed="true" /></a></td>
			                                <td><a href="javascript:goErpPrdDetail('<c:out value="${row.ERP_MST_CD }"/>');"><fmt:formatNumber value="${row.ERP_MST_STD_SELL_PRC }" groupingUsed="true" /></a></td>
			                                <td><fmt:formatNumber value="${row.ERP_MST_SHIP_PRC }" groupingUsed="true" /></td>
			                                <td><fmt:formatNumber value="${row.ERP_SELL_CNT }" groupingUsed="true" /></td>
			                                <td><fmt:formatNumber value="${row.ERP_SELL_PRC }" groupingUsed="true" /></td>
			                                <td><ui:formatDate value="${row.ERP_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
			                            </tr>
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${commandMap.searchYn eq 'Y'}">
										<tr>
											<td colspan=10 class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
										</tr>
									</c:if>
									<c:if test="${commandMap.searchYn ne 'Y'}">
										<tr>
											<td colspan=10 class="td_no_result">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
										</tr>
									</c:if>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div><!-- // col list -->

                <div class="pagination"><!-- pagination -->
					<ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->


				<div class="bbs-status"><!-- bbs status -->
					<div class="page">
						총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
					</div>
					<div class="sort">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
					</div>
				</div><!-- // bbs status -->
				
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
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='cPage']").val(1);
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/legacyProductList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $searchForm = $("#searchForm");
        $searchForm.find("input[name='cPage']").val(cPage);
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/legacyProductList.do", "target":"_self", "method":"post"}).submit();
    };
    
  	//erp 상품 상세페이지 팝업
    goErpDetail = function (erpMstCd)
    {
        var $frm = $("#frm");
        $frm.find("#searchPrdMstErpCd").val(erpMstCd);
        popup('',"1100","800","no","_ErpMstDetailPopup");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/legacyProductDetailPopup.do", "target":"popup_ErpMstDetailPopup", "method":"post"}).submit();
    };
    
  	//erp 상품 상세페이지 팝업
    goErpPrdDetail = function (erpMstCd)
    {
        var $frm = $("#frm");
        $frm.find("#searchPrdMstErpCd").val(erpMstCd);
        popup('',"1100","800","no","_ErpMstPrdDetailPopup");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/legacyErpProductDetailPopup.do", "target":"popup_ErpMstPrdDetailPopup", "method":"post"}).submit();
    };
    
 	// 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
    	if("${paging.totalRecordCount}" > 10000){
    		alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
    		return;
    	}else if("${paging.totalRecordCount}" == 0){
    		alert("저장할 내역이 없습니다.");
    		return;
    	}
    	if("${commandMap.searchYn }" != "Y"){
    		alert("검색을 해주시기 바랍니다.");
    		return;
    	}
        var $searchForm = $("#searchForm"); 
       	$searchForm.attr({"action": "<c:out value="${serverDomain}" />/am/product/legacyProductListExcelDownload.do", "target":"_self", "method":"post"}).submit(); 
    });
 	
	getItemList("searchItmCtgDepth1", "-1", "<c:out value="${commandMap.searchItmCtgDepth1}" />", "<c:out value="${serverDomain}"/>","P","");
	
	if($("#searchItmCtgDepth1").val() != ""){
		getItemList("searchItmCtgDepth2", $("#searchItmCtgDepth1 option:selected").val(), "<c:out value="${commandMap.searchItmCtgDepth2}" />", "<c:out value="${serverDomain}"/>", "P","");
		getItemList("searchItmCtgDepth3", $("#searchItmCtgDepth2 option:selected").val(), "<c:out value="${commandMap.searchItmCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "P","");
		getItemList("applyItemCategoryList", $("#searchItmCtgDepth3 option:selected").val(), "<c:out value="${commandMap.searchErpMstNfis}" />", "<c:out value="${serverDomain}"/>", "P","checkbox");
	}
	
    $(document).on("change", "#searchItmCtgDepth1", function () 
    {
    	getItemList("searchItmCtgDepth2", $("#searchItmCtgDepth1 option:selected").val(), "<c:out value="${commandMap.searchItmCtgDepth2}" />", "<c:out value="${serverDomain}"/>", "P","");
    	getItemList("searchItmCtgDepth3", "", "<c:out value="${commandMap.searchItmCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "P");
    });
    $(document).on("change", "#searchItmCtgDepth2", function () 
    {
    	getItemList("searchItmCtgDepth3", $("#searchItmCtgDepth2 option:selected").val(), "<c:out value="${commandMap.searchItmCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "P","");
    });
    $(document).on("change", "#searchItmCtgDepth3", function () 
    {
    	getItemList("applyItemCategoryList", $("#searchItmCtgDepth3 option:selected").val(), "<c:out value="${commandMap.searchItmCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "P","checkbox");
    });

});
</script>
</body>
</html>