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

                <h2 class="title"><span>1:1문의</span></h2>
					 
                <h3 class="title"><span>목록</span></h3>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
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
									<a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>작성자/ID</span></th>
	                            <td>
	                               	<input type="text" class="text serach-text" name="searchMemMstMemNm" id="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>"/> / 
									<input type="text" class="text serach-text" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
	                            </td>
	                            <th><span>키워드</span></th>
	                            <td>
	                            	<input type="text" class="text serach-text large" name="searchKeyword" id="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" placeholder="제목 또는 질문과 답변 내용에서 찾으시는 단어를 입력하세요."/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>문의유형</span></th>
	                            <td>
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
		                      	</td>
	                            <th><span>답변상태</span></th>
	                            <td>
	                            	<input type="radio" name="searchMemAdvRplYn" id="stateA" class="radio" value="" <c:if test="${empty commandMap.searchMemAdvRplYn }">checked="checked"</c:if>/>
									<label for="stateA">전체</label>
									<input type="radio" name="searchMemAdvRplYn" id="stateB" class="radio" value="N"<c:if test="${commandMap.searchMemAdvRplYn eq 'N'}">checked="checked"</c:if>/>
									<label for="stateB">미답변</label>
									<input type="radio" name="searchMemAdvRplYn" id="stateC" class="radio" value="Y" <c:if test="${commandMap.searchMemAdvRplYn eq 'Y'}">checked="checked"</c:if>/>
									<label for="stateC">답변완료</label>
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
	                <input type="hidden" name="MEM_ADV_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchMemAdvRegNm" value="<c:out value="${commandMap.searchMemAdvRegNm }"/>"/>
                    <input type="hidden" name="searchMemAdvRegId" value="<c:out value="${commandMap.searchMemAdvRegId }"/>"/>
                    <input type="hidden" name="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
                    <input type="hidden" name="searchMemMstMemTel" value="<c:out value="${commandMap.searchMemMstMemTel }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchMemAdvType" value="<c:out value="${commandMap.searchMemAdvType }"/>"/>
                    <input type="hidden" name="searchMemAdvRplYn" value="<c:out value="${commandMap.searchMemAdvRplYn }"/>"/>
                    <input type="hidden" name="searchMemAdvQstTypeUp" value="<c:out value="${commandMap.searchMemAdvQstTypeUp }"/>"/>
                    <input type="hidden" name="searchMemAdvQstType" value="<c:out value="${commandMap.searchMemAdvQstType }"/>"/>
	                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
                 			<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>		
						
	                    <!-- <div class="col-1-2 text-right">
	                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
	                    </div> -->
                	</div><!-- // 목록 상단 버튼 -->
			 	
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 5%;" />
                            <col style="width: 20%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
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
			                                <td><c:out value="${row.MEM_ADV_QST_TYPE_UP_NM }" /> > <c:out value="${row.MEM_ADV_QST_TYPE_NM }" /></td>
			                                <td class="left">
			                                    <a href="#none" class="ellipsis preview" data-mem_adv_idx="<c:out value="${row.MEM_ADV_IDX }" />" data-mem_adv_rpl_yn="<c:out value="${row.MEM_ADV_RPL_YN }"/>">
			                                        <c:if test="${row.MEM_ADV_CHN_GBN eq 'M'}">
        												<img alt="모바일작성" src="../img/image_phone.png"/>
    												</c:if>
			                                        <c:out value="${row.MEM_ADV_TITLE }" />
			                                    </a>
			                                    <%-- <div class="dropdown-menu dropdown-preview"><!-- preview -->
			                                        <c:out value="${row.BRD_INQ_CONTENTS }" />
			                                    </div><!-- // preview --> --%>
			                                </td>
			                                <td>
			                                	<c:out value="${row.MEM_ADV_REG_NM }" />(<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.MEM_ADV_REG_ID }" />');" title="새 창 으로 열립니다."><c:out value="${row.MEM_ADV_REG_ID }"/></a>)
			                                </td>
			                                <td><ui:formatDate value="${row.MEM_ADV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
<!-- 			                                <td> -->
<%-- 			                                   <span class="label label-<c:out value="${row.BRD_INQ_USE_YN eq 'Y'?'b':'a' }"/>"> --%>
<%-- 	                                                <c:out value="${row.BRD_INQ_USE_YN eq 'Y'?'사용':'미사용' }"/> --%>
<!-- 	                                            </span> -->
<!-- 			                                </td> -->
			                                <td>
			                                	<c:out value="${row.MEM_ADV_RPL_YN eq 'Y' ? '답변완료' : '미답변' }"/>
		                                	</td>
			                            </tr>
			                            <c:set var="listNum" value="${listNum-1}" />     
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr><td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td></tr>
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
    $(document).on("click", "#inqList .preview", function () {
    	var $frm = $("#frm");
        $frm.find("input[name='MEM_ADV_IDX']").val($(this).data("mem_adv_idx"));
//         if($(this).data("mem_adv_rpl_yn") == "Y")
//         {
            $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/inquiryEdit.do", "target":"_self", "method":"post"}).submit();
//         }
//         else
//         {
//             $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/inquiryForm.do", "target":"_self", "method":"post"}).submit();    
//         }
    
    });
 	// 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
    	var $frm = $("#frm");
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/inquiryForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", ".serach-text", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/board/inquiryList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/inquiryList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
    	goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };        
});
//-->
</script>

</body>
</html>
