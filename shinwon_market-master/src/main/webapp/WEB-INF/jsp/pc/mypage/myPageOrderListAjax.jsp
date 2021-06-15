<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h4>
	최근 주문내역
<a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myShoppingList.do" class="more"><span class="blind">더 보기</span></a>
<span class="desc">최근 6개월동안 주문하신 내역입니다.</span>
</h4>
<table class="table-product table-my-order mt10"><!-- table-product -->
<caption>주문일시, 주문번호, 상품정보, 총결제금액으로 구성된 쇼핑몰 주문내역 목록입니다.</caption>
<colgroup>
<col style="width: 15%;" />
<col style="width: 20%;" />
<col style="width: auto;" />
<col style="width: 20%;" />
</colgroup>
<thead>
<tr>
    <th scope="col"><span>주문일시</span></th>
    <th scope="col"><span>주문번호</span></th>
    <th scope="col"><span>상품정보</span></th>
    <th scope="col"><span>총 결제금액</span></th>
</tr>
</thead>
<tbody id="tbodyOrderList">
	<c:choose>
		<c:when test="${not empty orderList }">
			<c:forEach var="row" items="${orderList }">
				<tr>
				    <td class="date"><ui:formatDate value="${row.ORD_MST_ORD_DT }" pattern="yyyy.MM.dd"/></td>
				    <td class="order-number">
					<p><a href="javascript:goOrderView('<c:out value="${row.ORD_MST_CD }" />');"><c:out value="${row.ORD_MST_CD }"/></a></p>
				    </td>
				    <td class="product">
					<p class="subject">
					    <a href="javascript:goOrderView('<c:out value="${row.ORD_MST_CD }" />');"><c:out value="${row.PRD_MST_NM }"/></a>
					</p>
					<c:if test="${row.ORD_PRD_CNT gt 1}">
						<p class="desc">
							외 <fmt:formatNumber value="${row.ORD_PRD_CNT - 1}" type="number" />건
						</p>
					</c:if>
				    </td>
				    <td class="price">
					<p><span class="warning"><fmt:formatNumber value="${row.ORD_MST_PAY_PRC}" type="number" /></span>원</p>
				    </td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
			    <td colspan="4">
				<p class="message no-more">
				    6개월동안 주문내역이 없습니다.
				</p>
			    </td>
			</tr>
		</c:otherwise>
	</c:choose>
</tbody>
</table><!-- // table-product -->

<div class="section-pagination mt20"><!-- section pagination -->
<ui:frontpaging paging="${paging }" jsFunction="goPage" />
</div><!-- // section pagination -->

<input type="hidden" name="cPage" value="${commandMap.cPage }"/>