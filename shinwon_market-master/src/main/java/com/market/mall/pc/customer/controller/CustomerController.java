package com.market.mall.pc.customer.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.model.Code;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.CustomerService;
import com.market.mall.pc.customer.service.impl.AgreementBoardServiceImpl;

/**
 * @PackageName: com.market.mall.pc.customer.controller
 * @FileName : CustomerController.java
 * @Date : 2014. 7. 22.
 * @프로그램 설명 : 프론트 > 고객센터 메인을 처리하는 Controller Class
 * @author kanghk
 */
@Controller("pcCustomerController")
public class CustomerController {
	
	@Resource(name="pcCustomerService")
    private CustomerService pcCustomerService;
	
	@Resource(name="pcCommonService")		
	private CommonService pcCommonService;
	
	@Autowired
	private AgreementBoardServiceImpl agreementBoardServiceImpl;
	
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
	@RequestMapping("/pc/customer/customerMain")
    public ModelAndView customerMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> dataMap = this.pcCustomerService.selectCustomerMain(commandMap);

        mv.setViewName("pc/customer/customerMainTemp");
        
        //RETURN OBJECT
        mv.addObject("faqList", dataMap.get("faqList"));
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
	@RequestMapping("/pc/customer/utilAgree")
	public ModelAndView utilAgree (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("serviceTermAgreement", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementTypeName("서비스 이용약관"));
		// 해당 브랜드로 이동
        mv.setViewName("pc/customer/utilAgree");
        
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
	@RequestMapping("/pc/customer/privacyPolicy")
	public ModelAndView privacyPolicy (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("privateInfoAgreement", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementTypeName("개인정보취급방침"));
		// 해당 브랜드로 이동
        mv.setViewName("pc/customer/privacyPolicy");
        
        return mv;
	}

	
}
