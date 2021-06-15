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

                <h2 class="title"><span>입점사업무공유관리</span></h2>

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
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
                                </td>
                            </tr>
                            <tr>
                                    <th><span>공유대상</span></th>
    	                            <td>
    	                            	<input type="radio" id="stateA" name="" class="radio" checked="checked" value="" />
    									<label for="stateA">전체</label>
    									<input type="radio"	id="stateB" name="" class="radio"  value="Y" />
    									<label for="stateB">슈퍼관리자</label>
    									<input type="radio" id="stateC" name="" class="radio"  value="N" />
    									<label for="stateC">입점사</label>
    	                            </td>
                                    <!-- 슈퍼관리자만 검색 가능 -->
                                    <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
                                        <th><span>입점사명</span></th>
                                        <td>
                                            <input id="searchVendorName" name="searchVendorName" type="text" class="text xlarge">
                                        </td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <th><span>업무구분</span></th>
                                    <td>
                                        <select class="select">
                                            <option>전체</option>
                                            <option>이벤트</option>
                                            <option>승인</option>
                                            <option>어드민관련</option>
                                            <option>cs</option>
                                            <option>기타</option>
                                        </select>
                                    </td>
                                    <th><span>작성자/ID</span></th>
                                    <td>
                                      <input type="text" name="searchWriter" id="searchWriter" class="text" value=""/>
                                       / 
                                       <input type="text" name="searchID" id="searchID" class="text" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>답변상태</span></th>
    	                            <td colspan="3">
    	                            	<input type="radio" id="stateA" name="" class="radio" checked="checked" value="" />
    									<label for="stateA">전체</label>
    									<input type="radio"	id="stateB" name="" class="radio"  value="Y" />
    									<label for="stateB">답변대기</label>
    									<input type="radio" id="stateC" name="" class="radio"  value="N" />
    									<label for="stateC">답변완료</label>
    	                            </td>
                                </tr>
                                <tr>
                                    <th><span>내용</span></th>
                                    <td colspan="3"><input type="text" name="searchContents" id="searchContents" class="text xlarge" value=""/></td>
                                </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->  
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                    <a href="javascript:search();" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
 
                <form id="frm" name="frm">
                    <input type="hidden" name="VDR_LGN_IDX" id="VDR_LGN_IDX"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>                    
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchBusiNo" value="<c:out value="${commandMap.searchBusiNo }"/>"/>
                    <input type="hidden" name="searchVendorNm" value="<c:out value="${commandMap.searchVendorNm }"/>"/>
                    <input type="hidden" name="searchCeoNm" value="<c:out value="${commandMap.searchCeoNm }"/>"/>
                    <input type="hidden" name="searchCeoNm" value="<c:out value="${commandMap.searchCeoNm }"/>"/>
                    
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">  
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">
                            	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                        <div class="col-1-2 text-right">
	                        <a href="javascript:goForm();" id="goForm" class="button small primary"><span>등록</span></a>
	                    </div>
                     </div><!-- // 목록 상단 버튼 -->
                     
                </form>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 8%;"/>
                        <col style="width: auto;" />
                        <col style="width: 12%;"/>
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>공유대상</th>
                            <th>업무구분</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>답변상태</th>
                        </tr>
                    </thead>
                    <tbody>            
                        <c:choose>
                            <c:when test="${not empty list }">
                                <c:set var="listNum" value="${paging.listNum}" />
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
                                        <td><c:out value="${listNum }"/></td>                                           
                                        <td class="left">
                                            <a href="javascript:goView('<c:out value="${row.VDR_LGN_IDX }"/>');" class="list-title">
                                                <c:out value="${row.VDR_LGN_NM }"/>
                                            </a>
                                        </td>   
                                        <td><c:out value="${row.VDR_LGN_CEO_NM }"/></td>
                                        <td>
                                            <c:out value="${row.VDR_LGN_BUSI1 }"/>-<c:out value="${row.VDR_LGN_BUSI2 }"/>-<c:out value="${row.VDR_LGN_BUSI3 }"/>
                                        </td>
                                        <td><c:out value="${row.VDR_LGN_TYPE_NM}"/></td>
                                        <td><ui:formatDate value="${row.VDR_LGN_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                    	<td>상태</td>
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
        
	// 업체명 클릭 이벤트
    goView = function (vdrLgnIdx) {
        var $frm = $("#frm");
        $frm.find("input[name='VDR_LGN_IDX']").val(vdrLgnIdx);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorLoginManagerEdit.do", "target":"_self", "method":"post"}).submit();
    };
        
    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
    
    // 검색 버튼 클릭 이벤트
    search = function(){
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorLoginManagerList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorLoginManagerList.do", "target":"_self", "method":"post"}).submit();
    };
    goForm = function(){
        var $searchForm = $("#searchForm"); 
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorLoginManagerForm.do", "target":"_self", "method":"post"}).submit(); 
    };
    
});
</script>

</body>
</html>
