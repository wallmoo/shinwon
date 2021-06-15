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

                <h2 class="title"><span>APP 버전관리</span></h2>
					 
                <h3 class="title"><span>목록</span></h3>
                
                 <form id="frm" name="frm"> 
	               	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                	<input type="hidden" id="APP_VER_IDX" name="APP_VER_IDX" value="" />
                  	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>		
						
	                    <div class="col-1-2 text-right">
	                        <a href="javascript:goForm();" class="button small primary"><span>등록</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: 5%;" />
							<col style="width: 10%;" />
							<col style="width: auto;" />
							<col style="width: 10%;" />
							<col style="width: 15%;" />
							<col style="width: 10%;" />
	                    </colgroup>
	                    <thead>
							<tr>
								<th>NO</th>
								<th>구분</th>
								<th>제목</th>
								<th>버전</th>
								<th>등록일</th>
								<th>상태</th>
							</tr>
						</thead>
	                    <tbody>
	                        <c:choose>
							    <c:when test="${not empty list}">
							    	<c:set var="listNum" value="${paging.listNum}" />
							    	<c:forEach var="item" items="${list }" varStatus="status">
									<tr>
										<td><c:out value="${listNum }" /></td>
										<td><c:out value="${item.APP_VER_GBN eq 'A' ? '안드로이드' : 'IOS' }"/></td>
										<td class="left"><a href="javascript:goView('<c:out value="${item.APP_VER_IDX }" />');"><c:out value="${item.APP_VER_NM }" /></a></td>
										<td><c:out value="${item.APP_VER_NO }"/></td>
										<td><ui:formatDate value="${item.APP_VER_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
										<td>
											<c:out value="${item.APP_VER_YN eq 'Y' ? '사용' : '미사용' }"/>
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
	var $frm = $("#frm");
	
    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/app/appVersionManageList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // APP VERSION관리 상세페이지 이동
    goView = function (appVerIdx)
    {
        $frm.find("#APP_VER_IDX").val(appVerIdx);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/app/appVersionManageEdit.do", "target":"_self", "method":"post"}).submit();
    };

    // APP VERSION관리 등록페이지 이동
    goForm = function ()
    {
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/app/appVersionManageForm.do", "target":"_self", "method":"post"}).submit();
    };

});
//-->
</script>

</body>
</html>
