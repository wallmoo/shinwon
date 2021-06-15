
<%@page import="com.market.util.URLUtil"%>
<%@ page language="java" import="Kisinfo.Check.IPIN2Client" %>
<%@ page language="java" import="NiceID.Check.CPClient" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	IPIN2Client pClient = new IPIN2Client();
	String sSiteCodeIpin				= "BB42";			
	String sSitePwIpin					= "shinwon!net2580";			
	String sCPRequest				= pClient.getRequestNO(sSiteCodeIpin);
   	String sAuthType = "M";
   	String popgubun = "N";
	String customize = "";
	String sGender = "";
	String urlBase = URLUtil.getUrl(request);
    String sErrorUrl = urlBase;
    String sReturnURL= urlBase+"/common/cert/cert.do";
    String sMessage = "";
	
	session.setAttribute("CPREQUEST" , sCPRequest);

	int iRtn = pClient.fnRequest(sSiteCodeIpin, sSitePwIpin, sCPRequest, sReturnURL);
	
	String sEncDataPhone				= "";
	String sEncDataIpin					= "";

	if (iRtn == 0)
	{
		sEncDataIpin = pClient.getCipherData();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이핀인증</title>
</head>
<body onload="goNice()">
	<form name="form_ipin" method="post">
		<input type="hidden" name="m" value="pubmain">
	    <input type="hidden" name="enc_data" value="<%= sEncDataIpin %>">
	    <input type="hidden" name="param_r1" value="">
	    <input type="hidden" name="param_r2" value="">
	    <input type="hidden" name="param_r3" value="">
	</form>
<script>
function goNice(){ 
	var form = document.form_ipin;
	form.action = 'https://cert.vno.co.kr/ipin.cb';  
	form.submit();
} 
</script> 
</body>
</html>