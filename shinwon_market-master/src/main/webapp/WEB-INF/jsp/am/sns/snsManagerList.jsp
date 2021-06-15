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

                <h2 class="title"><span>SNS 관리</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />  
                            <col style="width: auto;"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>등록일</span></th>
                                <td colspan="5"> 
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>SNS 사용여부</span></th>  
                                <td>  
                                    <input type="radio" id="stateA" name="searchSnsUseYn" class="radio" <c:if test="${empty commandMap.searchSnsUseYn }">checked="checked"</c:if> value=""/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" id="stateB" name="searchSnsUseYn" class="radio" <c:if test="${commandMap.searchSnsUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                    <label for="stateB">사용</label>
                                    <input type="radio" id="stateC" name="searchSnsUseYn" class="radio" <c:if test="${commandMap.searchSnsUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                    <label for="stateC">미사용</label>
                                </td>
                                <th><span>SNS 구분</span></th>
                                <td colspan="3">
                                    <select class="select" name="searchSnsType" id="searchSnsType">
                                        <option value="">전체</option>   
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                                <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${commandMap.searchSnsType eq codeRow.CMN_COM_IDX}">selected="selected"</c:if>>
                                                    <c:out value="${codeRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>   
                                    </select> 
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->  
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
 
                <form id="frm" name="frm">
                    <input type="hidden" name="SNS_MST_IDX" value="<c:out value="${commandMap.SNS_MST_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchSnsType" value="<c:out value="${commandMap.searchSnsType }"/>"/>
                    <input type="hidden" name="searchSnsUseYn" value="<c:out value="${commandMap.searchSnsUseYn }"/>"/>
                
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">  
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">
                            	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="#none;" id="goForm" class="button small primary"><span>등록</span></a>
                        </div>
                     </div><!-- // 목록 상단 버튼 -->
                </form>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                   <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />  
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 12%;" />
                        <col style="width: 8%;" />
                        <col style="width: 12%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>SNS 구분</th>
                            <th>SNS 구분코드</th>
                            <th>SNS API_KEY</th>
                            <th>SNS 사용여부</th>
                            <th>작성자</th>
                            <th>작성일</th> 
                            <th>수정자</th>
                            <th>수정일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list }">
                                <c:set var="listNum" value="${paging.listNum}" />
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
                                        <td><c:out value="${listNum }"/></td>  
                                        <td><c:out value="${row.SNS_MST_TYPE_NM }"/></td>
                                        <td><c:out value="${row.SNS_MST_TYPE }"/></td>
                                        <td class="left">
                                            <a href="#none" class="list-title" data-brd_nts_idx="<c:out value="${row.SNS_MST_IDX }"/>">
                                                <c:out value="${row.SNS_MST_API_KEY }"/>
                                            </a> 
                                        </td>
                                        <td>
                                        	<c:out value="${row.SNS_MST_USE_YN eq 'Y'?'사용':'미사용' }"/>
                                        </td>  
                                        <td><c:out value="${row.SNS_MST_REG_ID }"/></td>
                                        <td><ui:formatDate value="${row.SNS_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                        <td>
                                            <c:if test="${row.SNS_MST_UPD_ID != null || row.SNS_MST_UPD_IP != null}">  
                                               <c:out value="${row.SNS_MST_UPD_ID }"/>
                                            </c:if>   
                                        </td>
                                        <td><ui:formatDate value="${row.SNS_MST_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
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
                </table><!-- // table -->

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->
                
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

<script>    
$(function(){  
        
    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {  
        var $frm = $("#frm");      
          
        $frm.find("input[name='searchStartDate']").val($("#searchForm").find("input[name='searchStartDate']").val());                                                                  
        $frm.find("input[name='searchEndDate']").val($("#searchForm").find("input[name='searchEndDate']").val());                                                                  
        $frm.find("input[name='searchSnsType']").val($("#searchForm").find("#searchSnsType option:selected").val());                                                                  
        $frm.find("input[name='searchSnsUseYn']").val($("#searchForm").find(":radio[name='searchSnsUseYn']:checked").val());  
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/sns/snsManagerForm.do", "target":"_self", "method":"post"}).submit();
    });
      
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");   
        
        $frm.find("input[name='SNS_MST_IDX']").val($(this).data("brd_nts_idx")); 
        $frm.find("input[name='searchStartDate']").val($("#searchForm").find("input[name='searchStartDate']").val());                                                                  
        $frm.find("input[name='searchEndDate']").val($("#searchForm").find("input[name='searchEndDate']").val());     
        $frm.find("input[name='searchSnsType']").val($("#searchForm").find("#searchSnsType option:selected").val());   
        $frm.find("input[name='searchSnsUseYn']").val($("#searchForm").find(":radio[name='searchSnsUseYn']:checked").val());  
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/sns/snsManagerEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 검색 버튼 클릭 목록 이벤트
    goSearch = function() 
    {
    	var $searchForm = $("#searchForm");  
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/sns/snsManagerList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 회원 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e){
        if(e.keyCode == 13)  
        {
            goSearch();
        }
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/sns/snsManagerList.do", "target":"_self", "method":"post"}).submit();
    };
    
});
</script>

</body>
</html>
