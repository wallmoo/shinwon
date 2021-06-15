<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body>
<form id="callbackForm" name="callbackForm" method="post" action="<c:out value="${serverDomain}/pc/manager/snsCallbackUrl.do"/>" >
<!-- 	<input type="hidden" name="ROLE_USER" value="sns" /> -->
<!-- 	<input type="hidden" name="MEM_SNS_TYPE" value="naver" /> -->
<!-- 	<input type="hidden" name="MEM_SNS_ID" value="" /> -->
<!-- 	<input type="hidden" name="MEM_SNS_NM" value="" /> -->
<!-- 	<input type="hidden" name="MEM_SNS_EMAIL" value="" /> -->
<%-- 	<input type="hidden" name="MEM_SNS_CHANNEL_CODE" value="<c:out value="${Code.SNS_TYPE_NAVER }"/>" /> --%>
<%-- 	<input type="hidden" name="locationProtocol" value="<c:out value="${commandMap.locationProtocol }"/>"/> --%>
<%-- 	<input type="hidden" name="url" value="<c:out value="${commandMap.url}"/>"/> --%>
<%-- 	<input type="hidden" name="snsType" value="naver"/>snsCallback에서 사용 --%>
<%-- 	<input type="hidden" name="snsUsePoint" value="login"/>SNS 사용구분 --%>
<%-- 	<input type="text" name="state" value="${commandMap.state }"/>SNS 사용구분 --%>
</form>
<script type="text/javascript" src="/nas/cdn/pc/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>   <!-- naver 자바스크립트 SDK -->
<script type="text/javascript">

	var siteDomain = "<c:out value="${mobileDomain}" />";
	var naverCallbackUrl = siteDomain+"/pc/manager/naverCallbackUrl.do";
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "<c:out value="${naverKey}"/>",
			callbackUrl: naverCallbackUrl,
			callbackHandle: true
			/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		}
	);
	
	naverLogin.init();
    
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			/* 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
			var email = naverLogin.user.getEmail();
			if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				/* 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
				naverLogin.reprompt();
				return;
			}
			var sns = {};
			sns.sns='naver';
			sns.email = naverLogin.user.email;
			sns.name = naverLogin.user.name;
			sns.id = naverLogin.user.id; 
	   		opener.fnSnsLogin(sns);
	   		self.close();
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
</script>
</body>
</html>