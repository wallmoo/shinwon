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

            <h2 class="title"><span>추가혜택관리</span></h2>

            <h3 class="title"><span>검색</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>키워드 검색</span></th>
                            <td>
                                <input type="text" class="text xlarge" id="searchBenefitNm" name="searchBenefitNm" value="<c:out value="${commandMap.searchBenefitNm }"/>" placeholder="검색어 입력">
                            </td>
                        </tr>
                        <tr>
                            <th><span>전시기간</span></th>
                            <td>
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" id="searchBenefitStDt" name="searchBenefitStDt" value="<c:out value="${commandMap.searchBenefitStDt }" />" readonly="readonly" data-target-end="#searchBenefitEdDt"> ~
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" id="searchBenefitEdDt" name="searchBenefitEdDt" value="<c:out value="${commandMap.searchBenefitEdDt }" />" readonly="readonly" data-target-start="#searchBenefitStDt">
                                <a href="javascript:fnDateSet('searchBenefitEdDt', 'searchBenefitStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                <a href="javascript:fnDateSet('searchBenefitEdDt', 'searchBenefitStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('searchBenefitEdDt', 'searchBenefitStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('searchBenefitEdDt', 'searchBenefitStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><span>사용설정</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchBenefitUseYn" class="radio" value="" <c:if test="${empty commandMap.searchBenefitUseYn }">checked="checked"</c:if>/>
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="searchBenefitUseYn" class="radio"  value="Y" <c:if test="${commandMap.searchBenefitUseYn eq 'Y'}">checked="checked"</c:if>/>
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="searchBenefitUseYn" class="radio"  value="N" <c:if test="${commandMap.searchBenefitUseYn eq 'N'}">checked="checked"</c:if>/>
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="#none" id="search" class="button small primary"><span>검색</span></a>
            </div>

            <h3 class="title"><span>목록</span></h3>

            <form id="frm" name="frm">
               <input type="hidden" name="BNF_MST_IDX" value="" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                <input type="hidden" name="searchBenefitNm" value="${commandMap.searchBenefitNm }" />
                <input type="hidden" name="searchBenefitStDt" value="${commandMap.searchBenefitStDt }" />
                <input type="hidden" name="searchBenefitEdDt" value="${commandMap.searchBenefitEdDt }" />
                <input type="hidden" name="searchBenefitUseYn" value="${commandMap.searchBenefitUseYn }" />

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
                        <col style="width: 8%;" />
                        <col style="width: auto;" />
                        <col style="width: 20%;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>추가혜택명</th>
                            <th>전시기간</th>
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
			                            <td><c:out value="${listNum }" /></td>
			                            <td class="text-left">
			                            	<a href="#" class="list-title" data-bnf_mst_idx="${row.BNF_MST_IDX }">
			                            		<c:out value="${row.BNF_MST_NM }" />
			                            	</a>
										</td>
			                            <td><ui:formatDate value="${row.BNF_MST_ST_DT }" pattern="yyyy.MM.dd HH:mm:ss" /> ~ <ui:formatDate value="${row.BNF_MST_ED_DT }" pattern="yyyy.MM.dd HH:mm:ss" /></td>
			                            <td><ui:formatDate value="${row.BNF_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" /></td>
			                            <td>
			                            	<c:if test="${row.BNF_MST_USE_YN eq 'Y'}">
			                            		사용
			                            	</c:if>
			                            	<c:if test="${row.BNF_MST_USE_YN eq 'N'}">
			                            		미사용
			                            	</c:if>
			                            </td>
			                        </tr>
		                        <c:set var="listNum" value="${listNum-1}" />
                    			</c:forEach>
                    		</c:when>
                    	</c:choose>
                </table>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <!-- <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a> -->
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
		$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/site/benefitManagerForm.do","target" : "_self","method" : "post"}).submit();
	});
	
	// 검색 버튼 클릭 이벤트
	$(document).on("click","#search",function() {
		var $searchForm = $("#searchForm");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action" : "<c:out value="${serverDomain}" />/am/site/benefitManagerList.do",	"target" : "_self",	"method" : "post"}).submit();
	});
	
	// 페이지 사이즈 변경 이벤트
	$(document).on("change", "select[name='pageSize']",function() {
		goPage(1);
	});
	
	// 페이지 이동
	goPage = function(cPage) {
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({	"action" : "<c:out value="${serverDomain}" />/am/site/benefitManagerList.do", "target" : "_self", "method" : "post" }).submit();
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
	
	// 제목 a Tag 클릭 이벤트
	$(document).on(	"click",".list-title",function() {
		var $frm = $("#frm");
		$frm.find("input[name='BNF_MST_IDX']").val($(this).data("bnf_mst_idx"));
		$frm.attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/site/benefitManagerEdit.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
	});
});
//-->
</script>

</body>
</html>
