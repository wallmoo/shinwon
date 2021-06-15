<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder" %>
<%
/* -------------------------------------------------------------------------- */
/* 캐쉬 사용안함                                                              */
/* -------------------------------------------------------------------------- */
response.setHeader("cache-control","no-cache");
response.setHeader("expires","-1");
response.setHeader("pragma","no-cache");

request.setCharacterEncoding("utf-8");

String EP_res_msg_str = URLDecoder.decode(request.getParameter("EP_res_msg"),"UTF-8");
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=10" />
<meta name="robots" content="noindex, nofollow" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
    window.onload = function()
    {
        if(window.opener != null)
        {
        	/* 카드사 번호 수정 필요...! */
            window.opener.document.getElementById("EP_res_cd").value            = "<%=request.getParameter("EP_res_cd")           %>";
            window.opener.document.getElementById("EP_res_msg").value           = "<%=EP_res_msg_str									%>";
            window.opener.document.getElementById("EP_tr_cd").value             = "<%=request.getParameter("EP_tr_cd")            %>";
            window.opener.document.getElementById("EP_cno").value               = "<%=request.getParameter("EP_cno")              %>";
            window.opener.document.getElementById("EP_client_version").value    = "<%=request.getParameter("EP_client_version")   %>";
            window.opener.document.getElementById("EP_req_type").value          = "<%=request.getParameter("EP_req_type")         %>";
            window.opener.document.getElementById("EP_card_amt").value          = "<%=request.getParameter("EP_card_amt")         %>";
            window.opener.document.getElementById("EP_card_cd").value           = "<%=request.getParameter("EP_card_cd")          %>";
            
            <%-- window.opener.document.getElementById("EP_noint").value             = "<%=request.getParameter("EP_noint")            %>"; --%>
            
            window.opener.document.getElementById("EP_card_no").value           = "<%=request.getParameter("EP_card_no")          %>";
            window.opener.document.getElementById("EP_cavv").value              = "<%=request.getParameter("EP_cavv")             %>";
            window.opener.document.getElementById("EP_xid").value               = "<%=request.getParameter("EP_xid")              %>";
            window.opener.document.getElementById("EP_eci").value               = "<%=request.getParameter("EP_eci")              %>";
            window.opener.document.getElementById("EP_ret_save_used").value     = "<%=request.getParameter("EP_ret_save_used")    %>";
            window.opener.document.getElementById("EP_ret_save_kind").value     = "<%=request.getParameter("EP_ret_save_kind")    %>";
            window.opener.document.getElementById("EP_install_period").value    = "<%=request.getParameter("EP_install_period")   %>";
            window.opener.document.getElementById("EP_point_useyn").value       = "<%=request.getParameter("EP_point_useyn")      %>";
            window.opener.document.getElementById("EP_kmotion_useyn").value     = "<%=request.getParameter("EP_kmotion_useyn")    %>";
            window.opener.document.getElementById("EP_kvp_cardcode").value      = "<%=request.getParameter("EP_kvp_cardcode")     %>";
            window.opener.document.getElementById("EP_kvp_sessionkey").value    = "<%=request.getParameter("EP_kvp_sessionkey")   %>";
            window.opener.document.getElementById("EP_kvp_encdata").value       = "<%=request.getParameter("EP_kvp_encdata")      %>";
            window.opener.document.getElementById("EP_kvp_payset_flag").value   = "<%=request.getParameter("EP_kvp_payset_flag")  %>";
            window.opener.document.getElementById("EP_kvp_using_point").value   = "<%=request.getParameter("EP_kvp_using_point")  %>";
            window.opener.document.getElementById("EP_vp_ret_save_point").value = "<%=request.getParameter("EP_vp_ret_save_point")%>";
            window.opener.document.getElementById("EP_kvp_quota").value         = "<%=request.getParameter("EP_kvp_quota")        %>";
            window.opener.document.getElementById("EP_kvp_noint").value         = "<%=request.getParameter("EP_kvp_noint")        %>";
            window.opener.document.getElementById("EP_kvp_card_prefix").value   = "<%=request.getParameter("EP_kvp_card_prefix")  %>";
            window.opener.document.getElementById("EP_kvp_pgid").value          = "<%=request.getParameter("EP_kvp_pgid")         %>";
            window.opener.document.getElementById("EP_order_no").value          = "<%=request.getParameter("EP_order_no")         %>";

            if( "<%=request.getParameter("EP_res_cd") %>" == "0000" )
            {
                window.opener.f_submit();
            }
            else
            {
                alert( "<%=request.getParameter("EP_res_cd") %> : <%=EP_res_msg_str %>");
            }
      
            self.close();
        }
        else
        {
            window.parent.document.getElementById("EP_res_cd").value            = "<%=request.getParameter("EP_res_cd")           %>";
            window.parent.document.getElementById("EP_res_msg").value           = "<%=EP_res_msg_str									%>";
            window.parent.document.getElementById("EP_tr_cd").value             = "<%=request.getParameter("EP_tr_cd")            %>";
            window.parent.document.getElementById("EP_cno").value               = "<%=request.getParameter("EP_cno")              %>";
            window.parent.document.getElementById("EP_client_version").value    = "<%=request.getParameter("EP_client_version")   %>";
            window.parent.document.getElementById("EP_req_type").value          = "<%=request.getParameter("EP_req_type")         %>";
            window.parent.document.getElementById("EP_card_amt").value          = "<%=request.getParameter("EP_card_amt")         %>";
            window.parent.document.getElementById("EP_card_cd").value           = "<%=request.getParameter("EP_card_cd")          %>";
            
            <%-- window.parent.document.getElementById("EP_noint").value             = "<%=request.getParameter("EP_noint")            %>"; --%>
            
            window.parent.document.getElementById("EP_card_no").value           = "<%=request.getParameter("EP_card_no")          %>";
            window.parent.document.getElementById("EP_cavv").value              = "<%=request.getParameter("EP_cavv")             %>";
            window.parent.document.getElementById("EP_xid").value               = "<%=request.getParameter("EP_xid")              %>";
            window.parent.document.getElementById("EP_eci").value               = "<%=request.getParameter("EP_eci")              %>";
            window.parent.document.getElementById("EP_ret_save_used").value     = "<%=request.getParameter("EP_ret_save_used")    %>";
            window.parent.document.getElementById("EP_ret_save_kind").value     = "<%=request.getParameter("EP_ret_save_kind")    %>";
            window.parent.document.getElementById("EP_install_period").value    = "<%=request.getParameter("EP_install_period")   %>";
            window.parent.document.getElementById("EP_point_useyn").value       = "<%=request.getParameter("EP_point_useyn")      %>";
            window.parent.document.getElementById("EP_kmotion_useyn").value     = "<%=request.getParameter("EP_kmotion_useyn")    %>";
            window.parent.document.getElementById("EP_kvp_cardcode").value      = "<%=request.getParameter("EP_kvp_cardcode")     %>";
            window.parent.document.getElementById("EP_kvp_sessionkey").value    = "<%=request.getParameter("EP_kvp_sessionkey")   %>";
            window.parent.document.getElementById("EP_kvp_encdata").value       = "<%=request.getParameter("EP_kvp_encdata")      %>";
            window.parent.document.getElementById("EP_kvp_payset_flag").value   = "<%=request.getParameter("EP_kvp_payset_flag")  %>";
            window.parent.document.getElementById("EP_kvp_using_point").value   = "<%=request.getParameter("EP_kvp_using_point")  %>";
            window.parent.document.getElementById("EP_vp_ret_save_point").value = "<%=request.getParameter("EP_vp_ret_save_point")%>";
            window.parent.document.getElementById("EP_kvp_quota").value         = "<%=request.getParameter("EP_kvp_quota")        %>";
            window.parent.document.getElementById("EP_kvp_noint").value         = "<%=request.getParameter("EP_kvp_noint")        %>";
            window.parent.document.getElementById("EP_kvp_card_prefix").value   = "<%=request.getParameter("EP_kvp_card_prefix")  %>";
            window.parent.document.getElementById("EP_kvp_pgid").value          = "<%=request.getParameter("EP_kvp_pgid")         %>";
            window.parent.document.getElementById("EP_order_no").value          = "<%=request.getParameter("EP_order_no")         %>";
            
            if( "<%=request.getParameter("EP_res_cd") %>" == "0000" )
            {
                window.parent.f_submit();
            }
            else
            {
                alert( "<%=request.getParameter("EP_res_cd") %> : <%=EP_res_msg_str %>");
            }
            
            window.parent.kicc_popup_close();
        }
    }
</script>
<title></title>
</head>
<body>
</body>
</html>