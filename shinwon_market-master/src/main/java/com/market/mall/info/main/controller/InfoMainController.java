package com.market.mall.info.main.controller;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.info.branch.service.BranchService;
import com.market.mall.info.support.service.SupportService;
import com.market.mall.model.Paging;
import com.market.mall.pc.event.service.BenefitService;

@Controller
public class InfoMainController {
	
	 @Resource(name="branchService")
	 private BranchService branchService;
	 
	 @Resource(name="supportService")
	 private SupportService supportService;
	 
	 @Resource(name="benefitService")
	 private BenefitService benefitService;
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : index
	  * 2. ClassName : RecruitController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 26.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/main/index")
	 public ModelAndView index(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 
		 commandMap.put("startNum", 1);
		 commandMap.put("endNum", 4);
		 
		 mv.addObject("noticeList", 	this.supportService.selectNoticeListMain(commandMap));
 		 mv.addObject("areaCodeList", this.branchService.selectCode("COMMON_INFOSITE_AREA_GB"));
 		 
 		 // 비주얼 배너
 		 commandMap.put("endNum", 5);
 		 commandMap.put("CMN_COM_IDX", "1270");
 		 List top						= this.benefitService.selectCardBannerList(commandMap);
 		 mv.addObject("top", top);
 		 
 		 commandMap.put("endNum", 3);
 		 commandMap.put("CMN_COM_IDX", "2713");
 		 List mid						= this.benefitService.selectCardBannerList(commandMap);
 		 mv.addObject("mid", mid);
 		
		 mv.setViewName("/info/main/index");
		 return mv;
	 }
	 
 	 
 
}
