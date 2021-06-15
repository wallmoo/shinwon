<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    			<c:choose>
				<c:when test="${not empty listReputation}">
				<c:set var="listNum" value="${pagingReputaion.listNum}" />
				<c:forEach var="item" items="${listReputation }" varStatus="status"> 
					<li>
						<div class="head">
							<span class="star star-${item.PRD_REV_TOT_STAR } pull-left"><em>별 ${item.PRD_REV_TOT_STAR }개</em></span>
							<span class="pull-right"><span class="id"><c:out value="${fn:substring(item.PRD_REV_REG_ID,0,(fn:length(item.PRD_REV_REG_ID)-4))}" />****</span> 
							| <span class="date"><ui:formatDate value="${item.PRD_REV_REG_DT }" pattern="yyyy.MM.dd" /></span></span>
						</div>
						<div class="body">
							<p class="title">${item.PRD_REV_TITLE }</p>
							<p class="content">
							<c:if test="${not empty item.REP_IMG}">
								<img src="${cdnDomain }${item.REP_IMG}" alt="${item.PRD_REV_TITLE }" /><br><br>
                            </c:if>
								${item.PRD_REV_CONTENTS}
							</p>
						</div>
					</li>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<script>
						$("#moreReputation").remove();
//						alert('모든 상품평을 불러왔습니다.');
					</script>
				</c:otherwise>
				</c:choose>
<c:if test="${ commandMap.cPage eq paging.lastPageNoOnPageList }">
<script>
$("#moreReputation").remove();
//alert('모든 상품평을 불러왔습니다.');
</script>
</c:if>						
