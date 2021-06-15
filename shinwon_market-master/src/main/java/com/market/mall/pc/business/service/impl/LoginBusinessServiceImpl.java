package com.market.mall.pc.business.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.util.AesCrypto;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsBusiness;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Business;
import com.market.mall.model.Code;
import com.market.mall.model.Business.ROLEBUSINESS;
import com.market.mall.pc.business.service.LoginBusinessService;
import com.market.mall.pc.business.service.StandingPointService;
import com.market.mall.pc.common.service.CommonService;


/**
 * @PackageName: com.market.mall.pc.business.service.impl
 * @FileName : LoginBusinessServiceImpl.java
 * @Date : 2016. 2. 5.
 * @프로그램 설명 : 프론트 > 입점신청 > 로그인 관련 처리하는 Service Implement Class
 * @author : DEV_LEEKWANGWOON
 */
@Service("pcLoginBusinessService")
public class LoginBusinessServiceImpl implements LoginBusinessService {
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	@Resource(name="pcCommonService") private CommonService pcCommonService;	
	
	@Resource(name="pcStandingPointService") private StandingPointService pcStandingPointService;
	
	@Resource
	protected Mail mail;	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * <pre>
	 * 1. MethodName : loginManagerProc
	 * 2. ClassName  : JoinBusinessServiceImpl.java
	 * 3. Comment    : 로그인 처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param request
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public Business loginManagerProc (HttpServletRequest request, Business business, HttpServletResponse response) throws Exception
    {
    	Business returnBusiness = new Business();
    	ROLEBUSINESS roleBusiness = business.getROLE_BUSINESS();
        
        /**
         * CASE 1. 회원 로그인 
         */
        if("business".equals(roleBusiness.toString()))
        {
            String loginId = StringUtil.getString(business.getVDR_LGN_BUSINESSID(), "");
            String loginPw = StringUtil.getString(business.getVDR_LGN_PW(), "");

            /**
             * CASE 1-2-1. ID가 NULL인 경우 
             */
            if("".equals(loginId))
            {
                // STEP 1-2-1-1. ERROR(아이디 필요)
                returnBusiness.setLoginStateCode(Code.LOGIN_ID_INVALID);
                returnBusiness.setROLE_BUSINESS(ROLEBUSINESS.business);
            }
            
            /**
             * CASE 1-2-2. PWD가 NULL인 경우 
             */
            else if("".equals(loginPw))
            {
                // 1-2-2-1. ERROR(비밀번호 필요)
                returnBusiness.setLoginStateCode(Code.LOGIN_PW_INVALID);
                returnBusiness.setROLE_BUSINESS(ROLEBUSINESS.business);
            }
            
            /**
             * CASE 1-2-3. ID, PWD 모두 NULL이 아닌경우 
             */
            else
            {
                Map<String, Object> userInfo = new HashMap<String, Object>();
                
            	// 비밀번호 인코딩
            	loginPw = defaultDAO.selectStr("PcLoginBusiness.pwdEncoding", business);
            	business.setVDR_LGN_PW(loginPw); 

            	userInfo = (Map<String, Object>) defaultDAO.select("PcLoginBusiness.selectLoginBusinessInfo", business);
                	
                /**
                 * CASE 1-2-3-2-1. 일치하는 사용자 정보가 없을 경우 
                 */
                if(userInfo == null)
                {
                    // STEP 1-2-3-2-1-1. ERROR(입력받은 아이디와 일치하는 정보 없음)
                    returnBusiness.setLoginStateCode(Code.LOGIN_ID_NULL);
                    returnBusiness.setROLE_BUSINESS(ROLEBUSINESS.business);
                }
                /**
                 * CASE 1-2-3-2-2. 일치하는 사용자 정보가 존재 할 경우 
                 */
                else
                {
                	// 승인대기
                	/*if( "N".equals(userInfo.get("VDR_LGN_GBN")) )
                	{
                		returnBusiness.setROLE_BUSINESS(ROLEBUSINESS.business);
                        returnBusiness.setLoginStateCode(Code.LOGIN_SITE_NOT_ACCESS);
                	}
                	else
                	{*/
                		Map<String, Object> commandMap = new HashMap<String, Object>();
                    	commandMap.put("ID",loginId);
                    	commandMap.put("PASSWORD",loginPw);

                    	userInfo.put("ROLE_BUSINESS", ROLEBUSINESS.business);
                    	userInfo.put("VDR_LGN_BUSINESSID", loginId);
                        
                        /** STEP 1-2-3-2-2-2-1. 회원정보 Sesssion에 저장 */
                        SessionsBusiness.setSessionBusiness(request, userInfo);
                        
                        // session정보 쿠키 생성
                    	Map<String, Object> userMap = SessionsBusiness.getSessionBusinessMap(request);
                    	String strUserInfo = "";
                    	
                    	// 현재 시간 
                    	String todayTime = StringUtil.getString(DateUtil.getToday() +DateUtil.getTime().substring(0,4),"0");
                    	
                        // session 값을 받아와서 cookie 생성 
                		Iterator sessionKeys = userMap.keySet().iterator();
                		while(sessionKeys.hasNext()) {
                			String cookieName = (String)sessionKeys.next();
                			strUserInfo = strUserInfo + cookieName + "=" +AesCrypto.encrypt(StringUtil.getString(userMap.get(cookieName))) + "#";
                		}
                		
                		strUserInfo = strUserInfo+"LAST_TIME="+AesCrypto.encrypt(todayTime);
               		
                		//login 정보를 cookie 저장 
                		Cookie front_user_cookie = new Cookie("front_business_cookie", strUserInfo);
                		front_user_cookie.setPath("/");
                		response.addCookie(front_user_cookie);
                        
                        returnBusiness.setVDR_LGN_BUSINESSID(loginId);
                        returnBusiness.setROLE_BUSINESS(ROLEBUSINESS.business);
                        returnBusiness.setLoginStateCode(Code.LOGIN_SUCCESS);
                        returnBusiness.setVDR_LGN_NM(StringUtil.getString(userInfo.get("VDR_LGN_NM"))); 
                        returnBusiness.setVDR_LGN_CEO_NM(StringUtil.getString(userInfo.get("VDR_LGN_CEO_NM")));
                	//}
                }
            }
        }
        
        return returnBusiness;
    }	
    
    
    /**
     * <pre>
     * 1. MethodName : selectMemberInfo
     * 2. ClassName  : LoginBusinessServiceImpl.java
     * 3. Comment    : 프론트 > 입점신청 > 회원정보수정
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 11.
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectBusinessInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("PcLoginBusiness.selectBusinessInfo", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : updateMyInfo
	 * 2. ClassName  : LoginBusinessServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 수정처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 11.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> updateBusinessInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		int result = 0;
		int MEM_MST_MEM_GBN = StringUtil.getInt(commandMap.get("MEM_MST_MEM_GBN"),0);
		int MEM_MST_JOI_RTE = StringUtil.getInt(commandMap.get("MEM_MST_JOI_RTE"),0);
		int MEM_MST_ERP_ID = StringUtil.getInt(commandMap.get("MEM_MST_ERP_ID"),0);
		
		String VDR_LGN_REG_OD = StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"), "") +StringUtil.getString(commandMap.get("VDR_LGN_BUSI2"), "") +StringUtil.getString(commandMap.get("VDR_LGN_BUSI3"), "");
		
		commandMap.put("VDR_LGN_UPD_ID", VDR_LGN_REG_OD);
		commandMap.put("VDR_LGN_UPD_IP", request.getRemoteAddr());
		
		try
		{
			result = defaultDAO.update("PcLoginBusiness.updateBusinessInfo", commandMap); 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			commandMap.put("result", 00);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return commandMap;
		}
		
		commandMap.put("result",result);
		
		return commandMap;
	}	
	
	/**
	* <pre>
	* 1. MethodName : deleteBusinessInfo
	* 2. ClassName  : LoginBusinessServiceImpl.java
	* 3. Comment    : 프론트 > 입점신청 > 입점업체 탈퇴
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 5. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> deleteBusinessInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		int result = 0;
		
		String VDR_LGN_REG_OD = StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"), "") +StringUtil.getString(commandMap.get("VDR_LGN_BUSI2"), "") +StringUtil.getString(commandMap.get("VDR_LGN_BUSI3"), "");
		
		commandMap.put("VDR_LGN_UPD_ID", VDR_LGN_REG_OD);
		commandMap.put("VDR_LGN_UPD_IP", request.getRemoteAddr());
		
		try
		{
			result = defaultDAO.delete("PcLoginBusiness.deleteBusinessInfo", commandMap); 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			commandMap.put("result", 00);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return commandMap;
		}
		
		commandMap.put("result",result);
		
		return commandMap;
	}	
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckBusinessInfoCount
	 * 2. ClassName  : LoginBusinessServiceImpl.java
	 * 3. Comment    : 프론트 > 입점신청 > 비밀번호 찾기 정보 조회
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 18.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectCheckBusinessInfoCount (Map<String,Object> commandMap) throws Exception
    {
    	
    	return defaultDAO.selectCount("PcLoginBusiness.selectCheckBusinessInfoCount", commandMap);
    }	
    
    
    
    
    /**
     * <pre>
     * 1. MethodName : updateBusinessTempPw
     * 2. ClassName  : LoginBusinessServiceImpl.java
     * 3. Comment    : 비밀번호 찾기 > 임시비밀번호 발송
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 18.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public int updateBusinessTempPw (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
    	// 임시 비밀번호 생성
    	int cnt = 10;
    	StringBuffer tempPw = new StringBuffer();
    	Random random = new Random();

    	for (int i = 0; i < cnt; i++) 
    	{
	    	if (random.nextBoolean()) 
	    	{
	    		tempPw.append((char) ((int) (random.nextInt(26)) + 97));
	    	} 
	    	else 
	    	{
	    		tempPw.append((random.nextInt(10)));
	    	}
    	}
    	
    	//-- 임시 비밀번호 생성
    	commandMap.put("VDR_LGN_TEMP_PW", tempPw.toString());
    	
    	logger.info("임시 비밀번호 >>>> " + tempPw.toString());
    	
    	
    	int result = 0;
    	String vdrLgnUpdId = "";
    	
    	vdrLgnUpdId = StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"),"") + StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"),"") + StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"),"");
    	
    	// 아이피
    	commandMap.put("VDR_LGN_UPD_IP", request.getRemoteAddr());
    	// 등록자
    	commandMap.put("VDR_LGN_UPD_ID", vdrLgnUpdId);        
    	

       	result = defaultDAO.update("PcLoginBusiness.updateBusinessTempPw", commandMap);
        
        // 메일로 임시 비밀번호 발송 
    	if(result > 0)
    	{
    		logger.info("메일로");
    		
    		
    		Map<String, Object> resultmap = new HashMap<String, Object>();
    		Map<String, Object> mailMap = new HashMap<String, Object>();
    		
    		resultmap = defaultDAO.select("PcLoginBusiness.selectBusinessInfo", commandMap);
    		
    		mailMap.put("MAIL_CODE", "6");																// 이메일 코드
    		mailMap.put("MEMBER_EMAIL", StringUtil.getString(resultmap.get("VDR_LGN_MAIL"), "") );		// 수신자 이메일
    		mailMap.put("MEMBER_NAME",  StringUtil.getString(resultmap.get("VDR_LGN_NM") ,""));			// 수신자 이름
    		mailMap.put("EMAIL_TITLE", pcCommonService.getAppName()+" "+ StringUtil.getString(resultmap.get("VDR_LGN_NM") ,"")  + "님, 요청하신 임시 비밀번호 안내드립니다. 로그인 후 변경해 주세요.");	// 메일 제목
    		
    		
    		String loginUrl = "http://www.etland.co.kr/pc/business/login.do";
    		
        	StringBuffer resultContent = new StringBuffer();
    		
    		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(resultmap.get("VDR_LGN_NM") ,"")) );
    		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(resultmap.get("VDR_LGN_BUSI1") ,"") + "-" + StringUtil.getString(resultmap.get("VDR_LGN_BUSI2") ,"") + "-" + "*****" ));
    		StringUtil.textSumDelimiter(resultContent.append(tempPw.toString()));
    		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(resultmap.get("VDR_LGN_UPD_DT") ,"")));
    		StringUtil.textSumDelimiter(resultContent.append(loginUrl));

    		mailMap.put("EMAIL_CONTENTS", resultContent.toString());	// 메일 내용
    		
    		Map<String, Object> resultMailMap = this.mail.mailSend(mailMap);
    		
    		// mail 결과 코드
    		String resultMailCode = StringUtil.getString(resultMailMap.get("resultCode"));
    		
    		logger.info("#################MAIL 관련 LOG 시작#######################");
			logger.info("resultCode : " + resultMailCode);
			logger.info("resultMsg : " + StringUtil.getString(resultMailMap.get("resultMsg")));
			logger.info("#################MAIL 관련 LOG 끝#######################");
    		
			// mail 발송 실패 시
			if(Integer.valueOf(resultMailCode) != 0)
			{
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}    		
    	}
    	
    	return result;
    }    
    
}
