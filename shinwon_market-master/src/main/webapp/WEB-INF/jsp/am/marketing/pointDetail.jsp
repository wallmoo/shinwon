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

                <h2 class="title"><span>포인트 관리자 적립/차감내역</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>기간</span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointStDt" id="searchPointStDt" class="text" value="<c:out value="${commandMap.searchPointStDt }"/>" readonly="readonly" data-target-end="#searchPointEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchPointEdDt" id="searchPointEdDt" class="text" value="<c:out value="${commandMap.searchPointEdDt }"/>" readonly="readonly" data-target-start="#searchPointStDt"/>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    <!--<a href="javascript:fnDateSet('searchPointEdDt', 'searchPointStDt', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>-->
                                </td>
                            </tr>
                            <tr>
                                <th><span>ID</span></th>
                                <td>
                                    <input type="text" name="searchMemPitMemId" id="searchMemPitMemId" class="text" value="<c:out value="${commandMap.searchMemPitMemId }"/>">
                                </td>
                                <th><span>이름</span></th>
                                <td>
                                    <input type="text" name="searchMemMstMemNm" id="searchMemMstMemNm" class="text" value="<c:out value="${commandMap.searchMemMstMemNm }"/>">
                                </td>
                            </tr>
                            <tr>
                                <th><span>구분/내역</span></th>
                                <td colspan="3">
                                    <select id="searchMemPitGbn" name="searchMemPitGbn" class="select" title="포인트 구분">
                                        <option value="">전체</option>
                                        <option value="P" <ui:select v="P" t="${commandMap.searchMemPitGbn}" g="selected"/>>적립</option>
                                        <option value="M" <ui:select v="M" t="${commandMap.searchMemPitGbn}" g="selected"/>>차감</option>
                                    </select>
                                    <select id="searchMemPitBrkDwn" name="searchMemPitBrkDwn" class="select" title="포인트  내역">
                                        <option value="">전체</option>
                                    </select>
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
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchPointStDt" value="<c:out value="${commandMap.searchPointStDt }"/>"/>
                    <input type="hidden" name="searchPointEdDt" value="<c:out value="${commandMap.searchPointEdDt }"/>"/>
                    <input type="hidden" name="searchPitMstRegId" value="<c:out value="${commandMap.searchPitMstRegId }"/>"/>
                    <input type="hidden" name="searchPitMstRegNm" value="<c:out value="${commandMap.searchPitMstRegNm }"/>"/>
                    <input type="hidden" name="searchPitMstMemo" value="<c:out value="${commandMap.searchPitMstMemo }"/>"/>
                    <input type="hidden" name="searchPitMstGbn" value="<c:out value="${commandMap.searchPitMstGbn }"/>"/>
                    <input type="hidden" name="searchPitMstBrkDwn" value="<c:out value="${commandMap.searchPitMstBrkDwn }"/>"/>
                    <input type="hidden" name="PIT_MST_IDX" value=""/>

	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>

	                    <div class="col-1-2 text-right">
	                        <a href="javascript:goExcelDown();" id="goExcel" class="button small primary"><span>엑셀다운로드</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 5%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: auto%;" />
						</colgroup>
						<thead>
							<tr>
                                <th><input type="checkbox" class="checkAll"></th>
								<th>NO</th>
	                            <th>구분</th>
	                            <th>내역</th>
	                            <th>개별포인트</th>
	                            <th>대상인원수</th>
	                            <th>총 포인트</th>
	                            <th>처리자</th>
	                            <th>적립/차감/소멸일시</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty list }">
									<c:set var="listNum" value="${paging.listNum}" />
									<c:forEach var="row" items="${list }" varStatus="i">
										<tr>
                                            <td><input type="checkbox" class="checkbox"></td>
											<td><c:out value="${listNum }"/></td>
											<td>
												<c:if test="${row.PIT_MST_GBN eq 'P'}">적립</c:if>
												<c:if test="${row.PIT_MST_GBN eq 'M'}">차감</c:if>
												<c:if test="${row.PIT_MST_GBN eq 'D'}">소명</c:if>
											</td>
											<td>
												 <c:out value="${row.PIT_MST_BRK_DWN_NM }"/>
											</td>
											<td>
												<fmt:formatNumber value="${row.PIT_MST_PIT }" groupingUsed="true" />

											</td>
											<td>
												<a href="#none" class="list-title" data-pit_mst_idx="${row.PIT_MST_IDX }" >
													<c:out value="${row.PIT_MST_PIT_CNT }"/>
												</a>
											</td>
											<td>
												 <fmt:formatNumber value="${row.PIT_MST_PIT_TOTAL }" groupingUsed="true" />
											</td>
											<td>
												 <c:out value="${row.PIT_MST_REG_NM }"/>(<c:out value="${row.PIT_MST_REG_ID }"/>)
											</td>
											<td><ui:formatDate value="${row.PIT_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>

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
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointForm.do", "target":"_self", "method":"post"}).submit();
    });

    // 상세페이지 이동
    $(document).on("click", ".list-title", function () {
        var $this = $(this);

        var PIT_MST_IDX = $this.data("pit_mst_idx");

        popup("<c:out value="${serverDomain}" />/am/marketing/searchPointDetailPopup.do?PIT_MST_IDX="+PIT_MST_IDX, "1100", "500", "yes", "searchPointDetailPopup");

    });

 	// 검색 엔터 이벤트
    $('#searchForm').find("input").not(".datepicker").keydown(function (e){
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
	        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointDetail.do", "target":"_self", "method":"post"}).submit();
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointDetail.do", "target":"_self", "method":"post"}).submit();
    };

    getSubCodeList = function(code)
    {

    	var $frm = $("#frm");

    	var searchPitMstBrkDwn =  $frm.find("input[name='searchPitMstBrkDwn']").val()

    	$.ajax({
            type	: "POST",
            url : "<c:out value="${serverDomain}" />/am/marketing/pointCodeAjax.do",
            data	:  { "code":code},
            dataType : "JSON",
            async   : false,
            success	: function(data)
            {
            	var selected = "";
                $("#searchPitMstBrkDwn").empty().append("<option value=''>전체</option>");
                $.each(data.list, function(i,item)
                {
                	if(searchPitMstBrkDwn != item.CMN_COM_IDX)
                	{
                    	$("#searchPitMstBrkDwn").append("<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>");
                	}
                	else
                	{
                		$("#searchPitMstBrkDwn").append("<option value='"+item.CMN_COM_IDX+"' selected = 'selected' >"+item.CMN_COM_NM+"</option>");

                	}
                });

            },
            error   : function(xhr,status,error)
            {
                alert("포인트내역 호출 중 에러가 발생하였습니다.");
                //alert("code:"+xhr.status);
            }
        });
    };
 // 엑셀다운
    goExcelDown = function ()
    {
    	if("${paging.totalRecordCount}" > 10000){
    		alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
    		return;
    	}else if("${paging.totalRecordCount}" == 0){
    		alert("저장할 내역이 없습니다.");
    		return;
    	}

        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/pointDetailExcel.do", "target":"_self", "method":"post"}).submit();
    };

    getSubCodeList("P");
});
//-->
</script>

</body>
</html>
