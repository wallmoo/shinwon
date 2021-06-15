package com.market.mall.info.branch.controller;

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
import com.market.mall.info.branch.service.BranchService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

@Controller
public class BranchController {

	 @Resource(name="branchService")
	 private BranchService branchService;
	 
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : branchList
	  * 2. ClassName : BranchController.java
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
	 @RequestMapping("/info/branch/branchList")
	 public ModelAndView branchPress(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 mv.addObject("commandMap", commandMap);
		 mv.addObject("areaCodeList", this.branchService.selectCode("COMMON_INFOSITE_AREA_GB"));
		 mv.setViewName("/info/branch/branchList");
		 return mv;
	 }
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : branchView
	  * 2. ClassName : BranchController.java
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
	 @RequestMapping("/info/branch/branchView")
	 public ModelAndView branchView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
	 		 
		 ModelAndView mv = new ModelAndView();
	        
	     if(!"".equals(StringUtil.getString(commandMap.get("SHP_MST_IDX"), "")))
	     {
	         // 보도자료 상세정보
	      	 Map<String, Object> resultMap = this.branchService.selectBranchInfo(commandMap);
	      	 
	      	 mv.addObject("row", resultMap.get("row"));
	         mv.addObject("fileList", resultMap.get("fileList"));
	     }

	     // 구분 코드 리스트
	     //mv.addObject("codeList", this.commonService.selectCode("COMMON_INFO_NOTICE_TYPE"));
	     mv.addObject("commandMap", commandMap);
	     mv.setViewName("/info/branch/branchView");
	     return mv;
		 
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : branchListAjax
	  * 2. ClassName : BranchController.java
	  * 3. Comment : 지점 리스트 ajax
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 2. 24.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/info/branch/branchListAjax")
	 public JSON branchPressListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 commandMap.put("pageSize", 10);
		 
		 String SEARCH_GB = StringUtil.getString(commandMap.get("SEARCH_GB"),"1");
		 if("0".equals(SEARCH_GB))
		 {
			 commandMap.put("SHP_MST_AREA", StringUtil.getString(commandMap.get("SHP_MST_AREA"),"2395"));
			 commandMap.put("SHP_MST_AREA_SUB", StringUtil.getString(commandMap.get("SHP_MST_AREA_SUB"),"용산구"));
		 }
		 
		 String searchWord = "";
		 
		 
		 
		 String SEARCH_WORD = StringUtil.getString(commandMap.get("SEARCH_WORD"),"");
		 String SHP_MST_AREA = StringUtil.getString(commandMap.get("SHP_MST_AREA"),"");
		 String SHP_MST_AREA_SUB = StringUtil.getString(commandMap.get("SHP_MST_AREA_SUB"),"");
		 
		 int totalCount 	= this.branchService.selectBranchListCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap);
		 
		 
		 resultMap.put("list", 	this.branchService.selectBranchList(commandMap));
		 
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
	       
		 //SHP_MST_AREA_NM
		 
		 if("".equals(SEARCH_WORD))
		 {
			 if(!"".equals(SHP_MST_AREA))
			 {
				 searchWord = this.branchService.selectBranchAreaNm(SHP_MST_AREA);
				 
			 }
			 if(!"".equals(SHP_MST_AREA_SUB))
			 {
				 searchWord = searchWord +" > "+SHP_MST_AREA_SUB;
			 }
			 json.addObject("searchWord",			searchWord);
			 
		 }else
		 {
			 json.addObject("searchWord",			SEARCH_WORD);
		 }
		 
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 /**
	    * <pre>
	    * 1. MethodName : branchFileDownload
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
	    @RequestMapping("/info/branch/branchFileDownload")
	    public ModelAndView branchFileDownload (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
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
	     * <pre>
	     * 1. MethodName : getSubCodeAjax
	     * 2. ClassName  : PointController.java
	     * 3. Comment    : 하위코드 조회 조회
	     * 4. 작성자       : khcho
	     * 5. 작성일       : 2016. 01. 06.
	     * </pre>
	     *
	     * @param request
	     * @param commandMap
	     * @return
	     * @throws Exception
	     */
	     @RequestMapping("/info/branch/getSubCodeAjax")
	     public JSON getSubCodeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	     {
	    	 JSON json = new JSON();
	         String code = (String)commandMap.get("code");
	         
	         List<Map<String, Object>> subCodeList =this.branchService.selectCodeByCode(code);
	         
	         json.put("list",  subCodeList);
	         
	 
	         return json;
	     }    
	    
 
}
