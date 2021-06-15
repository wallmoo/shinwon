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

            <div class="container">

                <h2 class="title"><span>약관관리</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr><!-- row -->
                            <th><span>유형</span></th>
                            <td>
                                <select class="select" name="searchBrdCmnComIdx" id="searchBrdCmnComIdx">
                                    <option value="" <c:if test="${empty commandMap.searchBrdCmnComIdx }">selected="selected"</c:if>>전체</option>
                                    <c:if test="${not empty codeList }">
                                        <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                            <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${codeRow.CMN_COM_IDX eq commandMap.searchBrdCmnComIdx }">selected="selected"</c:if>>
                                                <c:out value="${codeRow.CMN_COM_NM }"/>
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </td>
                            <th><span>내용</span></th>
                            <td>
                                <input type="text" class="text large" name="searchKeyword" id="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" />
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <span class="pages">(총 <em><c:out value="${fn:length(list)}" /></em> 건)</span>
                    </div>
                    <div class="col-1-2 text-right">
                        <a href="javascript:goForm();" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                <colgroup>
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                </colgroup>
                <thead>
                    <tr>
                        <th><span>NO</span></th>
                        <th><span>유형</span></th>
                        <th><span>등록일</span></th>
                        <th><span>사용여부</span></th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:forEach var="row" items="${list}" varStatus="i">
                                <tr>
                                    <td><c:out value="${i.count}"/></td>
                                    <td class="text-left">
                                        <a href="javascript:goView('<c:out value="${row.BRD_AGR_IDX}"/>');">
                                            <c:out value="${row.BRD_CMN_COM_NM}"/>
                                        </a>
                                    </td> 
                                    <td><ui:formatDate value="${row.BRD_AGR_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                    <td>
                                        <c:out value="${row.BRD_CMN_COM_USE_YN eq 'Y' ? '사용' : '미사용'}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
                </table><!-- // table -->
            </div>

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

<form id="frm" name="frm">
<input type="hidden" name="BRD_AGR_IDX" id="BRD_AGR_IDX" value="" />
<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/> 
</form>

<script>
$(function(){
    // 검색 enter
    $("#searchKeyword").on("keydown", function(e){
        if(e.keyCode == 13){
            e.preventDefault();
            goSearch();
        }
    });

    // 검색
    goSearch = function(){
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/agreementBoardList.do", "target":"_self", "method":"post"}).submit(); 
    };

    // 등록
    goForm = function(){
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/agreementBoardForm.do", "target":"_self", "method":"post"}).submit();
    };

    // 상세
    goView = function(idx){
        $("#BRD_AGR_IDX").val(idx);
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/agreementBoardEdit.do", "target":"_self", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
