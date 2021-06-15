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

            <div class="container"><!-- container -->

                <h2 class="title"><span>리뷰어모집</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />

                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                            <col style="width: 10%;" />
                            <col style="width: auto;"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>등록일</span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchExpMstStDt" id="searchExpMstStDt" class="text" value="<c:out value="${commandMap.searchExpMstStDt }"/>" readonly="readonly" data-target-end="#searchExpMstEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchExpMstEdDt" id="searchExpMstEdDt" class="text" value="<c:out value="${commandMap.searchExpMstEdDt }"/>" readonly="readonly" data-target-start="#searchExpMstStDt"/>
                                    <a href="javascript:fnDateSet('searchExpMstEdDt', 'searchExpMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchExpMstEdDt', 'searchExpMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchExpMstEdDt', 'searchExpMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchExpMstEdDt', 'searchExpMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>상품코드</span></th>
                                <td>
                                    <input type="text" name="searchPrdMstCd" id="searchPrdMstCd" class="text large" value="<c:out value="${commandMap.searchPrdMstCd }"/>">
                                </td>
                                <th><span>상품명</span></th>
                                <td>
                                    <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text large" value="<c:out value="${commandMap.searchPrdMstNm }"/>">
                                </td>
                            </tr>
                            <tr>
                                <th><span>상태</span></th>
                                <td colspan="3">
                                    <input type="radio" id="stateA" name="searchExpMstStatus" class="radio" <c:if test="${empty commandMap.searchExpMstStatus }">checked="checked"</c:if> value=""/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" id="stateB" name="searchExpMstStatus" class="radio" <c:if test="${commandMap.searchExpMstStatus eq 'ing' }">checked="checked"</c:if> value="ing"/>
                                    <label for="stateB">진행중</label>
                                    <input type="radio" id="stateC" name="searchExpMstStatus" class="radio" <c:if test="${commandMap.searchExpMstStatus eq 'end' }">checked="checked"</c:if> value="end"/>
                                    <label for="stateC">모집종료</label>
                                    <input type="radio" id="stateD" name="searchExpMstStatus" class="radio" <c:if test="${commandMap.searchExpMstStatus eq 'win' }">checked="checked"</c:if> value="win"/>
                                    <label for="stateD">당첨자발표</label>
                                </td>
                            </tr>
                            <tr>
                            	<th><span>모집명</span></th>
                                <td colspan="3">
                                    <input type="text" name="searchExpMstNm" id="searchExpMstNm" class="text xlarge" value="<c:out value="${commandMap.searchExpMstNm }"/>">
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->

                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="PRD_MST_CD" value=""/>
                    <input type="hidden" name="EXP_MST_CD" value=""/>
	                <input type="hidden" name="selectedExpMstList" id="selectedExpMstList">

                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
					<input type="hidden" name="searchExpMstStatus" value="<c:out value="${commandMap.searchExpMstStatus }"/>"/>

                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">
                            	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="#none;" id="goForm" class="button small primary"><span>등록</span></a>
                        </div>
                     </div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                    <colgroup>
	                        <col style="width: 3%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 12%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 15%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 10%;" />
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th>NO</th>
	                            <th>상품코드</th>
	                           	<th>이미지</th>
	                           	<th>상품명</th>
	                            <th>모집명</th>
	                            <th>신청인원</th>
	                            <th>모집인원</th>
	                            <th>등록리뷰수</th>
	                            <th>등록일</th>
	                            <th>전시여부</th>
	                            <th>상태</th>
	                        </tr>
	                    </thead>
	                    <tbody id="list-field">
	                        <c:choose>
	                            <c:when test="${not empty list }">
	                                <c:set var="listNum" value="${paging.listNum}" />
	                                <c:forEach var="row" items="${list}" varStatus="i">
	                                    <tr>
	                                        <td><c:out value="${row.NUM }"/></td>
	                                        <td><a href="javascript:goView('<c:out value="${row.PRD_MST_CD }"/>');"><c:out value="${row.PRD_MST_CD }"/></a></td>
	                                        <td><span class="thumbnail_img"><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${row.PRD_IMAGE }"></span></td>
	                                        <td><c:out value="${row.PRD_MST_NM }"/></td>
	                                        <td class="left">
	                                            <a href="#" class="list-title" data-exp_mst_cd="<c:out value="${row.EXP_MST_CD }"/>" data-view_type="view">
	                                                <c:out value="${row.EXP_MST_NM }"/>
	                                            </a>
	                                        </td>
	                                        <td><c:out value="${row.EXP_MST_ETR_CNT }"/></td>
	                                        <td><c:out value="${row.EXP_MST_WIN_CNT }"/></td>
	                                        <td><c:out value="${row.EXP_MST_REV_CNT }"/></td>
	                                         <td>
	                                            <ui:formatDate value="${row.EXP_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
	                                        </td>
	                                        <td>
                                                <select name="EXP_MST_USE_YN" >
                                                    <option value="Y" <c:if test="${row.EXP_MST_USE_YN eq 'Y'}">selected</c:if>>전시</option>
                                                    <option value="N" <c:if test="${row.EXP_MST_USE_YN eq 'N'}">selected</c:if>>미전시</option>
                                                </select>
	                                        </td>
	                                        <td>
	                                         	<c:out value="${row.EXP_MST_STATE }"/>
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
	                </table><!-- // table -->

                    <div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
	                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
	                </div>

	                <div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
                </form>
            </div><!-- // container -->

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
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerForm.do", "target":"_self", "method":"post"}).submit();
    });

    // 상세페이지 이동
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='EXP_MST_CD']").val($this.data("exp_mst_cd"));
        var url = "";

        url = "<c:out value="${serverDomain}" />/am/marketing/kingerEdit.do";

        $frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
    });

	$(document).on("click",	"#goRegist",function() {
		var data = new Array();
    	$("#list-field").find("tr").each(function(i){
    		var obj = new Object();
			var $tr = $(this).find(".list-title");
			obj.EXP_MST_CD = $tr.data("exp_mst_cd");
			obj.EXP_MST_USE_YN = $(this).find("select :selected").val();
			data.push(obj);
		});
    	
		$("#selectedExpMstList").val(JSON.stringify(data));
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerListModify.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});

	// 상품 상세페이지 이동 (새창)
	goView = function (prdMstCd)
	{
		var $frm = $("#frm");
		$frm.find("input[name='PRD_MST_CD']").val(prdMstCd);
		
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
	};

    // 검색 버튼 클릭 이벤트
    goSearch = function()
    {
    	var searchExpMstStDt = $("#searchExpMstStDt").val().replace(/\-/g, "");
    	var searchExpMstEdDt = $("#searchExpMstEdDt").val().replace(/\-/g, "");

    	if(searchExpMstStDt != "" && searchExpMstEdDt != "" && searchExpMstStDt > searchExpMstEdDt){
    		alert("등록종료일자가 등록시작일자이후 여야 합니다.");
    		return;
    	} 
        var $searchForm = $("#searchForm");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerList.do", "target":"_self", "method":"post"}).submit();
    };

    // 검색 엔터 이벤트
    $('#searchForm').find("input").not(".datepicker").keydown(function (e){
        if(e.keyCode == 13)
        {
            goSearch();
        }
    });

    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });

    // 페이지 이동
    goPage = function (cPage) {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerList.do", "target":"_self", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
