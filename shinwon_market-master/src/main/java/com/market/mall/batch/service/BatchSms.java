package com.market.mall.batch.service;

import java.net.InetAddress;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Component
public class BatchSms {
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
		/**
		* <pre>
		* 1. MethodName : sendShortMessage
		* 2. ClassName  : Sms.java
		* 3. Comment    : 설명추가부분 
		* 4. 작성자       : kanghk
		* 5. 작성일       : 2014. 6. 24.
		* </pre>
		*
		* @param smsMap
		* TR_PHONE : 받는 사람 번호
		* TR_MSG : 메시지(120 바이트 이하만 가능)
		* @return
		* @throws Exception
		*/
		public Map<String,Object> sendShortMessage(Map<String, Object> smsMap) {
		String resultMsg = "";
		String resultCode = "0";
		
		try {
			
			String BRAND_NAME_KOR = "[MarketPlant몰]";
		
			//properties sms 발송 여부
			String smsSendYn = StringUtil.getString(propertiesService.getString("smsSendYn"),"");
			
			String trPhone = "";
			String trMsg = "";
			
			if(smsSendYn.equals("Y")){
				resultCode = "0";
				resultMsg = "정상처리";
				
				smsMap.put("resultCode"	, resultCode);
				smsMap.put("resultMsg"	, resultMsg);
				
				trPhone 	= (String)smsMap.get("TR_PHONE");
				trPhone = trPhone.replaceAll("\\-", "").trim();
				trMsg 	= BRAND_NAME_KOR + (String)smsMap.get("TR_MSG");
				
				if(trPhone==null || trPhone.length()==0 || trPhone.length()>11){
					resultCode = "1";
					resultMsg = "수신 번호 확인 [TR_PHONE:"+smsMap.get("TR_PHONE")+"]";
					
					smsMap.put("resultCode"	, resultCode);
					smsMap.put("resultMsg"	, resultMsg);
				}
				
				if("0".equals(smsMap.get("resultCode"))){
					if(trMsg==null || trMsg.length()==0 || trMsg.getBytes().length>120){
						resultCode = "2";
						
						smsMap.put("resultCode"	,resultCode);
						if(trMsg==null || trMsg.length()==0 ){
							resultMsg = "메시지 확인 [TR_MSG:"+smsMap.get("TR_MSG")+"]";							
							smsMap.put("resultMsg"	,resultMsg);
						}
						else{
							resultMsg = "메시지 길이 초과 ("+trMsg.getBytes().length+"bytes) [TR_MSG:"+smsMap.get("TR_MSG")+"]";
							smsMap.put("resultMsg"	,resultMsg);
						}
					}
				}
				
				logger.debug(resultMsg);
				
				if("0".equals(smsMap.get("resultCode"))){
					//발송 번호
					String trCallback = StringUtil.getString(propertiesService.getString("sms.callback"),"");
					smsMap.put("TR_CALLBACK", trCallback);
					smsMap.put("TR_MSG", trMsg);
					
					int tr_num = defaultDAO.insert("BatchSms.insertMMS", smsMap);
					smsMap.put("TR_NUM"	,String.valueOf(tr_num));
				}
			}else{
				resultCode = "3";
				resultMsg = "설정파일 smsSendYn이 N입니다.";
				
				logger.debug(resultMsg);
				
				smsMap.put("resultCode" ,resultCode);
				smsMap.put("resultMsg"	,resultMsg);
			}
			
			logger.debug("###############################################");
			logger.debug("SMS 발송처리 - 시작");
			logger.debug("수신 : " + trPhone);
			logger.debug("내용 : " + trMsg);
			logger.debug("결과 : " + resultMsg);
			logger.debug("SMS 발송처리 - 끝");
			logger.debug("###############################################");
		
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error("SMS 발송중 예외가 발생하였습니다.", ex);
			
			resultMsg = "오류 발생, 상세내용을 log를 참조하세요. ("+ex.toString()+") ";
			resultCode = "4";
			
			smsMap.put("resultMsg", resultMsg);
			smsMap.put("resultCode", resultCode);
		}
		
		return smsMap;
	}
		
		
	/**
	* <pre>
	* 1. MethodName : sendLongMessage
	* 2. ClassName  : Sms.java
	* 3. Comment    : LMS 전송
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2015. 1. 30.
	* </pre>
	*
	* @param smsMap
	* @return
	*/
	public Map<String,Object> sendLongMessage(Map<String, Object> smsMap) {
		String resultMsg = "";
		String resultCode = "0";
		
		try {
			
			//properties sms 발송 여부
			String smsSendYn = StringUtil.getString(propertiesService.getString("smsSendYn"),"");
			
			String trPhone = "";    // 번호
			String trMsg = "";	    // 내용
			String trSubject = "";  // 제목
			String trUserName = ""; // 수신자 이름
			String userPhone1 = "";
			String userPhone2 = "";
			String userPhone3 = "";
			String userId = "batch"; // 처리자
			
			if(smsSendYn.equals("Y")){
				resultCode = "0";
				resultMsg = "정상처리";
				
				smsMap.put("resultCode"	, resultCode);
				smsMap.put("resultMsg"	, resultMsg);
				
				trPhone 	= (String)smsMap.get("TR_PHONE");
				trPhone 	= trPhone.replaceAll("\\-", "").trim();
				trSubject 	= StringUtil.getString(smsMap.get("TR_SUBJECT"),StringUtil.getString(propertiesService.getString("app.name"),""));//제목 없는 경우 default값
				trMsg 		= (String)smsMap.get("TR_MSG");
				trUserName  = (String)smsMap.get("TR_NAME");
				
				// 번호 Check
				if(trPhone==null || trPhone.length()==0 || trPhone.length()>11){
					resultCode = "1";
					resultMsg = "수신 번호 확인 [TR_PHONE:"+smsMap.get("TR_PHONE")+"]";
					
					smsMap.put("resultCode"	, resultCode);
					smsMap.put("resultMsg"	, resultMsg);
				}
				
				// 내용 Check				
				if("0".equals(smsMap.get("resultCode"))){
					if(trMsg==null || trMsg.length()==0 || trMsg.getBytes().length>4000){
						resultCode = "2";
						
						smsMap.put("resultCode"	,resultCode);
						if(trMsg==null || trMsg.length()==0 ){
							resultMsg = "메시지 확인 [TR_MSG:"+smsMap.get("TR_MSG")+"]";							
							smsMap.put("resultMsg"	,resultMsg);
						}
						else{
							resultMsg = "메시지 길이 초과 ("+trMsg.getBytes().length+"bytes) [TR_MSG:"+smsMap.get("TR_MSG")+"]";
							smsMap.put("resultMsg"	,resultMsg);
						}
					}
				}
				
				// 제목 Check
				if("0".equals(smsMap.get("resultCode"))){
					if(trSubject==null || trSubject.length()==0 || trSubject.getBytes().length>40){
						resultCode = "3";
						
						smsMap.put("resultCode"	,resultCode);
						if(trSubject==null || trSubject.length()==0 ){
							resultMsg = "제목 확인 [TR_SUBJECT:"+smsMap.get("TR_SUBJECT")+"]";							
							smsMap.put("resultMsg"	,resultMsg);
						}
						else{
							resultMsg = "제목 길이 초과 ("+trSubject.getBytes().length+"bytes) [TR_SUBJECT:"+smsMap.get("TR_SUBJECT")+"]";
							smsMap.put("resultMsg"	,resultMsg);
						}
					}
				}
				
				// 이름 Check
				if("0".equals(smsMap.get("resultCode"))){
					if(trUserName==null || trUserName.length()==0 || trUserName.length()>40){
						resultCode = "4";
						resultMsg = "수신 이름 확인 [TR_NAME:"+smsMap.get("TR_NAME")+"]";
						
						smsMap.put("resultCode"	, resultCode);
						smsMap.put("resultMsg"	, resultMsg);
					}
				}
				
				if("0".equals(smsMap.get("resultCode"))){
					//발송 번호
					String trCallback = StringUtil.getString(propertiesService.getString("sms.callback"),"");
					smsMap.put("TR_CALLBACK", trCallback);	// CALLBACK
					smsMap.put("TR_SUBJECT", trSubject);	// 제목
					smsMap.put("TR_MSG", trMsg);			// 메세지
					smsMap.put("DEST_INFO", trUserName+"^"+trPhone);	// 받는사람^수신자번호
					
					/*if( !"".equals(StringUtil.getString(SessionsAdmin.getSessionAdminValue("ADM_MST_ID"), ""))  ){ //   admin 일 경우
						userId = StringUtil.getString(SessionsAdmin.getSessionAdminValue("ADM_MST_ID"), "");
					}else if( !"".equals(StringUtil.getString(SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"), "")) ){ // pront
						userId = StringUtil.getString(SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"), "");						
					}else{
						userId = "admin";						
					}*/
					
					smsMap.put("USER_ID", userId);	// 처리자
					
					
					if(trPhone.length() == 11 ){ // 핸드폰 11자리 가운데 4개
						userPhone1 = trPhone.substring(0, 3);
						userPhone2 = trPhone.substring(3, 7);
						userPhone3 = trPhone.substring(7, 11);
					}else{	// 핸드폰 10자리 가운데 3개
						userPhone1 = trPhone.substring(0, 3);
						userPhone2 = trPhone.substring(3, 6);
						userPhone3 = trPhone.substring(6, 10);						
					}

					smsMap.put("LMS_MST_HP1", userPhone1);
					smsMap.put("LMS_MST_HP2", userPhone2);
					smsMap.put("LMS_MST_HP3", userPhone3);
					smsMap.put("LMS_MST_REG_IP", InetAddress.getLocalHost().getHostAddress());	// 등록 아이피
					
					int tr_num = defaultDAO.insert("BatchSms.insertLmsMsg", smsMap);//LMS 전송
								 defaultDAO.insert("BatchSms.insertLmsHistory", smsMap);//LMS 전송
					
					smsMap.put("TR_NUM"	,String.valueOf(tr_num));
				}
			}else{
				resultCode = "5";
				resultMsg = "설정파일 smsSendYn이 N입니다.";
				
				smsMap.put("resultCode" ,resultCode);
				smsMap.put("resultMsg"	,resultMsg);
			}
			
			logger.debug("###############################################");
			logger.debug("SMS 발송처리 - 시작");
			logger.debug("수신 : " + trPhone);
			logger.debug("내용 : " + trMsg);
			logger.debug("이름 : " + trUserName);
			logger.debug("결과 : " + resultMsg);
			logger.debug("SMS 발송처리 - 끝");
			logger.debug("###############################################");
		
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error("SMS 발송중 예외가 발생하였습니다.", ex);
			
			resultMsg = "오류 발생, 상세내용을 log를 참조하세요. ("+ex.toString()+") ";
			resultCode = "6";
			
			smsMap.put("resultMsg", resultMsg);
			smsMap.put("resultCode", resultCode);
		}
		
		return smsMap;
	}	
	
	
	public static void main(String[] args){
		String phone = "0101234567";
		
		System.out.println(phone.substring(0, 3));
		System.out.println(phone.substring(3, 6));
		System.out.println(phone.substring(6, 10));
		
		
	}
}
