<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->  

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container"><!-- container -->

                <h2 class="title"><span>고객체험단</span></h2>

                <div class="tab-list"><!-- tab -->
                    <ul class="tab">
                        <li><a href="javascript:;" id="goBiasicEdit">KINGER관리</a></li>
                        <li><a href="javascript:;" id="goEntryList">응모자확인&당첨자 선정</a></li>
                        <li class="in" ><a href="javascript:;" id="goWinnerList">당첨자 발표</a></li>
                        <li><a href="javascript:;" id="goReview">REVIEW관리</a></li>
                    </ul>
                </div><!-- // tab -->
                
                <h3 class="title"><span>목록</span></h3>
                
                <table cellspacing="0" class="table-col table-b">
                    <colgroup>
                        <col style="width: 30%;" />
                        <col style="width: 30%;" />
                        <col style="width: 40%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>KINGER CODE</th>
                            <th>상품코드</th>
                            <th>제목</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><c:out value="${info.EXP_KINGER_CD }"/></td>
                            <td><c:out value="${info.PRD_MST_CD }"/></td>
                            <td><c:out value="${info.EXP_MST_NM }"/></td>
                        </tr>
                    </tbody>
                </table>
                
                <form id="frm" name="frm">
                    <input type="hidden" name="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }"/>" />
                    <input type="hidden" name="EXP_WIN_IDX" value="" />
                    <input type="hidden" name="cPageEntry" value="<c:out value="${commandMap.cPageEntry }"/>"/>
                    <input type="hidden" name="cPageBasic" value="<c:out value="${commandMap.cPageBasic }"/>"/>
                    <input type="hidden" name="pageSizeBasic" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
                    
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">  
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건)</span>
                        </div>
                        <c:if test="${empty list }">
                            <div class="col-1-2 text-right">
                                <a href="#none;" id="goForm" class="button small primary"><span>등록</span></a>
                            </div>  
                        </c:if>
                    </div><!-- // 목록 상단 버튼 -->
            
                </form>
            
                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 25%;" />
                        <col style="width: 20%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>제목</th>
                            <th>등록일</th>
                            <th>작성자</th>
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
                                        <td>
                                            <a href="#none" class="list-title" data-exp_win_idx="<c:out value="${row.EXP_WIN_IDX }"/>">
                                                <c:out value="${row.EXP_WIN_NM }"/>
                                            </a>
                                        </td>
                                        <td><ui:formatDate value="${row.EXP_WIN_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                        <td><c:out value="${row.EXP_WIN_REG_NM }"/>(<c:out value="${row.EXP_WIN_REG_ID }"/>)</td>
                                        <td>
                                            <c:if test="${row.EXP_WIN_USE_YN eq 'Y' }">사용</c:if>
                                            <c:if test="${row.EXP_WIN_USE_YN eq 'N' }">미사용</c:if>
                                        </td>
                                    </tr>
                                 <c:set var="listNum" value="${listNum-1}" />
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="5">등록된 당첨자발표가 없습니다.</td></tr>
                            </c:otherwise>
                        </c:choose>             
                    </tbody>
                </table>
       
                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->
 
                <form name="excelForm" id="excelForm">
                    <input type="hidden" name="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }"/>" />
                </form>
                <form name="tabForm" id="tabForm">
                    <input type="hidden" name="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPageBasic }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
                </form>
               
            </div><!-- // container -->

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>  

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script>    
$(function(){
    
	// 기본정보 탭 클릭 이벤트
    $(document).on("click", "#goBiasicEdit", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 당첨자 탭 클릭 이벤트
    $(document).on("click", "#goEntryList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerEntryList.do", "target" : "_self", "method" : "get"}).submit();
    });
    
    // 당첨자 탭 클릭 이벤트
    $(document).on("click", "#goReview", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerReviewList.do", "target" : "_self", "method" : "get"}).submit();
    });

    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerWinForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSizeEntry']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPageEntry']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerWinList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        if($searchForm.valid())
        {
            $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
            $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerWinList.do", "target":"_self", "method":"post"}).submit();
        }
    });
    
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='EXP_WIN_IDX']").val($this.data("exp_win_idx"));
        
        var url = "";
        
        url = "<c:out value="${serverDomain}" />/am/marketing/kingerWinEdit.do";
        
        $frm.attr({"action":url, "target":"_self", "method":"get"}).submit();
    });
    
});
</script>

</body>
</html>
