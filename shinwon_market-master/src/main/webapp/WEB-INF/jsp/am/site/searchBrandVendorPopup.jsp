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

            <h2 class="title"><span>입점사검색</span></h2>

                <!-- 탭부분 -->

                <h3 class="title"><span>검색</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="" />
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>입점사명</span></th>
                                <td>
                                    <input type="text" class="text large" id="searchVdrMstNm" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>사업자등록번호</span></th>
                                <td>
                                    <input type="text" class="text large" id="searchVdrMstBusi" name="searchVdrMstBusi" value="<c:out value="${commandMap.searchVdrMstBusi }"/>"/>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                    <a href="javascript:search();" id="search" class="button small primary"><span>검색</span></a>
                </div>

                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
                    <input type="hidden" name="searchVdrMstBusi" value="<c:out value="${commandMap.searchVdrMstBusi }"/>"/>
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                            <span class="pages">
                                (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->

                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>입점사명</th>
                                <th>사업자등록번호</th>
                                <th>대표자명</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:set var="listNum" value="${paging.listNum}" />
                                <c:forEach var="item" items="${list }" varStatus="status">
                                <tr>
                                    <td>
                                        <a href="javascript:goParent('<c:out value="${item.VDR_MST_NM }"/>','<c:out value="${item.VDR_MST_IDX }"/>');" title="해당 업체를 선택합니다">
                                            <c:out value="${item.VDR_MST_NM }"/>
                                        </a>
                                    </td>
                                    <td>
                                        <c:out value="${item.VDR_MST_BUSI1 }"/>-<c:out value="${item.VDR_MST_BUSI2 }"/>-<c:out value="${item.VDR_MST_BUSI3 }"/>
                                    </td>
                                    <td><c:out value="${item.VDR_MST_CEO_NM }"/></td>
                                </tr>
                                <c:set var="listNum" value="${listNum-1}" />
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                            
                        </tbody>
                    </table>
                </form>
                
                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                    </div>
                </div><!-- // section pagination -->

                

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="closePopup" class="button large"><span>닫기</span></a>
                    </div>
                </div><!-- // section-button -->

        </div>
    </div>
</div>

<footer><!-- footer -->
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</footer><!-- // footer -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js" /></script>
<script src="<c:out value="${serverDomain}" />am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	searchClear = function(){
		$("#searchVdrMstNm").val("")
		$("#searchVdrMstBusi").val("")
	}
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/searchBrandVendorPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
	//페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/site/searchBrandVendorPopup.do", "target":"_self", "method":"post"}).submit();
    };

    // 입점업체 선택 
    goParent = function (vdrNm,vdrIdx)
    {
    	window.opener.fnResultErpVendor(vdrNm,vdrIdx);
    	self.close();    	
    };
    
    // 닫기 버튼 클릭
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});   


});



</script>
</body>
</html>
