<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table class="table-d table-col table-my-order" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
<caption>주문일, 주문번호, 상품정보, 주문금액, 선택으로 구성된 주문 내역 목록입니다.</caption>
<colgroup>
    <col style="width: 15%;">
    <col style="width: 15%;">
    <col style="width: auto;">
    <col style="width: 20%;">
    <col style="width: 12%;">
</colgroup>
<thead>
    <tr>
        <th scope="col">주문일</th>
        <th scope="col">주문<br />번호</th>
        <th scope="col">상품정보</th>
        <th scope="col">주문금액</th>
        <th scope="col">선택</th>
    </tr>
</thead>
<tbody>
	<c:choose>
	    <c:when test="${not empty list}">
	    	<c:forEach var="data" items="${list }" varStatus="status">
	    		<tr>
	    			<c:if test="${data.ORD_RNK eq 1 }">
                        <td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="date"><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></td>
                        <td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="number">
                            <c:out value="${data.ORD_MST_CD }" />
                        </td>
                       </c:if>
	                <td class="text-left">
						<p class="subject">
							<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${data.PRD_MST_CD }" />" target="_self"><c:out value="${data.PRD_MST_NM }" /></a>
						</p>
						<c:if test="${not empty data.OPT_DTL_NM or not empty data.subPrdList}">
							<p class="option">
								옵션 :
								<c:if test="${not empty data.optionList}">
									<c:out value="${data.OPT_DTL_NM}" />
									<c:if test="${not empty data.subPrdList}">
										&nbsp;/&nbsp;
									</c:if>
								</c:if>
								<%-- 선택옵션 상품 리스트 --%>
								<c:if test="${not empty data.subPrdList}">
									<c:forEach var="subPrd" items="${data.subPrdList}" varStatus="i">
										${subPrd.OPT_DTL_NM}
										(
																			<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
																				+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
																			</c:if>
																		<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
										${i.last ? '' : '/&nbsp;'}	
									</c:forEach>
								</c:if>
							</p>
						</c:if>
	                </td>
	                <td class="price">
	                    <p><fmt:formatNumber value="${data.ORD_PRD_ORD_PRC + data.SUM_SUB_OPTION_ADD_PRC}" type="number" />원</p>
	                </td>
	                <c:if test="${data.ORD_RNK eq 1 }">
		                <td class="action" rowspan="<c:out value="${data.ORD_MST_CNT}"/>">
		                    <a href="javascript:resultOrderCd('<c:out value="${data.ORD_MST_CD }"/>');" class="button primary small">선택</a>
		                </td>
	                </c:if>
	            </tr>
	    	</c:forEach>
	    </c:when>
	    <c:otherwise>
	    	<tr>
                <td colspan="5" class="no-more">
                    <p class="message no-more">
                        최근 6개월간 주문내역이 존재하지 않습니다.
                    </p>
                </td>
            </tr>
	    </c:otherwise>
	</c:choose>
</tbody>
</table><!-- // table-d -->

<form id="searchOrdForm" name="searchOrdForm">
<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
<input type="hidden" name="ORD_MST_CD" value=""/> 
<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
         
<div class="section-pagination mb20"><!-- section pagination -->
	<ui:frontpaging paging="${paging }" jsFunction="goPage2" />
</div><!-- // section pagination -->
</form>

<script>
<!-- //

//-->
</script>
</body>

</html>