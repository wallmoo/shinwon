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
            
            <h2 class="title"><span>상품평</span></h2>
              
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
                            <col style="width: auto;" />
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
                                    <input type="text" name="searchPrdMstCd" id="searchPrdMstCd" class="text" placeholder="상품코드 입력" value="<c:out value="${commandMap.searchPrdMstCd }"/>">
                                </td>
                                <th><span>상품명</span></th>
                                <td>
                                     <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text" placeholder="상품명 입력" value="<c:out value="${commandMap.searchPrdMstNm }"/>">
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
                            <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                            <span class="pages">
                                (총 <strong class="em">1</strong>건, 1 of 1 page)
                            </span>
                        </div>

                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
                    
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>상품코드</th>
                                <th>상품명</th>
                                <th>만족도 평가</th>
                                <th>상품평가</th>
                                <th>등록일</th>
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
                                                 <a href="javascript:goAdminProductView('${row.PRD_PRD_MST_CD }');"><c:out value="${row.PRD_PRD_MST_CD }"/></a>
                                            </td>
                                            <td class="left">
                                                 <a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?prdMstCd=${row.PRD_PRD_MST_CD}" target="_blank">
                                                    <c:out value="${row.PRD_MST_NM }"/>
                                                </a>
                                            </td>
                                            <td class="left">
                                                <c:if test="${row.PRD_REV_CHN_GBN eq 'M' }">
                                                    <img alt="모바일에서 작성" src="<c:out value="${serverDomain }"/>/am/img/image_phone.png"/>
                                                </c:if>
                                                <c:if test="${row.CMM_FLE_CNT > 0 }">
                                                    <img alt="이미지 포함" src="<c:out value="${serverDomain }"/>/am/img/image_photo.png"/>
                                                </c:if>
                                                <a href="javascript:goProductView('${row.PRD_PRD_MST_CD }', '${row.PRD_REV_IDX }')" class="list-title">
                                                    <c:out value="${row.PRD_REV_TITLE }"/>
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.PRD_REV_STAR }"/>
                                            </td>
                                            <td><ui:formatDate value="${row.PRD_REV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
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
                    <input type="hidden" name="searchPrdRevTitle" value="<c:out value="${commandMap.searchPrdRevTitle }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
                    <input type="hidden" name="PRD_REV_IDX" value=""/>  
                 
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

<form id="detailForm" name="detailForm">
	<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value=""/>
	<input type="hidden" id="prdRevIdx" name="prdRevIdx" value=""/>
</form>

<script>
//<![CDATA[
$(document).ready(function () 
{
    // 검색
    goSearch = function() 
    {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberReviewPopup.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberReviewPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 관리자 상품관리>상품상세 페이지 이동
    goAdminProductView = function (prdMstCd)
    {
    	var $detailForm = $("#detailForm");
		$detailForm.find("input[name='PRD_MST_CD']").val(prdMstCd);
		$detailForm.attr({"action" : "http://bo.localhost:8080/am/product/basicProductEdit.do", "target" : "_blank", "method" : "post"}).submit();
    };
    
	// 사용자 상품관리>상품상세 페이지 이동
    goProductView = function (prdMstCd, prdRevIdx)
    {
    	var $detailForm = $("#detailForm");
		$detailForm.find("input[name='PRD_MST_CD']").val(prdMstCd);
		$detailForm.find("input[name='prdRevIdx']").val(prdRevIdx);
		$detailForm.attr({"action" : "http://bo.localhost:8080/pc/product/productView.do", "target" : "_blank", "method" : "post"}).submit();
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
        //goSearchDelivery(url);
        popup(url, "550", "700", "yes", "deliveryView");
    };
    
   	// 상품후기 상세보기
    /* $(document).on("click", ".goReviewDetail", function () {
        var $frm = $("#frm");
    	var prd_rev_idx = $(this).data("prd_rev_idx");
    	$frm.find("input[name='PRD_REV_IDX']").val(prd_rev_idx);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberReviewDetailPopup.do", "target":"_self", "method":"post"}).submit();
    }); */
    
    
    
	$('#excelDown').on('click',function(){
		goDownload();
	});
	
	
	goDownload = function()
	{
		var $searchForm = $("#searchForm"); 
		//$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberReviewPopupExcelDown.do", "target":"_self", "method":"post"}).submit();
		
	};    
          
   
  
});      
//]]>

$(document).ready(function () {
    //Paging count select 박스 적용
    var vPageSize = '<c:out value="${commandMap.pageSize }"/>';
    if ( vPageSize != '' )
      $('#pageSize').val( vPageSize );
    
	    
});


</script>
</body>
</html>