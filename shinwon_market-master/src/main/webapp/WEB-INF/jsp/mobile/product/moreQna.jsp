<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
						<c:when test="${not empty listProductQna}">
						<c:set var="listNum" value="${pagingQna.listNum}" />
						<c:forEach var="item" items="${listProductQna }" varStatus="status"> 
							<tr class="head">
								<td>
									<a href="javascript:;" class="js-collapse-toggler">
									<c:if test="${item.BRD_INQ_REPLY_CD ne 'Y'}">
										<span class="icon confirm"><em>확인</em></span>
									</c:if>
									<c:if test="${item.BRD_INQ_REPLY_CD eq 'Y'}">
										<span class="icon answer"><em>답변</em></span>
									</c:if>
										${item.BRD_INQ_TITLE }
									</a>
								</td>
							</tr>
							<c:if test="${item.BRD_INQ_REG_ID eq commandMap.MEM_MST_MEM_ID }" >
							<tr class="body">
								<td>
									<p class="title">
										<span class="id"><c:out value="${fn:substring(item.BRD_INQ_REG_ID,0,(fn:length(item.BRD_INQ_REG_ID)-4))}" />****</span> &nbsp; 
										| &nbsp; <span class="date"><ui:formatDate value="${item.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd" /></span>
										
									</p>
									<p class="content">
									${item.BRD_INQ_CONTENTS }
									</p>
									<p class="content">${item.BRD_INQ_REPLY_CONTENTS }
									</p>
								</td>
							</tr>
							</c:if>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<script>
								$("#moreQna").remove();
//								alert('모든 상품문의를 불러왔습니다.');
							</script>
						</c:otherwise>
						</c:choose>    
<c:if test="${ commandMap.cPage eq paging.lastPageNoOnPageList }">
<script>
$("#moreQna").remove();
//alert('모든 상품문의를 불러왔습니다.');
</script>
</c:if>						
