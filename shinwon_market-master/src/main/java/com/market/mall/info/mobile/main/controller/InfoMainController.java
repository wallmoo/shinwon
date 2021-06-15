package com.market.mall.info.mobile.main.controller;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.info.mobile.branch.service.BranchService;
import com.market.mall.info.mobile.support.service.SupportService;
import com.market.mall.mobile.event.service.BenefitService;
import com.market.mall.model.Paging;

@Controller("mobileInfoMainController")
public class InfoMainController {
	
	 @Resource(name="mobileBranchService")
	 private BranchService branchService;
	 
	 @Resource(name="mobileSupportService")
	 private SupportService supportService;
	 
	 @Resource(name="mBenefitService")
	 private BenefitService mBenefitService;
	 
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
	 @RequestMapping("/info/mobile/main/index")
	 public ModelAndView index(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 
		 commandMap.put("startNum", 1);
		 commandMap.put("endNum", 3);
		 
		 mv.addObject("noticeList", 	this.supportService.selectNoticeListMain(commandMap));
 		 mv.addObject("areaCodeList", this.branchService.selectCode("COMMON_INFOSITE_AREA_GB"));
 		 
 		// 비주얼 배너
 		 commandMap.put("endNum", 1);
 		 commandMap.put("CMN_COM_IDX", "2760");
 		 List top						= this.mBenefitService.selectCardBannerList(commandMap);
 		 mv.addObject("top", top);
 		 
 		 commandMap.put("endNum", 3);
 		 commandMap.put("CMN_COM_IDX", "2761");
 		 List mid						= this.mBenefitService.selectCardBannerList(commandMap);
 		 int midTotalCount				= this.mBenefitService.selectCardBannerTotalCount(commandMap);
 		 mv.addObject("mid", mid);
 		 mv.addObject("midTotalCount", midTotalCount);
 		 
 
		 mv.setViewName("/info/mobile/main/index");
		 return mv;
	 }
	 
 	 
 
}
