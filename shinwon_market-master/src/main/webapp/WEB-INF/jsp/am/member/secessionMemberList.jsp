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
  
                <h2 class="title"><span>탈퇴회원관리</span></h2>
                <h3 class="title"><span>검색</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="searchYn" value="Y" />                    
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchSecType" value="Y" />
                    
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
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
                                <th><span>탈퇴일</span></th>
                                <td colspan="5"> 
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchSecStartDate" id="searchSecStartDate" class="text date small" value="<c:out value="${commandMap.searchSecStartDate }"/>" readonly="readonly" data-target-end="#searchSecEndDate"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchSecEndDate" id="searchSecEndDate" class="text date small" value="<c:out value="${commandMap.searchSecEndDate }"/>" readonly="readonly" data-target-start="#searchSecStartDate"/>
                                    <a href="javascript:fnDateSet('searchSecEndDate', 'searchSecStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchSecEndDate', 'searchSecStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchSecEndDate', 'searchSecStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchSecEndDate', 'searchSecStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                           <tr>
								<th><span>가입일</span></th>
								<td colspan="5">
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="searchInfoStartDate" id="searchInfoStartDate" class="text date small" value="<c:out value="${commandMap.searchInfoStartDate }"/>" readonly="readonly" data-target-end="#searchInfoEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="searchInfoEndDate" id="searchInfoEndDate" class="text date small" value="<c:out value="${commandMap.searchInfoEndDate }"/>" readonly="readonly" data-target-start="#searchInfoStartDate"/>
									<a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
									<a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
								</td>
							</tr>
                            <tr>
                                <th><span>아이디</span></th>  
                                <td>  
                                    <input type="text" class="text" id="searchId" name="searchId" value="<c:out value="${commandMap.searchId }"/>" maxlength="15" placeholder="아이디입력"/>
                                </td>
                                <th><span>이름</span></th>
                                <td>
                                    <input type="text" class="text" id="searchNm" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>" maxlength="6" placeholder="이름입력"/>
                                </td>
                                <th><span>탈퇴사유</span></th>
                                <td>
                                    <select class="select" name="searchSecReason" id="searchSecReason">
                                    <option value="">전체</option>
                                    <c:if test="${not empty codes.MEMBER_SEC_REASON }">
                                        <c:forEach var="secReasonRow" items="${codes.MEMBER_SEC_REASON }">
                                            <c:if test="${secReasonRow.CMN_COM_IDX ne Code.SEC_REASON_AUTH }">
                                                <option value="<c:out value="${secReasonRow.CMN_COM_IDX }"/>" <c:if test="${secReasonRow.CMN_COM_IDX eq commandMap.searchSecReason}">selected="selected"</c:if>><c:out value="${secReasonRow.CMN_COM_NM }"/></option>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    </select>
                                </td>  
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->  
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
 
                <h3 class="title"><span>목록</span></h3>
  
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="searchSecStartDate" value="<c:out value="${commandMap.searchSecStartDate }"/>" />
                    <input type="hidden" name="searchSecEndDate" value="<c:out value="${commandMap.searchSecEndDate }"/>" />
                    <input type="hidden" name="searchId" value="<c:out value="${commandMap.searchId }"/>"/>
                    <input type="hidden" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>"/>
                    <input type="hidden" name="searchSecType" value="<c:out value="${commandMap.searchSecType }"/>" />
                    <input type="hidden" name="searchSecReason" value="<c:out value="${commandMap.searchSecReason }"/>" />
                
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="탈퇴회원 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                            <span class="pages">
                                (총 <strong class="em">1</strong>건, 1 of 1 page)
                            </span>
                        </div>

                        <div class="col-1-2 text-right">
                        
                            <button id="delRstMember" class="button small"><span>탈퇴후재가입</span></button>                        
                        
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->


                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                    <col style="width: 5%;" />
                        <col style="width: 5%;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <thead>
                        <tr>
                        	<th><input type="checkbox" name="checkAll" id="checkAll" class="checkbox checkAll" /></th>
                            <th>NO</th>
                            <th>아이디</th>
                            <th>회원이름</th>
                            <th>탈퇴일</th>
                            <th>가입일</th>
                            <th>탈퇴사유</th>
                        </tr>
                    </thead>
                    <tbody id="secessionList">
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:set var="listNum" value="${paging.listNum}" />
                            <c:forEach var="item" items="${list }" varStatus="status">
                            <tr>
                            	<td class="checkInp"><input type="checkbox" class="checkbox checkRow" value="<c:out value="${item.MEM_MST_MEM_ID }"/>"/></td>
                                <td><c:out value="${listNum }" /></td>
                                <td>
                                    <a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${item.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
                                        <c:out value="${item.MEM_MST_MEM_ID }"/>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${item.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
                                        <c:out value="${item.MEM_MST_MEM_NM}"/>
                                    </a>
                                </td>
                                <td><ui:formatDate value="${item.MEM_MST_LEV_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                <td><ui:formatDate value="${item.MEM_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                <td><c:out value="${item.MEM_MST_LEV_YN eq 'Y' ? item.MEM_MST_LEV_RSN_CD_NM : item.MEM_MST_OUT_RSN_NM }"/></td>
                            </tr>
                            <c:set var="listNum" value="${listNum-1}" />
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${commandMap.searchYn eq 'Y'}">
                                <tr>
                                    <td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                </tr>
                            </c:if>
                            <c:if test="${commandMap.searchYn ne 'Y'}">
                                <tr>
                                    <td class="td_no_result">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
                                </tr>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table><!-- // table -->
                </form>
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
$(function () {
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
        var $searchRequired = $.trim($("#searchId").val()) + $.trim($("#searchNm").val());
        
//         if( $searchRequired == ""){
//             alert("[아이디,이름] 중 한개 이상은 필수 입력해주세요.");
//             $("#searchId").focus();
//             return;
//         }
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/secessionMemberList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/secessionMemberList.do", "target":"_self", "method":"post"}).submit();
    };
    
    
	goDownload = function()
	{
		var $searchForm = $("#searchForm");
		//$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/secessionMemberExcelDownload.do", "target":"_self", "method":"post"}).submit();
	};


	$('#excelDown').on('click',function(){
		goDownload();
	});
    
  
	 $('#delRstMember').click(function(){
		 
		 
		 var $frm = $('#frm');
		 var num = 0 ;
		 var checkList = $frm.find('input[type=checkbox].checkRow');
		 for(var i=0;i<checkList.length;i++){
			 var dom = $(checkList[i]);
			 if(dom.is(":checked")){
				 num = num *1 +1 ;
			 }
		 }
		 
		 if ( num == 0 ){
			 alert( '회원정보를 삭제할 1개 이상의 아이디를 선택하세요' );
			 return ;
		 }		 
		 
		if (confirm("해당 회원정보를 삭제하시겠습니까?")) {
			
			 var $frm = $('#frm');
			 var num = 0 ;
			 var checkList = $frm.find('input[type=checkbox].checkRow');
			 for(var i=0;i<checkList.length;i++){
				 var dom = $(checkList[i]);
				 if(dom.is(":checked")){
					 $frm.append('<input type="hidden" name="targetMemberList" value="'+dom.val()+'">');
				 }
			 }

			 $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/secessionMemberDelete.do", "target":"_self", "method":"post"}).submit();				 

		}     		 
	 });
	 
    $('#checkAll').on('change', function(){
    	if($('input[name=checkAll]').is(':checked')){
    		$('#secessionList').find('.checkbox').prop('checked', true);
    	} else {
    		$('#secessionList').find('.checkbox').prop('checked', false);
    	}
    });	 
	    
    $('#secessionList .checkbox').on('change', function(){
    	if($('#secessionList .checkbox:checked').length == $('#secessionList .checkbox').length){
    		$('#checkAll').prop('checked', true);
    	} else {
    		$('#checkAll').prop('checked', false);
    	} 
    });	    
     
});

$(document).ready(function () {
    var vPageSize = '<c:out value="${commandMap.pageSize }"/>';
    if ( vPageSize != '' )
      $('#pageSize').val( vPageSize );

});

</script>

</body>
</html>
