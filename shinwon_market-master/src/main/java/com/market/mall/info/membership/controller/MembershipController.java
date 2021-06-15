package com.market.mall.info.membership.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
//import com.market.mall.info.membership.service.MembershipService;

@Controller
public class MembershipController {

//	 @Resource(name="membershipService")
//	 private MembershipService membershipService;
//	 
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : membershipList
	  * 2. ClassName : MembershipController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 24.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/membership/membershipGuide")
	 public ModelAndView membershipGuide(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 
 
		 mv.setViewName("/info/membership/membershipGuide");
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : membershipList
	  * 2. ClassName : MembershipController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 24.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/membership/membershipGrade")
	 public ModelAndView membershipGrade(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 
 
		 mv.setViewName("/info/membership/membershipGrade");
		 return mv;
	 }
 
}
