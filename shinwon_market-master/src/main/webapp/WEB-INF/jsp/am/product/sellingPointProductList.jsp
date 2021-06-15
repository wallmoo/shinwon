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
				<span>홍보문구관리</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">홍보문구관리</h3>

				<div class="title-box">
					<h4 class="title">검색</h4>

					<div class="right">
						<a href="javascript:search();" class="button button-b"><span>검색</span></a>
						<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
					</div>
				</div>

				<div class="section-form"><!-- section-form-a -->
				
                <form id="searchForm" name="searchForm">  
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
					<div class="form-group">
						<label class="label"><span>홍보문구</span></label>
						<div class="field">
							<input type="text" class="text long" id="searchPrmWrdTxt" name="searchPrmWrdTxt" value="<c:out value="${commandMap.searchPrmWrdTxt }" />" />
						</div>
					</div>

					<div class="form-group">
						<label class="label"><span>전시기간</span></label>
						<div class="field">
							<input type="text" class="text datepicker s-datepicker" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />" /> ~
							<input type="text" class="text datepicker e-datepicker" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />" />
							<a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
							<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            (날짜형식: YYYY-MM-DD)
						</div>
					</div>

					<div class="form-group">
						<label class="label"><span>상태</span></label>
						<div class="field">
							<input type="radio" id="searchPrmWrdState1" class="radio" name="searchPrmWrdState" value="" <ui:select v="${commandMap.searchPrmWrdState }" t="" g="checked"/> />
							<label for="searchPrmWrdState1">전체</label>
							<input type="radio" id="searchPrmWrdState2" class="radio" name="searchPrmWrdState" value="Y" <ui:select v="${commandMap.searchPrmWrdState }" t="Y" g="checked"/> />
							<label for="searchPrmWrdState2">사용</label>
							<input type="radio" id="searchPrmWrdState3" class="radio" name="searchPrmWrdState" value="N" <ui:select v="${commandMap.searchPrmWrdState }" t="N" g="checked"/> />
							<label for="searchPrmWrdState3">미사용</label>
						</div>
					</div>

                </form>
				</div><!-- // section-form-a -->


				<div class="title-box">
					<h4 class="title">리스트</h4>

					<div class="right">
						<a href="javascript:goForm();" class="button button-b"><span>등록</span></a>
						<a href="#none" id="excelDown" class="button button-b"><span>엑셀 내려받기</span></a>
					</div>
				</div>

                <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
                <input type="hidden" name="searchPrmWrdTxt" value="<c:out value="${commandMap.searchPrmWrdTxt }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchPrmWrdState" value="<c:out value="${commandMap.searchPrmWrdState }"/>"/>
                <input type="hidden" id="PRM_WRD_IDX" name="PRM_WRD_IDX" value="" />
                
				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: auto;" />
							<col style="width: 18%;" />
							<col style="width: 8%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>홍보문구</th>
								<th>전시기간</th>
								<th>상품수</th>
								<th>등록일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
								    <td><c:out value="${listNum }" /></td>
								    <td class="left"><a href="javascript:goView('<c:out value="${item.PRM_WRD_IDX }" />');"><c:out value="${item.PRM_WRD_TXT }" /></a></td>
								    <td><ui:formatDate value="${item.PRM_WRD_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${item.PRM_WRD_ED_DT }" pattern="yyyy.MM.dd"/></td>
								    <td>
								        <c:if test="${item.PRM_WRD_SCOPE eq Code.SCOPE_PRODUCT }"><c:out value="${item.PRD_CNT }" /></c:if>
								        <c:if test="${item.PRM_WRD_SCOPE eq Code.SCOPE_CATEGORY }">-</c:if>
								    </td>
								    <td><ui:formatDate value="${item.PRM_WRD_REG_DT }" pattern="yyyy.MM.dd"/></td>
								    <td><c:if test="${item.PRM_WRD_STATE eq 'Y' }"><span class="label label-b">사용</span></c:if><c:if test="${item.PRM_WRD_STATE eq 'N' }"><span class="label label-a">미사용</span></c:if></td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
								<tr>
									<td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
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


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
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
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/sellingPointProductList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/sellingPointProductList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 홍보문구관리 상세페이지 이동
    goView = function (prmWrdIdx)
    {
        var $frm = $("#frm");
        $frm.find("#PRM_WRD_IDX").val(prmWrdIdx);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/sellingPointProductEdit.do", "target":"_self", "method":"post"}).submit();
    };

    // 홍보문구관리 등록페이지 이동
    goForm = function ()
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/sellingPointProductForm.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
    	if("${paging.totalRecordCount}" > 10000){
    		alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
    		return;
    	}
        var $searchForm = $("#frm"); 
       	$searchForm.attr({"action": "<c:out value="${serverDomain}" />/am/product/sellingPointProductListExcelDownload.do", "target":"_self", "method":"post"}).submit(); 
    });    
});
</script>
</body>
</html>