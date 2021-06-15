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
    	
        <%-- alert( "<%=request.getParameter("sp_res_cd") %> : <%=request.getParameter("sp_res_cd") %>"); --%>
        
        if( "<%=request.getParameter("sp_res_cd") %>" == "0000" )
        {
            window.parent.f_account_submit();
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
