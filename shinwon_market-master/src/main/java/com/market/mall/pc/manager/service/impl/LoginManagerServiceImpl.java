package com.market.mall.pc.manager.service.impl;

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
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.manager.service.LoginManagerService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.manager.service.impl
 * @FileName : LoginManagerServiceImpl.java
 * @Date : 2016. 8. 31.
 * @프로그램 설명 : 프론트 > 사용자 로그인을 처리하는 Service Implement Class
 * @author DEV_KIMYEONGJUN
 */
@Service("pcLoginManagerService")
public class LoginManagerServiceImpl implements LoginManagerService{

    @Resource(name="defaultDAO")	
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name = "propertiesService") 
    protected EgovPropertyService propertiesService;
    
    @Resource   
    protected Mail mail;	
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * <pre>
     * 1. MethodName : loginManagerProc
     * 2. ClassName  : LoginManagerServiceImpl.java
     * 3. Comment    : 회원, 비회원 로그인을 처리
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 31.
     * </pre>
     *
     * @param request
     * @param user
     * @param response
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public User loginManagerProc (HttpServletRequest request, User user, HttpServletResponse response) throws Exception
    {
        User returnUser = new User();
        ROLEUSER roleUser = user.getROLE_USER();
          
        /**
         * ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 로그인 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
         * 
         *  CASE 1. 회원 로그인
         *  ===================================================================================
         *  CASE 1-2-1. ID가 NULL인 경우
         *      STEP 1-2-1-1. ERROR(아이디 필요)
         *  CASE 1-2-2. PWD가 NULL인 경우
         *      STEP 1-2-2-1. ERROR(비밀번호 필요)
         *  CASE 1-2-3. ID, PWD 모두 NULL이 아닌경우
         *      STEP 1-2-3-1. Parameter Setting
         *      STEP 1-2-3-2. 사용자 정보 조회
         *      CASE 1-2-3-2-1. 일치하는 사용자 정보가 없을 경우
         *          STEP 1-2-3-2-1-1. ERROR(입력받은 아이디와 일치하는 정보 없음)
         *      CASE 1-2-3-2-2. 일치하는 사용자 정보가 존재 할 경우
         *          STEP 1-2-3-2-2-1. CRM 로그인정보 조회
         *              STEP 1-2-3-2-2-2-1. 회원정보 Sesssion에 저장
         *              STEP 1-2-3-2-2-2-2. 로그인 이력 등록
         *              STEP 1-2-3-2-2-2-3. 포인트 지급
         *              
         *  
         *  CASE 2. 비회원 로그인
         *  ===================================================================================
         *      CASE 2-1. 비회원 주문번호가 NULL 인경우
         *          STEP 2-1-1. ERROR(주문번호 필요)
         *      CASE 2-2. 비회원 주문 주문자명이 NULL인 경우
         *          STEP 2-2-1. ERROR(주문자명 필요)
         *      CASE 2-3. 모두 NULL이 아닌경우
         *          STEP 2-3-1. 주문정보 조회
         *          CASE 2-3-1. 일치하는 주문정보가 없는경우
         *              STEP 2-3-1-1. ERROR(일치하는 주문정보가 존재하지 않음)
         *          CASE 2-3-2. 일치하는 주문정보가 존재하는 경우
         *              CASE 2-4-2-1. 주문자명이 일치하는 경우
         *                  STEP 2-4-2-1-1. 비회원 주문자 정보 Session에 저장
         *              CASE 2-4-2-2. 주문자명이 일치하지 않는경우
         *                  STEP 2-4-2-2-1. ERROR(주문자명이 일치하지 않음)
         * 
         */
        
        /* ************************************************************************************************************************************************ */
        /* ************************************************************** 회원 로그인 시작 **************************************************************** */
        /** CASE 1. 회원 로그인 */
        if("user".equals(roleUser.toString()))
        {
            Map<String, Object> historyMap = new HashMap<String, Object>();
            
            String loginId = StringUtil.getString(user.getMEM_MST_MEM_ID(), "");
            String loginPw = StringUtil.getString(user.getMEM_MST_WEB_PWD(), "");
            
            /** CASE 1-2-1. ID가 NULL인 경우 */
            if("".equals(loginId))
            {
                // STEP 1-2-1-1. ERROR(아이디 필요)
                returnUser.setLoginStateCode(Code.LOGIN_ID_INVALID);
                returnUser.setROLE_USER(ROLEUSER.user);
            }
            /** CASE 1-2-2. PWD가 NULL인 경우 */
            else if("".equals(loginPw))
            {
                // 1-2-2-1. ERROR(비밀번호 필요)
                returnUser.setLoginStateCode(Code.LOGIN_PW_INVALID);
                returnUser.setROLE_USER(ROLEUSER.user);
            }
            /** CASE 1-2-3. ID, PWD 모두 NULL이 아닌경우 */
            else
            {
                /** STEP 1-2-3-1. Parameter Setting */
                /** STEP 1-2-3-2. 사용자 정보 조회 */
                Map<String, Object> userInfo = new HashMap<String, Object>();
                String MEM_MST_LEV_YN = "";  // 탈퇴여부
                
            	// 자동로그인 쿠키 조회
            	Cookie[] cookies = request.getCookies();
            	boolean isAutoLogin = false;
        		String autoLoginYn = "";
        		
        		if(cookies != null)
        		{
        			for(Cookie cookie : cookies){
	            		if("cookieEtlandUserAutoLogin".equals(cookie.getName()))
	            		{
	            			isAutoLogin = true;
	            		}
	            	}
        		}
        		
        		// 자동로그인 쿠키가 있는 경우
        		if(isAutoLogin)
        		{
        			autoLoginYn = "Y";
        		}
        		else
        		{
        			autoLoginYn = "N";
        		}

        		user.setAutoLoginYn(autoLoginYn);
            	
            	if("N".equals(autoLoginYn))
            	{
            		// 비밀번호 인코딩
                	loginPw = defaultDAO.selectStr("PcLoginManager.pwdEncoding", user);
                	user.setMEM_MST_WEB_PWD(loginPw);	// 인코딩된 비밀번호 user에 담기
            	}

            	// 사용자 정보 조회
            	userInfo = (Map<String, Object>) defaultDAO.select("PcLoginManager.selectLoginManagerInfo", user);
            	
            	// 탈퇴회원 조회
            	if(userInfo == null)
            	{
            		MEM_MST_LEV_YN = "N";
            	}
                	
                /** CASE 1-2-3-2-1. 일치하는 사용자 정보가 없을 경우 */
                if(userInfo == null)
                {
                	// 탈퇴회원의 경우
                	if("Y".equals(MEM_MST_LEV_YN))
                	{
                		returnUser.setROLE_USER(ROLEUSER.user);
                        returnUser.setLoginStateCode(Code.LOGIN_SITE_NOT_ACCESS);
                	}
                	else
                	{
                		// STEP 1-2-3-2-1-1. ERROR(입력받은 아이디와 일치하는 정보 없음)
                        returnUser.setLoginStateCode(Code.LOGIN_ID_NULL);
                        returnUser.setROLE_USER(ROLEUSER.user);
                	}
                }
                /** CASE 1-2-3-2-2. 일치하는 사용자 정보가 존재 할 경우 */
                else
                {
                	// 블랙리스트 회원
                	if("Y".equals(userInfo.get("MEM_MST_BLK_YN")))
                	{	
                		returnUser.setROLE_USER(ROLEUSER.user);
                        returnUser.setLoginStateCode(Code.LOGIN_STOP_LOGIN);
                	}
                	// 임시비밀번호 발급한 회원
                	else if("Y".equals(userInfo.get("MEM_MST_TMP_PW_YN")))
                	{
                		// 임시 비밀번호 유효시간 체크(4시간)
                		int checkTempPwDt = defaultDAO.selectCount("PcLoginManager.selectCheckPwDtCount", userInfo);
                		
                		if(checkTempPwDt > 0)
                		{
                			Map<String, Object> commandMap = new HashMap<String, Object>();
                        	commandMap.put("ID",loginId);
                        	commandMap.put("PASSWORD",loginPw);

                        	userInfo.put("ROLE_USER", ROLEUSER.user);
                            
                            /** STEP 1-2-3-2-2-2-1. 회원정보 Sesssion에 저장 */
                            SessionsUser.setSessionUser(request, userInfo);
                            
                            // session정보 쿠키 생성
                        	Map<String, Object> userMap = SessionsUser.getSessionUserMap(request);
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
                   		
                    		// login 정보를 cookie 저장 
                    		Cookie front_user_cookie = new Cookie("front_user_cookie", strUserInfo);
                    		front_user_cookie.setPath("/");
                    		response.addCookie(front_user_cookie);
                            
                    		returnUser.setMEM_MST_MEM_PW_CHG_DT(StringUtil.getString(userInfo.get("MEM_MST_MEM_PW_CHG_DT")));
                            returnUser.setMEM_MST_MEM_ID(loginId);
                            returnUser.setROLE_USER(ROLEUSER.user);
                            returnUser.setLoginStateCode(Code.LOGIN_SUCCESS);
                            returnUser.setRST_YN(StringUtil.getString(userInfo.get("RST_YN")));                   // 휴면여부
                            returnUser.setMEM_MST_MEM_GBN(StringUtil.getString(userInfo.get("MEM_MST_MEM_GBN"))); // 회원 구분코드
                            returnUser.setLOGIN_PIT_YN(StringUtil.getString(userInfo.get("LOGIN_PIT_YN")));       // 로그인 시 포인트 지급 여부(하루에 한번)
                		}
                		else
                		{
                			returnUser.setROLE_USER(ROLEUSER.user);
                            returnUser.setLoginStateCode(Code.LOGIN_PASS_EFFECTIVE_TIME);
                		}
                	}
                	else
                	{
                		Map<String, Object> commandMap = new HashMap<String, Object>();
                    	commandMap.put("ID",loginId);
                    	commandMap.put("PASSWORD",loginPw);

                    	userInfo.put("ROLE_USER", ROLEUSER.user);
                        
                        /** STEP 1-2-3-2-2-2-1. 회원정보 Sesssion에 저장 */
                        SessionsUser.setSessionUser(request, userInfo);
                        
                        // session정보 쿠키 생성
                    	Map<String, Object> userMap = SessionsUser.getSessionUserMap(request);
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
                        
                        returnUser.setMEM_MST_MEM_ID(loginId);
                        returnUser.setROLE_USER(ROLEUSER.user);
                        returnUser.setLoginStateCode(Code.LOGIN_SUCCESS);
                        returnUser.setRST_YN(StringUtil.getString(userInfo.get("RST_YN")));                   // 휴면여부
                        returnUser.setMEM_MST_MEM_GBN(StringUtil.getString(userInfo.get("MEM_MST_MEM_GBN"))); // 회원 구분코드
                        returnUser.setLOGIN_PIT_YN(StringUtil.getString(userInfo.get("LOGIN_PIT_YN")));       // 로그인 시 포인트 지급 여부(하루에 한번)
                	}
                	
                	// 전환 페이지 이동 여부(온라인회원,간편회원만 해당 / 마지막방문일 + 15일 여부 체크)
                	int PASS_VST = StringUtil.getInt(userInfo.get("VST_PASS_CNT"));
                	
                	if(PASS_VST > 15)
                	{
                		returnUser.setVST_PASS_YN("Y");
                	}
                	
                	// 방문일, 방문횟수 update
            		defaultDAO.update("PcLoginManager.updateVisitInfo", user.getMEM_MST_MEM_ID());
                	
                	// 로그인 이력 등록
                    historyMap.put("LGI_HIS_REG_IP", request.getRemoteAddr());
                    historyMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
                    defaultDAO.insert("PcLoginManager.insertLoginHistory", historyMap);
                }
            }
        }
        /* ************************************************************************************************************************************************ */
        /* ******************************************************** 비회원 구매자 로그인 시작 ************************************************************* */
        /** CASE 2. 비회원 로그인 */
        else if("order_guest".equals(roleUser.toString()))
        {
            String nonLoginOrdCd = StringUtil.getString(user.getORD_MST_CD(), "");      // 비회원 주문번호
            String nonLoginOrdNm = StringUtil.getString(user.getORD_MST_ORD_NM(), "");  // 비회원 주문자명
            
            /** CASE 2-1. 비회원 주문번호가 NULL 인경우 */
            if("".equals(nonLoginOrdCd)) 
            { 
                // STEP 2-1-1. ERROR(주문번호 필요)
                returnUser.setLoginStateCode(Code.LOGIN_ORD_CODE_INVALID);
                returnUser.setROLE_USER(ROLEUSER.order_guest);
            }
            /** CASE 2-2. 비회원 주문자명 NULL 인경우 */
            else if("".equals(nonLoginOrdNm))
            {
                // STEP 2-2-1. ERROR(주문자명 필요)
                returnUser.setLoginStateCode(Code.LOGIN_NON_MEM_NM_INVALID);
                returnUser.setROLE_USER(ROLEUSER.order_guest);
            }
            /** CASE 2-3. 모두 NULL이 아닌경우 */
            else
            {
                /** STEP 2-3-1. 주문정보 조회 */
                Map<String, Object> orderInfo = (Map<String, Object>) defaultDAO.select("PcLoginManager.selectLoginManagerOrderInfo", user);
                
                /** CASE 2-3-1. 일치하는 주문정보가 없는경우 */
                if(orderInfo == null)
                {
                    // STEP 2-3-1-1. ERROR(일치하는 주문정보가 없는경우)
                    returnUser.setLoginStateCode(Code.LOGIN_ORD_CODE_NULL);
                    returnUser.setROLE_USER(ROLEUSER.order_guest);
                }
                /** CASE 2-3-2. 일치하는 주문정보가 존재하는 경우 */
                else
                {
                    /** CASE 2-3-2-1. 주문자명이 일치하는 경우 */
                    if(nonLoginOrdNm.equals(StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "")))
                    {
                        orderInfo.put("ROLE_USER", ROLEUSER.order_guest);
                        
                        /** STEP 2-3-2-1-1. 비회원 주문자 정보 Session에 저장 */
                        SessionsUser.setSessionUser(request, orderInfo);
                        
                        // session정보 쿠키 생성
                    	Map<String, Object> userMap = SessionsUser.getSessionUserMap(request);
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
                        
                        returnUser.setROLE_USER(ROLEUSER.order_guest);
                        returnUser.setLoginStateCode(Code.LOGIN_NON_MEM_SUCCESS);
                    }
                    /** CASE 2-3-2-2. 주문자명이 일치하지 않는경우 */
                    else
                    {
                        // STEP  2-3-2-2-1. ERROR(주문자명이 일치하지 않는경우)
                        returnUser.setLoginStateCode(Code.LOGIN_NON_MEM_NM_INCORRECT);
                        returnUser.setROLE_USER(ROLEUSER.order_guest);
                    }
                }
            }
        }
        
        return returnUser;
    }
    
    /**
     * <pre>
     * 1. MethodName : loginSnsManagerProc
     * 2. ClassName  : LoginManagerServiceImpl.java
     * 3. Comment    : SNS 계정 사용자 로그인 처리
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */ 
    @SuppressWarnings("unchecked") 
    public User loginSnsManagerProc (HttpServletRequest request, User user, HttpServletResponse response) throws Exception
    {
        /**
         * ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 로그인 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
         * 
         *  CASE 3. SNS 로그인
         *  ===================================================================================
         *      CASE 3-1. SNS 고유 아이디 NULL 인경우
         *          STEP 3-1-1. ERROR(SNS 고유 아이디 필요)
         *      CASE 3-2. SNS 고유 아이디 NULL이 아닌경우 
         *          STEP 3-2-1. 사용자 정보 조회
         *          CASE 3-2-1. 일치하는 사용자 정보가 없을 경우
         *              STEP 3-1-1-1. ERROR(일치하는 사용자 정보가 없을 경우)
         *          CASE 3-2-2. 일치하는 사용자 정보가 있을 경우
         *              STEP 3-2-2-1. 회원정보 Sesssion에 저장
         */
          
        User returnUser = new User(); 
        
        String snsLoginId = StringUtil.getString(user.getMEM_SNS_ID(), "");  // SNS 아이디(고유 KEY)
        
        /** CASE 3-1. SNS 고유 아이디 NULL 인경우 */
        if("".equals(snsLoginId)) 
        { 
            // STEP 3-3-1. ERROR(SNS 고유 아이디 필요)
            returnUser.setLoginStateCode(Code.LOGIN_SNS_ID_INVALID);
            returnUser.setROLE_USER(ROLEUSER.user);
        }
        /** CASE 3-2. SNS 고유 아이디 NULL이 아닌경우 */
        else
        {
            /** STEP 3-2-1. 사용자 정보 조회 */
            // 사용자 정보 조회: MEM_SNS_ID: SNS 고유 KEY로 로그인 처리                  
            Map<String, Object> userInfo = (Map<String, Object>) defaultDAO.select("PcLoginManager.selectLoginSnsManagerInfo", user);  
            
            /** CASE 3-2-1. 일치하는 사용자 정보가 없을 경우 */
            if(userInfo == null) 
            { 
                // STEP 3-3-1-1. ERROR(일치하는 사용자 정보가 없을 경우)
                returnUser.setLoginStateCode(Code.LOGIN_ID_NULL);  
            }
            /** CASE 3-2-2. 일치하는 사용자 정보가 있을 경우 */  
            else
            {  
                Map<String, Object> historyMap = new HashMap<String, Object>();
                userInfo.put("ROLE_USER", user.getROLE_USER());
                  
                /** STEP 3-2-2-1. 회원정보 Sesssion에 저장 */
                SessionsUser.setSessionUser(request, userInfo);  
                
                // session정보 쿠키 생성
                Map<String, Object> userMap = SessionsUser.getSessionUserMap(request);
                String strUserInfo = "";
                
                // 현재 시간 
                String todayTime = StringUtil.getString(DateUtil.getToday() +DateUtil.getTime().substring(0,4),"0");
                
                // session 값을 받아와서 cookie 생성 
                // keySet() : userMap에 어떤 키값들이 들어있는지 확인, iterator() : 순서대로
                Iterator sessionKeys = userMap.keySet().iterator();  // java.util.HashMap$KeyIterator@1ae792c9
                
                while(sessionKeys.hasNext()) {                       
                    String cookieName = (String)sessionKeys.next();  // cookieName : MEM_MST_MAIL
                   
                    // strUserInfo: MEM_MST_MAIL=7f3c3ee211f850630027de7b2e1a01ccc99391906697c3fa0c1fec8186ee072d#
                    strUserInfo = strUserInfo + cookieName + "=" +AesCrypto.encrypt(StringUtil.getString(userMap.get(cookieName))) + "#";
                }  
                
                strUserInfo = strUserInfo+"LAST_TIME="+AesCrypto.encrypt(todayTime);
            
                // login 정보를 cookie 저장 
                Cookie front_user_cookie = new Cookie("front_user_cookie", strUserInfo);
                front_user_cookie.setPath("/");
                response.addCookie(front_user_cookie);
                
                returnUser.setLoginStateCode(Code.LOGIN_SNS_SUCCESS);
                
                // 방문수, 최근방문일 갱신
                defaultDAO.update("PcLoginManager.updateVisitInfo", userInfo);
                  
                // 로그인 이력 등록
                historyMap.put("LGI_HIS_REG_IP", request.getRemoteAddr());
                historyMap.put("MEM_MST_MEM_ID", userInfo.get("MEM_MST_MEM_ID"));
                defaultDAO.insert("PcLoginManager.insertLoginHistory", historyMap);
            }
        }  
        
        return returnUser; 
    }      
    
    /**   
    * <pre>
    * 1. MethodName : insertLoginPoint
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 로그인 성공 시 포인트 지급
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 16.
    * </pre>
    *
    * @param commandMap
    * @throws Exception
    */
    public void insertLoginPoint (Map<String,Object> commandMap) throws Exception
    {
    	int PIT_MST_PIT = 10;
    	
    	commandMap.put("PIT_MST_BRK_DWN", Code.LOGIN_SUCCESS_POINT_CODE);
    	commandMap.put("PIT_MST_PIT", PIT_MST_PIT);
    	commandMap.put("PIT_MST_GBN", "P");
    	
    	// 로그인한 회원의 전체 포인트 조회
    	int MEM_PIT_TOT_PIT = this.defaultDAO.selectCount("PcLoginManager.selectMemTotalPoint", commandMap);
    	
    	// 포인트 적립/차감 관리에 내역 추가
    	int result = this.defaultDAO.insert("PcLoginManager.insertLoginPoint", commandMap);
    	
    	if(result > 0)
    	{
    		// 전체 포인트 + 상품 후기 작성 포인트 지급 합산
        	commandMap.put("MEM_PIT_TOT_PIT", MEM_PIT_TOT_PIT + PIT_MST_PIT);
        	
    		// 회원 포인트 관리에 지급 내역 추가
    		this.defaultDAO.insert("PcLoginManager.insertLoginPointMember", commandMap);
    	}
    	
    }
    
    /**
    * <pre>
    * 1. MethodName : selectRestMemberInfo
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 휴면회원 > 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> selectRestMemberInfo (HttpServletRequest request,Map<String,Object> commandMap) throws Exception
    {
    	// 휴면회원정보조회
    	commandMap.put("MEMBER_TYPE_PRI", Code.COMMON_PRI_MEMBER_GRADE);
		commandMap.put("MEMBER_TYPE_SIMPLE", Code.MEMBER_TYPE_SIMPLE);
		commandMap.put("MEMBER_TYPE_COMP", Code.COMMON_COMP_MEMBER_GRADE);		
    	Map<String,Object> restMemberInfo = defaultDAO.select("PcLoginManager.selectRestMemberInfo", commandMap);
    	
    	commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
    	
    	int result = 0;
    	
    	try
		{
    		int MEM_MST_ERP_ID = StringUtil.getInt(restMemberInfo.get("MEM_MST_ERP_ID"),0);
    		
    		// 기간계고객코드가 있는 경우만 해당
			if(MEM_MST_ERP_ID != 0)
			{
				// 온라인 회원이 아닌경우만 해당
				if("N".equals(StringUtil.getString(restMemberInfo.get("ONLINE_YN"))))
				{
					// 회원수정관련 프로시저 호출(ERP)
					Map<String,Object> erpJoinParamMap = new HashMap<String, Object>();
					
					// 휴면회원 해제
					
					erpJoinParamMap.put("P_AN8", MEM_MST_ERP_ID);	// 고객번호
					erpJoinParamMap.put("P_E1URCD4", StringUtil.getString(restMemberInfo.get("P8E1URCD4")));		// I/F구분
					
					// 프로시저 호출 실패 시 에러 관련 처리해야함... rollback
					logger.info("#### R_RESULT ####"+String.valueOf(erpJoinParamMap.get("R_RESULT")));
					logger.info("#### R_SQLERRM ####"+String.valueOf(erpJoinParamMap.get("R_SQLERRM")));
					
					if(!"Y".equals(String.valueOf(erpJoinParamMap.get("R_RESULT"))))
					{
						restMemberInfo.put("result", -99);
						restMemberInfo.put("ERP_ERR_MSG", String.valueOf(erpJoinParamMap.get("R_SQLERRM")));
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						return restMemberInfo;
					}
				}
			}
			
			// 휴면회원 테이블에서 회원 마스터 테이블로 정보 이동
        	result = defaultDAO.insert("PcLoginManager.updateRestMember", commandMap);
			
        	if(result > 0)
        	{
        		//휴면회원테이블의 정보 삭제
	    		defaultDAO.delete("PcLoginManager.deleteRestMember", commandMap);
        	}
		}
    	catch(Exception e)
		{
			e.printStackTrace();
			restMemberInfo.put("result", 00);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return restMemberInfo;
		}
    	
    	restMemberInfo.put("result",result);
    	return restMemberInfo;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCertifyInfo
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : siren 본인인증(휴대폰, 아이핀) CI값으로 회원 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> selectCertifyInfo (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.select("PcLoginManager.selectCertifyInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectSimpleMemInfo
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 아이디 찾기 > 간편회원조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> selectSimpleMemInfo (Map<String,Object> commandMap) throws Exception
    {
    	// 간편회원 공통코드 값
    	commandMap.put("MEM_MST_MEM_GBN", Code.MEMBER_TYPE_SIMPLE);
    	
    	return defaultDAO.select("PcLoginManager.selectSimpleMemInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectBusinessMemIdList
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 아이디찾기 > 기업회원 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBusinessMemIdList (Map<String,Object> commandMap) throws Exception
    {
    	// 기업회원 공통코드 값
    	commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_COMP_MEMBER_GRADE);
    	
    	return defaultDAO.selectList("PcLoginManager.selectBusinessMemIdList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCheckBasicMemInfoCount
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 비밀번호찾기 > 통합회원 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCheckBasicMemInfoCount (Map<String,Object> commandMap) throws Exception
    {
    	// 통합회원 공통코드 값
    	commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_PRI_MEMBER_GRADE);
    	
    	return defaultDAO.selectCount("PcLoginManager.selectCheckBasicMemInfoCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateBasicMemPw
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 비밀번호찾기 결과 > 통합회원 > 비밀번호 변경
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public int updateBasicMemPw (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
    	commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
    	
    	int result = 0;
    	
    	// 휴면회원
    	if("Y".equals(commandMap.get("RST_YN")))
    	{
    		result = defaultDAO.update("PcLoginManager.updateRestBasicMemPw", commandMap);
    	}
    	else
    	{
    		result = defaultDAO.update("PcLoginManager.updateBasicMemPw", commandMap);
    	}
    	
    	logger.info("메일로 비밀번호 변경되었음을 알립니다.");
    	
    	/* 메일 발송 시작 */
    	Map<String,Object> sendMap = defaultDAO.select("PcLoginManager.selectChangePwMemInfo", commandMap);
		Map<String,Object> mailMap = new HashMap<String, Object>();
		
		if("".equals(StringUtil.getString(sendMap.get("MEM_MST_MAIL"),"")))
		{
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = -1;
		}
			
		String userNm = FormatUtil.markingName(StringUtil.getString(sendMap.get("MEM_MST_MEM_NM"),""));
		
		mailMap.put("MAIL_CODE", "5");	// 이메일 코드
		mailMap.put("MEMBER_EMAIL", StringUtil.getString(sendMap.get("MEM_MST_MAIL"),""));	//	수신자 이메일
		mailMap.put("MEMBER_NAME", userNm);	//	수신자 이름
		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + userNm  + "님, 비밀번호가 변경되었습니다.");	// 메일 제목
		
		StringBuffer resultContent = new StringBuffer();
		
		StringUtil.textSumDelimiter(resultContent.append(userNm));
		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("MASK_MEM_MST_MEM_ID") ,"")));
		StringUtil.textSumDelimiter(resultContent.append("비밀번호 찾기"));
		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("UPDATE_DT") ,"")));

		mailMap.put("EMAIL_CONTENTS", resultContent.toString());	// 메일 내용
		
		Map<String,Object> resultMailMap = this.mail.mailSend(mailMap);
		
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
			result = -2;
		}
		/* 메일 발송 끝 */
    	
    	return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCheckSimpleMemInfo
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 비밀번호 찾기 > 간편회원 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> selectCheckSimpleMemInfo (Map<String,Object> commandMap) throws Exception
    {
    	// 간편회원 공통코드 값
    	commandMap.put("MEM_MST_MEM_GBN", Code.MEMBER_TYPE_SIMPLE);
    	
    	return defaultDAO.select("PcLoginManager.selectCheckSimpleMemInfoByCertInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCheckBusinessMemInfo
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 비밀번호 찾기 > 기업회원 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> selectCheckBusinessMemInfo (Map<String,Object> commandMap) throws Exception
    {
    	// 기업회원 공통코드 값
    	commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_COMP_MEMBER_GRADE);
    	
    	return defaultDAO.select("PcLoginManager.selectCheckBusinessMemInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateMemberTempPw
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 비밀번호 찾기 > 임시 비밀번호 발송(간편회원, 기업회원)
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public int updateMemberTempPw (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
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
    	
    	commandMap.put("MEM_MST_TEMP_PW", tempPw.toString());
    	//-- 임시 비밀번호 생성
    	
    	int result = 0;

    	commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
        
        // 휴면회원
        if("Y".equals(commandMap.get("RST_YN")))
        {
        	result = defaultDAO.update("PcLoginManager.updateRestMemberTempPw", commandMap);	
        }
        else
        {
        	result = defaultDAO.update("PcLoginManager.updateMemberTempPw", commandMap);
        }
        
        // 메일로 임시 비밀번호 발송 
    	if(result > 0)
    	{
			logger.info("메일로 임시 비밀번호가 발송됩니다.");
			
			/* 메일 발송 시작 */
			Map<String,Object> sendMap = defaultDAO.select("PcLoginManager.selectChangePwMemInfo", commandMap);
			Map<String,Object> mailMap = new HashMap<String, Object>();
			
			if("".equals(StringUtil.getString(sendMap.get("MEM_MST_MAIL"),"")))
			{
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				result = -1;
			}
			
			String userNm = FormatUtil.markingName(StringUtil.getString(sendMap.get("MEM_MST_MEM_NM"),""));
			
			mailMap.put("MAIL_CODE", "6");	// 이메일 코드
			mailMap.put("MEMBER_EMAIL", StringUtil.getString(sendMap.get("MEM_MST_MAIL"),""));	//	수신자 이메일
			mailMap.put("MEMBER_NAME", userNm);	//	수신자 이름
			mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + userNm  + "님, 요청하신 임시 비밀번호 안내드립니다. 로그인 후 변경해 주세요.");	// 메일 제목
			
			String loginUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do";
			
			StringBuffer resultContent = new StringBuffer();
    		
    		StringUtil.textSumDelimiter(resultContent.append(userNm));
    		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("MASK_MEM_MST_MEM_ID") ,"")));
    		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(commandMap.get("MEM_MST_TEMP_PW"),"")));
    		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("UPDATE_DT") ,"")));
    		StringUtil.textSumDelimiter(resultContent.append(loginUrl));

    		mailMap.put("EMAIL_CONTENTS", resultContent.toString());	// 메일 내용
    		
    		Map<String,Object> resultMailMap = this.mail.mailSend(mailMap);
    		
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
				result = -2;
			}
			/* 메일 발송 끝 */
    	}
    	
    	return result;
    }
    
    @SuppressWarnings("unchecked")
	public int updateMemberPw (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
    	// 임시 비밀번호 생성
    	int result = 0;
    	
    	commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
        
        // 휴면회원
        if("Y".equals(commandMap.get("RST_YN")))
        {
        	result = defaultDAO.update("PcLoginManager.updateRestMemberPw", commandMap);	
        }
        else
        {
        	result = defaultDAO.update("PcLoginManager.updateMemberPw", commandMap);
        }
        
    	return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectChangeSimpleMemInfo
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 프론트 > 로그인 > 간편회원 전환 > 정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> selectChangeSimpleMemInfo (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.select("PcJoinMember.selectOnlineMemberInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : checkSimpleMem
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 통합회원 전환하려는 회원의 CI가 IPN테이블에 존재하는지 여부 체크, ERP에 CI가 있는지 체크
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> checkSimpleMem (Map<String,Object> commandMap) throws Exception
    {
    	Map<String,Object> resultMap = new HashMap<String, Object>();
    	
    	// SM CI체크
    	int checkCI = defaultDAO.selectCount("PcJoinMember.selectCheckCI", commandMap);
    	
    	// 간략한 회원정보 가져오기
    	Map<String,Object> memInfo = defaultDAO.select("PcLoginManager.selectSimpleChangeMemInfo", commandMap);
    	
    	// CI가 있음 - 통합회원 이거나 온라인회원인 경우
    	if(checkCI > 0)
    	{
    		// 가입 구분
    		int MEM_MST_JOI_RTE = 0;
    		
    		if(memInfo != null)
    		{
    			MEM_MST_JOI_RTE = StringUtil.getInt(memInfo.get("MEM_MST_JOI_RTE"));	
    		}
    		
    		if(MEM_MST_JOI_RTE > 0)
    		{
    			//통합회원
                resultMap.put("returnCode", "E00");
                return resultMap;
    		}
    		else
    		{
    			resultMap.put("returnCode", "E99");
    			return resultMap;
    		}
    	}
    	// SM CI가 없음
    	else
    	{
    		// ERP 정보조회
    		commandMap.put("erpLinkNm",propertiesService.getString("erp.db.link"));
    		
    		Map<String,Object> erpMemberInfo = new HashMap<String, Object>();
    		
    		// 정상적인 간편회원 전환 SM CI 없음 , ERP CI 없음
    		if(erpMemberInfo == null)
    		{
    			resultMap.put("returnCode","S00");
    		}
    		// ERP CI 있음
    		else
    		{
    			// 기간계고객코드
				int MEM_MST_ERP_ID = StringUtil.getInt(erpMemberInfo.get("MEM_MST_ERP_ID"));	
    					
    			// 기간계고객코드 여부 판단
    			if(MEM_MST_ERP_ID > 0)
    			{
    				// 오프라인회원으로 간주 
    				resultMap.put("returnCode", "E02");
    				return resultMap;
    			}
    			else
    			{
    				// ERP에 있는 기간계고객코드로 전환 진행
    				resultMap.put("P1AN8", erpMemberInfo.get("MEM_MST_ERP_ID"));
    				resultMap.put("returnCode", "S01");
    			}
    		}
    	}
    	
    	return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateToken
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 모바일 > APP > token ID 추가
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 3. 9.
    * </pre>
    *
    * @param commandMap
    * @throws Exception
    */
    public void updateToken (Map<String,Object> commandMap) throws Exception
    {
    	defaultDAO.update("PcLoginManager.updateToken", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : mergeToken
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 모바일 > APP > token ID 추가
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 3. 9.
    * </pre>
    *
    * @param commandMap
    * @throws Exception
    */
    public void mergeToken (Map<String,Object> commandMap) throws Exception
    {
    	int result = defaultDAO.selectCount("PcLoginManager.selectTokenCount", commandMap);
    	if (result == 0) {
    		defaultDAO.insert("PcLoginManager.insertToken", commandMap);
		}
    }

	@Override
	public Map<String, Object> selectCertifyIntegrationUserInfo(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.select("PcLoginManager.selectCertifyIntegrationUserInfo", commandMap);
	}

	@Override
	public Map<String, Object> selectCheckSimpleMemInfoByCertInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("PcLoginManager.selectCheckSimpleMemInfoByCertInfo", commandMap);
	}

	@Override
	public Map<String, Object> checkPwSkip(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("PcLoginManager.updatePwSkip", commandMap);
	}

	@Override
	public int updateMemberRegularPasswordChange(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		// 임시 비밀번호 생성
    	int result = 0;
    	commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
        result = defaultDAO.update("PcLoginManager.updateRegularPasswordChange", commandMap);
        return result;
	}

}
 