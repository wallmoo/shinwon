<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="c_dlv_type2" value=""/>

<c:choose>
	<c:when test="${c_dlv_type eq 'sysRetail'}">
		<c:set var="c_dlv_type2" value="normal"/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_sysRetail }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_sysRetail }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_sysRetail }"/>
		<c:set var="cart_total_common" value="${cart_total_sysRetail }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_sysRetail }"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'vendor'}">
		<c:set var="c_dlv_type2" value="normal"/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_vendor }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_vendor }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_vendor }"/>
		<c:set var="cart_total_common" value="${cart_total_vendor }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_vendor }"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'get1'}">
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_get1 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_get1 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_get1 }"/>
		<c:set var="cart_total_common" value="${cart_total_get1 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_get1 }"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'get2'}">
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_get2 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_get2 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_get2 }"/>
		<c:set var="cart_total_common" value="${cart_total_get2 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_get2 }"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'get3'}">
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_get3 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_get3 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_get3 }"/>
		<c:set var="cart_total_common" value="${cart_total_get3 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_get3 }"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'service'}">	
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_service }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_service }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_service }"/>
		<c:set var="cart_total_common" value="${cart_total_service }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_service }"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'long24'}">
		<c:set var="c_lng_div" value="24"/>
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_long24 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_long24 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_long24 }"/>
		<c:set var="cart_total_common" value="${cart_total_long24 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_long24 }"/>
		<c:set var="cart_expected_lng_prc_common" value="${cart_expected_lng_prc_long24 }"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'long36'}">
		<c:set var="c_lng_div" value="36"/>
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_long36 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_long36 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_long36 }"/>
		<c:set var="cart_total_common" value="${cart_total_long36 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_long36 }"/>
		<c:set var="cart_expected_lng_prc_common" value="${cart_expected_lng_prc_long36 }"/>
	</c:when>
</c:choose>

<colgroup>
    <col style="width: 3%;" />
    <col style="width: auto;" />
    <col style="width: 11%;" />
    <col style="width: 6%;" />
    <col style="width: 9%;" />
    <col style="width: 11%;" />
    <col style="width: 10%;" />
    <col style="width: 10%;" />
    <col style="width: 8%;" />
</colgroup>
<thead>
    <tr>
        <th scope="col">
        	<input type="checkbox" class="selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked" title="모두선택"/>
        </th>
        <th scope="col"><span>상품/옵션 정보</span></th>
        <th scope="col"><span>판매가</span></th>
        <th scope="col"><span>수량</span></th>
        <th scope="col"><span>즉시할인금액</span></th>
        <th scope="col"><span>주문예정금액</span></th>
        <th scope="col"><span>추가혜택
        	<c:if test="${c_dlv_type ne 'service'}">
            	<a href="#benefitAdd" class="link-guide js-tooltip" data-size="250x360"><em class="blind">안내</em></a>
            </c:if>
        </span></th>
        <th scope="col"><span>배송비</span></th>
        <th scope="col"><span>선택</span></th>
    </tr>
</thead>
<tfoot>
    <tr>
        <td colspan="9" class="total-price">
            <div class="article order">
                <p class="tit">주문상품금액</p>
                <p class="price"><span id="span_cart_prd_amount_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_prd_amount_common}" type="number" /></span>원</p>
            </div>
            <span class="reckoning minus"><em class="blind">빼기</em></span>
            <div class="article discount">
                <p class="tit">즉시할인금액</p>
                <p class="price"><span id="span_cart_ist_cpn_prc_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_ist_cpn_prc_common}" type="number" /></span>원</p>
            </div>
            <span class="reckoning plus"><em class="blind">더하기</em></span>
            <div class="article ship">
                <p class="tit">배송비</p>
                <p class="price"><span id="span_cart_delivery_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_delivery_common}" type="number" /></span>원</p>
            </div>
            <span class="reckoning value"><em class="blind">결과</em></span>
            <div class="article final">
                <p class="tit">결제예정금액</p>
                <p class="price"><span id="span_cart_total_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_total_common}" type="number" /></span>원</p>
                <c:if test="${not empty c_lng_div}">
            		<p>
	            		<span style="color:#fd1f27">(월 청구예상금액 <span id="span_cart_expected_lng_prc_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_expected_lng_prc_common}" type="number" pattern="###,###"/></span>원)</span>
	            	</p>
            	</c:if>
                <p class="desc">(적립예정 포인트 : <span id="span_cart_reserve_mileage_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_reserve_mileage_common}" type="number" /></span>P)</p>
            </div>
        </td>
    </tr>
</tfoot>