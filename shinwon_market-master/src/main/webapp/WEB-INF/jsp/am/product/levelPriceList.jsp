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
				<span>회원별가격정보 조회</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">할인율조회</h3>
				
				<div class="title-box">
					<h4 class="title">상품검색</h4>

					<div class="right">
						<a href="javascript:search();" class="button button-b"><span>검색</span></a>
						<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
					</div>
				</div>

				<div class="section-form"><!-- section-form-a -->
				
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
					
					<div class="form-group">
						<label class="label"><span>회원구분</span></label>
						<div class="field">
							<select class="select" id="searchSaleObjSctn" name="searchSaleObjSctn" >
								<option value="">전체</option><%--비회원은 제외되어 common_code 를 사용하지 않음 --%>
                                <option value="${Code.MEMBER_GROUP_MALL}" <ui:select v="${commandMap.searchSaleObjSctn }" t="${Code.MEMBER_GROUP_MALL }" g="selected"/>><c:out value="${Code.MEMBER_GROUP_MALL_NM }" /></option>
                                <option value="${Code.MEMBER_GROUP_OWN}" <ui:select v="${commandMap.searchSaleObjSctn }" t="${Code.MEMBER_GROUP_OWN }" g="selected"/>><c:out value="${Code.MEMBER_GROUP_OWN_NM }" /></option>
                                <option value="${Code.MEMBER_GROUP_SUB}" <ui:select v="${commandMap.searchSaleObjSctn }" t="${Code.MEMBER_GROUP_SUB }" g="selected"/>><c:out value="${Code.MEMBER_GROUP_SUB_NM }" /></option>
                                <option value="${Code.MEMBER_GROUP_VIP}" <ui:select v="${commandMap.searchSaleObjSctn }" t="${Code.MEMBER_GROUP_VIP }" g="selected"/>><c:out value="${Code.MEMBER_GROUP_VIP_NM }" /></option>
								</select>
						</div>
					</div>
					
					<div class="form-group" id="searchDetail">
						<label class="label"><span>개발연도</span></label>
						<div class="field">
 							<input type="text" class="text" id="searchPrdMstDvlpYear" name="searchPrdMstDvlpYear" value="<c:out value="${commandMap.searchPrdMstDvlpYear }"/>" /> 
						</div>
					</div>
					
					<div class="form-group">
						<label class="label"><span>상품코드</span></label>
						<div class="field">
 							<input type="text" class="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" /> 
						</div>
					</div>
					
					<div class="form-group" id="searchDetail">
						<label class="label"><span>상품구분</span></label>
						<div class="field">
							<select class="select" id="searchPrdMstGdsSctnCd" name="searchPrdMstGdsSctnCd" >
								<option value="">전체</option>
                                <c:forEach var="prdGdsSctnList" items="${productKndList}">
                                    <option value="${prdGdsSctnList.CMN_COM_ETC1}" <ui:select v="${commandMap.searchPrdMstGdsSctnCd }" t="${prdGdsSctnList.CMN_COM_ETC1 }" g="selected"/>><c:out value="${prdGdsSctnList.CMN_COM_NM }" /></option>
                                </c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group" id="searchDetail">
						<label class="label"><span>계절코드</span></label>
						<div class="field">
 							<select class="select" id="searchPrdSsonCd" name="searchPrdSsonCd" >
								<option value="">전체</option>
                                <c:forEach var="ssonCdList" items="${ssonCdList}">
                                    <option value="${ssonCdList.CMN_COM_ETC1}" <ui:select v="${commandMap.searchPrdSsonCd }" t="${ssonCdList.CMN_COM_ETC1 }" g="selected"/>><c:out value="${ssonCdList.CMN_COM_NM }" /></option>
                                </c:forEach>
							</select> 
						</div>
					</div>		
                </form>
				</div><!-- // section-form-a -->               

                <form id="frm" name="frm">
	                <input type="hidden" name="searchSaleObjSctn" value="<c:out value="${commandMap.searchSaleObjSctn }"/>"/>
	                <input type="hidden" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>"/>
	                <input type="hidden" name="searchPrdMstDvlpYear" value="<c:out value="${commandMap.searchPrdMstDvlpYear }"/>" />
	                <input type="hidden" name="searchPrdMstGdsSctnCd" value="<c:out value="${commandMap.searchPrdMstGdsSctnCd }"/>" />
	                <input type="hidden" name="searchPrdSsonCd" value="<c:out value="${commandMap.searchPrdSsonCd }"/>" />	                	                
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	                <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
	                <input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
                    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
                    
				<div class="title-box">
					<h4 class="title">상품목록</h4>
					<div class="right">
						<a href="#none" class="button button-b" id="excelDown" ><span>엑셀 내려받기</span></a>
					</div>                     
				</div>

				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
						<col width="4%" />
						<col width="5%" />
						<col width="8%" />
						<col width="7%" />
						
						<col width="4%" />
						<col width="4%" />
						<col width="3%" />
						<col width="3%" />
						<col width="3%" />
						
						<col width="4%" />
						<col width="4%" />
						<col width="7%" />
						<col width="4%" />
						<col width="4%" />
						
						<col width="6%" />
						<col width="6%" />
						<col width="6%" />
						<col width="4%" />
						<col width="6%" />
						<col />
						
						<thead>
							<tr>
								<th>판매대상</th>
								<th>판매대상명</th>
								<th>상품코드</th>
								<th>대표품목</th>
								
								<th>품종코드</th>
								<th>할인율</th>
								<th>균일가</th>
								<th>포인트<br />적립대상<br />여부</th>
								<th>포인트<br />사용대상<br />여부</th>
								
								<th>프로모션<br />구분</th>
								<th>쿠폰발행<br />여부</th>
								<th>캠페인ID</th>
								<th>개발년도</th>
								<th>계절</th>
								
								<th>유효기간</th>
								<th>작업일자</th>
								<th>등록일자</th>
								<th>등록자</th>
								<th>수정일자</th>
								<th>수정자</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td>${item.SALE_OBJ_SCTN_CD}</td>
									<td>${item.SALE_OBJ_SCTN_NM}</td>
									<td><a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${item.PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다."><c:out value="${item.PRD_MST_CD }" /></a></td>
									<td>${item.REP_PROD_CD}</td>
									<td>${item.PRD_MST_ITEM_KND_CD}</td>
									<td>${item.PROD_PERAMT1}</td>
									<td><fmt:formatNumber value="${item.PROD_PERAMT2 }" groupingUsed="true" /></td>
									<td>${item.POINT_SAVE_YN}</td>
									<td>${item.POINT_USE_YN}</td>
									<td>${item.PROMOTION_GBN}</td>
									<td>${item.COUPON_BALHENG}</td>
									<td>${item.CMPG_ID}</td>
									<td>${item.PRD_MST_DVLP_YEAR}</td>
									<td>${item.PRD_MST_SSON_NM}</td>
									<td><ui:formatDate value="${item.AVAIL_SDATE}" pattern="yyyy.MM.dd" /><br />~<ui:formatDate value="${item.AVAIL_EDATE}" pattern="yyyy.MM.dd" /></td>
									<td><ui:formatDate value="${item.UPDATE_DATE}" pattern="yyyy.MM.dd" /></td>
									<td><ui:formatDate value="${item.REGI_DATE}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
									<td>${item.REGI_USER}</td>
									<td><ui:formatDate value="${item.UPDT_DATE}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
									<td>${item.UPDT_USER}</td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<c:if test="${param.searchYn eq 'Y'}">
						    	<tr>
									<td colspan="20">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    	</c:if>
						    	<c:if test="${param.searchYn ne 'Y'}">
						    	<tr>
									<td colspan="20">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
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


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    //체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");
    
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/levelPriceList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/levelPriceList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 상품 상세페이지 이동
    goView = function (prdMstCd)
    {
        var $frm = $("#frm");
        $frm.find("#PRD_MST_CD").val(prdMstCd);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_self", "method":"post"}).submit();
    };
    
 // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
        var $searchForm = $("#frm"); 
       	$searchForm.attr({"action": "<c:out value="${serverDomain}" />/am/product/levelPriceListExcelDownload.do", "target":"_self", "method":"post"}).submit(); 
    });    
    
});
</script>
</body>
</html>