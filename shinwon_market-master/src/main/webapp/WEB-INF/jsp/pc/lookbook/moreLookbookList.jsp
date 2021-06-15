<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  					<c:choose>
					<c:when test="${not empty listLookBook}">
					<c:forEach var="item" items="${listLookBook }" varStatus="status">
						<div class="lookbook-item<c:if test="${ item.RNUM%4 eq 0 }"> fourth</c:if>">
							<a href="/pc/lookbook/lookbook.do?idx=${item.LKB_MST_IDX }">
								<img src="${cdnDomain}${item.LKB_MST_IMG1_ATT_PATH}${item.LKB_MST_IMG1_SYS_NM}" alt="${item.LKB_MST_TITLE }">
								<p>
								<c:choose>
						        <c:when test="${fn:length(item.LKB_MST_TITLE) > 30}">
					           		<c:out value="${fn:substring(item.LKB_MST_TITLE,0,30)}"/>...
					           	</c:when>
					           	<c:otherwise>
					            	<c:out value="${item.LKB_MST_TITLE }"/>
					           	</c:otherwise>
					          	</c:choose>
					          	</p>
							</a>
						</div>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<script>
							$("#moreLookbookList").remove();
//							alert('모든 룩북을 불러왔습니다.');
						</script>
					</c:otherwise>
					</c:choose>
<c:if test="${ commandMap.cPage eq paging.lastPageNoOnPageList }">
<script>
	$("#moreLookbookList").remove();
//	alert('모든 룩북을 불러왔습니다.');
</script>
</c:if>							