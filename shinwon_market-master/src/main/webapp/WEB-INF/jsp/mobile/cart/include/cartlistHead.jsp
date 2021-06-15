<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:set var="c_dlv_type_nm" value=""/>    
<c:set var="c_dlv_type2" value=""/>

<c:choose>
	<c:when test="${c_dlv_type eq 'sysRetail'}">
		<c:set var="c_dlv_type_nm" value="프라이스킹"/>
		<c:set var="c_dlv_type2" value="normal"/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_sysRetail }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_sysRetail }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_sysRetail }"/>
		<c:set var="cart_total_common" value="${cart_total_sysRetail }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_sysRetail }"/>
		<c:set var="c_dlv_type_prc_nm" value="결제예정금액"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'vendor'}">
		<c:set var="c_dlv_type_nm" value="파트너"/>
		<c:set var="c_dlv_type2" value="normal"/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_vendor }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_vendor }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_vendor }"/>
		<c:set var="cart_total_common" value="${cart_total_vendor }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_vendor }"/>
		<c:set var="c_dlv_type_prc_nm" value="결제예정금액"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'get1'}">
		<c:set var="c_dlv_type_nm" value="겟잇나우"/>
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_get1 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_get1 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_get1 }"/>
		<c:set var="cart_total_common" value="${cart_total_get1 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_get1 }"/>
		<c:set var="c_dlv_type_prc_nm" value="총 결제예정금액"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'get2'}">
		<c:set var="c_dlv_type_nm" value="겟잇나우"/>
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_get2 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_get2 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_get2 }"/>
		<c:set var="cart_total_common" value="${cart_total_get2 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_get2 }"/>
		<c:set var="c_dlv_type_prc_nm" value="총 결제예정금액"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'get3'}">
		<c:set var="c_dlv_type_nm" value="겟잇나우"/>
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_get3 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_get3 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_get3 }"/>
		<c:set var="cart_total_common" value="${cart_total_get3 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_get3 }"/>
		<c:set var="c_dlv_type_prc_nm" value="총 결제예정금액"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'service'}">
		<c:set var="c_dlv_type_nm" value="클린킹"/>
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_service }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_service }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_service }"/>
		<c:set var="cart_total_common" value="${cart_total_service }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_service }"/>
		<c:set var="c_dlv_type_prc_nm" value="총 결제예정금액"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'long24'}">
		<c:set var="c_dlv_type_nm" value="장기할부"/>
		<c:set var="c_lng_div" value="24"/>
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_long24 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_long24 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_long24 }"/>
		<c:set var="cart_total_common" value="${cart_total_long24 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_long24 }"/>
		<c:set var="cart_expected_lng_prc_common" value="${cart_expected_lng_prc_long24 }"/>
		<c:set var="c_dlv_type_prc_nm" value="총 결제예정금액"/>
	</c:when>
	<c:when test="${c_dlv_type eq 'long36'}">
		<c:set var="c_dlv_type_nm" value="장기할부"/>
		<c:set var="c_lng_div" value="36"/>
		<c:set var="c_dlv_type2" value=""/>
		<c:set var="cart_prd_amount_common" value="${cart_prd_amount_long36 }"/>
		<c:set var="cart_ist_cpn_prc_common" value="${cart_ist_cpn_prc_long36 }"/>
		<c:set var="cart_delivery_common" value="${cart_delivery_long36 }"/>
		<c:set var="cart_total_common" value="${cart_total_long36 }"/>
		<c:set var="cart_reserve_mileage_common" value="${cart_reserve_mileage_long36 }"/>
		<c:set var="cart_expected_lng_prc_common" value="${cart_expected_lng_prc_long36 }"/>
		<c:set var="c_dlv_type_prc_nm" value="총 결제예정금액"/>
	</c:when>
</c:choose>