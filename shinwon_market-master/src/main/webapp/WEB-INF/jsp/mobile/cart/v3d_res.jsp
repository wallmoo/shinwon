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
        window.parent.document.getElementById("sp_res_cd").value             = "<%=request.getParameter("sp_res_cd")           %>";  // 응답코드
        window.parent.document.getElementById("sp_res_msg").value            = "<%=request.getParameter("sp_res_msg")          %>";  // 응답메세지
        window.parent.document.getElementById("sp_tr_cd").value              = "<%=request.getParameter("sp_tr_cd")            %>";  // 처리구분
        window.parent.document.getElementById("sp_cno").value                = "<%=request.getParameter("sp_cno")              %>";  // 거래번호
        window.parent.document.getElementById("sp_client_version").value     = "<%=request.getParameter("sp_client_version")   %>";  // EasyPay 모듈 버전 
        window.parent.document.getElementById("sp_req_type").value           = "<%=request.getParameter("sp_req_type")         %>";  // 결제구분
        window.parent.document.getElementById("sp_card_amt").value           = "<%=request.getParameter("sp_card_amt")         %>";  // 카드거래금액
        window.parent.document.getElementById("sp_card_cd").value            = "<%=request.getParameter("sp_card_cd")          %>";  // 카드코드
        window.parent.document.getElementById("sp_noint").value              = "<%=request.getParameter("sp_noint")            %>";  // 무이자서비스
        window.parent.document.getElementById("sp_card_no").value            = "<%=request.getParameter("sp_card_no")          %>";  // 카드번호
        window.parent.document.getElementById("sp_cavv").value               = "<%=request.getParameter("sp_cavv")             %>";  // 안심클릭 보안 cavv값
        window.parent.document.getElementById("sp_xid").value                = "<%=request.getParameter("sp_xid")              %>";  // 안심클릭 보안 xid 값
        window.parent.document.getElementById("sp_eci").value                = "<%=request.getParameter("sp_eci")              %>";  // 안심클릭 보안 eci 값
        window.parent.document.getElementById("sp_ret_save_used").value      = "<%=request.getParameter("sp_ret_save_used")    %>";  // 세이브사용유무
        window.parent.document.getElementById("sp_ret_save_kind").value      = "<%=request.getParameter("sp_ret_save_kind")    %>";  // 세이브종류
        window.parent.document.getElementById("sp_install_period").value     = "<%=request.getParameter("sp_install_period")   %>";  // 할부거래
        window.parent.document.getElementById("sp_point_useyn").value        = "<%=request.getParameter("sp_point_useyn")      %>";  // 포인트사용유무
        window.parent.document.getElementById("sp_kmotion_useyn").value      = "<%=request.getParameter("sp_kmotion_useyn")    %>";  // KMotion 사용유무
        window.parent.document.getElementById("sp_kvp_cardcode").value       = "<%=request.getParameter("sp_kvp_cardcode")     %>";  // kvp 카드코드
        window.parent.document.getElementById("sp_kvp_sessionkey").value     = "<%=request.getParameter("sp_kvp_sessionkey")   %>";  // kvp 세션키
        window.parent.document.getElementById("sp_kvp_encdata").value        = "<%=request.getParameter("sp_kvp_encdata")      %>";  // kvp 암호화값
        window.parent.document.getElementById("sp_kvp_payset_flag").value    = "<%=request.getParameter("sp_kvp_payset_flag")  %>";  // 포인트플래그
        window.parent.document.getElementById("sp_kvp_using_point").value    = "<%=request.getParameter("sp_kvp_using_point")  %>";  // 사용한 포인트
        window.parent.document.getElementById("sp_card_prefix").value        = "<%=request.getParameter("sp_card_prefix")      %>";  // 카드 BIN(6자리)
        window.parent.document.getElementById("sp_order_no").value           = "<%=request.getParameter("sp_order_no")         %>";  // 가맹점 주문번호
       
        <%-- alert( "<%=request.getParameter("sp_res_cd") %> : <%=request.getParameter("sp_res_cd") %>"); --%>
        
        if( "<%=request.getParameter("sp_res_cd") %>" == "0000" )
        {
            window.parent.f_submit();
        }
        else
        {
            alert( "<%=request.getParameter("sp_res_cd") %> : <%=request.getParameter("sp_res_cd") %>");
        }
            
        window.parent.kicc_popup_close();
    }
</script>
<title>direct 가맹점 test page</title>
</head>
<body>
</body>
</html>
