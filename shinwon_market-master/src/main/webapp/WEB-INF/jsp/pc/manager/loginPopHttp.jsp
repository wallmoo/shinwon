<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--[if IE]><![endif]-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]>   <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" class="no-js ie ie6 lteie7"> <![endif]-->
<!--[if IE 7]>      <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" class="no-js ie ie7 lteie7"> <![endif]-->
<!--[if IE 8]>      <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" class="no-js ie ie8"> <![endif]-->
<!--[if IE 9]>      <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" class="no-js ie ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" class="no-js"> <!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery-2.1.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
  $(function () {
	  <c:choose>
 		<c:when test="${not empty commandMap.linkUrl}"><%-- 비회원 구매인 경우 --%>
	  		 var url = "<c:out value="${commandMap.linkUrl}"/>";						     
	  		 opener.location.href = url;
 		</c:when>
 		<c:otherwise>
		     opener.name='parent';
		     
	    	 $('#frmExec').attr({'action':decodeURIComponent(encodeURIComponent("${commandMap.url}")),'method':'post','target':'parent'}).submit();
 		</c:otherwise>
 	 </c:choose>
 	
	 self.close(); 
  });
  //-->
</script>
<form id="frmExec" name="frmExec" method="${not empty methodType ? methodType : 'post'}">
<div style="display: none;">
<%--     <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="${selectMenuCode }"/> --%>
    <c:forEach items="${commandMap}" var="item">
        <input type="hidden" id="${item.key }" name="${item.key}" value="${fn:trim(item.value)}"/>
    </c:forEach>
</div>
</form>
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>
