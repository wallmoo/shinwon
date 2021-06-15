<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

    <div class="modal"><!-- modal -->
    
        <div class="modal-wrapper"><!-- modal-wrapper -->
        
            <div class="modal-inner"><!-- modal-inner -->
            
            <h2 class="title"><span>관심상품</span></h2>
              <c:out value="${list }"/>
                <c:choose>
                    <c:when test="${memberInfo.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
                        <%@ include file="/WEB-INF/jsp/am/member/infoCompMemberTabInc.jsp" %>           
                    </c:when>
                    <c:otherwise>
                        <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
                    </c:otherwise>
                </c:choose>
                
                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>
                <!-- // table -->
                
                <h3 class="title"><span>목록</span></h3>
            
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />        
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
                  
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>  
                                <th><span>등록일자</span></th>
                                <td colspan="3">   
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
                                <th><span>상품코드</span></th>
                                <td>
                                    <input type="text" name="searchPrdMstCd" id="searchPrdMstCd" class="text" value="<c:out value="${commandMap.searchPrdMstCd }"/>">
                                </td>
                                <th><span>상품명</span></th>
                                <td>
                                     <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text" value="<c:out value="${commandMap.searchPrdMstNm }"/>">
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
            
                </form>
                
                <p style="color:red;line-height:0;">! 장바구니는 7일간 보관됩니다.</p>
                
                <div class="grid section-button-search">
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm"> 
                
                    <div class="grid section-button-list">
                        <div class="col-1-1 text-right">
                            <span class="pages">
                            	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div> 
                    </div>
                    
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 20%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>상품코드</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>가격</th>
                                <th>등록일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                           <td>
                                                <c:out value="${listNum }"/>
                                           </td>
                                           <td>
                                                <c:out value="${row.PRD_MST_CD }"/>
                                            </td>
                                            <td>
                                                <a href="javascript:goPreview('<c:out value="${row.PRD_MST_CD }" />');"><c:out value="${row.PRD_MST_NM }"/></a>
                                                <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
                                                        옵션 :
                                                        <c:if test="${not empty row.optionList}">
                                                            <c:out value="${row.OPT_DTL_NM}" />
                                                            <c:if test="${not empty row.subPrdList}">
                                                                &nbsp;/&nbsp;
                                                            </c:if>
                                                        </c:if>
                                                        
                                                        <%-- 선택옵션 상품 리스트 --%>
                                                        <c:if test="${not empty row.subPrdList}">
                                                            <c:forEach var="subPrd" items="${row.subPrdList}" varStatus="i">
                                                                ${subPrd.OPT_DTL_NM}
                                                                ${i.last ? '' : '/&nbsp;'}  
                                                            </c:forEach>
                                                        </c:if>
                                                </c:if>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${row.MEM_CRT_CNT}" type="number"/>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${row.PRD_MST_PRC}" type="number"/>
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.MEM_CRT_REG_DT}" pattern="yyyy.MM.dd HH:mm"/>
                                            </td>
                                       </tr>
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>  
                                        <td colspan="6">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
                        
                    <div class="section-pagination"><!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                        </div>
                    </div><!-- // section pagination -->
                 
                </form>
                
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->
    
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

<script>
//<![CDATA[
$(function() {
    
    var $searchForm = $("#searchForm"); 
    var $frm = $("#frm");
    
    // 폼체크
    $searchForm.validate({
        rules: {
            searchStartDate:{required:{depends:function(){
                if($("#searchEndDate").val() != "") return true;
                else return false;
            }}}, // 등록일 시작
            searchEndDate:{required:{depends:function(){
                if($("#searchStartDate").val() != "") return true;
                else return false;
            }}} // 등록일 끝
        },
        messages: {
            searchStartDate : { required:"검색 시작일을 입력해주십시오." }, // 검색시작일
            searchEndDate : { required:"검색 종료일을 입력해주십시오." }    // 검색종료일
        }
    });
    
    // 회원 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e){
        if(e.keyCode == 13)  
        {
            goSearch();
        }
    });
    
    // 검색 버튼 클릭 이벤트
    goSearch = function() 
    {
    	if($searchForm.valid()){
            $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
            $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberCartPopup.do", "target":"_self", "method":"post"}).submit(); 
        }
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberCartPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 상품 상세페이지 이동 (프론트)
    goPreview = function (prdMstCd)
    {
        var openNewWindow = window.open("about:blank");
        
        openNewWindow.location.href ="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd="+prdMstCd;
    };
    
});
//]]>
</script>
</body>
</html>