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
import com.market.mall.model.Business;
import com.market.mall.model.Code;
import com.market.mall.model.Business.ROLEBUSINESS;
import com.market.mall.pc.business.service.JoinBusinessService;

/**
 * @PackageName: com.market.mall.pc.member.service.impl
 * @FileName : JoinMemberServiceImpl.java
 * @Date : 2015. 11. 12.
 * @프로그램 설명 : 프론트 > 회원가입을 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("pcJoinBusinessService")
public class JoinBusinessServiceImpl implements JoinBusinessService {
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCheckBusinessNoCount
	 * 2. ClassName  : JoinBusinessServiceImpl.java
	 * 3. Comment    : 사업자 번호 체크
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 4.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCheckBusinessNoCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcJoinBusiness.selectCheckBusinessNoCount", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : insertBusiness
	 * 2. ClassName  : JoinBusinessServiceImpl.java
	 * 3. Comment    : 회원등록
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> insertBusiness(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
		
		String VDR_LGN_REG_OD = StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"), "") +StringUtil.getString(commandMap.get("VDR_LGN_BUSI2"), "") +StringUtil.getString(commandMap.get("VDR_LGN_BUSI3"), "");
		commandMap.put("VDR_LGN_REG_IP", request.getRemoteAddr());
		commandMap.put("VDR_LGN_REG_ID", VDR_LGN_REG_OD);

		int result = 0;
		
		try
		{
			int businessCount = defaultDAO.selectCount("PcJoinBusiness.selectCheckBusinessNoCount", commandMap);
			if(businessCount > 0){
				commandMap.put("result",-1);
				return commandMap;
			}
			
			result = defaultDAO.insert("PcJoinBusiness.insertBusiness", commandMap);
		}
		catch(Exception e){
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
            Map<String, Object> historyMap = new HashMap<String, Object>();
            
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
                	/*// 승인대기
                	if( "N".equals(userInfo.get("VDR_LGN_GBN")) )
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
                		Cookie front_user_cookie = new Cookie("front_user_cookie", strUserInfo);
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
	
}
