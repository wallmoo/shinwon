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

            <h2 class="title"><span>O2O매장 목록</span></h2>

            <h3 class="title"><span>검색</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>키워드 검색</span></th>
                            <td colspan="3">
                                <select class="select" name="searchType" id="searchType">
                                	<option value="all" <c:if test="${empty commandMap.searchType }">selected="selected"</c:if>>전체</option>
                                	<option value="shopNM" <c:if test="${commandMap.searchType eq 'shopNM'}">selected="selected"</c:if>>매장명</option>
                                    <option value="telNum" <c:if test="${commandMap.searchType eq 'telNum'}">selected="selected"</c:if>>전화번호뒷자리</option>
                                </select>
                                <input type="text" class="text large" name="searchKeyword" id="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>지역</span></th>
                            <td>
                                <select class="select" name="searchArea" id="searchArea" value="${commandMap.searchArea}">
                                    <option value="">전체</option>
                                    <option value="서울">서울</option>
                                    <option value="경기도">경기도</option>
                                    <option value="인천">인천</option>
                                    <option value="강원도">강원도</option>
                                    <option value="충청남도">충청남도</option>
                                    <option value="대전">대전</option>
                                    <option value="충청북도">충청북도</option>
                                    <option value="부산">부산</option>
                                    <option value="울산">울산</option>
                                    <option value="대구">대구</option>
                                    <option value="경상북도">경상북도</option>
                                    <option value="경상남도">경상남도</option>
                                    <option value="전라남도">전라남도</option>
                                    <option value="광주">광주</option>
                                    <option value="세종">세종</option>
                                    <option value="전라북도">전라북도</option>
                                    <option value="제주">제주</option>
                                    <option value="세종">세종</option>
                                </select>
                            </td>
                            <th><span>사용설정</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchUseYn" class="radio" <c:if test="${empty commandMap.searchUseYn }">checked="checked"</c:if> value=""/>
                                <label for="stateA">전체</label>
                                <input type="radio" id="stateB" name="searchUseYn" class="radio" <c:if test="${commandMap.searchUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="searchUseYn" class="radio" <c:if test="${commandMap.searchUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                <label for="stateC">미사용</label>
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
               	<input type="hidden" name="PART_DIV" value="" />
               	<input type="hidden" name="PART_NO" value="" />
               	<input type="hidden" name="BRAND" value="" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                <input type="hidden" name="searchUseYn" value="<c:out value="${commandMap.searchUseYn }"/>"/>
                <input type="hidden" name="searchArea" value="<c:out value="${commandMap.searchArea }"/>"/>


                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                    	<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                    	<span class="pages">(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)</span>
                        <!-- <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select> -->
                        <!-- <span class="pages">
                            (총 <strong class="em">1</strong>건, 1 of 1 page)
                        </span> -->
                    </div><!-- // 목록 상단 버튼 -->

                    <div class="col-1-2 text-right">
                        <a href="#none" id="goSync" class="button small primary"><span>동기화</span></a>
                    </div>
                </div>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>지역</th>
                            <th>매장명</th>
                            <th>매장 운영시간</th>
                            <th>방문 가능시간</th>
                            <th>전화번호</th>
                            <th>위치</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
	                        <c:when test="${not empty list }">
	                        	<c:forEach var="row" items="${list }" varStatus="i">
		                        <tr>
	                            	<td><c:out value="${row.RNUM }"/></td>
	                            	<td><c:out value="${row.STATE }"/></td>
	                            	<td class="text-left">
	                            		<a href="javascript:void(0);" id="goView" data-part_div="${row.PART_DIV}" data-part_no="${row.PART_NO}" data-brand="${row.BRAND}"><c:out value="${row.PART_DIV }"/><c:out value="${row.PART_NO }"/><c:out value="${row.BRAND }"/></a>
	                            	</td>
	                            	
	                            	<td>
	                            		<c:out value="${row.ERP_SHP_ST_HH }"/>:<c:out value="${row.ERP_SHP_ST_MM }"/> ~
	                            		<c:out value="${row.ERP_SHP_ED_HH }"/>:<c:out value="${row.ERP_SHP_ED_MM }"/>
	                            	</td>
	                            	<td>
	                            		<c:out value="${row.ERP_SHP_PCK_ST_HH }"/>:<c:out value="${row.ERP_SHP_PCK_ST_MM }"/> ~
	                            		<c:out value="${row.ERP_SHP_PCK_ED_HH }"/>:<c:out value="${row.ERP_SHP_PCK_ED_MM }"/>
	                            	</td>
	                            	
		                            <td><c:out value="${row.PART_PHONE_NO }"/></td>
		                            <td><a href="javascript:popupOpen('<c:out value="${row.MAP_URL }"/>',1024,764,'mapPopup');">지도보기</a></td>
		                        </tr>
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
                        <!-- <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a> -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->

            </form>
        </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->
	<form id="syncO2OERPFORM"/>
    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>


<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
function popupOpen(url,width,height,mapId){
	if(!url){
		alert('등록된 지도가 없습니다');
		return;
	}
	popup(url,width,height,mapId);
}
$(function(){
	// 검색 엔터 이벤트
    $(document).on("keydown", "#searchWord", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
	$(document).on("click", "#goView", function(){
		var $frm = $("#frm");
        $frm.find("input[name='PART_DIV']").val($(this).data("part_div"));
        $frm.find("input[name='PART_NO']").val($(this).data("part_no"));
        $frm.find("input[name='BRAND']").val($(this).data("brand"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/o2oStoreEdit.do", "target":"_self", "method":"post"}).submit();
	});
 	// 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/o2oStoreList.do", "target":"_self", "method":"post"}).submit(); 
    });
 	
    $("#goSync").on("click", function() {
		if(!confirm("정말로 동기화 하시겠습니까?")){
			return;
		}
		$("#syncO2OERPFORM").attr({"action":"<c:out value="${serverDomain}" />/am/site/o2oStoreListERPSync.do", "target":"_self", "method":"post"}).submit();
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/o2oStoreList.do", "target":"_self", "method":"post"}).submit();
    };
    
});    
    
 

//-->
</script>

</body>
</html>
