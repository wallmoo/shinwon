package com.market.mall.pc.customer.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.FileUploadException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.model.User;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.GroupInquiryService;

@Controller("pcGroupInquiryController")
public class GroupInquiryController {
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	@Resource(name="pcGroupInquiryService")
    private GroupInquiryService pcGroupInquiryService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	* <pre>
	* 1. MethodName : groupInquiryForm
	* 2. ClassName  : GroupInquiryController.java
	* 3. Comment    : 고객센터 단체주문 폼 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 25.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/groupInquiryForm")
    public ModelAndView groupInquiryForm (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		if(SessionsUser.isLogin(request))
        {
	        ModelAndView mv = new ModelAndView();
	        
	        // Common Codes
	        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
	        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	
	        //RETURN OBJECT
	        commandMap.put("today", DateUtil.getToday("").substring(0,4) + "-" + DateUtil.getToday("").substring(4,6) + "-" + DateUtil.getToday("").substring(6,8));
	        
	        // 해당 브랜드로 이동
	        mv.setViewName("pc/customer/groupInquiryForm");
	        
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
	* 1. MethodName : groupInquiryInsert
	* 2. ClassName  : GroupInquiryController.java
	* 3. Comment    : 단체주문 등록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 25.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/pc/customer/groupInquiryInsert", method = RequestMethod.POST)
    public JSON groupInquiryInsert (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		String resultMsg = "";
		String isSuccessYn = "";
		
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			//사용자 정보
			User user = SessionsUser.getSessionUser(request);
			
			// 브랜드 코드 가져오기
	        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
	        
			if(SessionsUser.isLogin(request)){
				commandMap.put("GRP_INQ_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			}
			commandMap.put("GRP_INQ_REG_IP", request.getRemoteAddr());
			
			try
			{
				if(this.pcGroupInquiryService.insertGroupInquiry((MultipartHttpServletRequest)request,commandMap) > 0)
				{
					isSuccessYn = "Y";
					resultMsg = "등록 되었습니다.";
				}
				else
				{
					isSuccessYn = "N";
					resultMsg = "등록에 실패하였습니다.";
				}
			}
			catch(FileUploadException e)
			{
				logger.debug("productCommentRegist Error : " + e.getMessage());
				isSuccessYn = "N";
				resultMsg = e.getMessage();
			}
			catch(Exception e)
			{
				logger.debug("productCommentRegist Error : " + e.getMessage());
				isSuccessYn = "N";
				resultMsg = "등록에 실패했습니다.";
			}
		
			json.addObject("resultMsg", resultMsg);
			json.addObject("isSuccessYn", isSuccessYn);
	        
			return json;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : productCheckAjax
	* 2. ClassName  : GroupInquiryController.java
	* 3. Comment    : 상품코드 체크
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 25.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/pc/customer/productCheckAjax.do", method = RequestMethod.POST)
	public JSON productCheckAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON json = new JSON();
        
		Map<String, Object> dataMap = this.pcGroupInquiryService.selectProductInfo(commandMap);
        
		System.out.println("dataMap ==========================" + dataMap);
        if(dataMap != null){
        	json.put("resultYn", "Y");
        	json.put("PRD_MST_NM", StringUtil.getString(dataMap.get("PRD_MST_NM"),""));
		}else{
			json.put("resultYn", "N");
		}
        
        return json;
    }
	
	/**
	* <pre>
	* 1. MethodName : productCdHelpPopup
	* 2. ClassName  : GroupInquiryController.java
	* 3. Comment    : 상품코드 확인방법 팝업
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/productCdHelpPopup")
    public ModelAndView productCdHelpPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/customer/productCdHelpPopup");
        return mv;
    }
}
