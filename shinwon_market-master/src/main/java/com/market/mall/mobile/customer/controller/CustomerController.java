package com.market.mall.mobile.customer.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.mobile.customer.service.CustomerService;
import com.market.mall.model.Code;
import com.market.mall.pc.common.service.CommonService;

/**
 * @PackageName: com.market.mall.pc.customer.controller
 * @FileName : CustomerController.java
 * @Date : 2014. 7. 22.
 * @프로그램 설명 : 프론트 > 고객센터 메인을 처리하는 Controller Class
 * @author kanghk
 */
@Controller("mobileCustomerController")
public class CustomerController {
	
	@Resource(name="mobileCustomerService")
    private CustomerService mobileCustomerService;
	
	@Resource(name="pcCommonService")		
	private CommonService pcCommonService;
	
	/**
	 * <pre>
	 * 1. MethodName : customerMain
	 * 2. ClassName : CustomerController.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/customer/customerMain")
    public ModelAndView customerMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
        ModelAndView mv = new ModelAndView();
        
        
        
        commandMap.put("CMN_COM_UP_IDX", 105);
        Map<String, Object> dataMap = this.mobileCustomerService.selectCustomerMain(commandMap);

        mv.setViewName("mobile/customer/customerMain");
        
        //RETURN OBJECT
        
        mv.addObject("noticeList", dataMap.get("noticeList"));
        mv.addObject("eveWinList", dataMap.get("eveWinList"));
        mv.addObject("faqCodeList", dataMap.get("faqCodeList"));
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : utilAgree
	* 2. ClassName : CustomerController.java
	* 3. Comment : 사용자 > 고객센터 > 이용약관
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/utilAgree")
	public ModelAndView utilAgree (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		// 해당 브랜드로 이동
        mv.setViewName("mobile/customer/utilAgree");
        
        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : privacyPolicy
	* 2. ClassName : CustomerController.java
	* 3. Comment : 사용자 > 고객센터 > 개인정보취급방침
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/privacyPolicy")
	public ModelAndView privacyPolicy (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		// 해당 브랜드로 이동
        mv.setViewName("mobile/customer/privacyPolicy");
        
        return mv;
	}

	
}
