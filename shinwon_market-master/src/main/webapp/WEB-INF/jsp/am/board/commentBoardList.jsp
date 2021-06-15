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

                <h2 class="title"><span>상품후기</span></h2>
                     
                <h3 class="title"><span>목록</span></h3>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <c:if test="${not empty commandMap.searchVdrMstIdx }"><%-- 입점업체 관리자일 경우 --%>
                        <input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    </c:if>
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr><!-- row -->
                                <th><span>등록일</span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />"   readonly="readonly" data-target-end="#searchEndDate"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />"  readonly="readonly" data-target-start="#searchStartDate"/>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>상품코드</span></th>
                                <td>
                                	<textarea name="searchPrdMstCd" id="searchPrdMstCd" class="textarea h_28px" value="<c:out value="${commandMap.searchPrdMstCd }"/>">
										<c:out value="${commandMap.searchPrdMstCd }"/>
                                	</textarea>
                               	</td>
                                <th><span>상품명</span></th>
                                <td><input type="text" class="text xlarge" name="searchPrdMstNm" id="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/></td>
                            </tr>
                            <tr>
                                <th><span>작성자/ID</span></th>
                                <td colspan="3">
                                    <input type="text" class="text serach-text" name="searchPrdRevRegNm" id="searchPrdRevRegNm" value="<c:out value="${commandMap.searchPrdRevRegNm }"/>"/>
                                    /
                                    <input type="text" class="text serach-text" name="searchPrdRevRegId" id="searchPrdRevRegId" value="<c:out value="${commandMap.searchPrdRevRegId }"/>"/>   
                                </td>
                            </tr>
                            <tr>
                            	<th><span>상태</span></th>
                                <td>
                                   <input type="radio" id="stateA" name="searchPrdRevUseYn" class="radio" <c:if test="${empty commandMap.searchPrdRevUseYn }">checked="checked"</c:if> value=""/>
                                   <label for="stateA">전체</label>
                                   <input type="radio" id="stateB" name="searchPrdRevUseYn" class="radio" <c:if test="${commandMap.searchPrdRevUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                   <label for="stateB">사용</label>
                                   <input type="radio" id="stateC" name="searchPrdRevUseYn" class="radio" <c:if test="${commandMap.searchPrdRevUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                   <label for="stateC">미사용</label>
                                </td>
                                <th><span>내용</span></th>
                                <td colspan="3">
                                    <input type="text" class="text xlarge" name="searchPrdRevContents" id="searchPrdRevContents" value="<c:out value="${commandMap.searchPrdRevContents }"/>"/>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm"> 
                    <input type="hidden" name="PRD_REV_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdRevRegNm" value="<c:out value="${commandMap.searchPrdRevRegNm }"/>"/>
                    <input type="hidden" name="searchPrdRevRegId" value="<c:out value="${commandMap.searchPrdRevRegId }"/>"/>
                    <input type="hidden" name="searchPrdRevContents" value="<c:out value="${commandMap.searchPrdRevContents }"/>"/>
                    <input type="hidden" name="searchPrdRevUseYn" value="<c:out value="${commandMap.searchPrdRevUseYn }"/>"/>
                    <input type="hidden" name="searchPrdRevBstYn" value="<c:out value="${commandMap.searchPrdRevBstYn }"/>"/>
                    <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">
                                (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>      
                        
                        <div class="col-1-2 text-right">
                            <a href="#none;" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
                
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 3%;" />
                            <col style="width: 10%;" />
                            <col style="width: 5%;" />
                            <col style="width: 8%;" />
                            <col style="width: auto;" />
                            <col style="width: 3%;" />   
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 7%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>상품코드</th>
                                <th>이미지</th>
                                <th>상품명</th>
                                <th>상품후기</th>
                                <th>평점</th>
                                <th>작성자</th>
                                <th>등록일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td><c:out value="${listNum }"/></td>
                                            <td>
                                                <a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.PRD_PRD_MST_CD }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
                                                    <c:out value="${row.PRD_PRD_MST_CD }"/>
                                                </a>
                                            </td>
                                            <td><span class="thumbnail_img"><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${row.PRD_IMAGE }"></span></td>
                                            <td>
                                                <%-- <a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${row.PRD_PRD_MST_CD}&ADMIN=Y" target="_blank"> --%>
                                                <a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.PRD_PRD_MST_CD }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
                                                    <c:out value="${row.PRD_MST_NM }"/>
                                                </a>
                                            </td>
                                            <td class="left">
                                                <a href="javascript:;" class="list-title" data-prd_rev_idx="<c:out value="${row.PRD_REV_IDX }"/>">
                                                    <c:choose>
                                                        <c:when test="${fn:length(row.PRD_REV_CONTENTS) > 15}">
                                                            <c:out value="${fn:substring(row.PRD_REV_CONTENTS, 1, 10) }" />...
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${row.PRD_REV_CONTENTS}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.PRD_REV_STAR }"/>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty commandMap.searchVdrMstIdx }"><%-- 입점업체 관리자일 경우 --%>
                                                        <c:out value="${row.PRD_REV_REG_ID }"/>(<c:out value="${row.MEM_MST_MEM_NM }"/>)
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="javascript:goView('<c:out value="${row.PRD_REV_REG_ID }" />');">
                                                            <c:out value="${row.PRD_REV_REG_ID }"/>(<c:out value="${row.MEM_MST_MEM_NM }"/>)
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><ui:formatDate value="${row.PRD_REV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                            <td>
                                                <c:out value="${row.PRD_REV_USE_YN eq 'Y' ? '사용' : '미사용' }"/>
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
                        
                    <div class="section-pagination"><!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                        </div>
                    </div><!-- // section pagination -->
                </form>     
                
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
<script>
$(function(){
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='PRD_REV_IDX']").val($(this).data("prd_rev_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/commentBoardEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/board/commentBoardList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/commentBoardList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
        goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    }; 
    
 // 엑셀 다운로드
	$(document).on("click","#excelDown", function() {
		if ("${paging.totalRecordCount}" > 10000) {
			alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
			return;
		} else if ("${paging.totalRecordCount}" == 0) {
			alert("저장할 내역이 없습니다.");
			return;
		}
		var $frm = $("#searchForm");
		$frm.attr({
					"action" : "<c:out value="${serverDomain}" />/am/board/commentBoardListExcelDownload.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
});
//-->
</script>

</body>
</html>
