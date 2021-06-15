<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${not empty planList }">
		<c:forEach var="planList" items="${planList }" varStatus="i">
			<li>
				<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/planProductList.do?PLN_MST_IDX=<c:out value="${planList.PLN_MST_IDX }" />','_self');" >
					<img data-original="<c:out value="${cdnDomain}" /><c:out value="${planList.CMM_FLE_ATT_PATH}" /><c:out value="${planList.CMM_FLE_SYS_NM}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" height=225 alt="<c:out value="${planList.CMN_FLE_ALT_TXT}" />" />
					<strong class="tx_ti"><c:out value="${fn:length(planList.PLN_MST_TITLE) > 30 ? fn:substring(planList.PLN_MST_TITLE,0,30) : planList.PLN_MST_TITLE}" /></strong>
				</a>
			</li>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<li class="no_list">
			<span>진행중인 기획전이 없습니다.</span>
		</li>
	</c:otherwise>
</c:choose>