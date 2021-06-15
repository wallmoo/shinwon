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
            
            <h2 class="title"><span>OOTD</span></h2>
              
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
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
                  
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto%;" />
                        </colgroup>
                        <tbody>
                            <tr>  
                                <th><span>등록일자</span></th>
                                <td colspan="7">   
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
                                <th><span>제목</span></th>
                                <td colspan="7"> 
                                     <input type="text" name="searchCntMstTitle" id="searchCntMstTitle" class="text" value="<c:out value="${commandMap.searchCntMstTitle }"/>">
                                </td>
                            </tr>
                            
                            <tr>  
                                <th><span>상태</span></th>
                                <td colspan="7"> 
                                    <input type="radio" id="stateA" name="searchCntMstUseYn" class="radio" <c:if test="${empty commandMap.searchCntMstUseYn }">checked="checked"</c:if> value=""/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" id="stateB" name="searchCntMstUseYn" class="radio" <c:if test="${commandMap.searchCntMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                    <label for="stateB">사용</label>
                                    <input type="radio" id="stateC" name="searchCntMstUseYn" class="radio" <c:if test="${commandMap.searchCntMstUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                    <label for="stateC">미사용</label>                                
                                </td>
                            </tr>                            
                        </tbody>
                    </table><!-- // table -->
            
                </form>
                
                <div class="grid section-button-search">
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm"> 
                
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages">
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>			
						                    
                        <!--  
                        <div class="col-1-2 text-left">
                            <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                            <span class="pages">
                                (총 <strong class="em">1</strong>건, 1 of 1 page)
                            </span>
                        </div>
                        -->

                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
                    
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 50%;" />
                            <col style="width: 10%" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <!-- 
                            <col style="width: auto;" />
                             -->
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>등록일</th>
                                <th>댓글수</th>
                                <th>상태</th>

                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td><c:out value="${row.RNUM}"/></td>
                                            <td style='text-align:left' >
                                                 <img src="${cdnDomain}${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="${row.CMN_FLE_ALT_TXT}" style="border:1px solid #ccc;width:50px;height:50px;">
                                                 
					                             <a href="javascript:;" class="list-title" data-ootd_idx="<c:out value="${row.CNT_MST_IDX }"/>">
													<c:out value="${row.CNT_MST_TITLE }" />
												 </a>                                                 
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.CNT_MST_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/>
                                            </td>

                                            <td>
                                                 <c:out value="${row.COMMENT_COUNT }"/>
                                            </td>
                                            
                                            <td>
                                                 <c:out value="${row.CNT_MST_USE_YN_NM }"/>
                                            </td>                                            
                                            
                                        </tr>
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>   
                            </c:choose>
                        </tbody>
                    </table>
                
                    <input type="hidden" name="CNT_MST_IDX" value="" />                
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchCntMstTitle" value="<c:out value="${commandMap.searchCntMstTitle }"/>"/>
                    <input type="hidden" name="searchCntMstUseYn" value="<c:out value="${commandMap.searchCntMstUseYn }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }" />" />
                
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
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

<script>
//<![CDATA[
$(document).ready(function () 
{
    // 검색
    goSearch = function() 
    {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberOOTDPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            goSearch();
        }
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () 
    {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberOOTDPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
        goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
        //goSearchDelivery(url);
        popup(url, "550", "700", "yes", "deliveryView");
    };
    
    $(document).on("change", "#searchMemPitGbn", function (){
        var code = $("#searchMemPitGbn").val();
        getSubCodeList(code);
    });
    
    fnEtrPopup = function( EVT_MST_IDX, MEM_MST_MEM_ID ){
         
        popup("<c:out value="${serverDomain}" />/am/member/infoMemberEventEtrPopup.do?MEM_MST_MEM_ID="+MEM_MST_MEM_ID+"&EVT_MST_IDX="+EVT_MST_IDX, "600", "600", "yes", "infoMemberEventEtrPopup");
    };
    fnWinPopup = function( EVT_MST_IDX, MEM_MST_MEM_ID ){
         
        popup("<c:out value="${serverDomain}" />/am/member/infoMemberEventWinPopup.do?MEM_MST_MEM_ID="+MEM_MST_MEM_ID+"&EVT_MST_IDX="+EVT_MST_IDX, "600", "600", "yes", "infoMemberEventWinPopup");
    };
    
    goEventViewPopup =  function ( serverDomain , evtIdx ) {
    	
    	popup(serverDomain+"/pc/event/eventView.do?EVT_MST_IDX=" + evtIdx, "1200", "700", "yes", "goEventViewPopup");    	

    };

	$('#excelDown').on('click',function(){
		goDownload();
	});
	
	
	goDownload = function()
	{
		var $searchForm = $("#searchForm"); 
		//$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberOOTDPopupExcelDown.do", "target":"_self", "method":"post"}).submit();
		
	};
	
	
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='CNT_MST_IDX']").val($(this).data("ootd_idx"));
        //$frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/ootdBoardEdit.do", "target":"_self", "method":"post"}).submit();
        popup("<c:out value="${serverDomain}" />/am/board/ootdBoardEdit.do?CNT_MST_IDX="+ $(this).data("ootd_idx"), "1200", "800", "yes", "ootdBoardEdit");
    });	
    
  
});      
//]]>
</script>
</body>
</html>