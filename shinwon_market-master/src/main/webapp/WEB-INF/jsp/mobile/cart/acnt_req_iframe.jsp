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
    <form name="frm" method="post" action="http://testsp.easypay.co.kr/ep8/acnt/DirectAcntCertReqAction.do" >
    </c:if>
    
    <!-- REAL -->
    <c:if test="${CST_PLATFORM ne 'test'}">
    <form name="frm" method="post" action="https://sp.easypay.co.kr/ep8/acnt/DirectAcntCertReqAction.do">
    </c:if>
    	<input type="hidden" id="sp_tr_cd"        name="sp_tr_cd"        value="<%=request.getParameter("sp_tr_cd")        %>" />
    	<input type="hidden" id="sp_pay_type"        name="sp_pay_type"        value="<%=request.getParameter("sp_pay_type")        %>" />
    	<input type="hidden" id="sp_tot_amt"        name="sp_tot_amt"        value="<%=request.getParameter("sp_tot_amt")        %>" />
    	<input type="hidden" id="sp_currency"        name="sp_currency"        value="<%=request.getParameter("sp_currency")        %>" />
    	<input type="hidden" id="sp_mall_id"        name="sp_mall_id"        value="<%=request.getParameter("sp_mall_id")        %>" />
    	<input type="hidden" id="sp_mall_nm"        name="sp_mall_nm"        value="<%=request.getParameter("sp_mall_nm")        %>" />
    	<input type="hidden" id="sp_order_no"        name="sp_order_no"        value="<%=request.getParameter("sp_order_no")        %>" />
    	<input type="hidden" id="sp_product_nm"        name="sp_product_nm"        value="<%=request.getParameter("sp_product_nm")        %>" />
    	<input type="hidden" id="sp_product_amt"        name="sp_product_amt"        value="<%=request.getParameter("sp_product_amt")        %>" />
    	<input type="hidden" id="sp_return_url"        name="sp_return_url"        value="<%=request.getParameter("sp_return_url")        %>" />
    	<input type="hidden" id="sp_cash_yn"        name="sp_cash_yn"        value="<%=request.getParameter("sp_cash_yn")        %>" />
    	<input type="hidden" id="sp_cash_issue_type"        name="sp_cash_issue_type"        value="<%=request.getParameter("sp_cash_issue_type")        %>" />
    	<input type="hidden" id="sp_cash_auth_type"        name="sp_cash_auth_type"        value="<%=request.getParameter("sp_cash_auth_type")        %>" />
    	<input type="hidden" id="sp_cash_auth_value"        name="sp_cash_auth_value"        value="<%=request.getParameter("sp_cash_auth_value")        %>" />
    </form>
  </body>
</html>
