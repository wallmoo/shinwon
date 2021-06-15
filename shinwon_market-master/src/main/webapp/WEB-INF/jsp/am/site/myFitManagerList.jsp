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

            <h2 class="title"><span>마이핏관리 목록</span></h2>

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
                            <th><span>항목 분류 선택</span></th>
                            <td colspan="3">
                                <select class="select" name="FIT_MST_CTG1">
                                    <option>대분류 전체</option>
                                </select>
                                <!-- 대분류 상의 선택시 -->
                                <select class="select" name="FIT_MST_CTG2">
                                    <option>중분류 전체</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span>입력정보 선택</span></th>
                            <td>
                                <select class="select" id="searchInfoIdx" name="searchInfoIdx">
                                    <option value="" <c:if test="${empty commandMap.searchInfoIdx }">selected="selected"</c:if>>전체</option>
                                        <c:if test="${not empty inputList }">
                                            <c:forEach var="codeRow" items="${inputList }" varStatus="i">
                                                <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${codeRow.CMN_COM_IDX eq commandMap.searchInfoIdx }">selected="selected"</c:if>>
                                                    <c:out value="${codeRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                </select>
                            </td>
                            <th><span>사용설정</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchMyFitUseYn" class="radio" <c:if test="${empty commandMap.searchMyFitUseYn }">checked="checked"</c:if> value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="searchMyFitUseYn" class="radio" <c:if test="${commandMap.searchMyFitUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="searchMyFitUseYn" class="radio" <c:if test="${commandMap.searchMyFitUseYn eq 'N'}">checked="checked"</c:if> value="N" />
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
            </div>

            <h3 class="title"><span>목록</span></h3>

            <form id="frm" name="frm">
                
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
				<input type="hidden" name="FIT_MST_IDX"  id="FIT_MST_IDX"  value="<c:out value="${row.FIT_MST_IDX }"/>"/>
				<input type="hidden" name="searchInfoIdx" value="<c:out value="${commandMap.searchInfoIdx }"/>"/>
				<input type="hidden" name="searchPlnMstTitle" value="<c:out value="${commandMap.searchPlnMstTitle }"/>"/>
				<input type="hidden" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>"/>
				<input type="hidden" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>"/>
				<input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>"/>
				<input type="hidden" name="searchMyFitUseYn" value="<c:out value="${commandMap.searchMyFitUseYn }"/>"/>
				<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                        <span class="pages">
                            
                            (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                        </span>
                    </div>

                    <div class="col-1-2 text-right">
                        <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->
                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>썸네일</th>
                            <th>대분류</th>
                            <th>중분류</th>
                            <th>입력정보</th>
                            <th>등록일</th>
                            <th>사용설정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="listNum" value="${paging.listNum}" />
                        <c:forEach var="row" items="${list }" varStatus="i">
                    		<tr>
	                            <td><c:out value="${listNum }"/></td>
	                            <td><span class="thumbnail_img"><img name="FIT_IMAGE" src="<c:out value="${cdnDomain}" />${row.FIT_IMAGE }"></span></td>
	                            <td>${row.MAIN_CTG }</td>
	                            <td>${row.SUB_CTG }</td>
                                <td class="text-left">
                                    <a href="javascript:;" class="list-title" data-fit_idx="<c:out value="${row.FIT_MST_IDX }"/>">
                                        <c:forEach var="infoItem" items="${infoList}" varStatus="j">
                                            <c:set var ="nextInfoIdx" value="${infoList[j.index+1].FIT_MST_IDX}" />
                                                <c:if test="${row.FIT_MST_IDX eq infoItem.FIT_MST_IDX}">
                                                    ${infoItem.CMN_COM_NM} 
                                                </c:if>
                                                <c:if test="${row.FIT_MST_IDX eq infoItem.FIT_MST_IDX and row.FIT_MST_IDX eq nextInfoIdx}">
                                                    ,
                                                </c:if>
                                        </c:forEach>
                                    </a>
                                </td>
                                
	                            <td><ui:formatDate value="${row.FIT_MST_REG_DT }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                            <td>
	                            	<c:if test="${row.FIT_MST_USE_YN eq 'Y'}">
	                            		사용
	                            	</c:if>
	                            	<c:if test="${row.FIT_MST_USE_YN eq 'N'}">
	                            		미사용
	                            	</c:if>
	                            </td>
	                        </tr>
                            <c:set var="listNum" value="${listNum-1}" />
                    	</c:forEach>
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

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/>

<input type="hidden" id="mainCategory" value='${JsonUtil.getJsonArrayFromList(mainCategory)}'>
<script>
$(function(){
	var highOption = JSON.parse($("#mainCategory").val());

	$(document).on("change", "#FIT_MST_CTG1", function (){
		getOptionList("FIT_MST_CTG2", $("#FIT_MST_CTG1 option:selected").val(),$("#searchPrdCtgEnv").val(),highOption);

	});
	$(document).on("click","#goForm",function(){
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/myFitManagerForm.do", "target":"_self", "method":"post"}).submit();

	});
	
	//검색
	$(document).on("click", "#search", function () {
		var $searchForm = $("#searchForm");
			$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
	        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/myFitManagerList.do", "target":"_self", "method":"post"}).submit();
	    });
	
	// 엑셀 다운로드
	$(document).on("click","#excelDown", function() {
		if ("${paging.totalRecordCount}" > 10000) {
			alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
			return;
		} else if ("${paging.totalRecordCount}" == 0) {
			alert("저장할 내역이 없습니다.");
			return;
		}
		var $frm = $("#searchForm");
		$frm.attr({
					"action" : "<c:out value="${serverDomain}" />/am/site/myFitManagerListExcelDownload.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
	
	getOptionList = function(obj, upIdx, selectIdx,data){
        var selected = "";
        var title = upIdx==2?"대분류 전체":"중분류 전체";
        $("#"+obj).empty().append("<option value=''>"+title+"</option>");
        $.each(data, function(i,item){
        	if(item.CMN_COM_NM =="나의 기본정보") return true;
        	if (item.CMN_COM_IDX == selectIdx)
                selected = "selected";
            else
                selected = "";
            
        	if(item.CMN_COM_UP_IDX == upIdx || item.CMN_COM_LEVEL == upIdx)
            	$("#"+obj).append("<option value='"+item.CMN_COM_IDX+"' "+selected+">"+item.CMN_COM_NM+"</option>");
        });
    };
    
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='FIT_MST_IDX']").val($(this).data("fit_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/myFitManagerEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/myFitManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
})
//-->
</script>

</body>
</html>
