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

                <h2 class="title"><span>이벤트 관리</span></h2>

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
	                           	<th><span>기간</span></th>
	                           	<td colspan="3">
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="searchEvtMstStDt" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }" />"   readonly="readonly" data-target-end="#searchEvtMstEdDt"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchEvtMstEdDt" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }" />"  readonly="readonly" data-target-start="#searchEvtMstStDt"/>
									<a href="javascript:fnDateSet('searchEvtMstEdDt', 'searchEvtMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                	<a href="javascript:fnDateSet('searchEvtMstEdDt', 'searchEvtMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                	<a href="javascript:fnDateSet('searchEvtMstEdDt', 'searchEvtMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                	<a href="javascript:fnDateSet('searchEvtMstEdDt', 'searchEvtMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                           	</td>
	                        </tr>
	                        <tr>
	                            <th><span>이벤트명</span></th>
	                            <td colspan="3">
	                               	<input type="hidden" name="searchType" value="S_NM"/>
                               		<input type="text" name="searchWord" id="searchWord" class="text large" value="<c:out value="${commandMap.searchWord }"/>">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>이벤트 형태</span></th>
	                            <td colspan="3">
	                            	<input type="radio" id="eventTypeA" name="searchEvtMstType" class="radio" <c:if test="${empty commandMap.searchEvtMstType}">checked="checked"</c:if> value=""/>
	                            	<label for="eventTypeA">전체</label>
 	                    			<c:if test="${not empty eventTypeList }">
	 	                    			<c:forEach var="eventTypeRow" items="${eventTypeList }" varStatus="i">
	                             			<input id="eventType${i.index}" type="radio" name="searchEvtMstType" class="radio" <c:if test="${commandMap.searchEvtMstType eq eventTypeRow.CMN_COM_IDX}">checked="checked"</c:if> value="<c:out value="${eventTypeRow.CMN_COM_IDX}"/>"/>
	                              			<label for="eventType${i.index}"><c:out value="${eventTypeRow.CMN_COM_NM }"/></label>
		                            	</c:forEach>
	                            	</c:if>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>채널</span></th>
	                            <td>
									<input type="radio" id="shoppingChannerA" name="searchEvtMstShopType" class="radio" <c:if test="${empty commandMap.searchEvtMstShopType }">checked="checked"</c:if> value=""/>
	                                <label for="shoppingChannerA">전체</label>
	                                <input type="radio" id="shoppingChannerB" name="searchEvtMstShopType" class="radio" <c:if test="${commandMap.searchEvtMstShopType eq 'PC' }">checked="checked"</c:if> value="PC"/>
	                                <label for="shoppingChannerB">PC</label>
	                                <input type="radio" id="shoppingChannerC" name="searchEvtMstShopType" class="radio" <c:if test="${commandMap.searchEvtMstShopType eq 'MOBILE' }">checked="checked"</c:if> value="MOBILE"/>
	                                <label for="shoppingChannerC">MOBILE</label>
		                      	</td>
	                            <th><span>전시상태</span></th>
	                            <td>
		                            <input type="radio" id="stateA" name="searchEvtMstUseYn" class="radio" <c:if test="${empty commandMap.searchEvtMstUseYn }">checked="checked"</c:if> value=""/>
	                                <label for="stateA">전체</label>
	                                <input type="radio" id="stateB" name="searchEvtMstUseYn" class="radio" <c:if test="${commandMap.searchEvtMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                                <label for="stateB">사용</label>
	                                <input type="radio" id="stateC" name="searchEvtMstUseYn" class="radio" <c:if test="${commandMap.searchEvtMstUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
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
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>

	                    <div class="col-1-2 text-right">
	                        <a  href="#none" id="goForm" class="button small primary"><span>등록</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 3%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 8%;" />
                            <col style="width: 6%;" />
                            <col style="width: 6%;" />
                            <col style="width: 10%;" />
                            <col style="width: 5%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
                                <th>채널</th>
                                <th>이벤트명</th>
                                <th>기간</th>
                                <th>형태</th>
                                <th>응모자</th>
                                <th>당첨자</th>
                                <th>당첨자발표예정일</th>
                                <th>전시상태</th>
							</tr>
						</thead>
						<tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${totalCount - row.RNUM + 1 }"/></td>
			                                <td>
			                                	<c:choose>
													<c:when test="${row.EVT_MST_MB_YN eq 'Y' and row.EVT_MST_PC_YN eq 'Y'}">PC+MOBILE
													</c:when>
													<c:otherwise>
														<c:if test="${row.EVT_MST_PC_YN eq 'Y'}" >PC</c:if>
														<c:if test="${row.EVT_MST_MB_YN eq 'Y'}" >MOBILE</c:if>
													</c:otherwise>
												</c:choose>
			                                </td>
			                                <td class="left">
				                                <a href="#none" class="list-title" data-evt_mst_idx="<c:out value="${row.EVT_MST_IDX }"/>" data-view_type="view">
				                                    <c:out value="${row.EVT_MST_TITLE }"/>
				                                </a>
			                                </td>
			                                <td>
                                                <ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~<br/>
                                                <ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/>
			                                </td>
			                                <td>
			                                	<c:if test="${not empty eventTypeList }">
			                                		<c:forEach var="eventTypeRow" items="${eventTypeList }" varStatus="i">
			                                			<c:if test="${row.EVT_MST_TYPE eq eventTypeRow.CMN_COM_IDX}">
			                                				<c:out value="${eventTypeRow.CMN_COM_NM }"/>
			                                			</c:if>
		                               				</c:forEach>
			                                	</c:if>
		                               		</td>
											<td><c:out value="${row.EVT_MST_ETR_CNT eq 0 or empty row.EVT_MST_ETR_CNT? '-' : row.EVT_MST_ETR_CNT}"/></td>
											<td><c:out value="${row.EVT_MST_WIN_CNT eq 0 or empty row.EVT_MST_WIN_CNT ? '-' : row.EVT_MST_WIN_CNT}"/></td>
											<td><ui:formatDate value="${row.EVT_MST_WIN_DT }" pattern="yyyy.MM.dd"/></td>
											<td>
												<select class="select">
													<option>전시</option>
													<option>미전시</option>
												</select>
												<!--<c:out value="${row.EVT_MST_USE_YN eq 'Y' ? '전시' : '미전시' }"/> -->
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
	                </div>

					<div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
	                 <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="EVT_MST_IDX" value="" />
                    <input type="hidden" name="EVT_MST_TYPE" value=""/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
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
 $("#searchForm").validate({
        rules : {
            searchType : {required:{
                depends:function ()
	                {
	                    if($("#searchWord").val() != "" && $("#searchType").val() == "")
	                    {
	                        return true;
	                    }
	                    else
	                    {
	                        return false;
	                    }
	                }
                }
            }
        },
        messages : {searchType:{required:"반드시 선택해 주십시오."}}
    });

    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventForm.do", "target":"_self", "method":"post"}).submit();
    });

    // 상세페이지 이동
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='EVT_MST_IDX']").val($this.data("evt_mst_idx"));
        $frm.find("input[name='EVT_MST_TYPE']").val($this.data("evt_mst_type"));
        var viewType = $this.data("view_type");
        var url = "";
        if(viewType == "view")
        {
            url = "<c:out value="${serverDomain}" />/am/marketing/eventEdit.do";
        }
        else if (viewType == "entryList")
        {
            url = "<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do";
        }
        else
        {
            url = "<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do";
        }
        $frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
    });

    // 검색 엔터 이벤트
    $(document).on("keydown", "#searchWord", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });

    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm");
        if($searchForm.valid())
        {
	        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
	        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventList.do", "target":"_self", "method":"post"}).submit();
        }
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventList.do", "target":"_self", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
