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

                <h2 class="title"><span>FAQ</span></h2>
					 
                <h3 class="title"><span>목록</span></h3>
                
                <form id="searchForm" name="searchForm">
                   	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="BRAND_CD" value=""/>
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
	                            <th><span>등록일</span></th>
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
	                        <tr>
	                            <th><span>키워드검색</span></th>
	                            <td>
	                               	<input type="text" class="text xlarge" name="searchBrdFaqTitleAndContents" id="searchBrdFaqTitleAndContents" value="<c:out value="${commandMap.searchBrdFaqTitleAndContents }"/>"/>
	                            </td>
	                            <th><span>유형</span></th>
	                            <td>
									<select class="select" name="searchBrdCmnComIdx" id="searchBrdCmnComIdx">
	                                	<option value="">선택</option>
	                                	<c:if test="${not empty codes.FAQ_INQUIRY_TYPE_CODE }">
			 	                    		<c:forEach var="faqRow" items="${codes.FAQ_INQUIRY_TYPE_CODE }" varStatus="i">
			 	                    			<option value="<c:out value="${faqRow.CMN_COM_IDX }"/>" <c:if test="${commandMap.searchBrdCmnComIdx eq faqRow.CMN_COM_IDX}">selected="selected"</c:if>>
			 	                    				<c:out value="${faqRow.CMN_COM_NM }"/>
			 	                    			</option>	      
				                            </c:forEach>
			                            </c:if>
	                                </select>
                                	<!-- <input type="checkbox" id="searchBrdFaqOftenYn" name="searchBrdFaqOftenYn" <c:if test="${commandMap.searchBrdFaqOftenYn eq 'Y' }">checked="checked"</c:if> value="Y"/><label for="searchBrdFaqOftenYn"> FAQ TOP5 조회</label> -->
		                      	</td>
	                            <th><span>상태</span></th>
	                            <td>
	                            	<input type="radio" id="stateA" name="serachBrdFaqUseYn" class="radio" <c:if test="${empty commandMap.serachBrdFaqUseYn }">checked="checked"</c:if> value=""/>
		                            <label for="stateA">전체</label>
		                            <input type="radio" id="stateB" name="serachBrdFaqUseYn" class="radio" <c:if test="${commandMap.serachBrdFaqUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
		                            <label for="stateB">사용</label>
		                            <input type="radio" id="stateC" name="serachBrdFaqUseYn" class="radio" <c:if test="${commandMap.serachBrdFaqUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
		                            <label for="stateC">미사용</label>
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
	                <input type="hidden" name="BRD_FAQ_IDX" value="" />
                    <input type="hidden" name="BRAND_CD" value=""/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchBrdFaqTitle" value="<c:out value="${commandMap.searchBrdFaqTitle }"/>"/>
                    <input type="hidden" name="searchBrdFaqContents" value="<c:out value="${commandMap.searchBrdFaqContents }"/>"/>
                    <input type="hidden" name="searchBrdFaqTitleAndContents" value="<c:out value="${commandMap.searchBrdFaqTitleAndContents }"/>"/>
                    <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
                    <input type="hidden" name="serachBrdFaqUseYn" value="<c:out value="${commandMap.serachBrdFaqUseYn }"/>"/>
                    <input type="hidden" name="searchBrdFaqOftenYn" value="<c:out value="${commandMap.searchBrdFaqOftenYn }"/>"/>
                    <input type="hidden" name="searchBrdCmnComUpIdx" value="<c:out value="${commandMap.searchBrdCmnComUpIdx }"/>"/>
	                
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
	                        <col style="width: 8%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 15%;" />
	                       <!--  <col style="width: 10%;" /> -->
	                        <col style="width: 10%;" />
	                        <col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
	                            <th>유형</th>
	                            <th>제목</th>
	                            <th>등록일</th>
	                            <!-- <th>자주하는FAQ</th> -->
	                            <th>작성자</th>
	                            <th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty list }">
									<c:set var="listNum" value="${paging.listNum}" />
									<c:forEach var="row" items="${list }" varStatus="i">
										<tr>
											<td><c:out value="${listNum }"/></td>
											<td><c:out value="${row.BRD_CMN_COM_NM }"/></td>
											<td class="left">
												<a href="#none" class="list-title" data-brd_faq_idx="<c:out value="${row.BRD_FAQ_IDX }"/>">
													<c:out value="${row.BRD_FAQ_TITLE }"/>
												</a>
											</td>
											<td><ui:formatDate value="${row.BRD_FAQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
											<%-- <td>
												<span class="label label-<c:out value="${row.BRD_FAQ_OFTEN_YN eq 'Y'?'b':'a' }"/>">
													<c:out value="${row.BRD_FAQ_OFTEN_YN eq 'Y'?'사용':'미사용' }"/>
												</span>
											</td> --%>
											<td>
												<c:out value="${row.BRD_FAQ_REG_ID }"/>(<c:out value="${row.BRD_FAQ_REG_NM }"/>)
											</td>
											<td>
												<c:out value="${row.BRD_FAQ_USE_YN eq 'Y' ? '사용' : '미사용' }"/>
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
    	var $frm = $("#frm");
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/faqBoardForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='BRD_FAQ_IDX']").val($(this).data("brd_faq_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/faqBoardEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchBrdFaqTitle", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 내용 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchBrdFaqContents", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
	 // 키워드 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchBrdFaqTitleAndContents", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 

        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/board/faqBoardList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/faqBoardList.do", "target":"_self", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
