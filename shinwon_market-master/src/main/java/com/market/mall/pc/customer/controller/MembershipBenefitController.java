package com.market.mall.pc.customer.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;

@Controller
public class MembershipBenefitController 
{
	/**
	* <pre>
	* 1. MethodName : membershipBenefit
	* 2. ClassName : MembershipBenefitController.java
	* 3. Comment : 사용자 > 고객센터 > 멤버십혜택 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/membershipBenefit")
	public ModelAndView membershipBenefit(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 해당 브랜드로 이동
        mv.setViewName("pc/customer/membershipBenefit");
        
		return mv;
	}
}
