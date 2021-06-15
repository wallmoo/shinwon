<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table class="table-a table-mileage mt10"><!-- table-a -->
<caption>유형, 구분, 내용, 포인트, 발생 일자, 주문번호로 구성된 적립/차감 포인트 목록입니다.</caption>

<thead>
    <tr>
        <th scope="col"><span>유형</span></th>
        <th scope="col"><span>구분</span></th>
        <th scope="col"><span>내용</span></th>
        <th scope="col"><span>포인트</span></th>
        <th scope="col"><span>발생 일자</span></th>
        <th scope="col"><span>주문번호</span></th>
    </tr>
</thead>
<tbody>
<c:choose>
	<c:when test="${not empty mileageList }">
		<c:forEach var="mileageList" items="${mileageList }" varStatus="i">
			<tr>
			    <td class="type"><c:out value="${mileageList.MLG_SHP_GB_NM }"/></td>
			    <td class="part"><c:out value="${mileageList.MLG_USE_GB_NM }"/></td>
			    <td class="detail"><c:out value="${mileageList.MLG_KND_GB_NM }"/></td>
			    <td class="mileage">
			    	<c:choose>
			    		<c:when test="${mileageList.MLG_USE_GB == 'A' || mileageList.MLG_USE_GB == 'C'}">
			    			<fmt:formatNumber value="${mileageList.MLG_ERP_MLG }" groupingUsed="true" />
			    		</c:when>
			    		<c:otherwise>
			    			-<fmt:formatNumber value="${mileageList.MLG_ERP_MLG }" groupingUsed="true" />
			    		</c:otherwise>
			    	</c:choose>
			    </td>
			    <td class="date"><ui:formatDate value="${mileageList.MLG_ERP_DT }" pattern="yyyy.MM.dd"/></td>
			    <td class="order-number">
			    	<a href="<c:out value="${frontDomain}" />/pc/mypage/myShoppingInfo.do?ORD_MST_CD=<c:out value="${mileageList.MLG_ORDER_CD }"/>">
			    	<c:out value="${mileageList.MLG_ORDER_CD }"/>
			    	</a>
			    </td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
            <td colspan="6">
                <p class="message no-more">
                    포인트 내역이 없습니다.
                </p>
            </td>
        </tr>
	</c:otherwise>
</c:choose>
</tbody>
</table><!-- // table-a -->
<h5 class="title">포인트 유의사항</h5>
<ul class="list list-a small">
    <li>상품을 구매하는 회원에게 구매금액의 일정 비율을 포인트로 적립하며, 주문취소 또는 반품의 경우에는 포인트가 회수됩니다.</li> 
    <li>포인트는 적립일로부터 3년간 유효하며, 유효기간이 경과한 적립금은 자동적으로 소멸됩니다.</li>
    <li>포인트는 10,000원 이상부터 사용가능하며  당월 소멸 예정 포인트는 1원부터 사용 가능합니다.</li>
</ul>

<div class="section-pagination mt20"><!-- section pagination -->
<ui:frontpaging paging="${paging }" jsFunction="goPage" />
</div><!-- // section pagination -->

<input type="hidden" name="cPage" value="${commandMap.cPage }"/>

