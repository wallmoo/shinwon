<%@page import="com.market.util.URLUtil"%>
<%@ page language="java" import="NiceID.Check.CPClient" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
	CPClient niceCheck = new  CPClient();
	String sSiteCodePhone = "BA143";			
	String sSitePassword = "gPg7YAi7wcdc";		
	String sRequestNumber = niceCheck.getRequestNO(sSiteCodePhone);
   	String sAuthType = "M";
   	String popgubun = "N";
	String customize = "";
	String sGender = "";
	String urlBase = URLUtil.getUrl(request);
    String sErrorUrl = urlBase;
    String sReturnURL= urlBase+"/common/cert/cert.do";
    String sMessage = "";
	
	session.setAttribute("REQ_SEQ" , sRequestNumber);
	
    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                        "8:SITECODE" + sSiteCodePhone.getBytes().length + ":" + sSiteCodePhone +
                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                        "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                        "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + 
						"6:GENDER" + sGender.getBytes().length + ":" + sGender;
	  
	int iReturn = niceCheck.fnEncode(sSiteCodePhone, sSitePassword, sPlainData);
	
	String sEncDataPhone				= "";
	String sEncDataIpin					= "";

    if( iReturn == 0 )
    {
    	sEncDataPhone = niceCheck.getCipherData();
    	request.setAttribute("sEncDataPhone", sEncDataPhone);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 인증</title>
</head>
<body onload="goPhoneCert()">
	<form name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce"/>
		<input type="hidden" name="EncodeData" value="<c:out value="${ sEncDataPhone }"/>"/>
	</form>
<script type="text/javascript">
function goPhoneCert(){
	var form = document.form_chk;
	form.action = 'https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb';  
	form.submit();
}
</script>
</body>
</html>