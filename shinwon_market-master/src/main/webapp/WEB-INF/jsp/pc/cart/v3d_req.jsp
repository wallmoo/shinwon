<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="utf-8"%>
<%
/* -------------------------------------------------------------------------- */
/* 캐쉬 사용안함                                                              */
/* -------------------------------------------------------------------------- */
response.setHeader("cache-control","no-cache");
response.setHeader("expires","-1");
response.setHeader("pragma","no-cache");

request.setCharacterEncoding("utf-8");
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=10" />
<meta name="robots" content="noindex, nofollow" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
    window.onload = function()
    {
        document.frm.submit();
    }
</script>
<title>webpay</title>
</head>
<body>
    <c:if test="${CST_PLATFORM eq 'test'}">
    <form name="frm" method="post" action="http://testpg.easypay.co.kr/webpay/card/DirectCardCertReqAction.do" >
	</c:if>
	<c:if test="${CST_PLATFORM ne 'test'}">
	<form name="frm" method="post" action="https://pg.easypay.co.kr/webpay/card/DirectCardCertReqAction.do" >
	</c:if>
        <input type="hidden" id="EP_mall_id"        name="EP_mall_id"        value="<%=request.getParameter("EP_mall_id")        %>" /> <!--[필수]가맹점ID -->
        <input type="hidden" id="EP_mall_nm"        name="EP_mall_nm"        value="<%=request.getParameter("EP_mall_nm")        %>" /> <!--[필수]가맹점명 -->
        <input type="hidden" id="EP_order_no"       name="EP_order_no"       value="<%=request.getParameter("EP_order_no")       %>" /> <!--[필수]가맹점 주문번호(인증응답) -->
        <input type="hidden" id="EP_product_nm"     name="EP_product_nm"     value="<%=request.getParameter("EP_product_nm")     %>" /> <!--[선택]상품명 -->
        <input type="hidden" id="EP_product_amt"    name="EP_product_amt"    value="<%=request.getParameter("EP_product_amt")    %>" /> <!--[필수]상품금액 -->
        <input type="hidden" id="EP_charset"        name="EP_charset"        value="<%=request.getParameter("EP_charset")        %>" /> <!--[선택]가맹점 페이지 charset(utf-8/UTF-8) -->
        <input type="hidden" id="EP_return_url"     name="EP_return_url"     value="<%=request.getParameter("EP_return_url")     %>" /> <!--[필수]가맹점 리턴URL -->
        <input type="hidden" id="EP_card_cd"        name="EP_card_cd"        value="<%=request.getParameter("EP_card_cd")        %>" /> <!--[필수]카드사 코드(인증응답) -->
        <input type="hidden" id="EP_install_period" name="EP_install_period" value="<%=request.getParameter("EP_install_period") %>" /> <!--[필수]할부개월(인증응답) -->
        <input type="hidden" id="EP_currency"       name="EP_currency"       value="<%=request.getParameter("EP_currency")       %>" /> <!--[필수]통화코드(수정불가) -->
        <input type="hidden" id="EP_kvp_pgid"       name="EP_kvp_pgid"       value="<%=request.getParameter("EP_kvp_pgid")        %>" /> <!--[선택]ISP PGID -->
        <input type="hidden" id="EP_kmotion_useyn"  name="EP_kmotion_useyn"  value="<%=request.getParameter("EP_kmotion_useyn")  %>" /> <!--[선택]국민 앱카드 결제화면 노출여부(Y:앱카드결제 노출) -->
        <input type="hidden" id="EP_save_useyn"     name="EP_save_useyn"     value="<%=request.getParameter("EP_save_useyn")     %>" /> <!--[선택]세이브결제 유무 -->
        <input type="hidden" id="EP_point_useyn"    name="EP_point_useyn"    value="<%=request.getParameter("EP_point_useyn")    %>" /> <!--[선택]카드사 포인트 사용유무 -->
        <input type="hidden" id="EP_noint_yn"       name="EP_noint_yn"       value="<%=request.getParameter("EP_noint_yn")       %>" /> <!--[선택]무이자 유무 -->
        <input type="hidden" id="EP_buss_no"        name="EP_buss_no"        value="<%=request.getParameter("EP_buss_no")        %>" /> <!--[선택]가맹점 사업자번호 -->
        <input type="hidden" id="EP_card_join_no"   name="EP_card_join_no"   value="<%=request.getParameter("EP_card_join_no")   %>" /> <!--[선택]카드사 가맹점 번호 -->
    </form>
</body>
</html>
