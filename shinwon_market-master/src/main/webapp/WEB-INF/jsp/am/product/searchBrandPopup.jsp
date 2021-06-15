<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
public String getCheckReqXSSTop(javax.servlet.http.HttpServletRequest req, String parameter, String default_value) {
    String req_value = (req.getParameter(parameter) == null ||  req.getParameter(parameter).equals("")) ? default_value : req.getParameter(parameter);
    req_value = req_value.replaceAll("</?[a-zA-Z][0-9a-zA-Zê°-\uD7A3ã±-ã=/\"\'%;:,._()\\-# ]+>","");
    req_value = req_value.replaceAll(">","");
    req_value = req_value.replaceAll(">","");
    return req_value;
}
%><%
String searchBrandNm = getCheckReqXSSTop(request, "searchBrandNm", "");	//검색어
%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/admin_ark/js/ark_brand.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/js/search.js"></script>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>브랜드 검색</span></h3>
            </div><!-- // push-guide -->
            
	        <form id="searchForm" name="searchForm">
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
	            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				<input type="hidden" name="searchYn" value="Y" />
				<input type="hidden" name="searchBrandUseYn" value="<c:out value="${commandMap.searchBrandUseYn }"/>" />
	        
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 30%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr><!-- row -->
		                    <th><span>브랜드명</span></th>
		                    <td>
		                        <input type="text" class="text search-view" id="searchBrandNm" name="searchBrandNm" value="<%=searchBrandNm %>" />
		                        <div id="brandSearchList" class="search-list">
									<ul id="ark_content_list_brand" class="reset">
	     							</ul>
								</div>
		                    </td>
		                </tr>
		            </tbody>
		        </table><!-- // table -->
		    </form>
		    
		    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                <a href="javascript:search();" class="button small primary"><span>검색</span></a>
            </div><!-- // 검색 하단 버튼 -->
            
            <form id="frm" name="frm">
	            <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                <div class="col-1-2 text-left">
	                    <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                    <span class="pages">
	                    	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                    </span>
	                </div>
	            </div><!-- // 목록 상단 버튼 -->
        	
	        	<table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th>브랜드코드</th>
							<th>브랜드명</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
						    <c:when test="${not empty list}">
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><c:out value="${item.BND_MST_IDX }"/></td>
									<td>
										<a href="javascript:goParent('<c:out value="${item.BND_MST_IDX }" />','<c:out value="${item.BND_MST_BRAND_NM }" />','<c:out value="${item.BND_MST_SERV }" />','<c:out value="${item.VDR_MST_IDX }" />','<c:out value="${item.VDR_MST_NM }" />','<c:out value="${item.BND_MST_BRAND_TYPE}" />');" title="해당 브랜드를 선택합니다">
											<c:out value="${item.BND_MST_BRAND_NM }" />
										</a>
									</td>
								</tr>
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<c:if test="${commandMap.searchYn eq 'Y'}">
						    	<tr>
									<td colspan="2">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    	</c:if>
						    	<c:if test="${commandMap.searchYn ne 'Y'}">
						    	<tr>
									<td colspan="2">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
						    	</c:if>
						    </c:otherwise>
						</c:choose>
	                </tbody>
	            </table><!-- // table -->
            
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
			    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
			    <input type="hidden" name="searchBrandUseYn" value="<c:out value="${commandMap.searchBrandUseYn }"/>" />
			    <input type="hidden" name="searchBrandNm" value="<c:out value="${commandMap.searchBrandNm }"/>" />
		    </form>

            <div class="section-pagination"><!-- section pagination -->
                <h4 class="sr-only">목록 페이징</h4>
                <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div>
            </div><!-- // section pagination -->
	        
			<div class="grid section-button-search"><!-- section button -->
				<a href="#none" id="closePopup" class="button small"><span>닫기</span></a>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () 
{
	
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

        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchBrandPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchBrandPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 입점업체 선택 
    goParent = function (brdMstIdx, brdMstNm, brdMstServ, vdrMstIdx, vrdMstNm,brdType)
    {
    	window.opener.fnResultBrand(brdMstIdx, brdMstNm,brdMstServ, vdrMstIdx, vrdMstNm,brdType);
    	self.close();    	
    };
    
    // 닫기 버튼 클릭
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
        
});


</script>
</body>
</html>