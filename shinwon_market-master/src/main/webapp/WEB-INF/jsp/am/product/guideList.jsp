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
                <a href="#none">상품 관리</a>
                &gt;
                <span>안내문구관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">안내문구관리</h3>

                <div class="title-box">
                    <h4 class="title">안내문구검색</h4>

                    <div class="right">
                        <a href="#none" id="search" class="button button-b"><span>검색</span></a>
                        <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                    </div>
                </div>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />

	                    <div class="form-group">
	                        <label class="label"><span>안내문구제목</span></label>
	                        <div class="field">
	                            <input type="text" class="text long" name="searchBrdGdsTitle" id="searchBrdGdsTitle" value="<c:out value="${commandMap.searchBrdGdsTitle }"/>"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                    	<label class="label"><span>분류</span></label>
	                    	
	                    	<input type="radio" id="searchBrdGdsCat" name="searchBrdGdsCat" class="radio" value="" <ui:select v="${commandMap.searchBrdGdsCat}" t="" g="checked"/> />
	                    	<label for="searchBrdGdsCat">전체</label>
	                    	
	                    	<input type="radio" id="searchBrdGdsCat${Code.PRODUCT_GUIDE_INFO}" name="searchBrdGdsCat" class="radio" value="${Code.PRODUCT_GUIDE_INFO}" <ui:select v="${commandMap.searchBrdGdsCat}" t="${Code.PRODUCT_GUIDE_INFO}" g="checked"/> />
	                    	<label for="searchBrdGdsCat${Code.PRODUCT_GUIDE_INFO}"><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_INFO]}" /></label>
	                    	
	                    	<input type="radio" id="searchBrdGdsCat${Code.PRODUCT_GUIDE_SIZE}" name="searchBrdGdsCat" class="radio" value="${Code.PRODUCT_GUIDE_SIZE}" <ui:select v="${commandMap.searchBrdGdsCat}" t="${Code.PRODUCT_GUIDE_SIZE}" g="checked"/> />
	                    	<label for="searchBrdGdsCat${Code.PRODUCT_GUIDE_SIZE}"><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_SIZE]}" /></label>
	                    	
	                    	<input type="radio" id="searchBrdGdsCat${Code.PRODUCT_GUIDE_WASH}" name="searchBrdGdsCat" class="radio" value="${Code.PRODUCT_GUIDE_WASH}" <ui:select v="${commandMap.searchBrdGdsCat}" t="${Code.PRODUCT_GUIDE_WASH}" g="checked"/> />
	                    	<label for="searchBrdGdsCat${Code.PRODUCT_GUIDE_WASH}"><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_WASH]}" /></label>
	                    	
	                    	<input type="radio" id="searchBrdGdsCat${Code.PRODUCT_GUIDE_SHIPPING}" name="searchBrdGdsCat" class="radio" value="${Code.PRODUCT_GUIDE_SHIPPING}" <ui:select v="${commandMap.searchBrdGdsCat}" t="${Code.PRODUCT_GUIDE_SHIPPING}" g="checked"/> />
	                    	<label for="searchBrdGdsCat${Code.PRODUCT_GUIDE_SHIPPING}"><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_SHIPPING]}" /></label>
	                    	
	                    	<input type="radio" id="searchBrdGdsCat${Code.PRODUCT_GUIDE_AS}" name="searchBrdGdsCat" class="radio" value="${Code.PRODUCT_GUIDE_AS}" <ui:select v="${commandMap.searchBrdGdsCat}" t="${Code.PRODUCT_GUIDE_AS}" g="checked"/> />
	                    	<label for="searchBrdGdsCat${Code.PRODUCT_GUIDE_AS}"><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_AS]}" /></label>
	                    	
	                    </div>
	                                            
	                    <div class="form-group">
	                        <label class="label"><span>상태</span></label>
	                        <div class="field">
	                            <input type="radio" id="stateA" name="searchBrdGdsUseYn" class="radio" <c:if test="${empty commandMap.searchBrdGdsUseYn }">checked="checked"</c:if> value=""/>
	                            <label for="stateA">전체</label>
	                            <input type="radio" id="stateB" name="searchBrdGdsUseYn" class="radio" <c:if test="${commandMap.searchBrdGdsUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                            <label for="stateB">사용</label>
	                            <input type="radio" id="stateC" name="searchBrdGdsUseYn" class="radio" <c:if test="${commandMap.searchBrdGdsUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
	                            <label for="stateC">미사용</label>
	                        </div>
	                    </div>

                    </form>
                </div><!-- // section-form-a -->
                

                <form id="frm" name="frm">
                <input type="hidden" name="BRD_GDS_IDX" value="" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                <input type="hidden" name="searchBrdGdsTitle" value="<c:out value="${commandMap.searchBrdGdsTitle }"/>"/>
                <input type="hidden" name="searchBrdGdsContents" value="<c:out value="${commandMap.searchBrdGdsContents }"/>"/>
                <input type="hidden" name="searchBrdGdsUseYn" value="<c:out value="${commandMap.searchBrdGdsUseYn }"/>"/>
                <input type="hidden" name="searchBrdGdsTopYn" value="<c:out value="${commandMap.searchBrdGdsTopYn }"/>"/>
                <input type="hidden" name="searchBrdGdsCat" value="<c:out value="${commandMap.searchBrdGdsCat }"/>"/>

				<div class="title-box">                
	                <h4 class="title">안내문구목록</h4>
	                <div class="right">
	                	<a href="#none" id="goForm" class="button button-b"><span>등록</span></a>
						<a href="#none" id="excelDown" class="button button-b"><span>엑셀 내려받기</span></a>
	                </div>
				</div>	                
				
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>CODE</th>
                                <th>분류</th>
                                <th>안내문구 제목</th>
                                <th>등록일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
			                                <td><c:out value="${row.BRD_GDS_IDX }"/></td>
			                                <td><c:out value="${Code.PRODUCT_GUIDE_NM[row.BRD_GDS_CAT]}"/></td>
			                                <td class="left">
			                                    <a href="#none" class="list-title" data-brd_gds_idx="<c:out value="${row.BRD_GDS_IDX }"/>">
			                                        <c:out value="${row.BRD_GDS_TITLE }"/>
			                                    </a>
			                                </td>
			                                <td><ui:formatDate value="${row.BRD_GDS_REG_DT }" pattern="yyyy.MM.dd"/></td>
			                                <td>
			                                    <span class="label label-<c:out value="${row.BRD_GDS_USE_YN eq 'Y'?'b':'a' }"/>">
                                                    <c:out value="${row.BRD_GDS_USE_YN eq 'Y'?'사용':'미사용' }"/>
                                                </span>
			                                </td>
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

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    
    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/guideForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='BRD_GDS_IDX']").val($(this).data("brd_gds_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/guideEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchBrdGdsTitle", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 내용 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchBrdGdsContents", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/guideList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/guideList.do", "target":"_self", "method":"post"}).submit();
    };

    // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
    	if("${paging.totalRecordCount}" > 10000){
    		alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
    		return;
    	}
        var $searchForm = $("#frm"); 
       	$searchForm.attr({"action": "<c:out value="${serverDomain}" />/am/product/guideListExcelDownload.do", "target":"_self", "method":"post"}).submit(); 
    });    
});
</script>
</body>
</html>