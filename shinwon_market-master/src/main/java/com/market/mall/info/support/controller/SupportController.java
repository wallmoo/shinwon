package com.market.mall.info.support.controller;

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
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.info.support.service.SupportService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class SupportController {

	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	
	 @Resource(name="supportService")
	 private SupportService supportService;
	 	
	 @Resource
	 protected Mail mail;
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : supportNotice
	  * 2. ClassName : SupportController.java
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
	 @RequestMapping("/info/support/supportNotice")
	 public ModelAndView supportNotice(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 
		 mv.addObject("commandMap", commandMap);
		 mv.setViewName("/info/support/supportNotice");
		 return mv;
	 }
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : supportNoticeView
	  * 2. ClassName : SupportController.java
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
	 @RequestMapping("/info/support/supportNoticeView")
	 public ModelAndView supportNoticeView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
	 		 
		 ModelAndView mv = new ModelAndView();
	        
	     if(!"".equals(StringUtil.getString(commandMap.get("DRT_NTS_IDX"), "")))
	     {
	         // 보도자료 상세정보
	      	 Map<String, Object> resultMap = this.supportService.selectNoticeInfo(commandMap);
	      	 this.supportService.updateNoticeReadCount(commandMap);
	      	 mv.addObject("row", resultMap.get("row"));
	         mv.addObject("fileList", resultMap.get("fileList"));
	     }

	     // 구분 코드 리스트
	     //mv.addObject("codeList", this.commonService.selectCode("COMMON_INFO_NOTICE_TYPE"));
	     mv.addObject("commandMap", commandMap);
	     mv.setViewName("/info/support/supportNoticeView");
	     return mv;
		 
	 }
	  
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : supportNoticeListAjax
	  * 2. ClassName : SupportController.java
	  * 3. Comment : 공지사항 리스트 ajax
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 2. 24.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/support/supportNoticeListAjax")
	 public JSON supportNoticeListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 commandMap.put("pageSize", 10);
		
		 int totalCount 	= this.supportService.selectNoticeListCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap);
		 
		 
		 resultMap.put("list", 	this.supportService.selectNoticeList(commandMap));
		 
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
	    * 1. MethodName : supportFileDownload
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
	    @RequestMapping("/info/support/supportFileDownload")
	    public ModelAndView supportFileDownload (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
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
	    
	    /**
		  * 
		  * <pre>
		  * 1. MethodName : supportNotice
		  * 2. ClassName : SupportController.java
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
		 @RequestMapping("/info/support/supportPraise")
		 public ModelAndView supportPraise(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
			 ModelAndView mv	= new ModelAndView();
			 String today = DateUtil.getToday("-"); 
			 mv.addObject("emailCodeList", this.supportService.selectCode("EMAIL_DOMAIN_CODE"));
			 mv.addObject("hpCodeList", this.supportService.selectCode("HP_CODE"));
			 mv.addObject("telCodeList", this.supportService.selectCode("TEL_CODE"));
			 mv.addObject("today", today);
			 mv.setViewName("/info/support/supportPraise");
			 return mv;
		 }
		 /**
		  * 
		  * <pre>
		  * 1. MethodName : popupPraiseEmployee
		  * 2. ClassName : SupportController.java
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
		 @RequestMapping("/info/support/popupPraiseEmployee")
		 public ModelAndView popupPraiseEmployee(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
			 ModelAndView mv	= new ModelAndView();
 			 mv.setViewName("/info/support/popupPraiseEmployee");
			 return mv;
		 }
		 /**
		  * 
		  * <pre>
		  * 1. MethodName : supportNoticeListAjax
		  * 2. ClassName : SupportController.java
		  * 3. Comment : 공지사항 리스트 ajax
		  * 4. 작성자 : khcho
		  * 5. 작성일 : 2016. 2. 24.
		  * </pre>
		  *
		  * @param request
		  * @param commandMap
		  * @return
		  * @throws Exception
		  */
		 @RequestMapping("/info/support/erpEmpListAjax")
		 public JSON erpEmpListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
			 
			 JSON json			= new JSON();
			 Map resultMap		= new HashMap();
			 
			 commandMap.put("pageSize", 8);
			 commandMap.put("MCSTYL", "BR");
			 
			 int totalCount 	= this.supportService.selectErpEmpListCount(commandMap);
			 Paging paging 		= new Paging(totalCount, commandMap);
			 
			 
			 resultMap.put("list", 	this.supportService.selectErpEmpList(commandMap));
			 
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
		       
//			 System.out.println("json start::::::>" + json);
			 return json;
		 }
		 /**
		  * 
		  * <pre>
		  * 1. MethodName : popupPraiseDelivery
		  * 2. ClassName : SupportController.java
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
		 @RequestMapping("/info/support/popupPraiseDelivery")
		 public ModelAndView popupPraiseDelivery(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
			 ModelAndView mv	= new ModelAndView();
 			 mv.setViewName("/info/support/popupPraiseDelivery");
			 return mv;
		 }
		 
		 /**
		  * 
		  * <pre>
		  * 1. MethodName : supportNoticeListAjax
		  * 2. ClassName : SupportController.java
		  * 3. Comment : 공지사항 리스트 ajax
		  * 4. 작성자 : khcho
		  * 5. 작성일 : 2016. 2. 24.
		  * </pre>
		  *
		  * @param request
		  * @param commandMap
		  * @return
		  * @throws Exception
		  */
		 @RequestMapping("/info/support/deliveryListAjax")
		 public JSON deliveryListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
			 
			 JSON json			= new JSON();
			 Map resultMap		= new HashMap();
			 
			 commandMap.put("pageSize", 8);
			 commandMap.put("MCSTYL", "DT");
			 
			 int totalCount 	= this.supportService.selectErpEmpListCount(commandMap);
			 Paging paging 		= new Paging(totalCount, commandMap);
			 
			 
			 resultMap.put("list", 	this.supportService.selectErpEmpList(commandMap));
			 
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
		       
//			 System.out.println("json start::::::>" + json);
			 return json;
		 }
		 
		 /**
		 * <pre>
		 * 1. MethodName : praiseRegist
		 * 2. ClassName  : SupportController.java
		 * 3. Comment    : 인포사이트 > 칭찬하기 등록 
		 * 4. 작성자       : khcho
		 * 5. 작성일       : 2016. 02. 26.
		 * </pre>
		 *
		 * @param request
		 * @param commandMap
		 * @return
		 * @throws Exception
		 */
		 @RequestMapping("/info/support/praiseRegist")
		 public ModelAndView praiseRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
		 {
		     ModelAndView mv = new ModelAndView();
		     
		     String regYn = this.supportService.selectPraiseRegCheck(request);
		     
		     if("Y".equals(regYn))
		     {
			     // 관리자 관리 관리자 등록
			     int result = this.supportService.insertPraise(request, commandMap);
			      
			     // view Page Info
			     if(result > 0)
			     {
			    	 Map<String, Object> mailMap = this.supportService.selectPraiseMailInfo(commandMap);
	                 String MEM_MST_MAIL = StringUtil.getString(mailMap.get("EMP_THK_MAIL"),"");
	                   	
	                 	if(!"".equals(MEM_MST_MAIL))
	    	            {
	                 		//기본정보
	    	            	String MAIL_CODE = "29";
	    	            	String MEMBER_NAME = StringUtil.getString(mailMap.get("EMP_THK_CST_NM"),"");
	    	             	String EMAIL_TITLE = StringUtil.getString(propertiesService.getString("app.name")+" ","")+MEMBER_NAME+"님, 칭찬하기에 글이 등록되었습니다.";
	    	            	String GB = "$T$";
	    	            	String EMAIL_CONTENTS1 = "";
	    	            	//메일내용
	    	            	String EMP_THK_REG_DT = StringUtil.getString(mailMap.get("EMP_THK_REG_DT"),"-");
	    	            	String EMP_THK_HP = StringUtil.getString(mailMap.get("EMP_THK_HP"),"-");
	    	            	String EMP_THK_TEL = StringUtil.getString(mailMap.get("EMP_THK_TEL"),"-");
	    	            	String EMP_THK_BRC_NM = StringUtil.getString(mailMap.get("EMP_THK_BRC_NM"),"-");
	    	            	String EMP_THK_CHG_NM = StringUtil.getString(mailMap.get("EMP_THK_CHG_NM"),"-");
	    	            	String EMP_THK_CTR_NM = StringUtil.getString(mailMap.get("EMP_THK_CTR_NM"),"-");
	    	            	String EMP_THK_DRV_NM = StringUtil.getString(mailMap.get("EMP_THK_DRV_NM"),"-");
	    	            	String EMP_THK_VST_DT = StringUtil.getString(mailMap.get("EMP_THK_VST_DT"),"-");
	    	            	String EMP_THK_TITLE = StringUtil.getString(mailMap.get("EMP_THK_TITLE"),"-");
	    	            	String EMP_THK_CONTENTS = StringUtil.getString(mailMap.get("EMP_THK_CONTENTS"),"-");
	    	                        	
	    	             	EMAIL_CONTENTS1 = MEMBER_NAME+GB+EMP_THK_REG_DT+GB+MEMBER_NAME+GB+MEM_MST_MAIL+GB+EMP_THK_HP+GB+EMP_THK_TEL+GB+EMP_THK_BRC_NM+"/"+EMP_THK_CHG_NM+GB+EMP_THK_VST_DT+GB+EMP_THK_CTR_NM+GB+EMP_THK_DRV_NM+GB+EMP_THK_TITLE+GB+EMP_THK_CONTENTS;
	    	             		
	    	             	mailMap.put("MAIL_CODE",MAIL_CODE);
	    	             	mailMap.put("MEMBER_EMAIL",MEM_MST_MAIL);
	    	             	mailMap.put("MEMBER_NAME",MEMBER_NAME);
	    	             	mailMap.put("EMAIL_TITLE",EMAIL_TITLE);
	    	             	mailMap.put("EMAIL_CONTENTS1",EMAIL_CONTENTS1);
	    	             		
	    	             	//System.out.println("cont : "+EMAIL_CONTENTS1);
	    	             	
	    	             	Map<String, Object> mailResult = this.mail.mailSendForm(mailMap);
	    	             	
	    	             	String resultMsg = StringUtil.getString(mailResult.get("mailResult"),"");
	    	             	String resultCode = StringUtil.getString(mailResult.get("resultCode"),"");
	    	             
	    	             }
	    	         
			         mv.addObject("alertMsg", "칭찬해 주셔서 감사드립니다. 항상 최선을 다하는 "+StringUtil.getString(propertiesService.getString("app.name"),"")+"이 되겠습니다. ^^");
			         mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/info/support/supportPraise.do");
			            
			     }
			     else
			     {
			         mv.addObject("alertMsg", "처리되지 않았습니다. 고객센터로 문의주시기 바랍니다.");
			         mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/info/support/supportPraise.do");
			     }
		     }
		     else
		     {
		    	 mv.addObject("alertMsg", "동일 IP에서 칭찬 등록을 하셨습니다. 5분 후 다시 이용 가능합니다.");
		         mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/info/support/supportPraise.do");
		     }
		     mv.setViewName("/pc/common/result");
		     return mv;
		}
		/**
		* 
		* <pre>
		* 1. MethodName : supportCounsel
		* 2. ClassName : SupportController.java
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
		@RequestMapping("/info/support/supportCounsel")
		public ModelAndView supportCounsel(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
			ModelAndView mv	= new ModelAndView();
			
			String today = DateUtil.getToday("-"); 
			String endDay = DateUtil.addDay(DateUtil.getToday("-"), 365);
			
			endDay = endDay.substring(0, 4)+"-"+endDay.substring(4, 6)+"-"+endDay.substring(6, 8);
			
			mv.addObject("branchList", this.supportService.selectCounselBranchList(commandMap));
			mv.addObject("consultGbCodeList", this.supportService.selectCode("COMMON_INFOSITE_CONSULT_GB"));
			mv.addObject("emailCodeList", this.supportService.selectCode("EMAIL_DOMAIN_CODE"));
			mv.addObject("hpCodeList", this.supportService.selectCode("HP_CODE"));
			mv.addObject("telCodeList", this.supportService.selectCode("TEL_CODE"));
			
			mv.addObject("today", today);
			mv.addObject("endDay", endDay);
			mv.setViewName("/info/support/supportCounsel");
			return mv;
		}
		
		/**
		 * <pre>
		 * 1. MethodName : counselRegist
		 * 2. ClassName  : SupportController.java
		 * 3. Comment    : 인포사이트 > 상담하기 등록 
		 * 4. 작성자       : khcho
		 * 5. 작성일       : 2016. 02. 26.
		 * </pre>
		 *
		 * @param request
		 * @param commandMap
		 * @return
		 * @throws Exception
		 */
		 @RequestMapping("/info/support/counselRegist")
		 public ModelAndView counselRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
		 {
		     ModelAndView mv = new ModelAndView();
		     
		         // 관리자 관리 관리자 등록
			 int result = this.supportService.insertCounsel(request, commandMap);
			      
			 // view Page Info
			 if(result > 0)
			 {
			     mv.addObject("alertMsg", "상담신청을 해주셔서 감사합니다. 빠른 시일내에 답변드리겠습니다.");
			     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/info/support/supportCounsel.do");
			          
			 }
			 else
			 {
			     mv.addObject("alertMsg", "처리되지 않았습니다. 고객센터로 문의주시기 바랍니다.");
			     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/info/support/supportCounsel.do");
			 }
		 	 mv.setViewName("/pc/common/result");
		 	 return mv;
		 }
		 /**
		  * 
		  * <pre>
		  * 1. MethodName : supportFAQ
		  * 2. ClassName : SupportController.java
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
		 @RequestMapping("/info/support/supportFAQ")
		 public ModelAndView supportFAQ(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
			 ModelAndView mv	= new ModelAndView();
	 		 
			 mv.setViewName("/info/support/supportFAQ");
			 return mv;
		 }
		 /**
		  * 
		  * <pre>
		  * 1. MethodName : supportAS
		  * 2. ClassName : SupportController.java
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
		 @RequestMapping("/info/support/supportAS")
		 public ModelAndView supportAS(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
			 ModelAndView mv	= new ModelAndView();
	 		 
			 mv.setViewName("/info/support/supportAS");
			 return mv;
		 }
		 /**
		  * 
		  * <pre>
		  * 1. MethodName : supportFaqListAjax
		  * 2. ClassName : SupportController.java
		  * 3. Comment : FAQ 리스트 ajax
		  * 4. 작성자 : khcho
		  * 5. 작성일 : 2016. 2. 26.
		  * </pre>
		  *
		  * @param request
		  * @param commandMap
		  * @return
		  * @throws Exception
		  */
		 @RequestMapping("/info/support/supportFaqListAjax")
		 public JSON supportFaqListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
			 
			 JSON json			= new JSON();
			 Map resultMap		= new HashMap();
			 
			 commandMap.put("pageSize", 10);
			
			 int totalCount 	= this.supportService.selectFaqListCount(commandMap);
			 Paging paging 		= new Paging(totalCount, commandMap);
			 
			 
			 resultMap.put("list", 	this.supportService.selectFaqList(commandMap));
			 
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
		       
//			 System.out.println("json start::::::>" + json);
			 return json;
		 }
		 
		/*//물류센터, 직원 ark
		    @RequestMapping("/am/search/ark/ark_transPopup")
			public ModelAndView ark_transPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
			{
				ModelAndView mv = new ModelAndView();
				
				mv.addObject("commandMap", commandMap);
				
				return mv;
			}
		    */
		 @RequestMapping("/info/search/ark/ark_transPopup")
			public ModelAndView ark_transPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
			{
				ModelAndView mv = new ModelAndView();
				
				mv.addObject("commandMap", commandMap);
				
				return mv;
			}
		 @RequestMapping("/info/search/ark_employee/ark_trans")
			public ModelAndView ark_trans (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
			{
				ModelAndView mv = new ModelAndView();
				
				mv.addObject("commandMap", commandMap);
				
				return mv;
			}
		 
}
