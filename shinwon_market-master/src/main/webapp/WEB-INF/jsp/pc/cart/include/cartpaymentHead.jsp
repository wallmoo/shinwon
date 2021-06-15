<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<colgroup>
    <col style="width: auto;" />
    <col style="width: 12%;" />
    <col style="width: 8%;" />
    <col style="width: 12%;" />
    <col style="width: 12%;" />
    <col style="width: 16%;" />
</colgroup>
<thead>
    <tr>
        <th scope="col"><span>상품/옵션 정보</span></th>
        <th scope="col"><span>판매가</span></th>
        <th scope="col"><span>수량</span></th>
        <th scope="col"><span>즉시할인금액</span></th>
        <th scope="col"><span>주문예정금액</span></th>
        <th scope="col">
        	<span>
        		<c:choose>
        			<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_GET_IT_NOW_CD}">
        				<%-- 겟잇나우인 경우 --%>
        				방문예약정보
        			</c:when>
        			<c:otherwise>
        				배송비
        			</c:otherwise>
        		</c:choose>
        	</span>
        </th>
    </tr>
</thead>