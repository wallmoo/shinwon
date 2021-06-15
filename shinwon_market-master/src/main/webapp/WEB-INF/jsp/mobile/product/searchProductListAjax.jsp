<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<table class="table-d table-col table-search" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
	<caption>상품코드, 상품명, 판매가격, 선택으로 구성된 상품검색 목록입니다.</caption>
	<colgroup>
	<col style="width: 18%;">
	<col style="width: auto;">
	<col style="width: 22%;">
	<col style="width: 14%;">
	</colgroup>
	<thead>
	    <tr>
	        <th scope="col">상품코드</th>
	        <th scope="col">상품명</th>
	        <th scope="col">판매가격</th>
	        <th scope="col">선택</th>
	    </tr>
	</thead>
	<tbody>
 				<c:choose>
			<c:when test="${not empty list}">
				<c:forEach var="list" items="${list }" varStatus="status">
					<tr>
          						<td><c:out value="${list.PRD_MST_CD }" /></td>
						<td class="text-left">
 									<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${list.PRD_MST_CD }" />" target="_self"><c:out value="${list.PRD_MST_NM }" />
						</td>
						<td>
							<p class="price-before">
								<c:choose>
									<c:when test="${list.PRD_MST_ERP_DSP_PRC > 0}">
										<span class="blind">판매가</span><fmt:formatNumber value="${list.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" />원
									</c:when>
									<c:otherwise>
										<span class="blind">판매가</span><fmt:formatNumber value="${list.ERP_MST_SELL_PRC }" groupingUsed="true" />원
									</c:otherwise>
								</c:choose>
							</p>
							<p class="price-after">
							    <span class="blind">할인가</span><fmt:formatNumber value="${list.PRD_MST_PRICE }" groupingUsed="true" />원
							    </p>
						</td>
						<td><a href="javascript:fnResultProduct('<c:out value="${list.PRD_MST_CD }" />');" class="button small">선택</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">
      						<p class="no-more">
          						검색결과가 없습니다
      						</p>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table><!-- // table-d -->

<div class="section-pagination mb20"><!-- section pagination -->
	<ui:frontpaging paging="${paging }" jsFunction="goPage" />
</div><!-- // section pagination -->
	
<script type="text/javascript">
//<![CDATA[
$(function(){
	
}); //function
//]]>
</script>