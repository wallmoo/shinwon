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

            <h2 class="title"><span>태그그룹 목록</span></h2>

            <h3 class="title"><span>검색</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr><!-- row -->
                            <th><span>키워드 검색</span></th>
                            <td>
                                <select class="select" name="searchType" id="searchType">
                                    <option value="S_ALL" <c:if test="${commandMap.searchType eq 'S_ALL'}">selected="selected"</c:if>>전체</option>
                                    <option value="S_TITLE" <c:if test="${commandMap.searchType eq 'S_TITLE' }">selected="selected"</c:if>>태그 그룹명</option>
                                    <option value="S_DESC" <c:if test="${commandMap.searchType eq 'S_DESC' }">selected="selected"</c:if>>그룹 설명</option>
                                </select>
                                <input type="text" name="searchKeyword" id="searchKeyword" class="text large" value="${commandMap.searchKeyword }" placeholder="검색어 입력" />
                            </td>
                        </tr>
                        <tr>
                            <th><span>사용설정</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchUseYN" class="radio" <c:if test="${empty commandMap.searchUseYN or commandMap.searchUseYN eq ''}">checked="checked"</c:if> value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="searchUseYN" class="radio" <c:if test="${commandMap.searchUseYN eq 'Y'}">checked="checked"</c:if> value="Y" />
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="searchUseYN" class="radio" <c:if test="${commandMap.searchUseYN eq 'N'}">checked="checked"</c:if> value="N" />
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="javascript:goSearch();" class="button small primary"><span>검색</span></a>
            </div>

            <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="${paging.cPage }" />
                <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                <input type="hidden" name="searchUseYN" value="<c:out value="${commandMap.searchUseYN }"/>" />
                <input type="hidden" name="TAG_GRP_ID" value=""/>
                <h3 class="title"><span>목록</span></h3>

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                        <span class="pages">
                            (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                        </span>
                    </div>

                    <div class="col-1-2 text-right">
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                        <a href="#none" id="productDelete" class="button small"><span>삭제</span></a>
                    <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 6%;" />
                        <col style="width: 20%;" />
                        <col style="width: 8%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 8%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll" id="allCheck"></th>
                            <th>NO</th>
                            <th>태그 그룹명</th>
                            <th>태그 등록 수</th>
                            <th>태그 그룹 설명</th>
                            <th>등록일</th>
                            <th>사용설정</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <c:choose>
                                <c:when test="${not empty TAG_GROUP_LIST }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${TAG_GROUP_LIST }" varStatus="i">
                                        <tr>
                                            <c:set var = "use_status" value = "${row.TAG_GRP_STATUS}"/>
                                            
                                            <td class="checkInp"><input type="checkbox" class="checkbox" /></td>
                                            <td><c:out value="${row.RNUM }"/></td>
                                            <td class="al">
                                                <a href="#none" class="list-title" data-tag_grp_id="<c:out value="${row.TAG_GRP_ID }"/>" data-view_type="view">
                                                    <c:out value="${row.TAG_GRP_TITLE }"/>
                                                </a>
                                            </td>
                                            <td><c:out value="${row.TAG_COUNT }"/></td>
                                            <td class="al"><c:out value="${row.TAG_GRP_DES}"/></td>
                                            <td><ui:formatDate value="${row.TAG_GRP_REG_DT}" pattern="yyyy-MM-dd"/></td>
                                            <td><c:out value="${row.TAG_GRP_STATUS eq 'Y' ? '사용' : '미사용'}"/></td>
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

                        </tr>
                        </tbody>
                </table>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <!-- <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a> -->
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

// 검색
goSearch = function(){
	var $searchForm = $("#searchForm");  
	$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
    $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/tag/tagGroupList.do", "target":"_self", "method":"post"}).submit(); 
};

$(function(){
	// 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/tag/tagGroupForm.do", "target":"_self", "method":"post"}).submit();
    });
	
    //$.checkBoxSelect("checkAll", "checkRow");
	
    
    // 상세페이지 이동
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='TAG_GRP_ID']").val($this.data("tag_grp_id"));
        var url = "";
        
        url = "<c:out value="${serverDomain}" />/am/tag/tagGroupEdit.do";
        
        $frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
    });
	
});
//-->
</script>
<script>
   	//전체선택 체크박스 클릭
     $(function(){  
     	$("#allCheck").click(function(){
     	if($("#allCheck").prop("checked")) {
     		$("input[type=checkbox]").prop("checked",true);
     	} else {
     		$("input[type=checkbox]").prop("checked",false);
     	}
    	})
   });
   	
     // 키워드 검색 엔터 이벤트
  	$('#searchForm').find("input").not(".primary").keydown(function (e){
  		if(e.keyCode == 13)
  		{
  			goSearch();
  		}
  	});
</script>

</body>
</html>
