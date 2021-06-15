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

                <h2 class="title"><span>배송업체 관리</span></h2>

                <h3 class="title"><span>검색</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>배송업체명</span></th>  
                                <td>  
                                    <input type="text" name="searchDlvCpnNm" id="searchDlvCpnNm" class="text" value="<c:out value="${commandMap.searchDlvCpnNm }"/>"/>
                                </td>
                            </tr>
                            <tr>    
                                <th><span>사용설정</span></th>
                                <td> 
                                    <input type="radio" id="stateA" name="searchDlvCpnOnYn" class="radio" <c:if test="${empty commandMap.searchDlvCpnOnYn }">checked="checked"</c:if> value=""/>
		                            <label for="stateA">전체</label>
		                            <input type="radio" id="stateB" name="searchDlvCpnOnYn" class="radio" <c:if test="${commandMap.searchDlvCpnOnYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
		                            <label for="stateB">사용</label>
		                            <input type="radio" id="stateC" name="searchDlvCpnOnYn" class="radio" <c:if test="${commandMap.searchDlvCpnOnYn eq 'N' }">checked="checked"</c:if> value="N"/>
		                            <label for="stateC">미사용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->  
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:;" id="search" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
                
                <h3 class="title"><span>목록</span></h3>
 
                <form id="frm" name="frm">
                    <input type="hidden" name="DLV_CPN_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchDlvCpnNm" value="<c:out value="${commandMap.searchDlvCpnNm }"/>"/>
                    <input type="hidden" name="searchDlvCpnOnYn" value="<c:out value="${commandMap.searchDlvCpnOnYn }"/>"/>
                
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">  
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)</span>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="#none;" id="goForm" class="button small primary"><span>등록</span></a>
                        </div>
                     </div><!-- // 목록 상단 버튼 -->
                </form>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: auto;" />
                        <col style="width: auto;" />
                        <col style="width: auto;" />
                        <col style="width: auto;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>배송업체명</th>
                            <th>안내전화번호</th>
                            <th>배송추적URL</th>
                            <th>사용설정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list }">
                                <c:set var="listNum" value="${paging.listNum}" />
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
                               			<td><c:out value="${listNum }"/></td>
                               			<td class="al"><a href="#none" class="list-title" data-dlv_cpn_idx="<c:out value="${row.DLV_CPN_IDX }"/>"><c:out value="${row.DLV_CPN_NM }"/></a></td>
                               			<td class="al">
											<c:choose>
												<c:when test="${fn:indexOf(row.DLV_CPN_TEL,'-') > -1 || fn:length(row.DLV_CPN_TEL) < 8 || fn:length(row.DLV_CPN_TEL) > 11 }">
	                               					<c:out value="${row.DLV_CPN_TEL }"/>
	                               				</c:when>
	                               				<c:otherwise>
	                               					<ui:phonenumber phonenumber="${row.DLV_CPN_TEL}"/>
												</c:otherwise>
	                               			</c:choose>
                               			</td>
                        		       	<td class="al"><c:out value="${row.DLV_CPN_URL }"/></td>
                               			<td><c:out value="${fn:trim(row.DLV_CPN_ON_YN) eq 'Y'?'사용':'미사용'}"/></td>
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
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/delivCompanyForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='DLV_CPN_IDX']").val($(this).data("dlv_cpn_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/delivCompanyEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#searchDlvCpnNm", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/delivCompanyList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/delivCompanyList.do", "target":"_self", "method":"post"}).submit();
    };
    
});
</script>

</body>
</html>
