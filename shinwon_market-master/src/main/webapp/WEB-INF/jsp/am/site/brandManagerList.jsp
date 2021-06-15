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

                <h2 class="title"><span>브랜드 관리</span></h2>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>검색</span></h3>
                </div><!-- // section-title -->
				
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
	                        <tr><!-- row -->
	                            <th><span>브랜드명</span></th>
	                            <td colspan="3">
	                                <input type="text" class="text" name="searchBrandNm" id="searchBrandNm" value="<c:out value="${commandMap.searchBrandNm }"/>" placeholder="검색어 입력." maxlength="15"/>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>브랜드안내설정</span></th>
	                            <td>
	                            	<input type="radio" id="stateA" name="searchBrandDplState" class="radio" <c:if test="${empty commandMap.searchBrandDplState }">checked="checked"</c:if> value=""/>
		                            <label for="stateA">전체</label>
		                            <input type="radio" id="stateB" name="searchBrandDplState" class="radio" <c:if test="${commandMap.searchBrandDplState eq 'Y' }">checked="checked"</c:if> value="Y"/>
		                            <label for="stateB">노출</label>
		                            <input type="radio" id="stateC" name="searchBrandDplState" class="radio" <c:if test="${commandMap.searchBrandDplState eq 'N' }">checked="checked"</c:if> value="N"/>
		                            <label for="stateC">미노출</label>
	                            </td>
	                            <th><span>사용설정</span></th>
	                            <td>
	                            	<input type="radio" id="stateA" name="searchBrandUseYn" class="radio" <c:if test="${empty commandMap.searchBrandUseYn }">checked="checked"</c:if> value=""/>
		                            <label for="stateA">전체</label>
		                            <input type="radio" id="stateB" name="searchBrandUseYn" class="radio" <c:if test="${commandMap.searchBrandUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
		                            <label for="stateB">사용</label>
		                            <input type="radio" id="stateC" name="searchBrandUseYn" class="radio" <c:if test="${commandMap.searchBrandUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
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
				
				<div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>목록</span></h3>
                </div><!-- // section-title -->
                
				<form id="frm" name="frm">
					<input type="hidden" name="selectedBrandList" id="selectedBrandList">
                    <input type="hidden" name="BND_MST_IDX" value="" />
                    <input type="hidden" name="VDR_MST_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchBrandNm" value="<c:out value="${commandMap.searchBrandNm }"/>"/>
                    <input type="hidden" name="searchBrandUseYn" value="<c:out value="${commandMap.searchBrandUseYn }"/>"/>
                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">  
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
	                    </div>
                   		<div class="col-1-2 text-right">
                   		
                   			<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX ne Code.VENDOR_ADMINISTRATOR_IDX}">
                   			
                   			 <button  id="btn_delete" class="button small"><span>브랜드 삭제</span></button>
                   			<a href="javascript:;" id="goRegist" class="button small primary"><span>저장</span></a>
                   			<a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                       		<a href="#none;" id="goForm" class="button small primary"><span>등록</span></a>
                       		</c:if>
                   		</div>
	                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                <colgroup>
                    <col style="width: auto;" />                
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                </colgroup>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkbox checkAll"></th>                     
                        <th>NO</th>
                        <th>입점사명</th>
                        <th>브랜드코드</th>
                        <th>브랜드명</th>
                        <th>서비스센터</th>
                        <th>등록일</th>
                        <th>브랜드 안내 설정</th>
                        <th>사용설정</th>
                    </tr>
                </thead>
                <tbody id="brand_list_wrapper">
					<c:choose>
                       	<c:when test="${not empty list }">
							<c:set var="listNum" value="${paging.listNum}" />
                            <c:forEach var="row" items="${list }" varStatus="i">
                                <tr>
									<td>
                                        <input type="checkbox" class="checkbox checkRow" value="<c:out value="${row.BND_MST_IDX }"/>"/>								
									</td>		                                
                           			<td><c:out value="${listNum }"/></td>
                           			<td><a href="javascript:goMst('<c:out value="${row.VDR_MST_IDX }"/>');"><c:out value="${row.VDR_MST_NM }"/></a></td>
                           			<td><c:out value="${row.BND_MST_IDX }"/></td>
                           			<td>
                           				<a href="javascript:goEdit('<c:out value="${row.BND_MST_IDX }"/>','<c:out value="${row.VDR_MST_IDX }"/>');" class="list-title">
                           					<c:out value="${row.BND_MST_BRAND_NM }"/>
                           				</a>
                           			</td>
									<td><c:out value="${row.BND_MST_SERV }"/></td>
									<td><ui:formatDate value="${row.BND_MST_REG_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                           			<td>
                           				<select class="select" data-org="${row.BND_MST_DPL_STATE}">
                                            <option value="Y" <c:if test="${row.BND_MST_DPL_STATE eq 'Y'}">selected="selected"</c:if>>노출</option>
                           					<option value="N" <c:if test="${row.BND_MST_DPL_STATE eq 'N'}">selected="selected"</c:if>>미노출</option>
                           				</select>
                           			</td>
                           			<td>
                           				<select class="select" data-org="${row.BND_MST_USE_YN}">
                           					<option value="Y" <c:if test="${row.BND_MST_USE_YN eq 'Y'}">selected="selected"</c:if>>사용</option>
                           					<option value="N" <c:if test="${row.BND_MST_USE_YN eq 'N'}">selected="selected"</c:if>>미사용</option>
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
	            </form>

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
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerForm.do", "target":"_self", "method":"post"}).submit();
    });
	
	//저장 버튼 클릭 이벤트
    $("#goRegist").on("click", function(){
        
    	var $listElem = $('#brand_list_wrapper tr');
    	var paramData = [];
    	for(var i = 0; i < $listElem.length; i ++) {
    		debugger;
    		var $curTr = $($listElem[i]);
    		
    		var brandObject = new Object();
    		
    		brandObject.BND_MST_IDX = $('td:nth-child(3)', $curTr).text();
    		brandObject.BND_MST_USE_YN =  $('td:nth-child(8) select option:selected', $curTr).val();
    		brandObject.BND_MST_USE_YN_ORG = $('td:nth-child(8) select', $curTr).data("org");
    		brandObject.BND_MST_DPL_STATE =  $('td:nth-child(7) select option:selected', $curTr).val();
    		brandObject.BND_MST_DPL_STATE_ORG = $('td:nth-child(7) select', $curTr).data("org");
    		
    		paramData.push(brandObject);
    	}
    	
    	$("#selectedBrandList").val(JSON.stringify(paramData))
    	
		$("#frm").attr({
			"action" : "<c:out value="${serverDomain}" />/am/site/brandListModify.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
        
    });
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#searchBrandNm", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 브랜드명 클릭 시 수정 페이지 이동
    goEdit = function (idx, vendorIdx)
    {
    	var $frm = $("#frm");
    	$frm.find("input[name='BND_MST_IDX']").val(idx);
    	$frm.find("input[name='VDR_MST_IDX']").val(vendorIdx);
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerEdit.do", "target":"_self", "method":"post"}).submit();
    };
    
    goMst = function (idx)
    {
    	var $frm = $("#frm");
    	$frm.find("input[name='VDR_MST_IDX']").val(idx);
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/vendorManagerEdit.do", "target":"_self", "method":"post"}).submit();
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
					"action" : "<c:out value="${serverDomain}" />/am/site/brandManagerListExcelDownload.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
    
    

    //체크박스
    $.checkBoxSelect("checkAll", "checkRow");
    
    
    
     // 브랜드 선택 삭제 
	 $('#btn_delete').click(function(){

		 var $frm = $('#frm');
		 var num = 0 ;
		 var checkList = $frm.find('input[type=checkbox].checkRow');
		 for(var i=0;i<checkList.length;i++){
			 var dom = $(checkList[i]);
			 if(dom.is(":checked")){
				 num = num *1 +1 ;
			 }
		 }
		 
		 if ( num == 0 ){
			 alert( '삭제할 1개 이상의 브랜드를 선택하세요' );
			 return ;
		 }		 
		 

		 
		if (confirm("브랜드를 삭제하시겠습니까?")) {
			
			 var $frm = $('#frm');
			 var num = 0 ;
			 var checkList = $frm.find('input[type=checkbox].checkRow');
			 
			 for(var i=0;i<checkList.length;i++){
				 var dom = $(checkList[i]);
				 if(dom.is(":checked")){
					 $frm.append('<input type="hidden" name="targetBndList" value="'+dom.val()+'">');
				 }
			 }

			 $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerDeleteList.do", "target":"_self", "method":"post"}).submit();				 

		}     		 

	 });        
    
    
});
//-->
</script>

</body>
</html>
