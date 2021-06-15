<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="section-price"><!-- section-price -->
    <div class="ct core">
        <div class="tit">
            <span class="office small"><c:out value="${c_dlv_type_nm}"/> 배송상품</span>
            <span class="large"><c:out value="${c_dlv_type_prc_nm}"/></span>
        </div>
        <div class="price">
        	<strong id="span_cart_total_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_total_common}" type="number" /></strong>원
            <a href="#priceDetail_${c_dlv_type}" class="js-toggler up-down"><i><span class="blind"><c:out value="${c_dlv_type_nm}"/> 배송상품 결제예정금액 <em>열기</em></span></i></a>
        </div>
    </div>
    
   	<c:if test="${c_dlv_type eq 'service' or c_dlv_type eq 'get1' or c_dlv_type eq 'get2' or c_dlv_type eq 'get3' or c_dlv_type eq 'long24' or c_dlv_type eq 'long36'}">
   		<c:if test="${c_dlv_type eq 'long24' or c_dlv_type eq 'long36'}"><%-- 장기할부인 경우 --%>
   			<p class="text-right month">
		        <strong class="small">(월 청구예상금액 <span id="span_cart_expected_lng_prc_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_expected_lng_prc_common}" type="number" pattern="###,###"/></span>원)</strong>
		    </p>
   		</c:if>
   		<p class="text-right">
	        <strong class="small">(적립예정 포인트 : <span id="span_cart_reserve_mileage_${c_dlv_type}" class="span_amt"><fmt:formatNumber value="${cart_reserve_mileage_common}" type="number" /></span>  P)</strong>
	    </p>
   	</c:if>
                
    <div id="priceDetail_${c_dlv_type}" class="desc toggle">
        <table border="0" cellpadding="0" cellspacing="0">
        <caption>주문상품금액, 즉시할인, 배송비로 구성된 결제예정금액 상세 테이블입니다.</caption>
        <tbody>
            <tr>
                <th>주문상품금액</th>
                <td>
                	<strong id="span_cart_prd_amount_${c_dlv_type}" class="span_amt large"><fmt:formatNumber value="${cart_prd_amount_common}" type="number" /></strong>원
                </td>
            </tr>
            <tr>
                <th>즉시할인</th>
                <td>
                	<strong class="large warning">(-)</strong>
                	<strong id="span_cart_ist_cpn_prc_${c_dlv_type}" class="span_amt large warning"><fmt:formatNumber value="${cart_ist_cpn_prc_common}" type="number" /></strong>원
                </td>
            </tr>
            <tr>
                <th>배송비</th>
                <td>
                	<strong class="large">+</strong>
                	<strong id="span_cart_delivery_${c_dlv_type}" class="span_amt large"><fmt:formatNumber value="${cart_delivery_common}" type="number" /></strong>원
                </td>
            </tr>
        </tbody>
        </table>
    </div>
</div><!-- section-price -->