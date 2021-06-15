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

                <h2 class="title"><span>관리자계정관리</span></h2>

                <h3 class="title"><span>검색</span></h3>

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
                                <th><span>키워드검색</span></th>  
                                <td colspan="3">  
                                    <select class="select" name="searchType" id="searchType">
                                        <option value="S_ALL" <c:if test="${commandMap.searchType eq 'S_ALL'}">selected="selected"</c:if>>전체</option>
                                        <option value="S_ID" <c:if test="${commandMap.searchType eq 'S_ID' }">selected="selected"</c:if>>아이디</option>
                                        <option value="S_NAME" <c:if test="${commandMap.searchType eq 'S_NAME' }">selected="selected"</c:if>>이름</option>
                                        <option value="S_TEL" <c:if test="${commandMap.searchType eq 'S_TEL' }">selected="selected"</c:if>>휴대폰번호 뒷자리</option>
                                    </select>
                                    <input type="text" class="text large" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>" placeholder="검색어 입력"/>
                                </td>
                            </tr>
                            <tr>
                            	<th><span>관리자권한</span></th>
                                <td>
                                    <select class="select" name="searchAuthority" id="searchAuthority">
                                        <option value="">전체</option>
                                        <c:if test="${not empty authList }">
                                            <c:forEach var="authRow" items="${authList }" varStatus="i">
                                                <option value="<c:out value="${authRow.AUT_MST_IDX }"/>" <c:if test="${authRow.AUT_MST_IDX eq commandMap.searchAuthority }">selected="selected"</c:if>><c:out value="${authRow.AUT_MST_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>
                                <th><span>상태</span></th>
                                <td> 
                                    <input type="radio" id="stateA" name="searchAdmMstState" class="radio" <c:if test="${empty commandMap.searchAdmMstState }">checked="checked"</c:if> value=""/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" id="stateB" name="searchAdmMstState" class="radio" <c:if test="${commandMap.searchAdmMstState eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                    <label for="stateB">사용</label>
                                    <input type="radio" id="stateC" name="searchAdmMstState" class="radio" <c:if test="${commandMap.searchAdmMstState eq 'N' }">checked="checked"</c:if> value="N"/>
                                    <label for="stateC">미사용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->  
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:search();" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
 				
 				<h3 class="title"><span>목록</span></h3>
 				
                <form id="frm" name="frm">
                    <input type="hidden" name="ADM_MST_ID" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchAuthority" value="<c:out value="${commandMap.searchAuthority }"/>"/>
                    <input type="hidden" name="searchAdmMstState" value="<c:out value="${commandMap.searchAdmMstState }"/>"/>
                
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">  
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">
                            	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                        <div class="col-1-2 text-right">
                   			 <button  id="btn_delete" class="button small"><span>계정 삭제</span></button>                        
                       		<a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                            <a href="#none;" id="goForm" class="button small primary"><span>등록</span></a>
                        </div>
                     </div><!-- // 목록 상단 버튼 -->


                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />                        
						<col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                        <col style="width: 8%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>&nbsp;</th>                        
                            <th>NO</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>관리자 권한</th>
                            <th>업무구분</th>
                            <th>등록일</th>
                            <th>사용설정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list }">
                                <c:set var="listNum" value="${paging.listNum}" />
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
										<td>
	                                        <input type="checkbox" class="checkbox checkRow" value="<c:out value="${row.ADM_MST_ID }"/>"/>								
										</td>	
                                        <td><c:out value="${listNum }"/></td>
                                        <td class="al"><a href="#none" class="list-title"><c:out value="${row.ADM_MST_ID }"/></a></td>
                                        <td><c:out value="${row.ADM_MST_NM }"/></td>
                                        <td><c:out value="${row.ADM_AUT_NM }"/></td>
                                        <td><c:out value="${row.ADM_MST_TYPE_NM }"/></td>
                                        <td><ui:formatDate value="${row.ADM_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                        <td><c:out value="${row.ADM_MST_STATE eq 'Y'?'사용':'미사용' }"/></td>
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
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/basicManagerForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='ADM_MST_ID']").val($(this).text());
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/basicManagerEdit.do", "target":"_self", "method":"post"}).submit();
    });

    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e){
        if(e.keyCode == 13)  
        {
            search();
        }
    });      
    
    // 검색 버튼 클릭 이벤트  
    search = function()  
    {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/basicManagerList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/basicManagerList.do", "target":"_self", "method":"post"}).submit();
    };
    
    
    // 계정 선택 삭제 
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
			 alert( '삭제할 1개 이상의 사용자 계정을 선택하세요' );
			 return ;
		 }		 
		 

		 
		if (confirm("사용자 계정을 삭제하시겠습니까?")) {
			
			 var $frm = $('#frm');
			 var num = 0 ;
			 var checkList = $frm.find('input[type=checkbox].checkRow');
			 
			 for(var i=0;i<checkList.length;i++){
				 var dom = $(checkList[i]);
				 if(dom.is(":checked")){
					 $frm.append('<input type="hidden" name="targetAdmList" value="'+dom.val()+'">');
				 }
			 }

			 $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/basicManagerDeleteList.do", "target":"_self", "method":"post"}).submit();				 

		}     		 

	 });       
    
    
});
</script>

</body>
</html>
