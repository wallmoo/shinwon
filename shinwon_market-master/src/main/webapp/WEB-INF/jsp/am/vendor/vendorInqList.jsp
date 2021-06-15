<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
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

                <h2 class="title"><span>입점사문의</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">  
                            <col style="width:23%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>등록일</span></th>
                                <td colspan="5"> 
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchStartDate" id="searchStartDate" class="text small" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchEndDate" id="searchEndDate" class="text small" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>입점사명</span></th>  
                                <td>  
                                    <input type="text" class="text xlarge" name="searchVdrMstNm" id="searchVdrMstNm" placeholder="검색어 입력" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
                                </td>
                                <th><span>ID/작성자</span></th>
                                <td>
                                    <input type="text" class="text small" name="searchScmInqRegId" id="searchScmInqRegId" placeholder="ID 입력" value="<c:out value="${commandMap.searchScmInqRegId }"/>"/>
                                    / <input type="text" class="text small" name="searchScmInqRegNm" id="searchScmInqRegNm" placeholder="작성자 입력" value="<c:out value="${commandMap.searchScmInqRegNm }"/>"/>
                                </td>
                                <th><span>문의유형</span></th>
                                <td>
                                    <select class="select" name="searchScmCmnComIdx" id="searchScmCmnComIdx">
                                        <option value="">전체</option>
                                        <c:if test="${not empty inqTypeCodeList }">
                                            <c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
                                                <option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }"/>" <c:if test="${inqTypeCodeRow.CMN_COM_IDX eq commandMap.searchScmCmnComIdx }">selected="selected"</c:if>>
                                                    <c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>답변상태</span></th>  
                                <td>  
                                    <input type="radio" name="searchScmInqReplyCd" id="stateA" class="radio" value="" <c:if test="${empty commandMap.searchScmInqReplyCd }">checked="checked"</c:if>/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" name="searchScmInqReplyCd" id="stateB" class="radio" value="N"<c:if test="${commandMap.searchScmInqReplyCd eq 'N'}">checked="checked"</c:if>/>
                                    <label for="stateB">미답변</label>
                                    <input type="radio" name="searchScmInqReplyCd" id="stateC" class="radio" value="Y" <c:if test="${commandMap.searchScmInqReplyCd eq 'Y'}">checked="checked"</c:if>/>
                                    <label for="stateC">답변완료</label>
                                </td>
                                <th><span>제목/내용</span></th>
                                <td colspan="3">
                                    <input type="text" class="text xlarge" name="searchKeyword" id="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" placeholder="제목 또는 내용 입력"/>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->  
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:;" id="search" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
 
                <form id="frm" name="frm">
                    <input type="hidden" name="SCM_INQ_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchScmCmnComIdx" value="<c:out value="${commandMap.searchScmCmnComIdx }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchScmInqReplyCd" value="<c:out value="${commandMap.searchScmInqReplyCd }"/>"/>                    
                    <input type="hidden" name="searchScmInqRegId" value="<c:out value="${commandMap.searchScmInqRegId }"/>"/>
                    <input type="hidden" name="searchScmInqRegNm" value="<c:out value="${commandMap.searchScmInqRegNm }"/>"/>
                
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">  
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">
                            	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                        <div class="col-1-2 text-right">
	                        <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
	                        	<a href="#" class="button small primary" id="goForm"><span>등록</span></a>
	                        </c:if>
                        </div>
                     </div><!-- // 목록 상단 버튼 -->
                </form>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>입점사</th>
                            <th>문의유형</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>답변상태</th>
                        </tr>
                    </thead>
                    <tbody id="inqList">
                        <c:choose>
                            <c:when test="${not empty list }">
                                <c:set var="listNum" value="${paging.listNum}" />
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
                                        <td><c:out value="${listNum }"/></td>
                                        <td>
                                            <a href="javascript:goViewVendor('<c:out value="${row.SCM_VDR_MST_IDX }"/>');" class="list-title">
                                                <c:out value="${row.VDR_MST_NM }" />
                                            </a>
                                        </td>
                                        <td><c:out value="${row.CMN_COM_NM }" /></td>
                                        <td class="left">
                                            <a href="#none" class="ellipsis preview" data-scm_inq_idx="<c:out value="${row.SCM_INQ_IDX }" />" data-scm_inq_reply_cd="<c:out value="${row.SCM_INQ_REPLY_CD }"/>">
                                                <c:out value="${row.SCM_INQ_TITLE }" />
                                            </a>                                                    
                                        </td>
                                        <td>
                                            <c:out value="${row.SCM_INQ_REG_ID }" />(<c:out value="${row.SCM_INQ_REG_NM }" />)
                                        </td>
                                        <td><ui:formatDate value="${row.SCM_INQ_REG_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td>    
                                        	<c:out value="${row.SCM_INQ_REPLY_CD eq 'Y' ? '답변완료':'답변미완료' }"/>
                                    </tr>  
                                    <c:set var="listNum" value="${listNum-1}" />     
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td></tr>
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
        
    var $frm = $("#frm");
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", "#inqList .preview", function () {
        $frm.find("input[name='SCM_INQ_IDX']").val($(this).data("scm_inq_idx"));
        if($(this).data("scm_inq_reply_cd") == "Y")
        {
            $frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorInqEdit.do", "target":"_self", "method":"post"}).submit();
        }
        else
        {
            $frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorInqForm.do", "target":"_self", "method":"post"}).submit();    
        }
    });
    
	$(document).on("click",	"#goForm",function() {
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/vendor/vendorInqForm.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", ".search-text", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 입점업체 상세정보 팝업창 호출
    goViewVendor = function (vdrMstIdx) {
        popup("<c:out value="${serverDomain}" />/am/site/vendorManagerPopup.do?VDR_MST_IDX=" + vdrMstIdx, "1200", "700", "yes", "goVendorManagerPopup");
    };
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorInqList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorInqList.do", "target":"_self", "method":"post"}).submit();
    };
    
});
</script>

</body>
</html>
