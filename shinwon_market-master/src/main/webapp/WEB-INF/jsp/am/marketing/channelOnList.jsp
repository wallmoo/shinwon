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

            <h2 class="title"><span>채널 ON</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
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
                            <th><span>등록일</span></th>
                            <td colspan="5">
								<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" name="searchCntMstStDt" id="searchCntMstStDt" class="text" value="<c:out value="${commandMap.searchCntMstStDt }"/>" readonly="readonly" data-target-end="#searchCntMstEdDt"/> ~
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" name="searchCntMstEdDt" id="searchCntMstEdDt" class="text" value="<c:out value="${commandMap.searchCntMstEdDt }"/>" readonly="readonly" data-target-start="#searchCntMstStDt"/>
                                <a href="javascript:fnDateSet('searchCntMstEdDt', 'searchCntMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                <a href="javascript:fnDateSet('searchCntMstEdDt', 'searchCntMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('searchCntMstEdDt', 'searchCntMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('searchCntMstEdDt', 'searchCntMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                
                            </td>
                        </tr>
                        <tr>
                            <th><span>키워드</span></th>
                            <td>
                              <input type="text" name="searchCntMstTitle" id="searchCntMstTitle" class="text large" value="<c:out value="${commandMap.searchCntMstTitle }"/>"/>
                            </td>
                            <th><span>채널</span></th>
                            <td>
	                              	<input type="radio" id="shoppingChannerA" name="searchCntMstShopType" class="radio"	<c:if test="${empty commandMap.searchCntMstShopType }">checked="checked"</c:if>	value="" /> 
									<label for="shoppingChannerA">전체 </label> 
									<input type="radio" id="shoppingChannerB" name="searchCntMstShopType" class="radio"	<c:if test="${commandMap.searchCntMstShopType eq 'PC' }">checked="checked"</c:if> value="PC" /> 
									<label for="shoppingChannerB">PC</label> 
									<input type="radio" id="shoppingChannerC" name="searchCntMstShopType" class="radio" <c:if test="${commandMap.searchCntMstShopType eq 'MOBILE' }">checked="checked"</c:if> value="MOBILE" /> 
									<label for="shoppingChannerC">MOBILE</label>
	                            </td>
                            <th><span>전시상태</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchCntMstUseYn" class="radio" <c:if test="${empty commandMap.searchCntMstUseYn }">checked="checked"</c:if> value=""/>
                                <label for="stateA">전체</label>
                                <input type="radio" id="stateB" name="searchCntMstUseYn" class="radio" <c:if test="${commandMap.searchCntMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="searchCntMstUseYn" class="radio" <c:if test="${commandMap.searchCntMstUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                        <tr>
                            <th><span>유형</span></th>
                            <td>
								<select class="select" name="searchPRD_CTG_IDX" id="searchPRD_CTG_IDX">
	                              <option value="">선택</option>
	                              <c:if test="${not empty listMenuCategory }">
									<c:forEach var="row" items="${listMenuCategory }" varStatus="i">
									<option value="<c:out value="${row.PRD_CTG_IDX }"/>" <c:if test="${row.PRD_CTG_IDX eq commandMap.searchPRD_CTG_IDX }">selected="selected"</c:if>>
										<c:out value="${row.PRD_CTG_NM }"/>
									</option>
									</c:forEach>
	                              </c:if>
								</select>
                            </td>
                            <th><span>시즌</span></th>
                            <td colspan="3">
                            	<select class="select" name="searchSeason" id="searchSeason">
                            		<option value="">선택</option>
                                    <c:if test="${not empty seasonList }">
                                        <c:forEach var="row" items="${seasonList }" varStatus="i" >
                                            <option value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.searchSeason }">selected="selected"</c:if>>
                                                <c:out value="${row.CMN_COM_NM }"/>
                                            </option>
                                        </c:forEach>
                                    </c:if>
	                          	</select>
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
              	<input type="hidden" name="CNT_MST_IDX" value="" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                <input type="hidden" name="searchCntMstShopType" value="<c:out value="${commandMap.searchCntMstShopType }"/>" />
                <input type="hidden" name="searchCntMstTitle" value="<c:out value="${commandMap.searchCntMstTitle }"/>" />
                <input type="hidden" name="searchCntMstStDt" value="<c:out value="${commandMap.searchCntMstStDt }"/>" />
                <input type="hidden" name="searchCntMstEdDt" value="<c:out value="${commandMap.searchCntMstEdDt }"/>" />
                <input type="hidden" name="searchCntMstStatus" value="<c:out value="${commandMap.searchCntMstStatus }"/>" />
                <input type="hidden" name="searchCntMstUseYn" value="<c:out value="${commandMap.searchCntMstUseYn }"/>" />
				<input type="hidden" name="searchPRD_CTG_IDX" value="<c:out value="${commandMap.searchPRD_CTG_IDX }"/>" />
				<input type="hidden" name="searchSeason" value="<c:out value="${commandMap.searchSeason }"/>" />

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
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />
                        <col style="width: auto;" />
                        <col style="width: 5%;" />
                        <col style="width: 15%;" />
                        <col style="width: 20%;" />
                        <col style="width: 5%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>채널</th>
                            <th>유형</th>
                            <th>영상제목</th>
                            <th>상품수</th>
                            <th>등록일</th>
                            <th>전시기간</th>
                            <th>전시여부</th>
                        </tr>
                    </thead>
                    <tbody id="channelOnList">
                    	<c:choose>
							<c:when test="${not empty list }">
								<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="row" items="${list }" varStatus="i">
									<tr>
										<td><c:out value="${listNum }"/></td>
										<td>
											<c:choose>
												<c:when test="${row.CNT_MST_CHANNEL_PC_YN eq'Y' && row.CNT_MST_CHANNEL_MOBILE_YN eq'Y' }">
												전체
												</c:when>
												<c:when test="${row.CNT_MST_CHANNEL_PC_YN eq 'Y'}">
												PC
												</c:when>
												<c:otherwise>
												MOBILE
												</c:otherwise>
											</c:choose> 
										</td>
										<td><c:out value="${row.CTG_TYPE }"/></td>
										<td class="left">
											<a href="#none" class="list-title"	data-cnt_mst_idx="${row.CNT_MST_IDX }"> 
												<c:out value="${row.CNT_MST_TITLE }" />
											</a>
										</td>
										<td>${row.CNT_DTL_CNT }</td>
										<td><ui:formatDate value="${row.CNT_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
										<td>
											<ui:formatDate value="${row.CNT_MST_ST_DT }" pattern="yyyy.MM.dd" /> ~ 
											<ui:formatDate value="${row.CNT_MST_ED_DT }" pattern="yyyy.MM.dd" />
										</td>
										<td>
											<select>
												<option <c:if test="${row.CNT_MST_USE_YN eq 'Y'}"> selected data-cnt_mst_use_yn="Y" </c:if>>전시</option>
												<option <c:if test="${row.CNT_MST_USE_YN eq 'N'}"> selected data-cnt_mst_use_yn="N" </c:if>>미전시</option>
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
<script>
$(function(){
	$(document).on("click",	"#goForm",function() {
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/marketing/channelOnForm.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
	
	$(document).on(	"click",".list-title",function() {
		var $frm = $("#frm");
		$frm.find("input[name='CNT_MST_IDX']").val($(this).data("cnt_mst_idx"));
		$frm.attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/marketing/channelOnEdit.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
	});

	// 검색 버튼 클릭 이벤트
	$(document).on("click","#search",function() {
		var stDt = $("#searchCntMstStDt").val().replace(/\-/g, "");
		var edDt = $("#searchCntMstEdDt").val().replace(/\-/g, "");
		if(stDt > edDt){
			alert("등록종료일자가 등록시작일자이후 여야 합니다.");
			return;	
		};

		var $searchForm = $("#searchForm");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/channelOnList.do",	"target" : "_self",	"method" : "post"}).submit();
	});
	
	// 페이지 사이즈 변경 이벤트
	$(document).on("change", "select[name='pageSize']",function() {
		goPage(1);
	});

	// 페이지 이동
	goPage = function(cPage) {
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/marketing/channelOnList.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
	};
	
	
    // 저장 버튼 클릭 이벤트
    $("#goRegist").on("click", function(){
        
    	var channelOnList = new Array();
		
    	$("#channelOnList").find("tr").each(function(i){
    		var obj = new Object();
			var $tr = $(this).find(".list-title");
			obj.CNT_MST_IDX = $tr.data("cnt_mst_idx");
			obj.CNT_MST_USE_YN = $(this).find("select :selected").val() == "전시" ? 'Y' : 'N';
			channelOnList.push(obj);
		});
    	
    	var jsonData = JSON.stringify(channelOnList);

        $.ajax ({
           async : false,
           type : "POST",
           url : "<c:out value="${serverDomain}" />/am/marketing/channelOnListStatusChangeAjax.do",
           data : {"jsonData":jsonData},
           dataType : "json",
           success : function (data) {
               alert(data.message);
           },
           error : function () {
               alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
           }
        });
        
    });
});
//-->
</script>

</body>
</html>
