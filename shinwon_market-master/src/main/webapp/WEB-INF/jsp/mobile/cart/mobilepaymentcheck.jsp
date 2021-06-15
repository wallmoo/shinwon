<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/jquery.validate.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/common.js"></script>


<c:choose>
<c:when test="${ param.LGD_RESPCODE eq '0000' }">
<form name="LGD_PAYINFO" id="LGD_PAYINFO" method="post" action="/mobile/cart/payment.do">
<c:forEach items="${parameterList}" var="p">
<c:out value="${p}" escapeXml="false"/>
</c:forEach>
<input type="text" name="LGD_PAYKEY" id="LGD_PAYKEY" value="<c:out value="${param.LGD_PAYKEY}"/>"/>
<input type="text" name="LGD_RESPCODE" id="LGD_RESPCODE" value="<c:out value="${param.LGD_RESPCODE}"/>"/>
<input type="text" name="LGD_RESPMSG" id="LGD_RESPMSG" value="<c:out value="${param.LGD_RESPMSG}"/>"/>
<%
System.out.println("########" + request.getParameter("LGD_PAYKEY"));
System.out.println("########" + request.getParameter("LGD_RESPCODE"));
System.out.println("########" + request.getParameter("LGD_RESPMSG"));
%>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$('#LGD_PAYINFO').submit();
});
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
	alert('결제요청 처리 실패 [<c:out value="${param.LGD_RESPCODE}"/>] : <c:out value="${param.LGD_RESPMSG}"/>');
</script>
</c:otherwise>
</c:choose>

</body>
</html>    