<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:choose>
    	<c:when test="${fn:length(detailList) > 1}">
    		<dl class="materials">
    			<c:forEach var="item" items="${detailList}" varStatus="i">
    				<a href="" id="detail_${item.BRD_SHG_IDX}"></a>
    				<dt><c:out value="${item.BRD_SHG_TITLE}"/></dt>
					<dd>
						<c:if test="${not empty item.fileList }">
	                    	<c:forEach var="fileRow" items="${item.fileList }" varStatus="i">
	                    		<span>
	                           		<img src="${img_domain}${fileRow.CMM_FLE_ATT_PATH }${fileRow.CMM_FLE_SYS_NM }" alt="<c:out value="${fileRow.CMN_FLE_ALT_TXT}"/>"/>
	                           </span>
	                        </c:forEach>
	                    </c:if>
					<p>
						<c:out value="${item.BRD_SHG_CONTENTS}" escapeXml="false"/>
					</p>
					</dd>				    				
    			</c:forEach>
    		</dl>
    	</c:when>
    	<c:otherwise>
    		<c:forEach var="item" items="${detailList}" varStatus="i">
				<c:out value="${item.BRD_SHG_CONTENTS}" escapeXml="false"/>				    				
   			</c:forEach>
    	</c:otherwise>
    </c:choose>
    