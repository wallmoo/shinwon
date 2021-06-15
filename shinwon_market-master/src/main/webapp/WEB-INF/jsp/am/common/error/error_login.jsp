<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>MarketPlant</title></head>
<body>
<script type="text/javascript">
	alert("사용자 인증 정보를 획득할 수 없습니다. 로그인 페이지로 이동합니다.");
	try
	{
	    // 새창 또는 팝업
	    window.opener.location.href;
	    if(isIE())
	    {
	        window.open('about:blank','_self').self.close();
	    }
	    else
	    {
	        self.close();    
	    }
	    parent.opener.location.href='/am/manager/login.do';
	}
	catch(e)
	{
	    // 현재창
	    location.href='/am/manager/login.do';
	}
	function isIE() { return ((navigator.appName == 'Microsoft Internet Explorer') || ((navigator.appName == 'Netscape') && (new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})").exec(navigator.userAgent) != null)));}
</script>
</body>
</html>
