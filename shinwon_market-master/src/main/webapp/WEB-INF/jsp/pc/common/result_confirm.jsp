<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
<c:choose>
<c:when test="${!empty closeMsg}">
<script type="text/javascript">
    $(document).ready(function () {
        alert("${closeMsg }");
    <c:if test="${!empty parentReload}">
	    <c:choose>
	    	<c:when test="${!empty returnUrl}">
				//$(opener.document).find("#frm").attr({action:"${returnUrl}"}).submit();
				opener.document.location.href = "${returnUrl}";
	    	</c:when>
	    	<c:otherwise>
	    		parent.opener.location.reload();
	    		<c:if test="${!empty parentParentReload}">
	    			parent.opener.opener.location.reload();
	    		</c:if>
	    	</c:otherwise>
	    </c:choose>
    </c:if>
    <c:if test="${!empty parentFunction}">
    	//parent.opener.parentFunction();
    	opener.${parentFunction}('${parentFunctionParam1}','${parentFunctionParam2}','${parentFunctionParam3}');
	</c:if>    
    
	<c:if test="${!empty openerReload}">
		opener.location.reload();
	</c:if>
        window.close();
    });
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
    $(document).ready(function () {
        <c:if test="${not empty confirmMsg}">
            var confirmYn = confirm("${confirmMsg }");
            if(confirmYn) { 
            	$("#frmExec").attr('action','${yesReturnUrl }'); 
            } else {
            	$("#frmExec").attr('action','${noReturnUrl }');
            }
        </c:if>
        
		<c:if test="${not empty messages}">
			alert("${messages}");
		</c:if>

        <c:if test="${not empty script}">
            <c:out value="${script}" escapeXml="false"/>
        </c:if>
        $("#frmExec").submit();
    });
</script>
<form id="frmExec" name="frmExec" method="${not empty methodType ? methodType : 'post'}">
<div style="display: none;">
    <%-- <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="${selectMenuCode }"/> --%>
    <c:forEach items="${commandMap}" var="item">
        <c:if test="${item.key ne 'BM_IDX' }">
            <c:set var="arrayCnt" value="${fn:indexOf(item.value, 'Ljava.lang.String')}" />

            <c:choose>
                <c:when test="${arrayCnt > 0}">
                     <c:forEach items="${item.value}" var="val">
                        <input type="hidden" id="${item.key }" name="${item.key}" value="${fn:trim(val)}"/>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <input type="hidden" id="${item.key }" name="${item.key}" value="${fn:trim(item.value)}"/>
                </c:otherwise>
            </c:choose>
    </c:if>
    </c:forEach>
</div>
</form>
</c:otherwise>
</c:choose>