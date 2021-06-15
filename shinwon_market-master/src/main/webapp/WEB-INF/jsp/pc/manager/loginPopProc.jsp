<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
<script type="text/javascript">
  $(function () {
	  <c:if test="${not empty alertMsg}">
      	  alert("${alertMsg }");
  	  </c:if>
  	  
 	  $frm = $("#frm");
  	  <c:choose>
  	  	<c:when test="${not empty failUrl}">
  	  		$frm.attr({action:"<c:out value="${failUrl}"/>"}).submit();
  	  	</c:when>
  	  	<c:otherwise>
  	  		$frm.attr({action:"<c:out value="${locationDomain}"/>/pc/manager/loginPopHttp.do"}).submit();
  	  	</c:otherwise>
  	  </c:choose>
  });
  //-->
</script>
<script language="JavaScript" src="/pc/global/xtractor/loginDummy.do?LOGIN_ID=<c:out value="${resultMap.DUMMY_MEM_ID }"/>"></script>
<form name="frm" id="frm" method="post">
	<input type="hidden" name="url" id="url" value="<c:out value="${resultMap.url }"/>"/>
	<input type="hidden" name="locationProtocol" id="locationProtocol" value="${locationProtocol}"/>
	<input type="hidden" name="MEM_MST_MEM_GBN" value="<c:out value="${resultMap.MEM_MST_MEM_GBN }"/>"/>
	<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${resultMap.MEM_MST_MEM_ID }"/>"/>
	<input type="hidden" name="path" id="path" value="<c:out value="${resultMap.path }"/>"/>
</form>
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>
