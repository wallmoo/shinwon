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

                <h2 class="title"><span>제조사 관리</span></h2>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>목록</span></h3>
                </div><!-- // section-title -->
				
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>제조사명</span></th>
	                            <td>
	                                <input type="text" class="text" name="searchMakerNm" id="searchMakerNm" value="<c:out value="${commandMap.searchMakerNm }"/>" placeholder="제조사명을 입력하세요." maxlength="15"/>
	                            </td>
	                        </tr>
	                        <tr>    
	                            <th><span>사용설정</span></th>
	                            <td>
	                            	<input type="radio" id="stateA" name="searchMrkMstUseYn" class="radio" <c:if test="${empty commandMap.searchMrkMstUseYn }">checked="checked"</c:if> value=""/>
		                            <label for="stateA">전체</label>
		                            <input type="radio" id="stateB" name="searchMrkMstUseYn" class="radio" <c:if test="${commandMap.searchMrkMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
		                            <label for="stateB">사용</label>
		                            <input type="radio" id="stateC" name="searchMrkMstUseYn" class="radio" <c:if test="${commandMap.searchMrkMstUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
		                            <label for="stateC">미사용</label>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	            </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
				
				<form id="frm" name="frm">
                    <input type="hidden" name="MRK_MST_IDX" value="" />
                    <input type="hidden" name="selectedMakerList" id="selectedMakerList">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchMakerNm" value="<c:out value="${commandMap.searchMakerNm }"/>"/>
                    <input type="hidden" name="searchMrkMstUseYn" value="<c:out value="${commandMap.searchMrkMstUseYn }"/>"/>
                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">  
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)</span>
	                    </div>
                   		<div class="col-1-2 text-right">
                   			<a href="javascript:;" id="goRegist" class="button small primary"><span>저장</span></a>
                   			<a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                       		<a href="#none;" id="goForm" class="button small primary"><span>등록</span></a>
                   		</div>
	                </div><!-- // 목록 상단 버튼 -->
	            </form>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                <colgroup>
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                </colgroup>
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>제조사코드</th>
                        <th>제조사명</th>
                        <th>등록일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody id="makerList">
					<c:choose>
                         <c:when test="${not empty list }">
                             <c:set var="listNum" value="${paging.listNum}" />
                             <c:forEach var="row" items="${list }" varStatus="i">
                                 <tr>
                            		<td><c:out value="${listNum }"/></td>
                            		<td><c:out value="${row.MRK_MST_IDX }"/></td>
                            		<td class="al">
										<a href="javascript:goEdit('<c:out value="${row.MRK_MST_IDX }"/>');" class="list-title" data-mrk_mst_idx="${row.MRK_MST_IDX }">
                            				<c:out value="${row.MRK_MST_BRAND_NM }"/>
                            			</a>
                            		</td>
                            		<td><ui:formatDate value="${row.MRK_MST_REG_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            		<td>
										<select>
											<option <c:if test="${row.MRK_MST_USE_YN eq 'Y'}"> selected data-mrk_mst_use_yn="Y" </c:if>>사용</option>
											<option <c:if test="${row.MRK_MST_USE_YN eq 'N'}"> selected data-mrk_mst_use_yn="N" </c:if>>미사용</option>
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
                </table><!-- // table -->

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->

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
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/makerManagerForm.do", "target":"_self", "method":"post"}).submit();
    });
	
	//저장 버튼 클릭 이벤트
	$(document).on("click",	"#goRegist",function() {
		
		var data = new Array();
    	$("#makerList").find("tr").each(function(i){
    		var obj = new Object();
			var $tr = $(this).find(".list-title");
			obj.MRK_MST_IDX = $tr.data("mrk_mst_idx");
			obj.MRK_MST_USE_YN = $(this).find("select :selected").val() == "사용" ? 'Y' : 'N';
			data.push(obj);
		});
    	
		$("#selectedMakerList").val(JSON.stringify(data));
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/site/makerManagerListModify.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
		
	});
	
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#searchMakerNm", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/makerManagerList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/makerManagerList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 제조사명 클릭 시 수정 페이지 이동
    goEdit = function (idx)
    {
    	var $frm = $("#frm");
    	$frm.find("input[name='MRK_MST_IDX']").val(idx);
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/makerManagerEdit.do", "target":"_self", "method":"post"}).submit();
    };
    
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
					"action" : "<c:out value="${serverDomain}" />/am/site/makerManagerListExcelDownload.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
});
//-->
</script>

</body>
</html>
