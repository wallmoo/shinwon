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
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="robots" content="noindex, nofollow" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
    window.onload = function()
    {
        document.frm.submit();
    }
</script>
<title>webpay 가맹점 test page</title>
</head>
<body>
    <!-- TEST -->
    <c:if test="${CST_PLATFORM eq 'test'}">
    <form name="frm" method="post" action="http://testsp.easypay.co.kr/ep8/card/DirectCardCertReqAction.do" >
    </c:if>
    
    <!-- REAL -->
    <c:if test="${CST_PLATFORM ne 'test'}">
    <form name="frm" method="post" action="https://sp.easypay.co.kr/ep8/card/DirectCardCertReqAction.do">
    </c:if>
        <input type="hidden" id="sp_mall_id"        name="sp_mall_id"        value="<%=request.getParameter("sp_mall_id")        %>" /> <!--[필수]가맹점ID -->
        <input type="hidden" id="sp_mall_nm"        name="sp_mall_nm"        value="<%=request.getParameter("sp_mall_nm")        %>" /> <!--[필수]가맹점명 -->
        <input type="hidden" id="sp_order_no"       name="sp_order_no"       value="<%=request.getParameter("sp_order_no")       %>" /> <!--[필수]가맹점 주문번호(인증응답) -->
        <input type="hidden" id="sp_product_nm"     name="sp_product_nm"     value="<%=request.getParameter("sp_product_nm")     %>" /> <!--[선택]상품명 -->
        <input type="hidden" id="sp_product_amt"    name="sp_product_amt"    value="<%=request.getParameter("sp_product_amt")    %>" /> <!--[필수]상품금액 -->
        <input type="hidden" id="sp_charset"        name="sp_charset"        value="<%=request.getParameter("sp_charset")        %>" /> <!--[선택]가맹점 페이지 charset(EUC-KR/UTF-8) -->
        <input type="hidden" id="sp_return_url"     name="sp_return_url"     value="<%=request.getParameter("sp_return_url")     %>" /> <!--[필수]가맹점 리턴URL -->
        <input type="hidden" id="sp_card_cd"        name="sp_card_cd"        value="<%=request.getParameter("sp_card_cd")        %>" /> <!--[필수]카드사 코드(인증응답) -->
        <input type="hidden" id="sp_install_period" name="sp_install_period" value="<%=request.getParameter("sp_install_period") %>" /> <!--[필수]할부개월(인증응답) -->
        <input type="hidden" id="sp_currency"       name="sp_currency"       value="<%=request.getParameter("sp_currency")       %>" /> <!--[필수]통화코드(수정불가) -->
        <input type="hidden" id="sp_vp_pgid"        name="sp_vp_pgid"        value="<%=request.getParameter("sp_vp_pgid")        %>" /> <!--[선택]ISP PGID -->
        <input type="hidden" id="sp_kmotion_useyn"  name="sp_kmotion_useyn"  value="<%=request.getParameter("sp_kmotion_useyn")  %>" /> <!--[선택]국민 앱카드 결제화면 노출여부 Y:앱카드결제 노출) -->
        <input type="hidden" id="sp_save_useyn"     name="sp_save_useyn"     value="<%=request.getParameter("sp_save_useyn")     %>" /> <!--[선택]세이브결제 유무 -->
        <input type="hidden" id="sp_point_useyn"    name="sp_point_useyn"    value="<%=request.getParameter("sp_point_useyn")    %>" /> <!--[선택]카드사 포인트 사용유무 -->
        <input type="hidden" id="sp_noint_yn"       name="sp_noint_yn"       value="<%=request.getParameter("sp_noint_yn")       %>" /> <!--[선택]무이자 유무 -->
        <input type="hidden" id="sp_buss_no"        name="sp_buss_no"        value="<%=request.getParameter("sp_buss_no")        %>" /> <!--[선택]가맹점 사업자번호 -->
        <input type="hidden" id="sp_card_join_no"   name="sp_card_join_no"   value="<%=request.getParameter("sp_card_join_no")   %>" /> <!--[선택]카드사 가맹점 번호 -->
        <input type='hidden' id="sp_user_phone"     name="sp_user_phone"     value="<%=request.getParameter("sp_user_phone")     %>" /> <!--[선택]고객휴대폰번호(ISP 결제 시 필수) -->
        <input type='hidden' id="sp_window_type"    name="sp_window_type"    value="<%=request.getParameter("sp_window_type")    %>" /> <!--[선택]윈도우 타입(iframe/submit) -->
        <input type='hidden' id="sp_app_scheme"     name="sp_app_scheme"     value="<%=request.getParameter("sp_app_scheme")     %>" /> <!--[선택]가맹점APP scheme -->
    </form>
  </body>
</html>
