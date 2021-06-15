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

                <h2 class="title"><span>카드행사관리</span></h2>
					 
                <h3 class="title"><span>목록</span></h3>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>기간검색</span></th>
	                            <td colspan="5">
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />"   readonly="readonly" data-target-end="#searchEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />"  readonly="readonly" data-target-start="#searchStartDate"/>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>종류</span></th>
	                            <td>
                               		<select class="select" name="searchCrdPmtGbn" id="searchCrdPmtGbn">
                                		<option value="">선택</option>
                                		<c:if test="${not empty cardEventCodeList }">
		 	                    			<c:forEach var="gbRow" items="${cardEventCodeList }" varStatus="i">
		 	                    				<option value="<c:out value="${gbRow.CMN_COM_IDX }"/>" <c:if test="${commandMap.searchCrdPmtGbn eq gbRow.CMN_COM_IDX}">selected="selected"</c:if>>
		 	                    					<c:out value="${gbRow.CMN_COM_NM }"/>
		 	                    				</option>	      
			                            	</c:forEach>
		                            	</c:if>
                               	 	</select>
	                            </td>
	                            <th><span>프로모션명</span></th>
	                            <td>
									<input type="text" name="searchCrdPmtNm" id="searchCrdPmtNm" class="text large" value="<c:out value="${commandMap.searchCrdPmtNm }"/>" />    
		                      	</td>
	                            <th><span>상태</span></th>
	                            <td>
	                            	<input type="radio" id="stateA" name="searchCrdPmtUseYn" class="radio" <c:if test="${empty commandMap.searchCrdPmtUseYn }">checked="checked"</c:if> value=""/>
	                                <label for="stateA">전체</label>
	                                <input type="radio" id="stateB" name="searchCrdPmtUseYn" class="radio" <c:if test="${commandMap.searchCrdPmtUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                                <label for="stateB">사용</label>
	                                <input type="radio" id="stateC" name="searchCrdPmtUseYn" class="radio" <c:if test="${commandMap.searchCrdPmtUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
	                                <label for="stateC">중지</label>
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
	                <input type="hidden" name="CRD_PMT_IDX" value="" />
                    <input type="hidden" name="COPY_YN" value="N" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchCrdPmtGbn" value="<c:out value="${commandMap.searchCrdPmtGbn }"/>"/>
                    <input type="hidden" name="searchCrdPmtNm" value="<c:out value="${commandMap.searchCrdPmtNm }"/>"/>
                    <input type="hidden" name="searchCrdPmtUseYn" value="<c:out value="${commandMap.searchCrdPmtUseYn }"/>"/>
	                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>		
						
	                    <div class="col-1-2 text-right">
	                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->
			 	
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 5%;" />
	                        <col style="width: 7%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 24%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 14%;" />
	                        <col style="width: 15%;" />
	                        <col style="width: 8%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
	                          	<th>종류</th>
	                          	<th>프로모션명</th>
	                          	<th>기간</th>
	                         	<th>상태</th>
	                          	<th>등록자</th>
	                          	<th>등록일시</th>
	                          	<th>복사</th>
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
												 <c:out value="${row.CRD_PMT_GBN_NM }"/>
											</td>
											<td class="left">
												<a href="#none" class="list-title" data-crd_pmt_idx="${row.CRD_PMT_IDX }" data-crd_pmt_gbn="${row.CRD_PMT_GBN }">
													<c:out value="${row.CRD_PMT_NM }"/>
												</a>
											</td>
											<td>
												<ui:formatDate value="${row.CRD_PMT_ST_DT }" pattern="yyyy.MM.dd"/>&nbsp;<c:out value="${row.CRD_PMT_ST_HH }"/>:<c:out value="${row.CRD_PMT_ST_MM }"/> ~ <ui:formatDate value="${row.CRD_PMT_ED_DT }" pattern="yyyy.MM.dd"/>&nbsp;<c:out value="${row.CRD_PMT_ED_HH }"/>:<c:out value="${row.CRD_PMT_ED_MM }"/>
											</td>
											<td>
												<c:out value="${row.CRD_PMT_USE_YN eq 'Y' ? '사용' : '중지' }"/>
											</td>
											<td>
												 <c:out value="${row.CRD_PMT_REG_NM }"/>(<c:out value="${row.CRD_PMT_REG_ID }"/>)
											</td>
											<td><ui:formatDate value="${row.CRD_PMT_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
											<td>
												 <a href="#none" id="goCopy" class="button button-b" data-crd_pmt_idx="${row.CRD_PMT_IDX }" data-crd_pmt_gbn="${row.CRD_PMT_GBN }"><span>복사</span></a>
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
	// 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='CRD_PMT_IDX']").val($(this).data("crd_pmt_idx"));
        var gbn = $(this).data("crd_pmt_gbn");
        
        if(gbn=="2031")
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventEdit.do", "target":"_self", "method":"post"}).submit();
       	}
        if(gbn=="2032")
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventDcEdit.do", "target":"_self", "method":"post"}).submit();
       	}
        if(gbn=="2033")
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventSaveEdit.do", "target":"_self", "method":"post"}).submit();
       	}
        if(gbn=="2034")
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventCashEdit.do", "target":"_self", "method":"post"}).submit();
       	}
        
    });
    
 // 복사 이벤트
    $(document).on("click", "#goCopy", function () {
    	
        var $frm = $("#frm");
        $frm.find("input[name='CRD_PMT_IDX']").val($(this).data("crd_pmt_idx"));
        $frm.find("input[name='COPY_YN']").val("Y");
        var gbn = $(this).data("crd_pmt_gbn");
        
        if(gbn=="2031")
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventEdit.do", "target":"_self", "method":"post"}).submit();
       	}
        if(gbn=="2032")
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventDcEdit.do", "target":"_self", "method":"post"}).submit();
       	}
        if(gbn=="2033")
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventSaveEdit.do", "target":"_self", "method":"post"}).submit();
       	}
        if(gbn=="2034")
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventCashEdit.do", "target":"_self", "method":"post"}).submit();
       	}
        
    });
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#searchCrdPmtNm", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventList.do", "target":"_self", "method":"post"}).submit();
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventList.do", "target":"_self", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
