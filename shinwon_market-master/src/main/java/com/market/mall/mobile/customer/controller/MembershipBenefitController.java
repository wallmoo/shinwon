package com.market.mall.mobile.customer.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;

/**
 * @PackageName: com.market.mall.mobile.customer.controller
 * @FileName : MembershipBenefitController.java
 * @Date : 2015. 7. 8.
 * @프로그램 설명 : 사용자 > 고객센터 > 멤버십혜택 관련하여 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller("mobileMembershipBenefitController")
public class MembershipBenefitController 
{
	/**
	* <pre>
	* 1. MethodName : membershipBenefitNormal
	* 2. ClassName : MembershipBenefitController.java
	* 3. Comment : 모바일 > 고객센터 > 멤버십혜택 - 일반회원 (MarketPlant , 마모트)
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/membershipBenefitNormal")
	public ModelAndView membershipBenefitNormal(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 해당 브랜드로 이동
        mv.setViewName("mobile/customer/membershipBenefitNormal");
        
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : membershipBenefitSilver
	* 2. ClassName : MembershipBenefitController.java
	* 3. Comment : 모바일 > 고객센터 > 멤버십혜택 - 실버회원 (MarketPlant , 마모트)
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/membershipBenefitSilver")
	public ModelAndView membershipBenefitSilver(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 해당 브랜드로 이동
        mv.setViewName("mobile/customer/membershipBenefitSilver");
        
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : membershipBenefitGold
	* 2. ClassName : MembershipBenefitController.java
	* 3. Comment : 모바일 > 고객센터 > 멤버십혜택 - 골드회원 (MarketPlant , 마모트)
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/membershipBenefitGold")
	public ModelAndView membershipBenefitGold(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 해당 브랜드로 이동
        mv.setViewName("mobile/customer/membershipBenefitGold");
        
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : membershipBenefitMountia
	* 2. ClassName : MembershipBenefitController.java
	* 3. Comment : 모바일 > 고객센터 > 멤버십혜택 - 마운티아
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("mobile/customer/membershipBenefitMountia")
	public ModelAndView membershipBenefitMountia(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 해당 브랜드로 이동
        mv.setViewName("mobile/customer/membershipBenefitMountia");
        
		return mv;
		
	}

}
