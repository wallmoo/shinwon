												<span class="bubbletip"></span>
												<ul>
												<c:choose>
												<c:when test="${not empty list }">
												<c:forEach var="item" items="${list }" varStatus="status">												
													<li><span class="size-item">${item.PRD_OPT_NM}</span><span class="size-remain<c:if test="${item.STOCK_YN ne 'O'}"> false</c:if>"><span class="sr-only">${item.STOCK_YN}</span></span></li>
												</c:forEach>
												</c:when>
												</c:choose>
												</ul>
