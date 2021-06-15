package com.market.mall.mobile.customer.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.pc.customer.service.AgreementBoardService;

@Controller("mobileAgreementBoardController")
public class AgreementBoardController {

	@Resource(name="pcAgreementBoardService")
    private AgreementBoardService pcAgreementBoardService;
	
//	/**
//	* <pre>
//	* 1. MethodName : agreementBoardList
//	* 2. ClassName  : AgreementBoardController.java
//	* 3. Comment    : 모바일 > 고객센터 > 이용약관 메인
//	* 4. 작성자       : kanghk
//	* 5. 작성일       : 2014. 8. 6.
//	* </pre>
//	*
//	* @param request
//	* @param commandMap
//	* @return
//	* @throws Exception
//	*/
//	@RequestMapping("/mobile/customer/agreementBoardList")
//    public ModelAndView agreementBoardList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("commandMap", commandMap);
//        return mv;
//    }
//	
//	/**
//	* <pre>
//	* 1. MethodName : agreementBoardDetail
//	* 2. ClassName  : AgreementBoardController.java
//	* 3. Comment    : 모바일 > 고객센터 > 이용약관 상세
//	* 4. 작성자       : kanghk
//	* 5. 작성일       : 2014. 8. 6.
//	* </pre>
//	*
//	* @param request
//	* @param commandMap
//	* @return
//	* @throws Exception
//	*/
//	@RequestMapping("/mobile/customer/agreementBoardDetail")
//    public ModelAndView agreementBoardDetail (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        ModelAndView mv = new ModelAndView();
//        
//        if(!"".equals(StringUtil.getString(commandMap.get("BRD_CMN_COM_IDX"), "")))
//        {
//            // 이용약관 상세정보
//            mv.addObject("row", this.pcAgreementBoardService.selectAgreementInfo(commandMap));
//        }
//        
//        //RETURN OBJECT
//        mv.addObject("commandMap", commandMap);
//        return mv;
//    }
}
