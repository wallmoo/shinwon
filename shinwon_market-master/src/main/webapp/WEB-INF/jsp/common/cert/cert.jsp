<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Properties"%>
<%@page import="com.market.mall.model.Code"%>
<%@page import="org.json.JSONStringer"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="NiceID.Check.CPClient" %>
<%@ page language="java" import="org.json.JSONObject" %>
<%@ page language="java" import="Kisinfo.Check.IPIN2Client" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%@ page language="java" import="java.util.Date" %>
<%
	SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMddHHmmss");
	JSONObject certified = null;
%>
<%
	//아이핀인증
	String strAuthResult = request.getParameter("enc_data"); // 인증결과 및 부가정보를 암호화한 데이터
	
	//String strReservedParam1 = request.getParameter("param_r1"); // CP 추가 전송 데이터
	//String strReservedParam2 = request.getParameter("param_r2");
	//String strReservedParam3 = request.getParameter("param_r3");
	if(strAuthResult!=null){
		 String sSiteCode				= "BB42";			// NICE평가정보에서 발급한 IPIN 서비스 사이트코드
		 String sSitePw					= "shinwon!net2580";	
		 IPIN2Client pClient = new IPIN2Client();
		 int iRtn = pClient.fnResponse(sSiteCode, sSitePw, strAuthResult);
		 if(iRtn==1){
			certified = new JSONObject();
			//certified.put("MEM_IPN_RST", pClient.getVNumber()); //1 가상주민번호 (13 byte, 숫자 또는 문자 포함)
			certified.put("MEM_IPN_RST", "Y");
			certified.put("MEM_MST_MEM_NM", pClient.getName()); // 이름
			certified.put("MEM_IPN_DI", pClient.getDupInfo()); // 2중복가입 확인값 (DI - 64 byte 고유값)
			certified.put("MEM_IPN_AGE", pClient.getAgeCode()); // 연령대 코드 (개발 가이드 참조)
			//certified.put("sCiperIpAddress", pClient.getCipherIPAddress()); // 아이피
			//certified.put("sCiperDatetime", pClient.getCipherDateTime()); // 아이피
			certified.put("MEM_IPN_SEX", pClient.getGenderCode().equals("1")?"M":"F"); // 성별 코드 (개발 가이드 참조)
			certified.put("MEM_IPN_BIR_DT", pClient.getBirthDate()); // 생년월일 (YYYYMMDD)
			certified.put("MEM_IPN_FGN", pClient.getNationalInfo()); // 3 내/외국인 정보 (개발 가이드 참조)
			//certified.put("sCPRequestNum", pClient.getCPRequestNO()); // CP 요청번호
			certified.put("MEM_IPN_AUT", pClient.getAuthInfo()); // 본인확인수단
			certified.put("MEM_IPN_CI", pClient.getCoInfo1()); // 연계정보 확인값 (CI - 88 byte 고유값)
			//certified.put("MEM_IPN_CI", pClient.getCIUpdate()); // CI 갱신정보
			certified.put("MEM_IPN_CRT_DT", formatter.format(new Date()));
			certified.put("MEM_IPN_AUT_GB", Code.MEMBER_AUTH_IPIN);
		 }
	}
%>
<%
	//폰인증
	String session_sRequestNumber = null;
	String sRequestNumber = "";			// 요청 번호
	java.util.HashMap mapresult = null;
	if(strAuthResult==null){
		CPClient niceCheck = new  NiceID.Check.CPClient();
		String sEncodeData = request.getParameter("EncodeData");
		String sSiteCode = "BA143";				// NICE로부터 부여받은 사이트 코드
	    String sSitePassword = "gPg7YAi7wcdc";	// NICE로부터 부여받은 사이트 패스워드
	    String sCipherTime = "";			// 복호화한 시간

	    String sPlainData = "";
	    
	    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

	    if( iReturn == 0 )
	    {
	        sPlainData = niceCheck.getPlainData();
	        sCipherTime = niceCheck.getCipherDateTime();
	        mapresult = niceCheck.fnParse(sPlainData);
	        certified = new JSONObject();
	        //certified.put("MEM_IPN_RST", (String)mapresult.get("RES_SEQ")); // 이름
	        certified.put("MEM_IPN_RST", "Y");
			certified.put("MEM_MST_MEM_NM", (String)mapresult.get("NAME")); // 이름
			certified.put("MEM_IPN_DI", (String)mapresult.get("DI")); // 중복가입 확인값 (DI - 64 byte 고유값)
			certified.put("MEM_IPN_SEX", mapresult.get("GENDER").toString().equals("1")?"M":"F"); // 성별 코드 (개발 가이드 참조)
			certified.put("MEM_IPN_BIR_DT", (String)mapresult.get("BIRTHDATE")); // 생년월일 (YYYYMMDD)
			certified.put("MEM_IPN_FGN",  (String)mapresult.get("NATIONALINFO")); // 내/외국인 정보 (개발 가이드 참조)
			certified.put("MEM_IPN_CI", (String)mapresult.get("CI")); // 연계정보 확인값 (CI - 88 byte 고유값)
			certified.put("MEM_IPN_CRT_DT", formatter.format(new Date())); 
			certified.put("MEM_IPN_AUT_GB", Code.MEMBER_AUTH_HP);
			certified.put("MEM_MST_HP", (String)mapresult.get("MOBILE_NO"));
			certified.put("MEM_IPN_HP_CRP", (String)mapresult.get("MOBILE_CO"));
	    }
	}
%>
<%
	String message = "본인인증 정보가 존재하지 않습니다";
	if(certified!=null && certified.has("MEM_IPN_BIR_DT")){
		Date birthDayDate = new SimpleDateFormat("yyyyMMdd", Locale.KOREAN).parse((String)certified.get("MEM_IPN_BIR_DT"));
		Calendar current = Calendar.getInstance();
		Calendar birth = Calendar.getInstance();
		birth.setTime(birthDayDate);
		int currentYear  = current.get(Calendar.YEAR);
		int currentMonth = current.get(Calendar.MONTH) + 1;
		int currentDay   = current.get(Calendar.DAY_OF_MONTH);
		
		int birthYear  = birth.get(Calendar.YEAR);
		int birthMonth = birth.get(Calendar.MONTH) + 1;
		int birthDay   = birth.get(Calendar.DAY_OF_MONTH);
		int age = currentYear - birthYear;
		if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {
			age = age -1;
		}
		if(age<14){
			message = "14세 미만은 가입 하실 수 없습니다";
		}
		else{
			message = null;
		}
	}
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="format-detection" content="telephone=no" />
</head>
<body>
<script type="text/javascript">
window.onload  = function() {	
	<c:if test="${not empty message}">
		alert(message);
		window.opener.location.href="/";
		self.opener = self;
		window.close();
	</c:if>
	if(!window.opener){window.opener = window.open("","Parent_window");}
	var parentDocument = window.opener.document;	
	var data = JSON.parse('<%=certified.toString()%>');
	if(window.opener.certCallback){
		window.opener.certCallback(data);
	}
	window.open("about:blank","_self").close();
};
</script>
</body>
</html>