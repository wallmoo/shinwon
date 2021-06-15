package com.market.mall.mobile.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.member.service.InfoMemberService;
import com.market.mall.pc.member.service.JoinMemberService;
import com.market.mall.pc.mypage.service.MyInfoService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.util.LoginPasswordCipher;

/**
 * @PackageName: com.market.mall.mobile.mypage.controller
 * @FileName : myInfoManageController.java
 * @Date : 2016. 2. 17.
 * @프로그램 설명 : 모바일 > 마이페이지 > 회원정보수정을 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller("mobileMyInfoManageController")
public class myInfoManageController {

	@Resource(name="pcMyPageService")
	private MyPageService pcMyPageService;
	
	@Resource(name="pcMyInfoService")
	private MyInfoService pcMyInfoService;

	@Resource(name="pcInfoMemberService")
	private InfoMemberService pcInfoMemberService;
	
	@Resource(name="pcJoinMemberService") 
	private JoinMemberService pcJoinMemberService;
	
	@Resource(name = "pcCommonService")
	private CommonService pcCommonService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	* <pre>
	* 1. MethodName : myInfoPasswordForm
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 비밀번호 입력 폼 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping(value="/mobile/mypage/myInfoPasswordForm")
	public ModelAndView myInfoPasswordForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("MEM_MST_MEM_NM", SessionsUser.getSessionUserValue("MEM_MST_MEM_NM"));
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            //RETURN OBJECT
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : checkPwAjax
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 비밀번호 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/checkPwAjax")
	public JSON checkPwAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
	        
			String pw = StringUtil.getString(commandMap.get("MEM_MST_PW")); 
			commandMap.put("MEM_MST_PW", LoginPasswordCipher.CipherPassword(pw));
			
			if(!"".equals(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "")))
	        {
	            // 비밀번호 체크
	            int pwCount = this.pcMyInfoService.selectCheckPwCount(commandMap);
	            
	            if( pwCount > 0)
	            {
	                json.put("resultYn", "Y");
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
		else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : myInfoEditForm
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 수정 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value="/mobile/mypage/myInfoEditForm")
	public ModelAndView myInfoEditForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            
            commandMap.put("MEM_MST_MEM_ID",SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // 회원타입(일반,간편,기업)
            int memType = StringUtil.getInt(commandMap.get("memType"),0);
            
            // 회원 상세 정보
            Map<String, Object> resultMap = new HashMap<String, Object>(); 
            
        	if(memType == Code.COMMON_COMP_MEMBER_GRADE)		// 기업회원
        	{
        		resultMap = this.pcMyInfoService.selectCompMemberInfo(commandMap);
        		mv.setViewName("/mobile/mypage/myCompInfoEditForm");
        	}
        	else	// 기업회원 제외(일반,간편)
        	{
        		resultMap = this.pcMyInfoService.selectMemberInfo(commandMap);
        		mv.setViewName("/mobile/mypage/myInfoEditForm");
        	}

            // Common Codes
            String[] codes = {"HP_CODE", "TEL_CODE"};
            mv.addObject("codes", this.pcCommonService.selectCodes(codes));
            
            /******************** 우편번호 추가 시작 ********************/
    		// 지역코드
    		mv.addObject("sidoList", this.pcCommonService.selectCode("AREA_CD"));
    		
    		// 프로토콜 여부 (https : true / http : false)
    		boolean secureYn = request.isSecure();
    		String domain = "";
    		
    		if(secureYn)
    		{
    			domain = StringUtil.getString(request.getAttribute("mobileSslDomain"));
    		}
    		else
    		{
    			domain = StringUtil.getString(request.getAttribute("mobileDomain"));
    		}
    		
    		mv.addObject("domain", domain);
    		/******************** 우편번호 추가 끝 ********************/
    		
    		//RETURN OBJECT
    		mv.addObject("memberInfo", resultMap);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : myInfoModify
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myInfoModify")
	public ModelAndView myInfoModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	        
	        // 회원정보 수정
	        Map<String,Object> returnMap = this.pcMyInfoService.updateMyInfo(request, commandMap);
	        // 결과 값
			int result = Integer.valueOf(StringUtil.getString(returnMap.get("result"),""));
	        
	        // view Page Info
	        if(result > 0)
	        {
	            mv.addObject("alertMsg", "수정 되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	            
	        }
	        else if(result == -99)
	        {
	        	logger.info("#################### 프로시져 에러 ###########################");
	        	// 프로시져 에러
	        	//this.pcJoinMemberService.insertErpError(returnMap);
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	        }
	        else if(result == 00)
	        {
	        	logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	        }
	        else
	        {
	            mv.addObject("alertMsg", "수정에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	        }
	        mv.setViewName("/mobile/common/result");
	        return mv;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : changePwd
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 회원정보 수정 > 비밀번호 변경 탭
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/changePwd")
	public ModelAndView changePwd (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			// 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
			
			mv.addObject("commandMap", commandMap);
			mv.addObject("summaryMap", summaryMap);
			
			return mv;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : myPwdModify
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 회원정보 수정 > 비밀번호 변경
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myPwdModify")
	public ModelAndView myPwdModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			String pw = StringUtil.getString(commandMap.get("MEM_MST_PW")); 
			commandMap.put("MEM_MST_PW", LoginPasswordCipher.CipherPassword(pw));
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
	        
	        int result = this.pcMyInfoService.updateMyPwd(commandMap);
	        
	        // view Page Info
	        if(result > 0)
	        {
	            mv.addObject("alertMsg", "수정 되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	            
	        }
	        else
	        {
	            mv.addObject("alertMsg", "수정에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	        }
	        mv.setViewName("/mobile/common/result");
	        return mv;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	 
	/**
	* <pre>
	* 1. MethodName : checkEmailAjax
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 간편회원 > 인증번호 발송 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/checkCtfEmailAjax")
	public JSON checkEmailAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
//		if(!"".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"), "")))
//        {
//            // 이메일 체크
//            int emailCount = this.pcMyInfoService.selectCheckCtfEmailCount(commandMap);
//            
//            if( emailCount == 0)  
//            {  
//                json.put("resultYn", "Y");
//            }
//            else
//            {
//            	json.put("resultYn", "N");
//            }
//            
//            json.put("successYn", "Y");
//        }
//        else 
//        {
//            json.put("successYn", "N");
//        }
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteCtfEmailAjax
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 인증번호 발송된 간편회원 > 이메일 변경 하지 않을 경우 > 인증번호 받은 이메일 삭제 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/deleteCtfEmailAjax")
	public JSON deleteCtfEmailAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		if(!"".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"), "")))
        {
			// 인증번호 발송된 이메일 삭제
			int ctfEmailCount = this.pcMyInfoService.deleteCtfEmail(commandMap);
			
			if(ctfEmailCount > 0)
			{
				json.put("successYn", "Y");
			}
			else
			{
				json.put("successYn", "N");
			}
        }
        else 
        {
            json.put("successYn", "N");
        }
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : checkCtfNoAjax
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 인증번호 발송된 간편회원 > 인증번호 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/checkCtfNoAjax")
	public JSON checkCtfNoAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		if(!"".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"), "")) && !"".equals(StringUtil.getString(commandMap.get("MEM_CTF_NO"), "")))
        {
            // 인증번호 체크
            int certNoCount = this.pcMyInfoService.selectCheckCtfNoCount(commandMap);
            
            if( certNoCount > 0)
            {
                json.put("resultYn", "Y");
            }
            // 유효시간이 지난경우
            else if (certNoCount == -1)
            {
            	json.put("resultYn","O");
            }
            // 이메일이 없는 경우
            else if(certNoCount == -2)
            {
            	json.put("resultYn","N");
            }
            // 인증번호가 같지 않은경우
            else
            {
                json.put("resultYn", "E");
            }
        }

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateMemEmailAjax
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 인증완료된 간편회원 > 변경한 이메일 주소로 update
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/updateMemEmailAjax")
	public JSON updateMemEmailAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		if(!"".equals(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "")) && !"".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"), "")))
        {
			// 변경한 이메일 주소 update
			int updateMemEmailCount = this.pcMyInfoService.updateMemEmail(request, commandMap);
			
			if(updateMemEmailCount > 0)
			{
				json.put("successYn", "Y");
			}
			else
			{
				json.put("successYn", "N");
			}
        }
        else 
        {
            json.put("successYn", "N");
        }
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : myCompInfoModify
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원정보수정 > 기업회원 > 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myCompInfoModify")
	public ModelAndView myCompInfoModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	        
	        // 기업 회원정보 수정
	        Map<String,Object> returnMap = this.pcMyInfoService.updateMyCompInfo(request, commandMap);
	        // 결과 값
			int result = Integer.valueOf(StringUtil.getString(returnMap.get("result"),""));
			
	        // view Page Info
	        if(result > 0)
	        {
	            mv.addObject("alertMsg", "수정 되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	            
	        }
	        else if(result == -99)
	        {
	        	logger.info("#################### 프로시져 에러 ###########################");
	        	// 프로시져 에러
	        	//this.pcJoinMemberService.insertErpError(returnMap);
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	        }
	        else if(result == 00)
	        {
	        	logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	        }
	        else
	        {
	            mv.addObject("alertMsg", "수정에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myPageMain.do");
	        }
	        mv.setViewName("/mobile/common/result");
	        return mv;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : myInfoDeleteForm
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원탈퇴 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myInfoDeleteForm")
	public ModelAndView myInfoDeleteForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
            
            commandMap.put("MEM_MST_MEM_ID",SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // 탈퇴사유 목록
            mv.addObject("secReasonList", this.pcCommonService.selectCode("MEMBER_SEC_REASON"));
            
            //RETURN OBJECT
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : checkOrderAjax
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원탈퇴 > 현재 주문이 있는지 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/checkOrderAjax")
	public JSON checkOrderAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
	        
			if(!"".equals(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "")))
	        {
	            // 주문 체크
	            int orderCount = this.pcMyInfoService.selectCheckOrderCount(commandMap);
	            
	            if( orderCount > 0)
	            {
	                json.put("resultYn", "Y");
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
		else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteMyInfo
	* 2. ClassName  : myInfoManageController.java
	* 3. Comment    : 모바일 > 마이페이지 > 회원탈퇴
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/deleteMyInfo")
	public ModelAndView deleteMyInfo (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	        
	        // 회원 탈퇴
	        Map<String,Object> returnMap = this.pcMyInfoService.deleteMyInfo(request, commandMap);
	        // 결과 값
			int result = Integer.valueOf(StringUtil.getString(returnMap.get("result"),""));
	        
	        // view Page Info
	        if(result > 0)
	        {
	            mv.addObject("alertMsg", "정상적으로 처리되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/manager/logout.do");
	            
	        }
	        else if(result == -99)
	        {
	        	logger.info("#################### 프로시져 에러 ###########################");
	        	// 프로시져 에러
	        	//this.pcJoinMemberService.insertErpError(returnMap);
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
	        }
	        else if(result == 00)
	        {
	        	logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
	        }
	        else
	        {
	            mv.addObject("alertMsg", "회원탈퇴에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
	        }
	        mv.setViewName("/mobile/common/result");
	        return mv;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
}
