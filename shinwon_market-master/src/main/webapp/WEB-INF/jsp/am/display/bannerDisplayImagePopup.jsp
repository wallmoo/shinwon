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
                <h3 class="title"><span>배너 미리보기</span></h3>
            </div><!-- // push-guide -->
            
            <c:if test="${not empty fileList }">
	        	<c:forEach var="row" items="${fileList }" varStatus="i">
	        		<div class="title-box">
						<img src="<c:out value="${img_domain}${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
					</div>
	        	</c:forEach>
	        </c:if>
            
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
