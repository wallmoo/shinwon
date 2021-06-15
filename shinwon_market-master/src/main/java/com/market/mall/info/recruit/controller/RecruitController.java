package com.market.mall.info.recruit.controller;
 
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.epasscni.common.annotations.RequestParams;
 

@Controller
public class RecruitController {
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : recruitModel
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
	 @RequestMapping("/info/recruit/recruitModel")
	 public ModelAndView recruitModel(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 
		 
		 mv.setViewName("/info/recruit/recruitModel");
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : recruitWelfare
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
	 @RequestMapping("/info/recruit/recruitWelfare")
	 public ModelAndView recruitWelfare(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 
		 
		 mv.setViewName("/info/recruit/recruitWelfare");
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : recruitJob
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
	 @RequestMapping("/info/recruit/recruitJob")
	 public ModelAndView recruitJob(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 
		 
		 mv.setViewName("/info/recruit/recruitJob");
		 return mv;
	 }
	 
	 
 
}
