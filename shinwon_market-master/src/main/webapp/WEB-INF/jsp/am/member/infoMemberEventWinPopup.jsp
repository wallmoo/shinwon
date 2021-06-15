<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/admin_ark/js/ark_manufacturer.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/js/search.js"></script>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>당첨내역</span></h3>
            </div><!-- // push-guide -->
            
            <table class="table-col table-a">
	            <colgroup>
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	            </colgroup>
                <thead>
                	<tr>
                		<th scope="col">번호</th>
						<th scope="col">경품명</th>
						<th scope="col">당첨여부</th>
						<th scope="col">메모</th>
                	</tr>
                </thead>
                <tbody>
                    <c:choose>
					    <c:when test="${not empty list}">
					    	<c:set var="listNum" value="1" />
					    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><c:out value="${listNum}"/></td>
									<td><c:out value="${item.WIN_INF_NM }" /></td>
									<td> 당첨 </td>		
									<td><c:out value="${item.EVT_WIN_MAN_CPY }" /> <!--<c:out value="${item.EVT_WIN_SUB_CPY }" /> <c:out value="${item.EVT_WIN_ATN }" />--> </td>						
								</tr>
								<c:set var="listNum" value="${listNum+1}" />
					    	</c:forEach>
					    </c:when>
					    <c:otherwise>
					    	<tr>
								<td colspan="4" style="text-align:center;">이벤트 당첨내역이 없습니다.</td>
							</tr>
					    </c:otherwise>
					</c:choose>
                </tbody>
			</table>	         
	        
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
$(function () 
{   
    $(document).on("click","#closePopup",function()
    {
        self.close();
    });
    
});


</script>
</body>
</html>
