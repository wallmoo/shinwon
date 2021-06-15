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

                <h2 class="title"><span>쿠폰발행내역</span></h2>
                
                <h3 class="title"><span>제휴쿠폰발행내역</span></h3>

				<form id="searchForm" name="searchForm">                
	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th><span>쿠폰번호</span></th>
	                            <td>
	                                <span><c:out value="${commandMap.CPN_MST_IDX}"/></span>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>쿠폰종류</span></th>
	                            <td>제휴</td>
	                        </tr>
	                        <tr>
	                            <th><span>고객쿠폰명</span></th>
	                            <td>
	                               	<span><c:out value="${commandMap.CPN_MST_TITLE}"/></span>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
                </form>
                
				<h3 class="title"><span>쿠폰발급 받은 회원 목록</span></h3>
               	<form id="frm" name="frm">
               		<input type="hidden" name="CPN_MST_IDX" id="CPN_MST_IDX" value="${commandMap.CPN_MST_IDX}" />
                    <input type="hidden" name="CPN_MST_YN" id="CPN_MST_YN" value="${commandMap.CPN_MST_YN}" />
                    <input type="hidden" name="searchCpnMstGbn" value="<c:out value="${commandMap.searchCpnMstGbn }"/>"/>
                    <input type="hidden" name="searchCpnMstTitle" value="<c:out value="${commandMap.searchCpnMstTitle }"/>"/>
                    <input type="hidden" name="searchCpnMstIdx" value="<c:out value="${commandMap.searchCpnMstIdx }"/>"/>
                    <input type="hidden" name="searchCpnMstIsuGbn" value="<c:out value="${commandMap.searchCpnMstIsuGbn }"/>"/>
                    <input type="hidden" name="searchCpnMstShopType" value="<c:out value="${commandMap.searchCpnMstShopType }"/>"/>
                    <input type="hidden" name="searchCpnMstUseYn" value="<c:out value="${commandMap.searchCpnMstUseYn }"/>"/>
                    <input type="hidden" name="searchCpnMstSeDt" value="<c:out value="${commandMap.searchCpnMstSeDt }"/>"/>
                    <input type="hidden" name="searchCpnMstStDt" value="<c:out value="${commandMap.searchCpnMstStDt }"/>"/>
                    <input type="hidden" name="searchCpnMstEdDt" value="<c:out value="${commandMap.searchCpnMstEdDt }"/>"/>         
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                
               		<div class="grid section-button-list">
	                 	<div class="col-1-2 text-left">
		                 	<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
		                  	<span class="pages">
		                  		(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
		                  	</span>
						</div>		
						<div class="col-1-2 text-right">
	                        <a href="#none" id="goList" class="button small"><span>목록</span></a>
	                    </div>
	         		</div>
        		</form>
			 	<table class="table-col table-b">
                	<colgroup>
                    	<col style="width: 10%;" />
                    	<col style="width: 15%;" />
                    	<col style="width: 15%;" />
                     	<col style="width: 30%;" />
                    	<col style="width: 30%;" />                            
                  	</colgroup>
                   	<thead>
                  		<tr>
                      		<th>번호</th>
                         	<th>이름</th>
                         	<th>아이디</th>
                          	<th>발급일</th>
                           	<th>사용일</th>
                       	</tr>
                 	</thead>
                    <tbody id="list-field">
                      	<c:choose>
							<c:when test="${not empty list }">
                                <c:set var="listNum" value="${paging.listNum}" />
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
                               			<td><c:out value="${listNum }"/></td>		                               		
                               			<td>
                               				<c:out value="${fn:substring(row.MEM_MST_MEM_NM,0,fn:length(row.MEM_MST_MEM_NM)-1) }*"/>
                               			</td>
                               			<td>		
                               				<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.CPN_MEM_ID }" />');"><c:out value="${row.CPN_MEM_ID }"/></a>
                               			</td>
                               			<td>                                                 
                               				<ui:formatDate value="${row.CPN_MEM_ISU_DT }" pattern="yyyy.MM.dd HH:mm:ss"/> 
                               			</td>
                               			<td>
                               				<c:out value="${row.CPN_PTN_SHP_NO }"/>
                           				</td>
                               			<td>
                                            <ui:formatDate value="${row.CPN_MEM_USE_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
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
               	</table>
	               	
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
	// 탭 클릭 이벤트
    $(document).on("click", "#goEventEntryList", function () {
        $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueAdm.do", "target" : "_self", "method" : "post"}).submit();
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueDetOff.do", "target":"_self", "method":"post"}).submit();
    };
    $(document).on("click", "#goList", function () 
    {
    	var $frm = $("#searchForm"); 
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueList.do", "target":"_self", "method":"post"}).submit();
   	});
    
});
</script>

</body>
</html>
