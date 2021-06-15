<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<script type="text/javascript">
   $(function () {
        <c:if test="${not empty alertMsg}">
            alert("${alertMsg }");
        </c:if>
        
        $("#frmExec").submit();
    });
</script>
<form id="frmExec" name="frmExec" method="${not empty methodType ? methodType : 'post'}" action="${returnUrl}">
<div style="display: none;">
<%--     <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="${selectMenuCode }"/> --%>
    <c:forEach items="${resultMap}" var="item">
        <input type="hidden" id="${item.key }" name="${item.key}" value="${fn:trim(item.value)}"/>
    </c:forEach>
</div>
</form>