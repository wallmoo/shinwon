package com.market.mall.info.intro.controller;

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
import com.market.mall.info.intro.service.IntroService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

@Controller
public class IntroController {

	 @Resource(name="introService")
	 private IntroService introService;
	 
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introComp
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introCompany")
	 public ModelAndView introComp(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 
		 
		 mv.setViewName("/info/intro/introCompany");
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introPhilosophy
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introPhilosophy")
	 public ModelAndView introPhilosophy(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 
		 
		 mv.setViewName("/info/intro/introPhilosophy");
		 return mv;
	 }
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introFriend
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introFriend")
	 public ModelAndView introFriend(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 		 
		 mv.setViewName("/info/intro/introFriend");
		 return mv;
	 }
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introBI
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introBI")
	 public ModelAndView introBI(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 		 
		 mv.setViewName("/info/intro/introBI");
		 return mv;
	 }
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introPrize
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introPrize")
	 public ModelAndView introPrize(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 		 
		 mv.setViewName("/info/intro/introPrize");
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introPress
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introPress")
	 public ModelAndView introPress(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 mv.addObject("commandMap", commandMap);
		 mv.setViewName("/info/intro/introPress");
		 return mv;
	 }
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introPressView
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introPressView")
	 public ModelAndView introPressView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
	 		 
		 ModelAndView mv = new ModelAndView();
	        
	     if(!"".equals(StringUtil.getString(commandMap.get("PRS_RLS_IDX"), "")))
	     {
	         // 보도자료 상세정보
	      	 Map<String, Object> resultMap = this.introService.selectPressInfo(commandMap);
	      	 this.introService.updatePressReadCount(commandMap);
	      	 mv.addObject("row", resultMap.get("row"));
	         mv.addObject("fileList", resultMap.get("fileList"));
	     }

	     // 구분 코드 리스트
	     //mv.addObject("codeList", this.commonService.selectCode("COMMON_INFO_NOTICE_TYPE"));
	     mv.addObject("commandMap", commandMap);
	     mv.setViewName("/info/intro/introPressView");
	     return mv;
		 
	 }
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introPosition
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 인포사이트 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 02. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introPosition")
	 public ModelAndView introPosition(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
 		 
		 mv.setViewName("/info/intro/introPosition");
		 return mv;
	 }
	 
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : introPressListAjax
	  * 2. ClassName : IntroController.java
	  * 3. Comment : 보도자료  리스트 ajax
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 2. 23.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/intro/introPressListAjax")
	 public JSON introPressListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 commandMap.put("pageSize", 10);
		
		 int totalCount 	= this.introService.selectPressListCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap);
		 
		 
		 resultMap.put("list", 	this.introService.selectPressList(commandMap));
		 
		 resultMap.put("paging",		paging);
		 
		 json.addObject("resultMap", 				resultMap);
		 json.addObject("firstpageno", 				paging.getFirstPageNo());
		 json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
		 json.addObject("totalPageCount",  			paging.getTotalPageCount());
		 json.addObject("lastPageNoOnPageList", 	paging.getLastPageNoOnPageList());	
		 json.addObject("cPage", 					paging.getcPage());
		 json.addObject("lastPageNo", 				paging.getLastPageNo());
		 json.addObject("pageSize",  				paging.getPageSize());
		 json.addObject("pagingSize", 				paging.getPagingSize());
		 json.addObject("listNum",					paging.getListNum());
		 json.addObject("totalRecordCount",			paging.getTotalRecordCount());
		 
		 json.addObject("totalCount",			totalCount);
	       
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 /**
	    * <pre>
	    * 1. MethodName : introFileDownload
	    * 2. ClassName  : CommonController.java
	    * 3. Comment    : 첨부파일 다운로드 
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2016. 2. 23.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	    */
	    @RequestMapping("/info/intro/introFileDownload")
	    public ModelAndView introFileDownload (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	    {
	        ModelAndView mv = new ModelAndView("downloadView");
	        if(!"".equals(StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "")))
	        {
	             
	        	String webPath = StringUtil.getString(commandMap.get("CMM_FLE_SAVE_PATH"), "");
	            String orgFileName = StringUtil.getString(commandMap.get("CMM_FLE_ORG_NM"), "");
	            File file = new File(webPath);
	            mv.addObject("downloadFile", file);
	            mv.addObject("orgFileName", orgFileName);
	           
	        }
	        
	        return mv;
	    }
 
}
