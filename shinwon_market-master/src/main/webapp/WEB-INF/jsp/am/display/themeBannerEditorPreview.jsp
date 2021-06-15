<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
    </head>
    
    <body>
    	<c:choose>
    	<c:when test="${not empty row.BNR_MST_CONTENTS }">
    		${row.BNR_MST_CONTENTS }
    	</c:when>
    	<c:otherwise>	
    		등록된 에디터 배너가 없습니다.
    	</c:otherwise>
    	</c:choose>
    	
    </body>
    
</html>    