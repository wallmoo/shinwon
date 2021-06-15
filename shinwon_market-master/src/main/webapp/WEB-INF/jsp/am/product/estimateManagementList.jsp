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

                <h2 class="title"><span>견적관리</span></h2>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>목록</span></h3>
                </div><!-- // section-title -->
				
				<form id="searchForm" name="searchForm">
	                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                <input type="hidden" name="searchYn" value="Y" />
                
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                        	<th><span>등록일</span></th>
	                        	<td colspan=3>
	                        		<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                       			<input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
	                       			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                                <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
	                                <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                        	</td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>구분</span></th>
	                            <td colspan=3>
	                                <c:choose>
    									<c:when test="${not empty codeList}">
    									<c:set var="listNum" value="1" />
    										<input type="radio" class="radio" id="searchEsmMstType_1" name="searchEsmMstType" value="" checked=true /> <label for="searchEsmMstType_1" > 전체</label>
    	    	                            <c:forEach var="brand" items="${codeList}" varStatus="status">
    											<input type="radio" class="radio" id="searchEsmMstType_${brand.CMN_COM_IDX}" name="searchEsmMstType" value="${brand.CMN_COM_IDX}" <c:if test="${commandMap.searchEsmMstType eq brand.CMN_COM_IDX}"> checked=true</c:if> /><label for="searchEsmMstType_${brand.CMN_COM_IDX}" > ${brand.CMN_COM_NM}</label>
    										<c:set var="listNum" value="${listNum + 1}" />
    	                        		    </c:forEach>
                           	    		</c:when>
                           	    	</c:choose>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>신청자명</span></th>
	                            <td>
	                                <input type="text" class="text small" name="searchEsmMstMemNm" id="searchEsmMstMemNm" value="<c:out value="${commandMap.searchEsmMstMemNm }"/>"/>
	                            </td>
	                            <th><span>ID</span></th>
	                        	<td>
	                        		<input type="text" class="text small" name="searchEsmMstMemId" id="searchEsmMstMemId" value="<c:out value="${commandMap.searchEsmMstMemId }"/>"/>
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<th><span>휴대폰</span></th>
	                        	<td>
	                        		<c:choose>
										<c:when test="${not empty hpList}">
											<select name="searchEsmMstHp1" id="searchEsmMstHp1" class="select">
											<option value="">선택</option>
		    	                            <c:forEach var="hpList" items="${hpList}" varStatus="status">
												<option value="${hpList.CMN_COM_IDX}"> <c:out value="${hpList.CMN_COM_NM}" /></option>
		                        		    </c:forEach>
		                        		    </select>
	                       	    		</c:when>
	                       	    	</c:choose>
		                            <input type="text" class="text short" name="searchEsmMstHp2" id="searchEsmMstHp2" value="<c:out value="${commandMap.searchEsmMstHp2 }"/>" maxlength="4"/>
		                            <input type="text" class="text short" name="searchEsmMstHp3" id="searchEsmMstHp3" value="<c:out value="${commandMap.searchEsmMstHp3 }"/>" maxlength="4"/>
	                        	</td>
	                        	<th><span>사용여부</span></th>
	                            <td>
	                                <input type="radio" id="searchUseYn0" name="searchUseYn" class="radio" <c:if test="${empty commandMap.searchUseYn }">checked="checked"</c:if> value=""/>
                                    <label for="searchUseYn0">전체</label>
                                    <input type="radio" class="radio" name="searchUseYn" id="searchUseYn1" value="Y" <c:if test="${commandMap.searchUseYn eq 'Y'}"> checked=true</c:if> />
                                    <label for="searchUseYn1">사용</label>
                                    <input type="radio" class="radio" name="searchUseYn" id="searchUseYn2" value="N" <c:if test="${commandMap.searchUseYn eq 'N'}"> checked=true</c:if> />
                                    <label for="searchUseYn2">미사용</label>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	            </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:search();" class="button small primary"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
				
				<form id="frm" name="frm">
                	<input type="hidden" name="ESM_MST_IDX"       value=""/>
	                <input type="hidden" name="cPage"             value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="searchEsmMstType" value="<c:out value="${commandMap.searchEsmMstType }"/>"/>
	                <input type="hidden" name="searchEsmMstMemNm" value="<c:out value="${commandMap.searchEsmMstMemNm }"/>"/>
	                <input type="hidden" name="searchEsmMstMemId" value="<c:out value="${commandMap.searchEsmMstMemId }"/>"/>
	                <input type="hidden" name="searchEsmMstHp1" value="<c:out value="${commandMap.searchEsmMstHp1 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp2" value="<c:out value="${commandMap.searchEsmMstHp2 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp3" value="<c:out value="${commandMap.searchEsmMstHp3 }"/>"/>
	                <input type="hidden" name="searchUseYn" value="<c:out value="${commandMap.searchUseYn }"/>"/>
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>"/>
                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                    <div class="col-1-2 text-left">
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
	                    </div>
	                    <div class="col-1-2 text-right">
	                    	<a href="javascript:goForm();" class="button small primary"><span>MD견적등록</span></a>
	                    </div>
	                </div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th><span>번호</span></th>
                            <th><span>구분</span></th>
                            <th><span>견적번호</span></th>
                            <th><span>신청자명</span></th>
                            <th><span>상담방법</span></th>
                            <th><span>등록일</span></th>
                            <th><span>MD견적</span></th>
                            <th><span>구매결정</span></th>
                            <th><span>구매승인</span></th>
                            <th><span>사용여부</span></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
							<c:when test="${not empty list }">
								<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="row" items="${list }" varStatus="i">
     								<tr>
										<td><c:out value="${listNum }"/></td>
										<td><c:out value="${row.ESM_MST_TYPE_NM }"/></td>
										<td>
											<a href="#none" class="list-title" data-brd_gds_idx="<c:out value="${row.ESM_MST_IDX }"/>">
												<c:out value="${row.ESM_MST_CD }"/>
												<c:if test="${row.ESM_REP_CNT > 0 }">
													&nbsp;&nbsp;<em class="strong">new</em>
												</c:if>
											</a>
										</td>
										<td>
											<c:out value="${row.ESM_MST_MEM_NM }"/>
											<c:if test="${row.ESM_MST_MEM_ID ne '' && row.ESM_MST_MEM_ID ne null }">
											(<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.ESM_MST_MEM_ID }" />');" title="새 창 으로 열립니다."><c:out value="${row.ESM_MST_MEM_ID }"/></a>)
											</c:if>
										</td>
										<td>
    										<c:out value="${row.ESM_MST_ADV_TYPE_NM }" />
										</td>
										<td><ui:formatDate value="${row.ESM_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
										<td><c:out value="${row.MEM_MD_CNT > 0 ?'Y':'N' }"/></td>
										<td><c:out value="${row.MEM_USE_BUY_CNT > 0 ?'Y':'N' }"/></td>
										<td><c:out value="${row.MEM_MD_BUY_CNT > 0 ?'Y':'N' }"/></td>
										<td>
											<span>
												<c:out value="${row.ESM_MST_USE_YN eq 'Y'?'사용':'미사용' }"/>
                 							</span>
   										</td>
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
	
	// 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
	
	fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='ESM_MST_IDX']").val($(this).data("brd_gds_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 사은품명 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchGftMstName", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    search = function(){
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementList.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 상품 등록페이지 이동
    goForm = function ()
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/estimateManagementForm.do", "target":"_self", "method":"post"}).submit();
        
    };
});
//-->
</script>

</body>
</html>
