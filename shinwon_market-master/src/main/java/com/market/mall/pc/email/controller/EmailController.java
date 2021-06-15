package com.market.mall.pc.email.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.email.service.EmailService;
import com.market.mall.pc.product.service.ProductService;









import egovframework.rte.fdl.property.EgovPropertyService;

/**
    * @PackageName: com.market.mall.pc.email.controller
    * @FileName : EmailController.java
    * @Date : 2016. 1. 19.
    * @프로그램 설명 : PC Email 화면을 처리하는 Controller Class
    * @author : DEV_LEEKWANGWOON
 */
@Controller
@AccessLevelUser(ROLEUSER.guest)
public class EmailController {
	
	@Resource(name="productService") 
	private ProductService productService;
	
	@Resource(name="emailService") 
	private EmailService emailService;
	
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;
	
	@Resource(name="cartService") 
	private CartService cartService;	
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());	
	
	/**
	 * 
	    * <pre>
	    * 1. MethodName : emailRejectReceive
	    * 2. ClassName  : EmailController.java
	    * 3. Comment    : Email 수신거부 페이지
	    * 4. 작성자       : DEV_LEEKWANGWOON
	    * 5. 작성일       : 2016. 1. 19.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	 */
	@RequestMapping("/pc/email/emailRejectReceive.do")	
	public ModelAndView emailRejectReceive(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		
        ModelAndView mv = new ModelAndView();
        
        String resultYn  = "N";
        
        logger.info("mailAddr  >>>> " + StringUtil.getString(commandMap.get("mailAddr"),""));
        logger.info("mailMemId  >>>> " + StringUtil.getString(commandMap.get("mailMemId"),""));
        
        if(!"".equals( StringUtil.getString(commandMap.get("mailAddr"), "")) && !"".equals( StringUtil.getString(commandMap.get("mailMemId"), "")) ){
        	
	        commandMap.put("MAILADDR",  StringUtil.getString(commandMap.get("mailAddr"), ""));
	        commandMap.put("MAILMEMID", StringUtil.getString(commandMap.get("mailMemId"), ""));
	        resultYn = "Y";
	        
	        Map<String, Object> emailMemberInfo = this.emailService.selectMemberEmailInfo(commandMap);
	        if(emailMemberInfo == null ){	// 맞는 회원이 없음.
	        	mv.addObject("alertMsg", "정상적인 요청이 아닙니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
		        resultYn = "N";			        	
	        }else{
	        	mv.addObject("emailMemberInfo", emailMemberInfo);
	        }
        }else{
            mv.addObject("alertMsg", "필수 정보가 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
	        resultYn = "N";            
        }
        
        
        if("Y".equals(resultYn)){
        	mv.setViewName("pc/email/emailRejectReceive");	
        }else{
        	mv.setViewName("pc/common/result");
        }
        
        mv.addObject("commandMap", commandMap);
        return mv;		
    }


	/**
	 * 
	    * <pre>
	    * 1. MethodName : memberEmailYnModify
	    * 2. ClassName  : EmailController.java
	    * 3. Comment    : 이메일 수신거부 처리
	    * 4. 작성자       : DEV_LEEKWANGWOON
	    * 5. 작성일       : 2016. 1. 19.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	 */
	@RequestMapping("/pc/email/memberEmailYnModifyAjax.do")	
	public JSON memberEmailYnModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
        ModelAndView mv = new ModelAndView();
        
        JSON json = new JSON();
        
		if(!"".equals(StringUtil.getString(commandMap.get("MAILMEMID"), ""))){
            // 비밀번호 체크
            int emailCount = this.emailService.updateMemberEmailYn(commandMap);
            
            if( emailCount > 0){
                json.put("resultYn", "Y");
            }
            else{
                json.put("resultYn", "N");
            }
            json.put("successYn", "Y");
        }else{
            json.put("successYn", "N");
        }
        return json;        
	}
	
}
