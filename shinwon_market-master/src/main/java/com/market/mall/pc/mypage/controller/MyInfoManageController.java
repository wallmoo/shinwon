package com.market.mall.pc.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.manager.service.LoginManagerService;
import com.market.mall.pc.member.service.InfoMemberService;
import com.market.mall.pc.member.service.JoinMemberService;
import com.market.mall.pc.member.service.MemberDeliveService;
import com.market.mall.pc.mypage.service.MyInfoService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.util.LoginPasswordCipher;
import com.market.util.StringUtils;

/**
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyInfoManageController.java
 * @Date : 2015. 12. 11.
 * @프로그램 설명 : 프론트 > 마이페이지 > 회원정보수정을 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller("PcMyInfoManageController")
public class MyInfoManageController 
{

	@Resource(name="pcMyPageService")
	private MyPageService pcMyPageService;
	
	@Resource(name="pcMyInfoService")
	private MyInfoService pcMyInfoService;

	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	@Resource(name="pcInfoMemberService")
	private InfoMemberService pcInfoMemberService;
	
	@Resource(name="pcJoinMemberService") 
	private JoinMemberService pcJoinMemberService;
	
	@Resource(name="pcLoginManagerService")
	private LoginManagerService pcLoginManagerService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * <pre>
	 * 1. MethodName : myInfoPasswordForm
	 * 2. ClassName  : MyInfoManageController.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 비밀번호 입력 폼
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value="/pc/mypage/myInfoPasswordForm")
	public ModelAndView myInfoPasswordForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
    	ModelAndView mv = new ModelAndView();
    	
		if(SessionsUser.isLogin(request))
        {
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("MEM_MST_MEM_NM", SessionsUser.getSessionUserValue("MEM_MST_MEM_NM"));
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            mv.addObject("summaryMap", summaryMap);
        }
        else
        {
        	commandMap.put("url", request.getAttribute("serverSslDomain") + "/pc/mypage/myInfoPasswordForm.do");
            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/manager/login.do");
            mv.setViewName("pc/common/result");
        }
		
		mv.addObject("commandMap", commandMap);
        return mv;
	}
	
    /**
     * <pre>
     * 1. MethodName : checkPwAjax
     * 2. ClassName  : MyInfoManageController.java
     * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 비밀번호 체크
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/checkPwAjax")
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
        	throw new PcAuthenticationException();
        }
	}

	/**
	 * <pre>
	 * 1. MethodName : myInfoEditForm
	 * 2. ClassName  : MyInfoManageController.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 수정 폼
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value="/pc/mypage/myInfoEditForm")
	public ModelAndView myInfoEditForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            Map<String,Object> searchSimpleMemInfo = this.pcLoginManagerService.selectCertifyIntegrationUserInfo(commandMap);
            String MEM_MST_MEM_ID = SessionsUser.getSessionUserValue("MEM_MST_MEM_ID");
            commandMap.put("MEM_MST_MEM_ID",MEM_MST_MEM_ID);
            
            if(searchSimpleMemInfo==null || !MEM_MST_MEM_ID.equals(StringUtil.getString(searchSimpleMemInfo.get("MEM_MST_MEM_ID")))) {
            	mv.addObject("alertMsg", "회원정보가 일치하지 않습니다.");
 	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myInfoPasswordForm.do?returnUrl=/pc/mypage/myInfoEditForm.do");
 	            return mv;
            }
            this.pcMyPageService.updateUserPhoneNumber(request, commandMap);
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // 회원타입(일반,간편,기업)
            int memType = StringUtil.getInt(commandMap.get("memType"),0);
            
            // 회원 상세 정보
            Map<String, Object> resultMap = new HashMap<String, Object>(); 
            
            // 기업회원
        	if(memType == Code.COMMON_COMP_MEMBER_GRADE)		
        	{
        		resultMap = this.pcMyInfoService.selectCompMemberInfo(commandMap);
        		mv.setViewName("/pc/mypage/myCompInfoEditForm");
        	}
        	// 기업회원 제외(일반,간편)
        	else	
        	{
        		resultMap = this.pcMyInfoService.selectMemberInfo(commandMap);
        		mv.setViewName("/pc/mypage/myInfoEditForm");
        	}

            // Common Codes
            String[] codes = {"EMAIL_DOMAIN_CODE","HP_CODE", "TEL_CODE"};
            mv.addObject("codes", this.pcCommonService.selectCodes(codes));
            
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
                        
            mv.addObject("memberInfo", resultMap);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	 * <pre>
	 * 1. MethodName : myInfoModify
	 * 2. ClassName  : MyInfoManageController.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 수정
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	/**
	 * @api {post} /pc/mypage/myInfoModify.do
	 * @apiName  회원정보수정
	 * @apiGroup 회원정보수정
     * @apiParam {String} MEM_MST_MAIL 메일
	 * @apiParam {String} MEM_MST_HP1 휴대폰번호1
	 * @apiParam {String} MEM_MST_HP2 휴대폰번호2
	 * @apiParam {String} MEM_MST_HP3 휴대폰번호3
	 * @apiParam {String} MEM_MST_MEM_ID 대상아이디
	 * @apiParam {String} MEM_MST_NCK_NM 닉네임
	 * @apiParam {String} MEM_MST_STY_JOB  스타일 직업
	 * @apiParam {String} MEM_MST_STY_HEIGHT 스타일 키
	 * @apiParam {String} MEM_MST_STY_WEIGHT 스타일 체중
	 * @apiParam {String} MEM_MST_PRF_IMG 프로필 이미지
	 * @apiParam {String} TRM_YN0001 SMS 수신   
     * @apiParam {String} TRM_YN0002 미사용
     * @apiParam {String} TRM_YN0003 카카오톡 수신
     * @apiParam {String} TRM_YN0004 이메일 수신
     * @apiParam {String} TRM_YN0005 영리목적광고
     * @apiParam {String} TRM_YN0006 텔레마케팅
     * @apiParam {String} TRM_YN0007 DM
     * @apiParam {String} TRM_YN0008 미사용
	 * @apiSuccess {String} alertMsg common_result 오류메세지
	 * @apiSuccess {String} returnUrl common_result 오류시 리다이렉트 될 주소
	 */
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myInfoModify")
	public ModelAndView myInfoModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
	        // 회원정보 수정
			
	        Map<String,Object> returnMap = this.pcMyInfoService.updateMyInfo(request, commandMap);
	        
	        // 결과 코드
	        String returnMsg =  (String) returnMap.get("returnMsg");
	        
	        if("S01".equals(returnMsg))
	        {
	            mv.addObject("alertMsg", "회원정보가 수정되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
	        }
	        else if("F01".equals(returnMsg))
	        {
	        	mv.addObject("alertMsg", "회원정보 수정에 실패하셨습니다.");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
	        }
	        else if("E99".equals(returnMsg))
	        {
	            mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
	        }
	        else
	        {
	            mv.addObject("alertMsg", "회원정보 수정에 실패하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
	        }
	        
	       
	        
            
	        mv.setViewName("/pc/common/result");
	        return mv;
        }
		else
		{
			throw new PcAuthenticationException();
		}
	}
	
	/**
	 * <pre>
	 * 1. MethodName : checkEmailAjax
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > 간편회원 > 이메일 중복체크 및 인증번호 발송
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	/**
	 * @api {get} /pc/member/checkEmailAjax.do
	 * @apiName  이메일중복확인
	 * @apiGroup 회원가입
	 *
	 * @apiParam {String} MEM_CTF_MAIL
	 * @apiSuccess {String} resultYn N False, Y True
	 */
	@FrontBannerSkip()
	@RequestMapping("/pc/myPage/checkEditEmailAjax")
	public JSON checkEditEmailAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		String email = StringUtil.getString(commandMap.get("MEM_CTF_MAIL"), "");
		if(!"".equals(email) && org.apache.commons.validator.routines.EmailValidator.getInstance().isValid(email))
        {
			String[] emailSplit = email.split("@");
			Map<String,Object> erpParam = new HashMap<String,Object>();
			erpParam.put("EMAIL1", emailSplit[0]);
			erpParam.put("EMAIL2", emailSplit[1]);
			Map<String,Object> erpResponse = ErpRequest.requestEmailDupInfo(erpParam);
			
            // 이메일 중복 체크
		    Map<String,Object> returnMap = this.pcJoinMemberService.selectCheckEmailCount(commandMap);
            
		    int result = (int) returnMap.get("result");  
		    int erpResult = StringUtil.getString(erpResponse.get("MemberEmailCheckResult")).equals("Y")?1:0;
            if(result > 0 || erpResult > 0 )  
            {
                json.put("resultYn", "N");
            }
            else
            {
                json.put("resultYn", "Y");
            }  
              
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
		
		return json;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : checkEmailAjax
	 * 2. ClassName  : MyInfoManageController.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 간편회원 > 인증번호 발송 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/checkCtfEmailAjax")
	public JSON checkEmailAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		if(!"".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"), "")))
        {
            // 이메일 체크, 이메일 보내기(인증번호)
		    Map<String,Object> returnMap = this.pcMyInfoService.selectCheckCtfEmailCount(commandMap);
              
		    int result = (int) returnMap.get("result");  
		    
            if(result > 0)
            {
                json.put("resultYn", "N");
            }
            else
            {
            	json.put("resultYn", "Y");
            	json.put("exposureCertNO", (String) returnMap.get("exposureCertNO"));  // 임시로 인증번호 노출
            }
               
            json.put("successYn", "Y");
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
	 * 2. ClassName  : MyInfoManageController.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증번호 발송된 이메일 간편회원 > 인증번호 체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/checkCtfNoAjax")
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
	 * 2. ClassName  : MyInfoManageController.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증완료된 간편회원 > 변경한 이메일 주소로 update
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/updateMemEmailAjax")
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
     * 1. MethodName : deleteCtfEmailAjax
     * 2. ClassName  : MyInfoManageController.java
     * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증번호 발송된 간편회원 > 간편회원 취소(이메일 변경 하지 않을 경우) > 인증번호 받은 이메일 삭제 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/deleteCtfEmailAjax")
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
     * 1. MethodName : myCompInfoModify
     * 2. ClassName  : MyInfoManageController.java
     * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 기업회원 > 수정
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myCompInfoModify")
	public ModelAndView myCompInfoModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	          
	        // 기업 회원정보 수정
	        Map<String,Object> returnMap = this.pcMyInfoService.updateMyCompInfo(request, commandMap);
	        
	        // 결과 코드
            String returnMsg = (String) returnMap.get("returnMsg");
			
            if("S01".equals(returnMsg))
            {
                mv.addObject("alertMsg", "기업회원정보가 수정되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
            }
            else if("F01".equals(returnMsg))
            {
                mv.addObject("alertMsg", "기업회원정보 수정에 실패하셨습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
            }
            else if("E99".equals(returnMsg))
            {
                mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
            }
            else
            {
                mv.addObject("alertMsg", "기업회원정보 수정에 실패하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
            }
	        mv.setViewName("/pc/common/result");
	        return mv;  
        }
		else
		{
			throw new PcAuthenticationException();
		}
	}
	
	   /**
     * <pre>
     * 1. MethodName : changePwd
     * 2. ClassName  : MyInfoManageController.java
     * 3. Comment    : 프론트 > 회원정보 수정 > 비밀번호 수정 폼
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/changePwd")
    public ModelAndView changePwd (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            
            commandMap.put("MEM_MST_MEM_ID",SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            mv.addObject("commandMap", commandMap);
            mv.addObject("summaryMap", summaryMap);
            
            return mv;
        }
        else
        {
            throw new PcAuthenticationException();
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : myPwdModify
     * 2. ClassName  : MyInfoManageController.java
     * 3. Comment    : 프론트 > 회원정보 수정 > 비밀번호 수정
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
	 * @api {post} /pc/mypage/myPwdModify.do
	 * @apiName  비밀번호수정
	 * @apiGroup 회원정보수정
	 *
	 * @apiParam   {String} MEM_MST_MEM_ID 대상아이디
	 * @apiParam   {String} MEM_MST_PW 새로운 비밀번호
	 * @apiSuccess {String} alertMsg common_result 오류메세지
	 * @apiSuccess {String} returnUrl common_result 오류시 리다이렉트 될 주소
	 */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myPwdModify")
    public ModelAndView myPwdModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            
            String pw = StringUtil.getString(commandMap.get("MEM_MST_PW")); 
			commandMap.put("MEM_MST_PW", LoginPasswordCipher.CipherPassword(pw));
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
            
            // 비밀번호 수정
            int result = this.pcMyInfoService.updateMyPwd(commandMap);
            
            if(result > 0)
            {
                mv.addObject("alertMsg", "비밀번호가 변경 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
            }
            else
            {
                mv.addObject("alertMsg", "비밀번호 변경에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myPageMain.do");
            }
            mv.setViewName("/pc/common/result");  
            return mv;
        }
        else
        {
            throw new PcAuthenticationException();
        }
    }
    
	/**
	* <pre>
	* 1. MethodName : myInfoDeleteForm
	* 2. ClassName  : MyInfoManageController.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원탈퇴 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
    
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myInfoDeleteForm")
	public ModelAndView myInfoDeleteForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			Map<String,Object> searchSimpleMemInfo = this.pcLoginManagerService.selectCertifyIntegrationUserInfo(commandMap);
            String MEM_MST_MEM_ID = SessionsUser.getSessionUserValue("MEM_MST_MEM_ID");
            commandMap.put("MEM_MST_MEM_ID",MEM_MST_MEM_ID);
            
            if(searchSimpleMemInfo==null || !MEM_MST_MEM_ID.equals(StringUtil.getString(searchSimpleMemInfo.get("MEM_MST_MEM_ID")))) {
            	mv.addObject("alertMsg", "회원정보가 일치하지 않습니다.");
 	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myInfoPasswordForm.do?returnUrl=/pc/mypage/myInfoDeleteForm.do");
 	            return mv;
            }            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // 탈퇴사유 목록
            mv.addObject("secReasonList", this.pcCommonService.selectCode("MEMBER_SEC_REASON"));
            
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
		else
		{
			throw new PcAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : checkOrderAjax
	* 2. ClassName  : MyInfoManageController.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원탈퇴 > 현재 주문이 있는지 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/checkOrderAjax")
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
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteMyInfo
	* 2. ClassName  : MyInfoManageController.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원탈퇴
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	
	/**
	 * @api {post} /pc/mypage/deleteMyInfo.do
	 * @apiName  회원탈퇴
	 * @apiGroup 회원탈퇴
	 *
	 * @apiParam   {String} MEM_MST_MEM_ID 대상아이디
	 * @apiParam   {String} MEM_MST_LEV_RSN_CD 탈퇴사유코드
	 * @apiParam   {String} MEM_MST_LEV_RSN 탈퇴사유
	 * @apiSuccess {String} alertMsg common_result 오류메세지
	 * @apiSuccess {String} returnUrl common_result 오류시 리다이렉트 될 주소
	 */
	
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/deleteMyInfo")
	public ModelAndView deleteMyInfo (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	        
	        // 회원 탈퇴
	        Map<String,Object> returnMap = this.pcMyInfoService.deleteMyInfo(request, commandMap);
	        if(commandMap.containsKey("MEM_MST_MEM_ID")) {
	        	Map<String,Object> erpParam = new HashMap<String,Object>();
	        	erpParam.put("ESHOP_ID", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
	        	List<Map<String,Object>> list = ErpRequest.requestWithDraw(erpParam);
	        }
	        
	        // 결과 값
			String resultMsg = StringUtil.getString(returnMap.get("resultMsg"),"");
	        
	        if("S01".equals(resultMsg))
	        {
	        	
	        	mv.setViewName("/pc/mypage/myInfoDeleteFinish");
	            mv.addObject("alertMsg", "정상적으로 회원탈퇴가 되었습니다.");
//	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/manager/logout.do");
	        }  
	        else if("F01".equals(resultMsg))
	        {
	        	mv.addObject("alertMsg", "회원탈퇴에 실패하셨습니다.");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
	        	mv.setViewName("/pc/common/result");
	        }
	        else if("F02".equals(resultMsg))
	        {
	            mv.addObject("alertMsg", "데이터가 누락되었습니다.\\n문제가 계속 발생시 관리자에게 문의해주세요.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
	            mv.setViewName("/pc/common/result");
	        }
	        else if("E99".equals(resultMsg))
            {
                mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n문제가 계속 발생시 관리자에게 문의해주세요.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
                mv.setViewName("/pc/common/result");
            }
	        else
	        {  
	            mv.addObject("alertMsg", "회원탈퇴에 실패하였습니다.\\n문제가 계속 발생시 관리자에게 문의해주세요.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
	            mv.setViewName("/pc/common/result");
	        }
	        
//	        mv.setViewName("/pc/common/result");
	        return mv;
        }
		else
		{
			throw new PcAuthenticationException();
		}
	}
	
}
