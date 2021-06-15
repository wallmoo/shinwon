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

                <h2 class="title"><span>기획전관리</span></h2>
					 
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
	                            <th><span>기획전명</span></th>
	                            
	                            <td>
	                               <input type="text" name="searchPlnMstTitle" id="searchPlnMstTitle" class="text long" value="<c:out value="${commandMap.searchPlnMstTitle }"/>" />
	                            </td>
	                            <th><span>상태</span></th>
	                            <td>
	                              	<input type="radio" id="shoppingChannerA" name="searchPlnMstShopType" class="radio"	<c:if test="${empty commandMap.searchPlnMstShopType }">checked="checked"</c:if>	value="" /> 
									<label for="shoppingChannerA">전체 </label> 
									<input type="radio" id="shoppingChannerB" name="searchPlnMstShopType" class="radio"	<c:if test="${commandMap.searchPlnMstShopType eq 'PC' }">checked="checked"</c:if> value="PC" /> 
									<label for="shoppingChannerB">PC</label> 
									<input type="radio" id="shoppingChannerC" name="searchPlnMstShopType" class="radio" <c:if test="${commandMap.searchPlnMstShopType eq 'MOBILE' }">checked="checked"</c:if> value="MOBILE" /> 
									<label for="shoppingChannerC">MOBILE</label>
	                            </td>
	                            <th><span>전시여부</span></th>
	                            <td>
	                            	<input type="radio" id="stateA" name="searchPlnMstUseYn" class="radio" <c:if test="${empty commandMap.searchPlnMstUseYn }">checked="checked"</c:if> value="" /> 
									<label for="stateA">전체</label> 
									<input type="radio"	id="stateB" name="searchPlnMstUseYn" class="radio" <c:if test="${commandMap.searchPlnMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y" /> 
									<label for="stateB">전시</label> 
									<input type="radio" id="stateC" name="searchPlnMstUseYn" class="radio" <c:if test="${commandMap.searchPlnMstUseYn eq 'N' }">checked="checked"</c:if> value="N" /> 
									<label for="stateC">미전시</label>
	                            </td>
							</tr>
	                        <tr> 
	                            <th><span>형태</span></th>
	                            <td>
	                            	<select class="select" name="searchPlnMstType" id="searchPlnMstType">
	                            		<option value="">전체</option>
	                            		<option value="A" <ui:select v="${commandMap.searchPlnMstType}" t="A" g="selected"/>>일반</option>
	                            		<option value="M" <ui:select v="${commandMap.searchPlnMstType}" t="M" g="selected"/>>매거진</option>

	                            	</select>                            
	                            </td>
	                            <th><span>기간</span></th>
	                            <td colspan="3">
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="searchPlnMstStDt" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }" />"   readonly="readonly" data-target-end="#searchPlnMstEdDt"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchPlnMstEdDt" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }" />"  readonly="readonly" data-target-start="#searchPlnMstStDt"/>
									<a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
		                            
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm"> 
               		<input type="hidden" name="tagList" id="selectedTagList">
               		<input type="hidden" name="selectedPlanList" id="selectedPlanList">
	              	<input type="hidden" name="PLN_MST_IDX" value="" /> 
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" /> 
					<input type="hidden" name="searchPlnMstShopType" value="<c:out value="${commandMap.searchPlnMstShopType }"/>" /> 
					<input type="hidden" name="searchPlnMstTitle" value="<c:out value="${commandMap.searchPlnMstTitle }"/>" /> 
					<input type="hidden" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>" /> 
					<input type="hidden" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>" /> 
					<input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>" /> 
					<input type="hidden" name="searchPlnMstUseYn" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>" />
	                <input type="hidden" name="searchPlnMstType" value="<c:out value="${commandMap.searchPlnMstType }"/>" />
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
							<col style="width: 6%;" />
							<col style="width: 8%;" />
							<col style="width: auto;" />
							<col style="width: 20%;" />
							<col style="width: 8%;" />
							<col style="width: 10%;" />
							<col style="width: 15%;" />
							<col style="width: 8%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>코드</th>
								<th>채널</th>
								<th>기획전명</th>
								<th>기획전기간</th>
								<th>기획 상품수</th>
								<th>조회수</th>
								<th>등록일</th>
								<th>전시여부</th>
							</tr>
						</thead>
						<tbody id="PLN_MST_LIST">
							<c:choose>
								<c:when test="${not empty list }">
									<c:set var="listNum" value="${paging.listNum}" />
									<c:forEach var="row" items="${list }" varStatus="i">
										<tr>
											<td><c:out value="${listNum }" /></td>
											<td><c:out value="${row.PLN_MST_IDX }" /></td>
											<td>
												<c:out value="${row.PLN_MST_TYPE eq 'A' ? '일반' : '매거진' }"/>												
											</td>
											<td class="left">
												<a href="#none" class="list-title"	data-pln_mst_idx="${row.PLN_MST_IDX }"> 
													<c:out value="${row.PLN_MST_TITLE }" />
												</a>
											</td>
											<td>
												<ui:formatDate value="${row.PLN_MST_ST_DT }" pattern="yyyy.MM.dd" /> ~ 
												<ui:formatDate value="${row.PLN_MST_ED_DT }" pattern="yyyy.MM.dd" />
											</td>
											<td>${row.PLN_DTL_CNT}</td>
											<td><fmt:formatNumber value="${row.PLN_DTL_CNT}" groupingUsed="true" /></td>
											<td><ui:formatDate value="${row.PLN_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" /></td>
											<td>
												<select>
													<option value="Y" <c:if test="${row.PLN_MST_USE_YN eq 'Y'}">selected</c:if>>전시</option>
													<option value="N" <c:if test="${row.PLN_MST_USE_YN eq 'N'}">selected</c:if>>미전시</option>
												</select>
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
					
					<div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
	                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
	                </div><!-- // section button --> 
						
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
<jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/>
<script>
$(function(){
	$(document).on("click",	"#goRegist",function() {
		
		var selectedTagIdList = new Array();
    	var data =  new Array();
    	$('#PLN_MST_LIST').children().each(function() {
    		var obj = new Object();
    		obj["PLN_MST_IDX"] = $(this).children()[1].textContent;
    		obj["PLN_MST_USE_YN"] = $(this).find("select :selected").val()
    		data.push(obj);
    	});
    	$("#selectedPlanList").val(JSON.stringify(data))
		
		$("#frm").attr({
					"action" : "<c:out value="${serverDomain}" />/am/marketing/planListModify.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
	
	$(document).on("click",	"#goForm",function() {
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/marketing/planForm.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
		// 제목 a Tag 클릭 이벤트
	$(document).on(	"click",".list-title",function() {
		var $frm = $("#frm");
		$frm.find("input[name='PLN_MST_IDX']").val($(this).data("pln_mst_idx"));
		$frm.attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/marketing/planEdit.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
	});
	// 검색 엔터 이벤트 
	$(document).on("keydown", "#searchPlnMstTitle",	function(e) {
		if (e.keyCode == 13) {
			$("#search").trigger("click");
			return false;
		}
	});

	// 검색 버튼 클릭 이벤트
	$(document).on("click","#search",function() {
		var $searchForm = $("#searchForm");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/planList.do",	"target" : "_self",	"method" : "post"}).submit();
	});
	
	// 페이지 사이즈 변경 이벤트
	$(document).on("change", "select[name='pageSize']",function() {
		goPage(1);
	});

	// 페이지 이동
	goPage = function(cPage) {
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({	"action" : "<c:out value="${serverDomain}" />/am/marketing/planList.do", "target" : "_self", "method" : "post" }).submit();
	};
	
	$(document).on("click",".first",function() {
		goPage()
	});
	$(document).on("click",".prev",function() {
	});
	$(document).on("click",".next",function() {
	});
	$(document).on("click",".last",function() {
	});
	
});
//-->
</script>

</body>
</html>
