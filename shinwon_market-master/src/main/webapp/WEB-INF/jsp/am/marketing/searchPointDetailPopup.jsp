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
                <h3 class="title"><span>포인트 적립/차감 대상확인</span></h3>
            </div><!-- // push-guide -->
            
            <table class="table-row table-a">
	            <colgroup>
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <thead>
                    <tr>
                        <th>구분</th>
                        <th>내역</th>
                        <th>관리자메모</th>
                        <th>개별포인트</th>
                    </tr>
                </thead>
	            <tbody id="pointMemberList">
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:set var="listNum" value="${paging.listNum}" />
                        <c:forEach var="item" items="${list }" varStatus="status">
                        <c:if test="${status.index eq 0 }">
                        <tr>
                            <td>
                                <c:if test="${item.PIT_MST_GBN eq 'P' }">적립</c:if>
                                <c:if test="${item.PIT_MST_GBN eq 'M' }">차감 </c:if>
                            </td>
                            <td><c:out value="${item.MEM_PIT_BRK_DWN_NM }" /></td>
                            <td><c:out value="${item.PIT_MST_MEMO }" /></td>
                            <td><c:out value="${item.PIT_MST_PIT }" /></td>                             
                        </tr>
                        
                        </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                         
                        <tr>
                            <td colspan="4">포인트 내역이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
	        </table>
	        
	        <h4 class="title"><span>대상 인원</span></h4>
	        
	        <table class="table-row table-a">
	            <colgroup>
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <thead>
                    <tr>
                        <th>번호</th>
                        <th>고객명</th>
                        <th>아이디</th>
                    </tr>
                </thead>
	            <tbody id="pointMemberList">
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:set var="listNum" value="${paging.listNum}" />
                        <c:forEach var="item" items="${list }" varStatus="status">
                        <tr>
                            <td><c:out value="${status.index +1 }" /></td>
                            <td><c:out value="${item.MEM_MST_MEM_NM }" /></td>
                            <td><c:out value="${item.MEM_PIT_MEM_ID }" /></td>
                        </tr>
                        <c:set var="listNum" value="${listNum-1}" />
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3">포인트 내역이 없습니다.</td>
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
$(document).ready(function () 
{
    
    $(document).on("click","#closePopup",function()
    {
        self.close();
    });
    
});
</script>
</body>
</html>
