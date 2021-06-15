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

                <h2 class="title"><span>휴면회원관리</span></h2>

                <h3 class="title"><span>검색</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="searchYn" value="Y" />                    
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 24%;" />
                            <col style="width: 10%;" />
                            <col style="width: 23%;" />
                            <col style="width: 10%;" />
                            <col style="width: 23%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <tr>
                                    <th class="5"><span>가입일</span></th>
                                    <td colspan="5">
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" class="text date small" id="searchInfoStartDate" name="searchInfoStartDate" value="<c:out value="${commandMap.searchInfoStartDate }" />" readonly="readonly" data-target-end="#searchInfoEndDate"> ~
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" class="text date small" id="searchInfoEndDate" name="searchInfoEndDate" value="<c:out value="${commandMap.searchInfoEndDate }" />" readonly="readonly" data-target-start="#searchInfoStartDate">
                                        <a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                        <a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                        <a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                        <a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="5"><span>휴면처리일</span></th>
                                    <td colspan="5">
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" class="text date small" id="searchRestStartDate" name="searchRestStartDate" value="<c:out value="${commandMap.searchRestStartDate }" />" readonly="readonly" data-target-end="#searchRestEndDate"> ~
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" class="text date small" id="searchRestEndDate" name="searchRestEndDate" value="<c:out value="${commandMap.searchRestEndDate }" />" readonly="readonly" data-target-start="#searchRestStartDate">
                                        <a href="javascript:fnDateSet('searchRestEndDate', 'searchRestStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                        <a href="javascript:fnDateSet('searchRestEndDate', 'searchRestStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                        <a href="javascript:fnDateSet('searchRestEndDate', 'searchRestStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                        <a href="javascript:fnDateSet('searchRestEndDate', 'searchRestStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>회원분류/회원등급</span></th>
                                    <td>
										<select name="searchMemberType" id="searchMemberType" class="select">
											<option value="">전체</option>
											<c:if test="${not empty codes.COMMON_MEMBER_TYPE }">
												<c:forEach var="memberTypeRow" items="${codes.COMMON_MEMBER_TYPE }">
													<option value="<c:out value="${memberTypeRow.CMN_COM_IDX }"/>" <c:if test="${memberTypeRow.CMN_COM_IDX eq commandMap.searchMemberType}">selected="selected"</c:if>><c:out value="${memberTypeRow.CMN_COM_NM }"/></option>
												</c:forEach>
											</c:if>
										</select>
										<select class="select" name="searchMemGrade" id="searchMemGrade">
											<option value="">전체</option>
										</select>
                                    </td>
                                    <th><span>아이디</span></th>
                                    <td>
                                        <input type="text" class="text" name="searchId" id="searchId" value="<c:out value="${commandMap.searchId }"/>" placeholder="아이디입력">
                                    </td>
                                    <th><span>이름</span></th>
                                    <td>
                                        <input type="text" class="text" name="searchNm" id="searchNm" value="<c:out value="${commandMap.searchNm }"/>" placeholder="이름입력">
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>휴대폰(뒤자리)</span></th>
                                    <td>
                                        <input type="text" class="text" name="searchTel" id="searchTel" value="<c:out value="${commandMap.searchTel }"/>" placeholder="4자리 입력">
                                    </td>
                                    <th><span>생년월일</span></th>
                                    <td colspan="3">
                                        <input type="text" class="text onlyNumber" name="searchBirth" id="searchBirth" value="<c:out value="${commandMap.searchBirth }"/>" maxlength="8" placeholder="YYYYMMDD(8자리)">
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>특정권한</span></th>
                                    <td colspan="5">
                                
                                    
										<ul class="form_radio_check_list">
										
											<li>
												<input type="checkbox" class="check" name="search3626" id="search3626" value="3626" />
												<label for="search3626">리뷰어회원</label>
											</li>
											<li>
												<input type="checkbox" class="check" name="search3627" id="search3627" value="3627" />
												<label for="search3627">특정리뷰회원</label>
											</li>
											<li>
												<input type="checkbox" class="check" name="search3628" id="search3628"  value="3628" />
												<label for="search3628">특정OOTD회원</label>
											</li>    
																				
										    <!--  
											<c:if test="${not empty previlege.MEMBER_PREVILEGE }">
												<c:forEach var="item" items="${previlege.MEMBER_PREVILEGE }">
													<li>
														<input type="checkbox" name="searchPrevilege" id="searchPrevilege" class="check" value="${item.CMN_COM_IDX }" />
														<label><c:out value="${item.CMN_COM_NM}" /></label>
													</li>
												</c:forEach>
											</c:if>
											-->
										</ul>
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
                    <input type="hidden" name="searchId" value="<c:out value="${commandMap.searchId }"/>"/>
                    <input type="hidden" name="searchMemberType" value="<c:out value="${commandMap.searchMemberType }"/>"/>
                    <input type="hidden" name="searchMemGrade" value="<c:out value="${commandMap.searchMemGrade }"/>"/>
                    <input type="hidden" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>"/>
                    <input type="hidden" name="searchTel" value="<c:out value="${commandMap.searchTel }"/>"/>
                    <input type="hidden" name="searchBirth" value="<c:out value="${commandMap.searchBirth }"/>"/>
                    <input type="hidden" name="searchPrevilege" value="<c:out value="${commandMap.searchPrevilege }"/>"/>
                    <input type="hidden" name="searchRestStartDate" value="<c:out value="${commandMap.searchRestStartDate }"/>"/>
                    <input type="hidden" name="searchRestEndDate" value="<c:out value="${commandMap.searchRestEndDate }"/>"/>
					<input type="hidden" name="search3626" value="<c:out value="${commandMap.search3626 }"/>"/>
					<input type="hidden" name="search3627" value="<c:out value="${commandMap.search3627 }"/>"/>
					<input type="hidden" name="search3628" value="<c:out value="${commandMap.search3628 }"/>"/>                    

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
                </form>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>아이디</th>
                            <th>회원이름</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>회원분류/회원등급</th>
                            <th>통합포인트</th>
                            <th>E포인트</th>
                            <th>가입일</th>
                            <th>휴면 처리일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:set var="listNum" value="${paging.listNum}" />
                            <c:forEach var="item" items="${list }" varStatus="status">
                            <tr>
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
                                <td><c:out value="${item.MEM_MST_SEX eq 'M' ? '남자' : item.MEM_MST_SEX eq 'F' ? '여자' : '' }"/></td>
                                <td><ui:formatDate value="${item.MEM_MST_BIR_DT }" pattern="yyyy.MM.dd"/></td>
                                <td>
                                     <c:out value="${item.MEM_MST_MEM_GBN_NM}"/>/<c:out value="${item.MEM_MST_MEM_GRD}"/>
                                     <c:out value="${item.MEM_MST_MEM_GRD ne '' ? '(휴)' : ''     }"/>
                                </td>
                                <td><c:out value="${item.MEM_TOT_POINT }"/>p</td>
                                <!--  <td><c:out value="${item.ERP_PIT }"/>p</td> -->
                                <td><c:out value="${item.MEM_PIT_TOT_PIT}"/>p</td>
                                <td><c:out value="${item.MEM_REG_DT }"/></td>
                                <td><ui:formatDate value="${item.MEM_MST_RST_DT }" pattern="yyyy.MM.dd"/></td>
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
        /*
        var $searchRequired = $.trim($("#searchId").val()) + $.trim($("#searchNm").val()) + $.trim($("#searchTel").val()) + $.trim($("#searchEmail").val());
        if( $searchRequired == ""){
            alert("[아이디,이름,휴대폰(뒷자리),이메일] 중 한개 이상은 필수 입력해주세요.");
            $("#searchId").focus();
            return;
        }
        */
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/restMemberList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/restMemberList.do", "target":"_self", "method":"post"}).submit();
    };
    
	goDownload = function()
	{
		var $searchForm = $("#searchForm");
		//$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/restMemberExcelDownload.do", "target":"_self", "method":"post"}).submit();
	};


	$('#excelDown').on('click',function(){
		goDownload();
	});
	    
    
    
 // 회원구분 셀렉트박스 선택 이벤트 > 회원등급셀렉트박스 변경
	$(document).on("change","#searchMemberType",function(){
		getMemGradeList($(this).val(), "searchMemGrade");
	});

	// 회원등급 셀렉트박스 변경 이벤트
	getMemGradeList = function(memberType, targetSelectId){
		$.ajax({
			type:"post",
			url : "<c:out value="${serverDomain}" />/am/member/getMemGradeListAjax.do",
			data : {"MEM_MST_MEM_GBN": memberType},
			dataType : "json",
			async : false,
			success : function(data){
				var selectedIdx = "${commandMap.searchMemGrade}";
				$("#"+targetSelectId).html("<option value=\"\">전체</option>");
				if(data.memGradeList.length > 0){
					$.each(data.memGradeList, function(idx, item){
						var selected = item.CMN_COM_IDX == selectedIdx ? "selected" : ""; //기존 선택된 회원구분이 있는 경우 selected
						$("#"+targetSelectId).append("<option value=\""+ item.CMN_COM_IDX +"\" "+ selected +">"+ item.CMN_COM_NM +"</option>");
					});
				}
			},
			error : function(err){
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});
	};

	// 검색버튼 클릭시 > 회원구분 값으로 해당 회원등급셀렉트박스 변경 이벤트
	if("${commandMap.searchMemberType}" != ""){
		getMemGradeList("${commandMap.searchMemberType}", "searchMemGrade");
	}
});

$(document).ready(function () {
    //Paging count select 박스 적용
    var vPageSize = '<c:out value="${commandMap.pageSize }"/>';
    if ( vPageSize != '' )
      $('#pageSize').val( vPageSize );
    
    if ( "<c:out value="${commandMap.search3626 }"/>" == '3626'  )
    	$('#search3626').attr( 'checked', 'checked');
    	//$('#search3626').is(':checked')

    if ( "<c:out value="${commandMap.search3627 }"/>" == '3627'  )
    	$('#search3627').attr( 'checked', 'checked');
    
    if ( "<c:out value="${commandMap.search3628 }"/>" == '3628'  )
    	$('#search3628').attr( 'checked', 'checked');    
    
});

</script>

</body>
</html>
