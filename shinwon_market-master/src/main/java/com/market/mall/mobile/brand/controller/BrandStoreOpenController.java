package com.market.mall.mobile.brand.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.model.User;
import com.market.mall.pc.brand.service.BrandStoreOpenService;
import com.market.mall.pc.common.service.CommonService;

/**
 * @PackageName: com.market.mall.mobile.brand.controller
 * @FileName : BrandStoreOpenController.java
 * @Date : 2015. 7. 17.
 * @프로그램 설명 : 사용자 > 모바일 > 브랜드사이트 > 매장개설문의 관련하여 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller("mobileBrandStoreOpenController")
public class BrandStoreOpenController 
{
	@Resource(name="pcBrandStoreOpenService") private BrandStoreOpenService pcBrandStoreOpenService;
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	/**
	* <pre>
	* 1. MethodName : brandStoreOpenMarmot
	* 2. ClassName : BrandStoreOpenController.java
	* 3. Comment : 사용자 > 마모트 > 매장개설문의 안내
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/mobile/brand/brandStoreOpenMarmot")
	public ModelAndView brandStoreOpenMarmot (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 해당 브랜드로 이동
        mv.setViewName("mobile/brand/brandStoreOpenMarmot");
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : brandStoreOpenForm
	* 2. ClassName : BrandStoreOpenController.java
	* 3. Comment : 사용자 > 매장개설문의 등록 폼
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/mobile/brand/brandStoreOpenForm")
	public ModelAndView brandStoreOpenForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			// Common Codes
	        String[] codes = {"EMAIL_DOMAIN_CODE", "TEL_CODE", "HP_CODE"};
	        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	        
			// 해당 브랜드로 이동
	        mv.setViewName("mobile/brand/brandStoreOpenForm");
	        
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
	* 1. MethodName : brandStoreOpenRegist
	* 2. ClassName : BrandStoreOpenController.java
	* 3. Comment : 사용자 > 매장개설문의 등록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/mobile/brand/brandStoreOpenRegist", method = RequestMethod.POST)
	public ModelAndView brandStoreOpenRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			//사용자 정보
			User user = SessionsUser.getSessionUser(request);
			
			//회사코드
			commandMap.put("COMP_CD", request.getAttribute("serverCompCd"));
			//브랜드코드
			commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
	        
			if(SessionsUser.isLogin(request)){
				commandMap.put("SHP_REQ_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			}
			commandMap.put("SHP_REQ_REG_IP", request.getRemoteAddr());
			
			int result = this.pcBrandStoreOpenService.insertBrandStoreOpen(commandMap);
			
			if(result > 0)
			{
				mv.addObject("alertMsg", "제출되었습니다.\\n빠른 시일 내에 담당자 확인 후 답변 드리도록 하겠습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/brand/brandStoreOpenMarmot.do");
			}
			else
			{
				mv.addObject("alertMsg", "등록 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/brand/brandStoreOpenMarmot.do");
			}
			mv.addObject("commandMap", commandMap);
			// 해당 브랜드로 이동
	        mv.setViewName("mobile/common/result");
			
	        return mv;
        }
		else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : brandStoreOpenMountia
	* 2. ClassName : BrandStoreOpenController.java
	* 3. Comment :  사용자 > 마운티아 > 매장개설문의 안내
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/mobile/brand/brandStoreOpenMountia")
	public ModelAndView brandStoreOpenMountia (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 해당 브랜드로 이동
        mv.setViewName("mobile/brand/brandStoreOpenMountia");
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
	}
}
