package com.market.mall.mobile.mypage.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.member.service.MemberDeliveService;
import com.market.mall.pc.mypage.service.MyPageService;

@Controller("mobileMyDeliveController")
public class MyDeliveController {
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
	
	@Resource(name="pcMemberDeliveService")
    private MemberDeliveService pcMemberDeliveService;
	
    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	/**
	* <pre>
	* 1. MethodName : myDeliveList
	* 2. ClassName  : MyDeliveController.java
	* 3. Comment    : 나의 배송지 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myDeliveList")
    public ModelAndView myDeliveList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
        	ModelAndView mv = new ModelAndView();

            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // 나의 배송지 목록 갯수
            int totalCount = this.pcMemberDeliveService.selectMemberDeliveListCount(commandMap);
            commandMap.put("pageSize", 3);
            Paging paging = new Paging(totalCount, commandMap); 
            
            if(totalCount>0)
            {
                // 나의 배송지 목록
                mv.addObject("list", this.pcMemberDeliveService.selectMemberDeliveList(commandMap));
            }        
            
            //RETURN OBJECT
            mv.addObject("totalCount", totalCount);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            mv.addObject("paging", paging);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	
	/**
	* <pre>
	* 1. MethodName : myDeliveForm
	* 2. ClassName  : MyDeliveController.java
	* 3. Comment    : 나의 배송주소록 등록/수정 폼
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
    @RequestMapping("/mobile/mypage/myDeliveForm")
    public ModelAndView myDeliveForm (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
        	ModelAndView mv = new ModelAndView();
            
            String pageStatus = StringUtil.getString(commandMap.get("pageStatus"), "N");
            
            if("M".equals(pageStatus)){
            	// -- 사용자정보 전달
    			User user = SessionsUser.getSessionUser(request);
    			commandMap.put("user", user);
            	
                //상세정보
                mv.addObject("row", this.pcMemberDeliveService.selectMemberDeliveInfo(commandMap));
            }else{
            	// 나의 배송지 목록 갯수
                /*int totalCount = this.pcMemberDeliveService.selectMemberDeliveListCount(commandMap);
                if(totalCount > 9){
                	mv.addObject("closeMsg", "주소록이 10개를 초과하여 등록이 불가능합니다.");
                	mv.setViewName("/pc/common/result");
                	return mv;
                }*/
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
            
            // 해당 브랜드로 이동
            mv.setViewName("mobile/mypage/myDeliveForm");

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
	* 1. MethodName : myDeliveProc
	* 2. ClassName  : MyDeliveController.java
	* 3. Comment    : 배송지 등록/수정
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myDeliveProc")
    public ModelAndView myDeliveProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
        	ModelAndView mv = new ModelAndView();
            int result = 0;
            
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("MEM_DLV_IP", request.getRemoteAddr());
            
            String pageStatus = StringUtil.getString(commandMap.get("pageStatus"), "");
            
            if("N".equals(pageStatus)){

            	result = this.pcMemberDeliveService.insertMemberDelive(commandMap);
            	
            	if(result > 0){
            		mv.addObject("alertMsg", "등록 되었습니다.");
    	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myDeliveList.do");
            	}else{
            		mv.addObject("alertMsg", "등록중 오류가 발생했습니다.");
            		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myDeliveList.do");
            	}
            }else if("M".equals(pageStatus)){
            	result = this.pcMemberDeliveService.updateMemberDelive(commandMap);
            	if(result > 0){
            		mv.addObject("alertMsg", "수정되었습니다.");
            		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myDeliveList.do");
            	}else{
            		mv.addObject("alertMsg", "수정중 오류가 발생했습니다.");
            		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myDeliveList.do");
            	}
            }
            
            mv.addObject("commandMap", commandMap);            
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
	* 1. MethodName : myDeliveBaseAddrProc
	* 2. ClassName  : MyDeliveController.java
	* 3. Comment    : 기본배송지로 설정
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myDeliveBaseAddrProc")
    public ModelAndView myDeliveBaseAddrProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
        	ModelAndView mv = new ModelAndView();
            int result = 0;
            
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
        	result = this.pcMemberDeliveService.updateMemberDeliveBaseY(commandMap);
        	
        	if(result > 0){
        		mv.addObject("alertMsg", "기본배송지로 설정되었습니다.");
        	}else{
        		mv.addObject("alertMsg", "기본배송지 설정중 에러가 발생했습니다.");
        	}
            
            //mv.addObject("commandMap", commandMap);            
            mv.addObject("methodType","get");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myDeliveList.do");
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
	* 1. MethodName : myDeliveRemove
	* 2. ClassName  : MyDeliveController.java
	* 3. Comment    : 배송지 삭제
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myDeliveRemove")
    public ModelAndView myDeliveRemove (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
        	ModelAndView mv = new ModelAndView();
            int result = 0;
            
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("MEM_DLV_IP", request.getRemoteAddr());
            
        	result = this.pcMemberDeliveService.deleteMemberDelive(commandMap);
        	
        	if(result > 0){
        		mv.addObject("alertMsg", "삭제되었습니다.");
        	}else{
        		mv.addObject("alertMsg", "삭제중 에러가 발생했습니다.");
        	}
            
            //mv.addObject("commandMap", commandMap);            
            mv.addObject("methodType","get");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/myDeliveList.do");
            mv.setViewName("/mobile/common/result");
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }

}
