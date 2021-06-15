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
            
            <h2 class="title"><span>1:1고객문의</span></h2>
              
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
                                <th><span>구분</span></th>
                                <td colspan="5">
                                    <select class="select" name="searchMemAdvQstTypeUp" id="searchMemAdvQstTypeUp">
                                        <option value="">전체</option>
                                        <c:if test="${not empty inqTypeCodeList }">
                                            <c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
                                                <option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }"/>" <c:if test="${inqTypeCodeRow.CMN_COM_IDX eq commandMap.searchMemAdvQstTypeUp }">selected="selected"</c:if>>
                                                    <c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <select class="select" name="searchMemAdvQstType" id="searchMemAdvQstType">
                                        <option value="">전체</option>
                                    </select>                       
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
                                <th><span>제목</span></th>
                                <td>
                                    <input type="text" name="searchMemAdvTitle" id="searchMemAdvTitle" class="text" value="<c:out value="${commandMap.searchMemAdvTitle }"/>">
                                </td>
                            </tr>
                            <tr>
                                <th><span>답변상태</span></th>
                                <td colspan="5">
                                    <input type="radio" name="searchMemAdvRplYn" id="stateA" class="radio" value="" <c:if test="${empty commandMap.searchMemAdvRplYn }">checked="checked"</c:if>/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" name="searchMemAdvRplYn" id="stateB" class="radio" value="N"<c:if test="${commandMap.searchMemAdvRplYn eq 'N'}">checked="checked"</c:if>/>
                                    <label for="stateB">답변미완료</label>
                                    <input type="radio" name="searchMemAdvRplYn" id="stateC" class="radio" value="Y" <c:if test="${commandMap.searchMemAdvRplYn eq 'Y'}">checked="checked"</c:if>/>
                                    <label for="stateC">답변완료</label>
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
                
                    <!--  
                    <div class="grid section-button-list">
                        <div class="col-1-1 text-right">
                            <span class="pages">(총 <strong><c:out value="${paging.totalRecordCount }" /></strong>건, / <em><c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /></em> page)</span>
                        </div> 
                    </div>
                    -->
                    
                    
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages">
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>			
	
                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->                    
                    
                    
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>구분</th>
                                <th>문의유형</th>
                                <th>제목</th>
                                <th>등록일</th>
                                <th>답변상태</th>
                                <th>답변일</th>
                                <th>답변자명</th>
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td><c:out value="${listNum }"/></td>
                                            <td><c:out value="${row.MEM_ADV_TYPE_NM }" /></td>
                                            <td><c:out value="${row.MEM_ADV_QST_TYPE_UP_NM }" /> > <c:out value="${row.MEM_ADV_QST_TYPE_NM }" /></td>
                                            <td class="left">
                                                <a href="#none" class="ellipsis preview" data-mem_adv_idx="<c:out value="${row.MEM_ADV_IDX }" />" data-mem_adv_rpl_yn="<c:out value="${row.MEM_ADV_RPL_YN }"/>">
                                                    <c:if test="${row.MEM_ADV_CHN_GBN eq 'M'}">
                                                        <img alt="모바일작성" src="../img/image_phone.png"/>
                                                    </c:if>
                                                    <c:out value="${row.MEM_ADV_TITLE }" />
                                                </a>
                                            </td>
                                            <td><ui:formatDate value="${row.MEM_ADV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                            <td><c:out value="${row.MEM_ADV_RPL_YN eq 'Y'?'답변완료':'미답변' }"/></td>
                                            <td><ui:formatDate value="${row.MEM_ADV_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                            <td>
                                                <c:if test="${row.MEM_ADV_RPL_YN eq 'Y'}">
                                                    <c:out value="${row.MEM_ADV_UPD_NM }" />(<c:out value="${row.MEM_ADV_UPD_ID }" />)
                                                </c:if>
                                            </td>
                                        </tr>
                                        <c:set var="listNum" value="${listNum-1}" />     
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr><td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td></tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchMemAdvQstTypeUp" value="<c:out value="${commandMap.searchMemAdvQstTypeUp }"/>"/>
                    <input type="hidden" name="searchMemAdvQstType" value="<c:out value="${commandMap.searchMemAdvQstType }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchMemAdvTitle" value="<c:out value="${commandMap.searchMemAdvTitle }"/>"/>
                    <input type="hidden" name="searchMemAdvRplYn" value="<c:out value="${commandMap.searchMemAdvRplYn }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
                    <input type="hidden" name="MEM_ADV_IDX" value=""/>     
                        
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
    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
        	goSearch();
        }
    });
    
    // 검색
    goSearch = function() 
    {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberInqPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
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
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberInqPopup.do", "target":"_self", "method":"post"}).submit();
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
    
    
    $(document).on("click", ".preview", function () {
        var $frm = $("#frm");
        $frm.find("input[name='MEM_ADV_IDX']").val($(this).data("mem_adv_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberInqDetailPopup.do", "target":"_self", "method":"post"}).submit();
    });
    
    $(document).on("change", "#searchMemAdvQstTypeUp", function (){
        var code = $("#searchMemAdvQstTypeUp").val();
        getSubCodeList(code);
    });
    
    getSubCodeList = function(code)
    {
        var $frm = $("#frm");
       
        var searchMemAdvQstType =  $frm.find("input[name='searchMemAdvQstType']").val()
        
        $.ajax({
            type    : "POST",
            url : "<c:out value="${serverDomain}" />/am/common/getSubCodeAjax.do",
            data    :  { "code":code},
            dataType : "JSON",
            async   : false,
            success : function(data)
            {
                var selected = "";
                $("#searchMemAdvQstType").empty().append("<option value=''>전체</option>");
                $.each(data.list, function(i,item) 
                {  
                    
                    if(searchMemAdvQstType != item.CMN_COM_IDX)
                    {
                        $("#searchMemAdvQstType").append("<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>");
                    }
                    else
                    {
                        $("#searchMemAdvQstType").append("<option value='"+item.CMN_COM_IDX+"' selected = 'selected'>"+item.CMN_COM_NM+"</option>");
                        
                    }
                });

            },
            error   : function(xhr,status,error)
            { 
                alert("코드 호출 중 에러가 발생하였습니다.");
                //alert("code:"+xhr.status); 
            }
        });
    };
    
    getSubCodeList($("#searchMemAdvQstTypeUp").val());
    
	$('#excelDown').on('click',function(){
		goDownload();
	});
	
	
	goDownload = function()
	{
		var $searchForm = $("#searchForm"); 
		//$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberInqPopupExcelDown.do", "target":"_self", "method":"post"}).submit();
		
	};    
  
});      
//]]>
</script>
</body>
</html>