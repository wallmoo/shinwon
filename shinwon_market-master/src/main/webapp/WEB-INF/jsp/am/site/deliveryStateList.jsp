<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

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
        
	        	<h2 class="title"><span>배송/교환/반품정보 관리</span></h2>
				<div class="section-title">
					<h3 class="title"><span>검색</span></h3>
				</div>
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 90%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>입점사 검색</span></th>
								<td><input type="text" class="text xlarge" name="searchVdrMstNm" value="${commandMap.searchVdrMstNm }"></td>
							</tr>
							<tr>
								<th><span>사용여부</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" id="stateA" name="searchDLVStateUseYN" class="radio" <c:if test="${empty commandMap.searchDLVStateUseYN }">checked="checked"</c:if> value=""/>
											<label for="stateA">전체</label>
										</li>
										<li>
											<input type="radio" id="stateB" name="searchDLVStateUseYN" class="radio" <c:if test="${commandMap.searchDLVStateUseYN eq 'Y' }">checked="checked"</c:if> value="Y"/>
											<label for="stateB">사용</label>
										</li>
										<li>
											<input type="radio" id="stateC" name="searchDLVStateUseYN" class="radio" <c:if test="${commandMap.searchDLVStateUseYN eq 'N' }">checked="checked"</c:if> value="N"/>
											<label for="stateC">미사용</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="grid section-button-search">
					<a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
					<a href="#" id="search" class="button small primary"><span>검색</span></a>
				</div>
				
				<form id="frm" name="frm">
					<input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
					<input type="hidden" name="DLV_INF_IDX"  value="" />
					
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages"> 
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>
					</div>
				</form>
				<table class="table-col table-b">
					<colgroup>
						<col style="width:70px;">
						<col style="width:auto;">
						<col style="width:250px;">
						<col style="width:150px;">
						<col style="width:100px;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>입점사명</th>
							<th>등록일자</th>
							<th>사용여부</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
                       		<c:when test="${not empty list }">
                       			<c:set var="listNum" value="${paging.listNum}" />
                            	<c:forEach var="row" items="${list }" varStatus="i">
                            		<tr>
                            			<td><c:out value="${listNum }"/></td>
                            			<td class="al">
                            				<a href="javascript:goEdit('<c:out value="${row.DLV_INF_IDX }"/>');">
                            					<c:out value="${row.VDR_MST_NM }"/>
                           					</a>
                       					</td>
										<td><ui:formatDate value="${row.DLV_INF_REG_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td><c:out value="${row.DLV_INF_USE_YN  eq 'Y' ? '사용':'미사용'}"/></td>
                            		</tr>
                            		<c:set var="listNum" value="${listNum-1}" />
                            	</c:forEach>
                       		</c:when>
                   		</c:choose>

					</tbody>
				</table>
				<div class="section-pagination">
					<h4 class="sr-only">목록 페이징</h4>
					<div class="wrap">
						<ui:paging paging="${paging }" jsFunction="goPage" />
					</div>
				</div>
			</div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>
<script>
$(function () {
	
 	// 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/deliveryStateList.do", "target":"_self", "method":"post"}).submit(); 
    });
 	
 	// 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/deliveryStateList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 입점사명 클릭 시 수정 페이지 이동
    goEdit = function (idx)
    {
    	var $frm = $("#frm");
    	$frm.find("input[name='DLV_INF_IDX']").val(idx);
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/deliveryStateEdit.do", "target":"_self", "method":"post"}).submit();
    };
 
})
</script>

</body>
</html>
