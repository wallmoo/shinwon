<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">${Code.PRODUCT_GUIDE_NM[commandMap.gCode]}</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">검색</h4>

			<div class="right">
				<a href="javascript:search();" class="button button-b"><span>검색</span></a>
				<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
			</div>
		</div>

		<div class="section-form"><!-- section-form-a -->

        <form id="searchForm" name="searchForm">
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            <input type="hidden" name="searchYn" value="Y" />
            
			<div class="form-group">
				<label class="label"><span>카테고리</span></label>
				<div class="field">
					<select id="searchMgzMstCtg" name="searchMgzMstCtg" class="select" title="카테고리">
						<option value="">전체</option>
							<c:forEach items="${categoryList}" var="data">
								<option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchMgzMstCtg}" g="selected"/>>
									<c:out value="${data.CMN_COM_NM}"/>
								</option> 
							</c:forEach> 
					</select>
				</div>
				<label class="label"><span>제목</span></label>
				<div class="field">
					<input type="text" class="text long" id="searchMgzMstTitle" name="searchMgzMstTitle" value="<c:out value="${commandMap.searchMgzMstTitle }" />" />
				</div>
			</div>
		</form>
		
		</div><!-- // section-form-a -->


		<div class="title-box">
			<h4 class="title">리스트</h4>
		</div>

				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: 15%;" />
							<col style="width: auto;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><c:out value="${item.RNUM }" /></td>
								    <td><c:out value="${item.MGZ_MST_CTG}" /></td>
								    <td><a href="javascript:getProductMgzAdd('<c:out value="${item.MGZ_MST_IDX}" />^<c:out value="${item.MGZ_MST_CTG}" />^<c:out value="${item.MGZ_MST_TITLE}" />')"><c:out value="${item.MGZ_MST_TITLE}" /></a></td>
								    <td><ui:formatDate value="${item.MGZ_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
								</tr>
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<c:if test="${param.searchYn eq 'Y'}">
						    	<tr>
									<td colspan="4">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    	</c:if>
						    	<c:if test="${param.searchYn ne 'Y'}">
						    	<tr>
									<td colspan="4">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
						    	</c:if>
						    </c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div><!-- // col list -->

                <form id="frm" name="frm">
                     <input type="hidden" name="BRD_GDS_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchMgzMstCtg" value="${commandMap.searchMgzMstCtg}" />
					<input type="hidden" name="searchMgzMstTitle" value="${commandMap.searchMgzMstTitle}" />  
                    <input type="hidden" name="searchYn" value="Y" />
                
				<div class="pagination"><!-- pagination -->
					<ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->

				<div class="bbs-status"><!-- bbs status -->
					<div class="page">
						Page : <strong class="em"><c:out value="${paging.cPage }" /></strong> / <c:out value="${paging.totalPageCount }" /> page
					</div>
					<div class="sort">
						 Total : <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>
					</div>
				</div><!-- // bbs status -->
                </form>

		<div class="section-button-popup"><!-- section button -->
			<a href="#none" id="closePopup" class="button button-b"><span>닫기</span></a>
		</div>
		
	</div><!-- // contents -->

</div><!-- // container -->



<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {

    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });

    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchEmagazinePopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchEmagazinePopup.do", "target":"_self", "method":"post"}).submit();
    };

 	// 선택 클릭 이벤트
    getProductMgzAdd = function (emgzArry) 
    {
    	var myArray;
    	
    	myArray = emgzArry.split('^');
		
		var params = {"MGZ_MST_IDX":myArray[0], "MGZ_MST_CTG":myArray[1], "MGZ_MST_TITLE":myArray[2]};
    	
    	if(	window.opener.fnResultEMgz(params) )    	
    		self.close();
    };
 	
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});
 	
});
//]]>
</script>
</body>
</html>
