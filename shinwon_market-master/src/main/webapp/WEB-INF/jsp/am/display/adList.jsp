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

                <h2 class="title"><span>광고관리</span></h2>
					 
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
	                            <th><span>전시채널</span></th>
	                            
	                            <td>
	                               <input type="radio" id="searchAdMstViewEnv1" name="searchAdMstViewEnv" class="checkbox channelType" value="" <c:if test="${empty commandMap.searchAdMstViewEnv }">checked="checked"</c:if> />
									<label for="searchAdMstViewEnv1">전체</label>
									<input type="radio" id="searchAdMstViewEnv2" name="searchAdMstViewEnv" class="checkbox channelType" value="${Code.USER_ENV_TYPE_PC }" <c:if test="${commandMap.searchAdMstViewEnv eq Code.USER_ENV_TYPE_PC}">checked="checked"</c:if> />
									<label for="searchAdMstViewEnv2">PC</label>
									<input type="radio" id="searchAdMstViewEnv3" name="searchAdMstViewEnv" class="checkbox channelType" value="${Code.USER_ENV_TYPE_MOBILE }" <c:if test="${commandMap.searchAdMstViewEnv eq Code.USER_ENV_TYPE_MOBILE}">checked="checked"</c:if> />
									<label for="searchAdMstViewEnv3">MOBILE</label>
	                            </td>
	                            <th><span>제목</span></th>
	                            <td>
	                                <input type="text" class="text" style="width: 80%;" id="searchAdMstTitle" name="searchAdMstTitle" value="<c:out value="${commandMap.searchAdMstTitle }"/>" />
	                            </td>
	                            <th><span>사용상태</span></th>
	                            <td>
	                                <input type="radio" id="searchAdMstDplYn1" class="radio" name="searchAdMstDplYn" value="" <ui:select v="${commandMap.searchAdMstDplYn }" t="" g="checked"/> />
									<label for="searchAdMstDplYn1">전체</label>
									<input type="radio" id="searchAdMstDplYn2" class="radio" name="searchAdMstDplYn" value="Y" <ui:select v="${commandMap.searchAdMstDplYn }" t="Y" g="checked"/> />
									<label for="searchAdMstDplYn2">전시</label>
									<input type="radio" id="searchAdMstDplYn3" class="radio" name="searchAdMstDplYn" value="N" <ui:select v="${commandMap.searchAdMstDplYn }" t="N" g="checked"/> />
									<label for="searchAdMstDplYn3">미전시</label>
	                            </td>
	                            </tr>
	                            <tr>
	                            <th><span>노출기간</span></th>
	                            <td colspan="5">
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
	                    </tbody>
	                </table><!-- // table -->
                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                    <a href="javascript:search();" class="button small primary"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm"> 
               		<input type="hidden" name="searchAdMstViewEnv" value="<c:out value="${commandMap.searchAdMstViewEnv }"/>"/>
	                <input type="hidden" name="searchAdMstTitle" value="<c:out value="${commandMap.searchAdMstTitle }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchAdMstDplYn" value="<c:out value="${commandMap.searchAdMstDplYn }"/>"/>
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" id="AD_MST_IDX" name="AD_MST_IDX" value="" />
	                <input type="hidden" name="AD_MST_VIEW_ENV" value="" />
	                
	                <input type="hidden" name="searchPopMstTopYn" value="<c:out value="${commandMap.searchPopMstTopYn }"/>"/>
	                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>		
						
	                    <div class="col-1-2 text-right">
	                        <a href="javascript:goFormPc();" class="button small primary"><span>PC등록</span></a>
	                        <a href="javascript:goFormMobile();" class="button small primary"><span>MOBILE등록</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->
			 	
                <table cellspacing="0" class="table-col table-b"><!-- table -->
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: auto;" />
						<col style="width: 10%;" />
						<col style="width: 5%;" />
						<col style="width: 5%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>광고영역</th>
							<th>전시채널</th>
							<th>제목</th>
							<th>노출기간</th>
							<th>CPC</th>
							<th>CPM</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
					
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><c:out value="${listNum }" /></td>
									<td><c:out value="${item.AD_MST_WCH_NM }" /></td>
									<td><c:if test="${item.AD_MST_VIEW_ENV eq Code.USER_ENV_TYPE_PC}" >PC</c:if>
										<c:if test="${item.AD_MST_VIEW_ENV eq Code.USER_ENV_TYPE_MOBILE}" >MOBILE</c:if>
									</td>
									<td class="left"><a href="javascript:goView('${item.AD_MST_VIEW_ENV }', '<c:out value="${item.AD_MST_IDX }" />');"><c:out value="${item.AD_MST_TITLE }" /></a></td>
									<td><ui:formatDate value="${item.AD_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${item.AD_MST_ED_DT }" pattern="yyyy.MM.dd"/></td>
									<td><c:out value="${item.AD_MST_CPC }" /></td>
									<td><c:out value="${item.AD_MST_CPM }" /></td>
									<td>
										<c:out value="${item.AD_MST_DPL_YN eq 'Y' ? '전시' : '미전시' }"/>
									</td>
									<td><ui:formatDate value="${item.AD_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
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
	$('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
	
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm");
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/adList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/adList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 검색어관리 상세페이지 이동
    goView = function ( env, popMstIdx)
    {
        var $frm = $("#frm");
        $frm.find("#AD_MST_IDX").val(popMstIdx);
        
        if( env == "P"){
        	$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/adEditPc.do", "target":"_self", "method":"post"}).submit();
        }else {
        	$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/adEditMobile.do", "target":"_self", "method":"post"}).submit();
        }
    };

    // 검색어관리 등록페이지 이동
    goFormPc = function ()
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/adFormPc.do", "target":"_self", "method":"post"}).submit();
    };

    // 검색어관리 등록페이지 이동
    goFormMobile = function ()
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/adFormMobile.do", "target":"_self", "method":"post"}).submit();
    };
	
});
//-->
</script>

</body>
</html>
