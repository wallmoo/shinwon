<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

            <h2 class="title"><span>셀러검색</span></h2>

                <!-- 탭부분 -->

                <h3 class="title"><span>검색</span></h3>
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="" />
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>셀러명</span></th>
                                <td>
                                    <input type="text" name="searchSellerNm" class="text xlarge" value="<c:out value="${commandMap.searchSellerNm }" />">
                                </td>
                                <th><span>입점사명</span></th>
                                <td>
                                    <input type="text" name="searchVdrNm" class="text xlarge" value="<c:out value="${commandMap.searchVdrNm }" />">
                                </td>
                            </tr>
                            <tr>
                                <th><span>입점일</span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="searchSellerStDt" name="searchSellerStDt" value="<c:out value="${commandMap.searchSellerStDt }" />"  readonly="readonly" data-target-end="#searchSellerEdDt"> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="searchSellerEdDt"name="searchSellerEdDt" value="<c:out value="${commandMap.searchSellerEdDt }" />" readonly="readonly" data-target-start="#searchSellerStDt">
                                    <a href="javascript:fnDateSet('searchSellerEdDt', 'searchSellerStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchSellerEdDt', 'searchSellerStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchSellerEdDt', 'searchSellerStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchSellerEdDt', 'searchSellerStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                </div>

                <form id="frm" name="frm">
                   	<input type="hidden" name="PLN_MST_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="searchSellerNm" value="<c:out value="${commandMap.searchSellerNm }"/>" />
                    <input type="hidden" name="searchVdrNm" value="<c:out value="${commandMap.searchVdrNm }"/>" />
                    <input type="hidden" name="searchSellerStDt" value="<c:out value="${commandMap.searchSellerStDt }"/>" />
                    <input type="hidden" name="searchSellerEdDt" value="<c:out value="${commandMap.searchSellerEdDt }"/>" />

                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">
                                (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>

                        <div class="col-1-2 text-right">
                            <select class="select">
                                <option value="order_reg">입점일순</option>
                            </select>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->

                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>셀러명</th>
                                <th>입점사명</th>
                                <th>입점일</th>
                                <th>상품등록 수</th>
                                <th>셀러픽등록 수</th>
                                <th>좋아요 수</th>
                                <th>판매율<br/>(배송중)</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="row" items="${list }" >
                        	<tr>
                        		
                                <td><a href="javascript:goParent('<c:out value="${row.BND_MST_SEL_NM }"/>','<c:out value="${row.VDR_MST_IDX }"/>');">${row.BND_MST_SEL_NM }</a></td>
                                <td><a href="javascript:goParent('<c:out value="${row.VDR_MST_NM }"/>','<c:out value="${row.VDR_MST_IDX }"/>');">${row.VDR_MST_NM }</a></td>
                                <td>
                                	<ui:formatDate value="${row.VDR_MST_REG_DT }" pattern="yyyy.MM.dd"/>
                                </td>
                                <td>${row.PRD_TOTAL }</td>
                                <td>${row.SELLERPICK_TOTAL }</td>
                                <td>${row.PRODUCT_LIKE_COUNT + row.SELLERPICK_LIKE_COUNT }</td>
                                <td>${row.VDR_SELL_RATE }<br/>(241)</td>
                            </tr>	
                        	</c:forEach>
                        </tbody>
                    </table>

                    <div class="section-pagination"><!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                        </div>
                    </div><!-- // section pagination -->

                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goList" class="button large"><span>닫기</span></a>
                    </div>
                </div><!-- // section-button -->

        </div>
    </div>
</div>

<footer><!-- footer -->
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</footer><!-- // footer -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	// 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/searchSellerPopup.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/searchSellerPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
	goParent = function (selMstNm,selMstIdx){
    	window.opener.fnResultSeller(selMstNm,selMstIdx);
    	self.close();    	
    };
});

</script>
</body>
</html>
