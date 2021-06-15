package com.market.mall.ifcomm.siren;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.epasscni.util.StringUtil;
import com.ibm.icu.text.SimpleDateFormat;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.ifcomm.siren
 * @FileName : SirenCert.java
 * @Date : 2015. 11. 11.
 * @프로그램 설명 : 사이렌 본인인증
 * @author DEV_KIMSOYOUNG
 */
@Component
public class SirenCert {
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	* <pre>
	* 1. MethodName : getSirenCertReqInfo
	* 2. ClassName  : SirenCert.java
	* 3. Comment    : 사이렌 본인인증 요청정보 생성
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 11.
	* </pre>
	*
	* @param request
	* @param customize > 기본 웹페이지 값("") 모바일페이지 값("Mobile")
	* @return
	* @throws Exception
	*/
	public String getSirenCertReqInfo(HttpServletRequest request, HttpServletResponse response, String customize) throws Exception
	{
		//날짜 생성  
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHmmss");
		String todayStr = date.format(today);

        Random ran = new Random();
        //랜덤 문자 길이
        int numLength = 6;
        String randomStr = "";

        for (int i = 0; i < numLength; i++) {
            //0 ~ 9 랜덤 숫자 생성
            randomStr += ran.nextInt(10);
        }
        
		//reqNum은 최대 40byte 까지 사용 가능
        String reqNum = todayStr + randomStr;										// 본인실명확인 요청번호
		String certDate = todayStr;													// 본인실명확인 요청시간
		String id       = propertiesService.getString("siren.certId");              // 본인실명확인 회원사 아이디
		String srvNo    = "";														// 본인실명확인 서비스번호
		String gubun = request.getParameter("gubun");								// 본인실명확인 페이지 (회원가입, 아이디찾기, 비밀번호 찾기, 온라인회원 전환)
		String chnGbn = StringUtil.getString(request.getParameter("type"),"");		// 채널 구분값(pc / mobile)
		
		// 회원가입의 서비스번호
		if("JOIN".equals(gubun))
		{
			srvNo =  propertiesService.getString(chnGbn + "siren.certSrvNo");
		}
		// 아이디 찾기의 서비스번호
		else if("ID".equals(gubun))
	    {
			srvNo =  propertiesService.getString(chnGbn + "siren.idCertSrvNo");
	    }
		// 비밀번호 찾기의 서비스번호
		else if("PW".equals(gubun))
	    {
			srvNo =  propertiesService.getString(chnGbn + "siren.pwCertSrvNo");
	    }
		else
		{
			// 온라인 회원 전환의 서비스 번호
			if("ONLINE".equals(gubun.substring(0, 6)))
			{
				srvNo =  propertiesService.getString(chnGbn + "siren.onlineCertSrvNo");
			}
		}
		
		String exVar    = "0000000000000000";                                       // 복호화용 임시필드	    
		String certGb	= propertiesService.getString("siren.certGb");              // 본인실명확인 본인확인 인증수단
		
		String addVar	= gubun;													// 본인실명확인 추가 파라메터
		
		/**
		*
		* reqNum 값은 최종 결과값 복호화를 위한 SecuKey로 활용 되므로 중요합니다.
		* reqNum 은 본인 확인 요청시 항상 새로운 값으로 중복 되지 않게 생성 해야 합니다.
		* 쿠키 또는 Session및 기타 방법을 사용해서 reqNum 값을 
		* pcc_V3_result_seed.jsp에서 가져 올 수 있도록 해야 함.
		* 샘플을 위해서 쿠키를 사용한 것이므로 참고 하시길 바랍니다.
		*
		*/
		Cookie c = new Cookie("reqNum", reqNum);
		//c.setMaxAge(1800);  // <== 필요시 설정(초단위로 설정됩니다)
		response.addCookie(c);

	    //01. 암호화 모듈 선언
		com.sci.v2.pcc.secu.SciSecuManager seed  = new com.sci.v2.pcc.secu.SciSecuManager();

		//02. 1차 암호화
		String encStr = "";
		String reqInfo      = id+"^"+srvNo+"^"+reqNum+"^"+certDate+"^"+certGb+"^"+addVar+"^"+exVar;  // 데이터 암호화
		encStr              = seed.getEncPublic(reqInfo);

		//03. 위변조 검증 값 생성
		com.sci.v2.pcc.secu.hmac.SciHmac hmac = new com.sci.v2.pcc.secu.hmac.SciHmac();
		String hmacMsg = hmac.HMacEncriptPublic(encStr);

		//03. 2차 암호화
		reqInfo  = seed.getEncPublic(encStr + "^" + hmacMsg + "^" + "0000000000000000");  //2차암호화
		
		return reqInfo;
	}
	
	/**
	* <pre>
	* 1. MethodName : getSirenCertResultInfo
	* 2. ClassName  : SirenCert.java
	* 3. Comment    : 사이렌 본인인증 결과
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> getSirenCertResultInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		// 변수 --------------------------------------------------------------------------------
	    String retInfo		= "";																// 결과정보
	    String name			= "";                                                               //성명
	    String sex			= "";																//성별
		String birYMD		= "";																//생년월일
		String fgnGbn		= "";																//내외국인 구분값
	    String di			= "";																//DI
	    String ci1			= "";																//CI
	    String ci2			= "";																//CI
	    String civersion    = "";                                                               //CI Version
	    String reqNum		= "";                                                               // 본인확인 요청번호
	    String result		= "";                                                               // 본인확인결과 (Y/N)
	    String certDate		= "";                                                               // 검증시간
	    String certGb		= "";                                                               // 인증수단
		String cellNo		= "";																// 핸드폰 번호
		String cellCorp		= "";																// 이동통신사
		String addVar		= "";

		//복화화용 변수
		String encPara		= "";
		String encMsg		= "";
		String msgChk       = "N";  
		
	    //-----------------------------------------------------------------------------------------------------------------
	    
	    //쿠키값 가져 오기
	    Cookie[] cookies = request.getCookies();
	    String cookiename = "";
	    String cookiereqNum = "";
		if(cookies!=null){
			for (int i = 0; i < cookies.length; i++){
				Cookie c = cookies[i];
				cookiename = c.getName();
				cookiereqNum = c.getValue();
				if(cookiename.compareTo("reqNum")==0) break;
				
				cookiereqNum = null;
			}
		}

	    try{

	        // Parameter 수신 --------------------------------------------------------------------
	    	retInfo  = request.getParameter("retInfo").trim();
	    	
	    	 // 1. 암호화 모듈 (jar) Loading
	        com.sci.v2.pcc.secu.SciSecuManager sciSecuMg = new com.sci.v2.pcc.secu.SciSecuManager();
	        //쿠키에서 생성한 값을 Key로 생성 한다.
	        retInfo  = sciSecuMg.getDec(retInfo, cookiereqNum);

	        // 2.1차 파싱---------------------------------------------------------------
	        String[] aRetInfo1 = retInfo.split("\\^");

			encPara  = aRetInfo1[0];         //암호화된 통합 파라미터
	        encMsg   = aRetInfo1[1];    //암호화된 통합 파라미터의 Hash값
			
			String  encMsg2   = sciSecuMg.getMsg(encPara);
			
			// 3.위/변조 검증 ---------------------------------------------------------------
	        if(encMsg2.equals(encMsg)){
	            msgChk="Y";
	        }

//			if(msgChk.equals("N")){
//				resultMap.put("msgChk", msgChk);	// 비정상적인 접근일때..
//				return resultMap;
//			}
			
			// 복호화 및 위/변조 검증 ---------------------------------------------------------------
			retInfo  = sciSecuMg.getDec(encPara, cookiereqNum);

	        String[] aRetInfo = retInfo.split("\\^");
			
	        name		= aRetInfo[0];
			birYMD		= aRetInfo[1];
	        sex			= aRetInfo[2];        
	        fgnGbn		= aRetInfo[3];
	        di			= aRetInfo[4];
	        ci1			= aRetInfo[5];
	        ci2			= aRetInfo[6];
	        civersion	= aRetInfo[7];
	        reqNum		= aRetInfo[8];
	        result		= aRetInfo[9];
	        certGb		= aRetInfo[10];
			cellNo		= aRetInfo[11];
			cellCorp	= aRetInfo[12];
	        certDate	= aRetInfo[13];
			addVar		= aRetInfo[14];
			
	    	// ----------------------------------------------------------------------------------
	    }catch(Exception ex){
	          System.out.println("[pcc] Receive Error -"+ex.getMessage());
	    }
	    
	    /** 인증 결과를 Map에 담는다 **/
	    resultMap.put("name", name);
	    resultMap.put("birYMD", birYMD);
	    resultMap.put("sex", sex);
	    resultMap.put("fgnGbn", fgnGbn);
	    resultMap.put("di", di);
	    resultMap.put("ci1", ci1);
	    resultMap.put("ci2", ci2);
	    resultMap.put("civersion", civersion);
	    resultMap.put("reqNum", reqNum);
	    resultMap.put("result", result);
	    resultMap.put("certGb", certGb);
	    resultMap.put("cellNo", cellNo);
	    resultMap.put("cellCorp", cellCorp);
	    resultMap.put("certDate", certDate);
	    resultMap.put("addVar", addVar);
	    resultMap.put("msgChk", msgChk);
	    
	    return resultMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : getSirenIpinCertReqInfo
	* 2. ClassName  : SirenCert.java
	* 3. Comment    : 사이렌 IPIN 본인인증 요청정보 생성 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 16.
	* </pre>
	*
	* @param request
	* @param response
	* @return
	* @throws Exception
	*/
	public String getSirenIpinCertReqInfo(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		Random ran = new Random();
		
		//랜덤 문자 길이
		int numLength = 16;
		String randomStr = "";

		for (int i = 0; i < numLength; i++) {
			//0 ~ 9 랜덤 숫자 생성
			randomStr += ran.nextInt(10);
		}

		String id          = propertiesService.getString("ipin.certId");     		//회원사 ID
	    String ipinReqNum  = randomStr;												//요청번호
	    String srvNo       = "";													//서비스번호
	    String gubun = request.getParameter("gubun");								// 본인실명확인 페이지 (회원가입, 아이디찾기, 비밀번호 찾기, 온라인회원 전환)
	    String chnGbn = StringUtil.getString(request.getParameter("type"),"");		// 채널 구분값(pc / mobile)
	    
	    // 회원가입의 서비스번호
 		if("JOIN".equals(gubun))
 		{
 			srvNo =  propertiesService.getString(chnGbn + "ipin.srvNo");
 		}
	    // 아이디 찾기의 서비스번호
 		else if("ID".equals(gubun))
	    {
	    	srvNo =  propertiesService.getString(chnGbn + "ipin.idSrvNo");           
	    }
	    // 비밀번호 찾기의 서비스번호
 		else if("PW".equals(gubun))
	    {
	    	srvNo =  propertiesService.getString(chnGbn + "ipin.pwSrvNo");           
	    }
 		else 
	    {
 			// 온라인 회원 전환의 서비스번호
 			if("ONLINE".equals(gubun.substring(0, 6)))
 			{
 				srvNo =  propertiesService.getString(chnGbn + "ipin.onlineCertSrvNo");	
 			}
	    }
	    
	    String exVar       = "0000000000000000";                                    // 복호화용 임시필드
		
		Cookie c = new Cookie("ipinReqNum", ipinReqNum);
		c.setMaxAge(1800);  // <==초단위로 설정됩니다.
		response.addCookie(c);	
		
	    // 암호화 모듈 선언
		com.sci.v2.ipin.secu.SciSecuManager seed  = new com.sci.v2.ipin.secu.SciSecuManager();

		// 1차 암호화
		String encStr = "";
		String reqInfo      = ipinReqNum+"/"+id+"/"+srvNo+"/"+exVar;  // 데이터 암호화
		encStr              = seed.getEncPublic(reqInfo);

		// 위변조 검증 값 등록
		com.sci.v2.ipin.secu.hmac.SciHmac hmac = new com.sci.v2.ipin.secu.hmac.SciHmac();
		String hmacMsg = hmac.HMacEncriptPublic(encStr);

		// 2차 암호화
		reqInfo  = seed.getEncPublic(encStr + "/" + hmacMsg + "/" + "00000000");  //2차암호화
		
		return reqInfo;
	}
	
	/**
	* <pre>
	* 1. MethodName : getSirenIpinCertResultInfo
	* 2. ClassName  : SirenCert.java
	* 3. Comment    : 사이렌 I-PIN 본인인증 결과 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> getSirenIpinCertResultInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		 // 변수 -------------------------------------------------------------------------------------------------------------
		String retInfo      = "";       
		String encPara      = "";
		String decPara      = "";
	   
		String encMsg       = "";                                                        // HMAC 메세지
	    
		String ipinReqNum   = "";                                                        // 요청번호(복호화)
	    String vDiscrNo     = "";                                                        // 가상식별번호
	    String name         = "";                                                        // 성명
	    String result       = "";                                                        // 결과값 (1인경우에만 정상)
		String age          = "";
	    String sex          = "";
		String ip           = "";
	    String authInfo     = "";														 // 발급수단정보	
	    String birth        = "";
	    String fgn          = "";                                                        // 외국인구분
		String discrHash    = "";                                                        // 중복가입확인정보
		String ciVersion	= "";														 // 연계정보 버젼
		String ciscrHash    = "";                                                        // 연계정보
		
		String msgChk       = "N";                                                    	 // 위조/변조 검증 결과

	    //-----------------------------------------------------------------------------------------------------------------

		try{
			//쿠키값 가져 오기
			Cookie[] cookies = request.getCookies();
			String tranjectionName = "";
			String tranjectionReqNum = "";
			if(cookies!=null){
				for (int i = 0; i < cookies.length; i++){
					Cookie c = cookies[i];
					tranjectionName = c.getName();
					tranjectionReqNum = c.getValue();
					
					if(tranjectionName.compareTo("ipinReqNum")==0) break;
					
					tranjectionReqNum = "";
				}
			}

	        // Parameter 수신 --------------------------------------------------------------------
	        retInfo  = request.getParameter("retInfo").trim();
	        
	        // 1. 암호화 모듈 (jar) Loading
	        com.sci.v2.ipin.secu.SciSecuManager sciSecuMg = new com.sci.v2.ipin.secu.SciSecuManager();

	        retInfo  = sciSecuMg.getDec(retInfo, tranjectionReqNum);

	        StringBuffer retInfoTemp    = new StringBuffer("");

	        // 2.1차 파싱---------------------------------------------------------------
	        int inf1 = retInfo.indexOf("/",0);
	        int inf2 = retInfo.indexOf("/",inf1+1);

			encPara  = retInfo.substring(0,inf1);         //암호화된 통합 파라미터
	        encMsg   = retInfo.substring(inf1+1,inf2);    //암호화된 통합 파라미터의 Hash값
	        
	        // 3.위/변조 검증 ---------------------------------------------------------------
	        if(sciSecuMg.getMsg(encPara).equals(encMsg)){
	            msgChk="Y";
	        }
	        
			if(msgChk.equals("N")){
				resultMap.put("msgChk", msgChk);	// 비정상적인 접근일때..
				return resultMap;
			}
			
			// 4.파라미터별 값 가져오기 ---------------------------------------------------------------
			decPara  = sciSecuMg.getDec(encPara, tranjectionReqNum);

			int info1 = decPara.indexOf("/",0);
	        int info2 = decPara.indexOf("/",info1+1);
	        int info3 = decPara.indexOf("/",info2+1);
	        int info4 = decPara.indexOf("/",info3+1);
	    	int info5 = decPara.indexOf("/",info4+1);
	        int info6 = decPara.indexOf("/",info5+1);
	        int info7 = decPara.indexOf("/",info6+1);
	        int info8 = decPara.indexOf("/",info7+1);
	        int info9 = decPara.indexOf("/",info8+1);
	        int info10 = decPara.indexOf("/",info9+1);
	        int info11 = decPara.indexOf("/",info10+1);
	        int info12 = decPara.indexOf("/",info11+1);
	        int info13 = decPara.indexOf("/",info12+1);

	        ipinReqNum = decPara.substring(0,info1);
	        vDiscrNo   = decPara.substring(info1+1,info2);
	        name       = decPara.substring(info2+1,info3);
	        result     = decPara.substring(info3+1,info4);
	        age        = decPara.substring(info4+1,info5);
	        sex        = decPara.substring(info5+1,info6);
	        ip         = decPara.substring(info6+1,info7);
	        authInfo   = decPara.substring(info7+1,info8);
	        birth      = decPara.substring(info8+1,info9);
	        fgn        = decPara.substring(info9+1,info10);
	        discrHash  = decPara.substring(info10+1,info11);
	        ciVersion  = decPara.substring(info11+1,info12);
			ciscrHash  = decPara.substring(info12+1,info13);	
			
			discrHash  = sciSecuMg.getDec(discrHash, tranjectionReqNum); //중복가입확인정보는 한번더 복호화
			ciscrHash  = sciSecuMg.getDec(ciscrHash, tranjectionReqNum); //연계정보는 한번더 복호화
		    
    	}catch(Exception ex){
	          System.out.println("[IPIN] Receive Test Error -"+ex.getMessage());
	    }
		
		/** 인증 결과를 Map에 담는다 **/
	    resultMap.put("reqNum", ipinReqNum);
	    resultMap.put("vDiscrNo", vDiscrNo);
	    resultMap.put("name", name);
	    resultMap.put("result", result);
	    resultMap.put("age", age);
	    resultMap.put("sex", sex);
	    resultMap.put("ip", ip);
	    resultMap.put("authInfo", authInfo);
	    resultMap.put("birth", birth);
	    resultMap.put("fgn", fgn);
	    resultMap.put("discrHash", discrHash);
	    resultMap.put("ciVersion", ciVersion);
	    resultMap.put("ciscrHash", ciscrHash);
	        
		return resultMap;
	}
	
	
}
