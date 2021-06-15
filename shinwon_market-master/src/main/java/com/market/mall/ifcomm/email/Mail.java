package com.market.mall.ifcomm.email;

import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.util.MailSender;
import com.market.util.MapAppendUtil;

import egovframework.rte.fdl.property.EgovPropertyService;

@Component
public class Mail {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name = "propertiesService") 
    protected EgovPropertyService propertiesService;
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	/**
	 * <pre>
	 * 1. MethodName : mailSend
	 * 2. ClassName  : mail.java
	 * 3. Comment    : 이메일을 발송하는 함수, map에 담긴 resultCode 값이 '0'이 아닌 경우 오류이며 오류내용은 resultMsg를 참고한다. (실시간 발송)
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 29.
	 * </pre>
	 * @param mailMap
	 * @return
	 */
	public Map<String,Object> mailSend(Map<String,Object> mailMap){
		
		String resultMsg = "";
		String resultCode = "0";
		
		try{
			
			//properties email 발송 여부
			String emailSendYn = StringUtil.getString(propertiesService.getString("emailSendYn"),"");
			
			if(emailSendYn.equals("Y")){
				
				resultCode = "0";
				resultMsg = "정상처리";
				
				mailMap.put("resultCode" , resultCode);
				mailMap.put("resultMsg"	 , resultMsg);
				
				
				//-- 메일 아이디 확인
				String ems_id = StringUtil.getString(mailMap.get("MAIL_CODE"),"");
				
				if("".equals(ems_id)){
					resultMsg = "이메일 아이디를 지정하세요.";
					resultCode = "1";
					
					logger.debug("##### [EMAIL] 이메일 아이디 미지정 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}
				
				//-- 수신자 이메일
				String memberEmail = StringUtil.getString(mailMap.get("MEMBER_EMAIL"),"");
				if("".equals(memberEmail)){
					resultMsg = "수신자 이메일을 지정하세요.";
					resultCode = "2";
					
					logger.debug("##### [EMAIL] 이메일 주소 누락 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}
				
				//-- 수신자 이름
				String memberName = StringUtil.getString(mailMap.get("MEMBER_NAME"),"");
				if("".equals(memberName)){
					resultMsg = "수신자 이름을 지정하세요.";
					resultCode = "3";
					
					logger.debug("##### [EMAIL] 이메일 수신자이름 누락 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}
				
				//-- 이메일 제목
				String emailTitle = StringUtil.getString(mailMap.get("EMAIL_TITLE"),"");
				if("".equals(emailTitle)){
					resultMsg = "이메일 제목을 지정하세요.";
					resultCode = "4";
					
					logger.debug("##### [EMAIL] 이메일 제목 누락 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}	
				
				//-- 메일 내용
				String emailContents = StringUtil.getString(mailMap.get("EMAIL_CONTENTS"),"");
				if("".equals(emailContents)){
					resultMsg = "이메일 내용을 지정하세요.";
					resultCode = "5";
					
					logger.debug("##### [EMAIL] 이메일 내용 누락 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}					
				
				mailMap.put("EON_EVENT_ID", ems_id);   // EON 등록된 EVENT ID
				mailMap.put("REV_EMAIL", memberEmail); // 받는사람의 이메일주소			
				mailMap.put("REV_NAME", memberName);   // 받는사람의 이름
				mailMap.put("SUBJECT", emailTitle);    // 이메일 제목

				// 내용에 따른 분기
				if(emailContents.length() < 2000){
					mailMap.put("MAPPING1", emailContents);
					mailMap.put("MAIL_ISLONG_YN", "N");// 이메일 내용
				}else{
					mailMap.put("MAPPING", emailContents);    // 이메일 내용
					mailMap.put("MAIL_ISLONG_YN", "Y");// 이메일 내용
				}
				
				
				logger.debug(resultMsg);
				
				logger.info("tr_num >> " + resultCode);				
				
				int mailSendResult = MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
				
				if(mailSendResult!=1) {
					resultCode = "400";
					resultMsg = "이메일 발송기능이 실패하였습니다.";
				}
				
				if("0".equals(mailMap.get("resultCode"))){
					MapAppendUtil.appendTablePrefix(mailMap, "MAIL_");
					mailMap.put("MAIL_KIND", mailMap.get("MAIL_CODE"));
					int tr_num = defaultDAO.insert("EMAILSEND.insertEmailSend", mailMap);
					logger.info("tr_num >> " + tr_num);					
					mailMap.put("TR_NUM"	,String.valueOf(tr_num));
				}				
				
			   logger.debug("###############################################");
			   logger.debug("이메일발송처리 - 시작");
			   logger.debug("수신자메일 : <"+ memberEmail +">");
			   logger.debug("수신자이름 : <"+ memberName +">");
			   logger.debug("제목 : " + emailTitle);
			   logger.debug("본문 : " + emailContents);
			   logger.debug("이메일발송처리 - 끝");
			   logger.debug("###############################################");
			}else{
				resultCode = "44";
				resultMsg = "설정파일 emailSendYn이 N입니다.";
				
				logger.debug(resultMsg);
				
				mailMap.put("resultCode" ,resultCode);
				mailMap.put("resultMsg"	,resultMsg);
			}
			
			
			
		} catch(Exception ex){
			ex.printStackTrace();
			logger.error("메일 발송중 예외가 발생하였습니다.", ex);
			
			resultMsg = "오류 발생, 상세내용을 log를 참조하세요. ("+ex.toString()+") ";
			resultCode = "6";
			
			mailMap.put("resultMsg", resultMsg);
			mailMap.put("resultCode", resultCode);
		}
		
		return mailMap;
	}
	
	
	/**
	 * <pre>
	 * 1. MethodName : mailSendForm
	 * 2. ClassName  : Mail.java
	 * 3. Comment    : 이메일을 발송하는 함수, map에 담긴 resultCode 값이 '0'이 아닌 경우 오류이며 오류내용은 resultMsg를 참고한다. (이벤트 발송)
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 3. 2.
	 * </pre>
	 * @param mailMap
	 * @return
	 */
	public Map<String,Object> mailSendForm(Map<String,Object> mailMap){
		
		String resultMsg = "";
		String resultCode = "0";
		
		try{
			
			//properties email 발송 여부
			String emailSendYn = StringUtil.getString(propertiesService.getString("emailSendYn"),"");
			
			if(emailSendYn.equals("Y")){
				
				resultCode = "0";
				resultMsg = "정상처리";
				
				mailMap.put("resultCode" , resultCode);
				mailMap.put("resultMsg"	 , resultMsg);
				
				
				//-- 메일 아이디 확인
				String ems_id = StringUtil.getString(mailMap.get("MAIL_CODE"),"");
				
				if("".equals(ems_id)){
					resultMsg = "이메일 아이디를 지정하세요.";
					resultCode = "1";
					
					logger.debug("##### [EMAIL] 이메일 아이디 미지정 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}
				
				//-- 수신자 이메일
				String memberEmail = StringUtil.getString(mailMap.get("MEMBER_EMAIL"),"");
				if("".equals(memberEmail)){
					resultMsg = "수신자 이메일을 지정하세요.";
					resultCode = "2";
					
					logger.debug("##### [EMAIL] 이메일 주소 누락 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}
				
				//-- 수신자 이름
				String memberName = StringUtil.getString(mailMap.get("MEMBER_NAME"),"");
				if("".equals(memberName)){
					resultMsg = "수신자 이름을 지정하세요.";
					resultCode = "3";
					
					logger.debug("##### [EMAIL] 이메일 수신자이름 누락 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}
				
				//-- 이메일 제목
				String emailTitle = StringUtil.getString(mailMap.get("EMAIL_TITLE"),"");
				if("".equals(emailTitle)){
					resultMsg = "이메일 제목을 지정하세요.";
					resultCode = "4";
					
					logger.debug("##### [EMAIL] 이메일 제목 누락 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}	
				
				//-- 메일 내용
				String emailContents1 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS1"),"");
				String emailContents2 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS2"),"");
				String emailContents3 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS3"),"");
				String emailContents4 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS4"),"");
				String emailContents5 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS5"),"");
				String emailContents6 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS6"),"");
				String emailContents7 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS7"),"");
				String emailContents8 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS8"),"");
				String emailContents9 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS9"),"");
				String emailContents10 = StringUtil.getString(mailMap.get("EMAIL_CONTENTS10"),"");
				if("".equals(emailContents1)){
					resultMsg = "이메일 내용을 지정하세요.";
					resultCode = "5";
					
					logger.debug("##### [EMAIL] 이메일 내용 누락 #####");
					
					mailMap.put("resultMsg", resultMsg);
					mailMap.put("resultCode", resultCode);
					
					return mailMap;
				}					
				
				mailMap.put("EON_EVENT_ID", ems_id);   // EON 등록된 EVENT ID
				mailMap.put("REV_EMAIL", memberEmail); // 받는사람의 이메일주소			
				mailMap.put("REV_NAME", memberName);   // 받는사람의 이름
				mailMap.put("SUBJECT", emailTitle);    // 이메일 제목
				
				mailMap.put("SEND_EMAIL", Code.EMAIL_SENDER_EMAIL);	  // 발신자 이메일
				mailMap.put("SEND_NAME" , Code.EMAIL_SENDER_NAME);	  // 발신자 이름
				mailMap.put("RETURN_EMAIL", Code.EMAIL_RETURN_EMAIL); // 리턴 이메일
				
				mailMap.put("MAPPING1", emailContents1);    // 이메일 내용1				
				mailMap.put("MAPPING2", emailContents2);    // 이메일 내용2				
				mailMap.put("MAPPING3", emailContents3);    // 이메일 내용3				
				mailMap.put("MAPPING4", emailContents4);    // 이메일 내용4				
				mailMap.put("MAPPING5", emailContents5);    // 이메일 내용5				
				mailMap.put("MAPPING6", emailContents6);    // 이메일 내용6				
				mailMap.put("MAPPING7", emailContents7);    // 이메일 내용7				
				mailMap.put("MAPPING8", emailContents8);    // 이메일 내용8				
				mailMap.put("MAPPING9", emailContents9);    // 이메일 내용9				
				mailMap.put("MAPPING10", emailContents10);  // 이메일 내용10				
				
				logger.debug("resultMsg >> " + resultMsg);
				logger.info("tr_num >> " + resultCode);				
				
				if("0".equals(mailMap.get("resultCode")))
				{
				    // 이벤트발송 마스터 Insert
					int tr_num = defaultDAO.insert("EMAILSEND.insertEmailSendForm", mailMap); 
					logger.info("tr_num >> " + tr_num);

					mailMap.put("SEQ"	,String.valueOf(tr_num));
					defaultDAO.insert("EMAILSEND.insertEmailSendList", mailMap);	// 이벤트발송 서브 Insert
					
					defaultDAO.update("EMAILSEND.updateEmailSendForm", mailMap);	// 이벤트발송 마스터 Update
					
				}				
				
			   logger.debug("###############################################");
			   logger.debug("이메일발송처리 - 시작");
			   logger.debug("수신자메일 : <"+ memberEmail +">");
			   logger.debug("수신자이름 : <"+ memberName +">");
			   logger.debug("제목 : " + emailTitle);
			   logger.debug("본문 : " + emailContents1);
			   logger.debug("이메일발송처리 - 끝");
			   logger.debug("###############################################");
			}else{
				resultCode = "44";
				resultMsg = "설정파일 emailSendYn이 N입니다.";
				
				logger.debug(resultMsg);
				
				mailMap.put("resultCode" ,resultCode);
				mailMap.put("resultMsg"	,resultMsg);
			}
			
			
			
		} catch(Exception ex){
			ex.printStackTrace();
			logger.error("메일 발송중 예외가 발생하였습니다.", ex);
			
			resultMsg = "오류 발생, 상세내용을 log를 참조하세요. ("+ex.toString()+") ";
			resultCode = "6";
			
			mailMap.put("resultMsg", resultMsg);
			mailMap.put("resultCode", resultCode);
		}
		
		return mailMap;
	}	
}
