package com.market.mall.pc.business.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationBusinessException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsBusiness;
import com.market.mall.common.annotations.AccessLevelBusiness;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.ifcomm.siren.SirenCert;
import com.market.mall.model.Business;
import com.market.mall.model.Code;
import com.market.mall.model.Business.ROLEBUSINESS;
import com.market.mall.pc.business.service.LoginBusinessService;
import com.market.mall.pc.business.service.StandingPointService;
import com.market.mall.pc.common.service.CommonService;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.pc.business.controller
 * @FileName : JoinBusinessController.java
 * @Date : 2016. 2. 4.
 * @프로그램 설명 : 프론트 > 입점신청 > 로그인 관련 처리
 * @author : DEV_LEEKWANGWOON
 */
@Controller("pcJoinLoginController")
public class LoginBusinessController {
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	
	@Autowired
	private SirenCert sirenCert;
	
	@Resource(name="pcLoginBusinessService") private LoginBusinessService pcLoginBusinessService;
	
	@Resource(name="pcCommonService") private CommonService pcCommonService;
	
	@Resource(name="pcStandingPointService") private StandingPointService pcStandingPointService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	/**
	 * <pre>
	 * 1. MethodName : login
	 * 2. ClassName  : JoinBusinessController.java
	 * 3. Comment    :  프론트 > 입점신청 > 로그인 
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
    @RequestMapping("/pc/business/login")
    public ModelAndView login (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("pc/business/login");
		mv.addObject("commandMap", commandMap);
		
		if(SessionsBusiness.isLoginBusiness(request))
        {
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/business/businessMain.do");
            mv.setViewName("pc/common/result");
        }		
        return mv;
    }
	
	/**
	 * <pre>
	 * 1. MethodName : loginProc
	 * 2. ClassName  : JoinBusinessController.java
	 * 3. Comment    : 프론트 > 입점신청 > 로그인 처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
    @RequestMapping("/pc/business/loginProc")
    public ModelAndView loginProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Business business = new Business();
        
        String roleUser = StringUtil.getString(commandMap.get("ROLE_USER"), "guest");
        String VDR_LGN_BUSINESSNO =	StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"), "") + StringUtil.getString(commandMap.get("VDR_LGN_BUSI2"), "") + StringUtil.getString(commandMap.get("VDR_LGN_BUSI3"), ""); 
        		
        String loginId = VDR_LGN_BUSINESSNO.trim();
        String loginPwd = StringUtil.getString(commandMap.get("VDR_LGN_PW"), "");
        
        String returnUrl = URLDecoder.decode(StringUtil.getString(commandMap.get("url"), ""),"UTF-8");
        String url = returnUrl;
        
        Map<String,Object> resultMap = new HashMap<String, Object>();	// 파라미터
        
        boolean loginCheck = false;
        /**
         * 회원 로그인 
         */
        if("business".equals(roleUser))
        {
        	
            if("".equals(loginId)) 		  // 아이디 필요
            {
            	business.setLoginStateCode(Code.LOGIN_ID_INVALID);
            	business.setROLE_BUSINESS(ROLEBUSINESS.business);
            } 
            else if("".equals(loginPwd)) // 비밀번호 필요
            {
            	business.setLoginStateCode(Code.LOGIN_PW_INVALID);
                business.setROLE_BUSINESS(ROLEBUSINESS.business);
            }
            else  
            {
            	business.setVDR_LGN_BUSINESSID(loginId);
            	business.setVDR_LGN_PW(loginPwd);
            	business.setROLE_BUSINESS(ROLEBUSINESS.business);
            	business.setVDR_LGN_BUSI1(StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"), ""));
            	business.setVDR_LGN_BUSI2(StringUtil.getString(commandMap.get("VDR_LGN_BUSI2"), ""));
            	business.setVDR_LGN_BUSI3(StringUtil.getString(commandMap.get("VDR_LGN_BUSI3"), ""));
                loginCheck = true;
            }
        }
       
        if(loginCheck)
        {
        	
            // 로그인
        	business = this.pcLoginBusinessService.loginManagerProc(request, business, response);
            
            mv.addObject("business", business);
            
            if(business.getLoginStateCode()==Code.LOGIN_SUCCESS)
            {
                commandMap.put("business", business);
                commandMap.put("session_id", (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id")));
                
            }  
        }
        
        /*************** 로그인 상태에 관한 alert메세지 시작 ***************/
        // 로그인 상태값
        int loginStateCode = business.getLoginStateCode();
        // 메세지
        String alertMsg = "";
        
        logger.info("################loginStateCode : " + loginStateCode );
        
        // 아이디 필요
        if(loginStateCode == Code.LOGIN_ID_INVALID)
        {
        	alertMsg = "아이디를 확인해 주십시오.";
        	returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/login.do";
        }
        // 비밀번호 필요
        else if(loginStateCode == Code.LOGIN_PW_INVALID)
        {
        	alertMsg = "비밀번호를 확인해 주십시오.";
        	returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/login.do";
        }
        // 아이디가 틀렸을 경우
        else if(loginStateCode == Code.LOGIN_ID_NULL)
        {
        	alertMsg = "아이디 또는 비밀번호가 일치하지 않습니다.\\n아이디와 비밀번호를 다시 입력해주세요.";
        	returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/login.do";
        }
        // 비밀번호가 틀렸을 경우
        else if(loginStateCode == Code.LOGIN_PW_INCORRECT)
        {
        	alertMsg = "아이디 또는 비밀번호가 일치하지 않습니다.\\n아이디와 비밀번호를 다시 입력해주세요.";
        	returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/login.do";
        }
        // 블랙리스트 
        else if(loginStateCode == Code.LOGIN_STOP_LOGIN)
        {
        	alertMsg = "일치하는 회원이 없습니다.\\n고객센터로 연락바랍니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/login.do";
        }
        // 로그인 오류
        else if(loginStateCode == Code.LOGIN_FAIL)
        {
        	alertMsg = "데이터 오류입니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/login.do";
        }
        // 탈퇴회원
        else if(loginStateCode == Code.LOGIN_SITE_NOT_ACCESS)
        {
        	alertMsg = "일치하는 회원이 없습니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/login.do";
        }
        // 임시 비밀번호 유효기간이 지난 회원
        else if(loginStateCode == Code.LOGIN_PASS_EFFECTIVE_TIME)
        {
        	alertMsg = "임시 비밀번호 유효시간이 지났습니다.\\n임시 비밀번호를 다시 재발급 받으시길 바랍니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/login.do";
        }
        /*************** 로그인 상태에 관한 alert메세지 끝 ***************/
        // 로그인에 성공 했을 경우
        else if(loginStateCode == Code.LOGIN_SUCCESS)
        {
        	logger.info("######################returnUrl : " + returnUrl);
            // 아이디 저장 유무
        	business.setSaveId(StringUtil.getString(commandMap.get("saveId"), "N"));
            
        	/*************** 쿠키에 담기 시작 ********************/
        	// 아이디 저장
        	if("Y".equals(business.getSaveId()))
        	{
        		Cookie cookieEtlandUserId = new Cookie("cookieEtlandUserId", business.getVDR_LGN_BUSINESSID());
        		cookieEtlandUserId.setMaxAge(30*24*60*60);
        		response.addCookie(cookieEtlandUserId);
        	}
        	else
        	{
        		// 아이디 저장 및 자동로그인 삭제
        		Cookie cookieEtlandUserId = new Cookie("cookieEtlandUserId", null);
        		cookieEtlandUserId.setMaxAge(0);
        		response.addCookie(cookieEtlandUserId);
        	}
        	/*************** 쿠키에 담기 끝 *******************/
        	
    		if(!"".equals(returnUrl))
    		{
    			// 이전 페이지로 갈 수 없는 경우
        		if(returnUrl.indexOf("login.do") > 0 || returnUrl.indexOf("changeMemPw.do") > 0 || returnUrl.indexOf("/gest") > 0 || returnUrl.indexOf("myShoppingInfo.do") > 0 || returnUrl.indexOf("Popup") > 0 || returnUrl.indexOf("/pwFindResult.do") > 0 || returnUrl.indexOf("/member/join") > 0 || 
        		  	returnUrl.indexOf("/clearRestMember.do") > 0 || returnUrl.indexOf("/sirenIpinResResult.do") > 0 || returnUrl.indexOf("/sirenResResult.do") > 0 || returnUrl.indexOf("/idFindResult.do") > 0 || returnUrl.indexOf("/nonMemberLogin.do") > 0 ||
        		  		returnUrl.indexOf("/paymentSuccess.do") > 0 || returnUrl.indexOf("/paymentFail.do") > 0 || returnUrl.indexOf("/myInfoEditForm.do") > 0 || returnUrl.indexOf("/changePwd.do") > 0 )
        		{
        			returnUrl = StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/businessMain.do";
        		}	
    		}
    		else
    		{
    			returnUrl = StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/businessMain.do";
    		}
        } 
        
        resultMap.put("url", url != "" ? url : StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/businessMain.do");
        
        mv.addObject("loginCheck", loginCheck);
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", returnUrl);
        mv.addObject("resultMap", resultMap);
        mv.setViewName("pc/business/loginProc");

        return mv;
    }	
	
	
	/**
	 * <pre>
	 * 1. MethodName : logout
	 * 2. ClassName  : LoginBusinessController.java
	 * 3. Comment    : 프론트 > 입점신청 > 로그아웃을 처리한다. 
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 11.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @param response
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/pc/business/logout")
    public ModelAndView logout (HttpServletRequest request, Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        // 로그인 세션 삭제
        SessionsBusiness.setSessionBusinessClear(request);
        
        // 쿠키 삭제 
        Cookie del_cookie = new Cookie("front_business_cookie", "");
        del_cookie.setMaxAge(0); 
        del_cookie.setPath("/");
  		response.addCookie(del_cookie);
        
        mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/business/businessMain.do");
        // 해당 브랜드로 이동
        mv.setViewName("pc/common/result");
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : businessInfoEditForm
     * 2. ClassName  : LoginBusinessController.java
     * 3. Comment    : 프론트 > 입점신청 > 정보수정 폼 
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 11.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception 
     */
	@AccessLevelBusiness(ROLEBUSINESS.business)
	@RequestMapping(value="/pc/business/businessInfoEditForm")
	public ModelAndView businessInfoEditForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsBusiness.isLoginBusiness(request))
        {
            ModelAndView mv = new ModelAndView();
            
            String businessNO  = SessionsBusiness.getSessionBusinessValue("VDR_LGN_BUSINESSID");
            String VDR_LGN_BUSI1 = businessNO.substring(0, 3); 
            String VDR_LGN_BUSI2 = businessNO.substring(3, 5); 
            String VDR_LGN_BUSI3 = businessNO.substring(5, 10); 
            
            commandMap.put("VDR_LGN_BUSI1",VDR_LGN_BUSI1);
            commandMap.put("VDR_LGN_BUSI2",VDR_LGN_BUSI2);
            commandMap.put("VDR_LGN_BUSI3",VDR_LGN_BUSI3);
            
            
            // 회원 상세 정보
            Map<String, Object> resultMap = new HashMap<String, Object>(); 
            

       		resultMap = this.pcLoginBusinessService.selectBusinessInfo(commandMap);
       		mv.setViewName("/pc/business/businessInfoEditForm");


    		// Common Codes
            String[] codes = {"EMAIL_DOMAIN_CODE","BUSINESS_CODE"};
            mv.addObject("codes", this.pcCommonService.selectCodes(codes));
            
            //RETURN OBJECT
            mv.addObject("businessInfo", resultMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new PcAuthenticationBusinessException();
        }
	}
	
	/**
	 * <pre>
	 * 1. MethodName : businessInfoModify
	 * 2. ClassName  : LoginBusinessController.java
	 * 3. Comment    : 프론트 > 입점신청 > 정보수정 처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 11.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@AccessLevelBusiness(ROLEBUSINESS.business)
	@RequestMapping("/pc/business/businessInfoModifyProc")
	public ModelAndView businessInfoModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsBusiness.isLoginBusiness(request))
        {
			ModelAndView mv = new ModelAndView();
	        
	        // 회원정보 수정
	        Map<String,Object> returnMap = this.pcLoginBusinessService.updateBusinessInfo(request, commandMap);
	        // 결과 값
			int result = Integer.valueOf(StringUtil.getString(returnMap.get("result"),""));
	        
	        // view Page Info
	        if(result > 0)
	        {
	            mv.addObject("alertMsg", "수정 되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/businessMain.do");
	            
	        }
	        else if(result == 00)
	        {
	        	logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
	        }
	        else
	        {
	            mv.addObject("alertMsg", "수정에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/businessMain.do");
	        }
	        mv.setViewName("/pc/common/result");
	        return mv;
        }
		else
		{
			throw new PcAuthenticationBusinessException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : businessInfoDeleteProc
	* 2. ClassName  : LoginBusinessController.java
	* 3. Comment    : 입점업체 탈퇴 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 5. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelBusiness(ROLEBUSINESS.business)
	@RequestMapping("/pc/business/businessInfoDeleteProc")
	public ModelAndView businessInfoDeleteProc (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsBusiness.isLoginBusiness(request))
        {
			ModelAndView mv = new ModelAndView();
	        
	        // 회원정보 수정
	        Map<String,Object> returnMap = this.pcLoginBusinessService.deleteBusinessInfo(request, commandMap);
	        // 결과 값
			int result = Integer.valueOf(StringUtil.getString(returnMap.get("result"),""));
	        
	        // view Page Info
	        if(result > 0)
	        {
	            mv.addObject("alertMsg", "탈퇴 되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/logout.do");
	            
	        }
	        else if(result == 00)
	        {
	        	logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
	        }
	        else
	        {
	            mv.addObject("alertMsg", "탈퇴에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/businessMain.do");
	        }
	        mv.setViewName("/pc/common/result");
	        return mv;
        }
		else
		{
			throw new PcAuthenticationBusinessException();
		}
	}
	
	
	/**
	 * <pre>
	 * 1. MethodName : businessPwFind
	 * 2. ClassName  : JoinBusinessController.java
	 * 3. Comment    :  프론트 > 입점신청 > 비밀번호 찾기 
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
    @RequestMapping("/pc/business/businessPwFind")
    public ModelAndView businessPwFind (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("pc/business/businessPwFind");
		mv.addObject("commandMap", commandMap);
		
		// Common Codes (이메일, 국번, 핸드폰, 판매희망채널, 현재유통방법)
        String[] codes = {"EMAIL_DOMAIN_CODE"}; 
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));				
		
		if(SessionsBusiness.isLoginBusiness(request))
        {
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/business/businessMain.do");
            mv.setViewName("pc/common/result");
        }		
        return mv;
    }	
	
	/**
	 * <pre>
	 * 1. MethodName : checkMemInfoAjax
	 * 2. ClassName  : LoginBusinessController.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점업체 정보 조회
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 18.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/pc/business/checkBusinessInfoAjax")
    public JSON checkBusinessInfoAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	JSON json = new JSON();

    	if(!"".equals(StringUtil.getString(commandMap.get("VDR_LGN_BUSI1"), "")) && 
           !"".equals(StringUtil.getString(commandMap.get("VDR_LGN_BUSI2"), "")) && 
           !"".equals(StringUtil.getString(commandMap.get("VDR_LGN_BUSI3"), "")) && 
           !"".equals(StringUtil.getString(commandMap.get("VDR_LGN_CEO_NM"), "")) && 
           !"".equals(StringUtil.getString(commandMap.get("VDR_LGN_MAIL"), ""))  
          )
        {
            // 비밀번호 찾기 통합회원정보 검색
            int memInfoCount = this.pcLoginBusinessService.selectCheckBusinessInfoCount(commandMap);
            
            if( memInfoCount > 0)
            {
                json.put("resultYn", "Y");
                
                int resultPwSendCount = this.pcLoginBusinessService.updateBusinessTempPw(request,commandMap);
                if(resultPwSendCount > 0){
                	json.put("successSend", "Y");
                }else{
                	json.put("successSend", "N");                	
                }
            }
            else
            {
                json.put("resultYn", "N");
            }
            
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
        
        return json;
    }	

}