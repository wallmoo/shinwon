package com.market.mall.am.site.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.site.service.MakerManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : MakerManagerController.java
 * @Date : 2015. 10. 14.
 * @프로그램 설명 : 관리자 > 시스템관리 > 제조사관리를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class MakerManagerController {

	@Resource(name="makerManagerService")
	private MakerManagerService makerManagerService;
	
	/**
	* <pre>
	* 1. MethodName : makerManagerList
	* 2. ClassName  : MakerManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/makerManagerList")
	public ModelAndView makerManagerList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 제조사 관리 목록 갯수
		int totalCount = this.makerManagerService.selectMakerManagerListCount(commandMap);
		
		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String,Object>> list = null;
        
        if(totalCount > 0)
        {
        	// 제조사 관리 목록
        	list = this.makerManagerService.selectMakerManagerList(commandMap);
        }
        
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
		
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : makerManagerForm
	* 2. ClassName  : MakerManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 등록 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/makerManagerForm")
	public ModelAndView makerManagerForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : makerManagerRegist
	* 2. ClassName  : MakerManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/makerManagerRegist")
	public ModelAndView makerManagerRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 제조사 관리 등록
		int result = this.makerManagerService.insertMakerManager(request, commandMap);
		
		// view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/makerManagerList.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/makerManagerList.do");
        }
        mv.setViewName("/am/common/result");
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : makerManagerEdit
	* 2. ClassName  : MakerManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 상세정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/makerManagerEdit")
	public ModelAndView makerManagerEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("MRK_MST_IDX"),"")))
		{
			// 제조사 관리 상세정보
			mv.addObject("row", this.makerManagerService.selectMakerManagerInfo(commandMap));
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : makerManagerModify
	* 2. ClassName  : MakerManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/makerManagerModify")
	public ModelAndView makerManagerModify(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("MRK_MST_IDX"), "")))
        {
			// 제조사관리 수정
			int result = this.makerManagerService.updateMakerManager(request, commandMap);
			
			// view Page Info
	        if(result > 0)
	        {
	            mv.addObject("alertMsg", "수정 되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/makerManagerList.do");
	        }
	        else
	        {
	            mv.addObject("alertMsg", "수정에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/makerManagerList.do");
	        }
	        
	        mv.addObject("commandMap", commandMap);
	        mv.setViewName("/am/common/result");
        }

		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : makerManagerNmCheckAjax
	* 2. ClassName  : MakerManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 > 제조사명 중복체크 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/makerManagerNmCheckAjax")
	public JSON makerManagerNmCheckAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("MRK_MST_BRAND_NM"), "")))
        {
            // 제조사명 중복 체크
            int makerNmCount = this.makerManagerService.selectMakerManagerNmCheckCount(commandMap);
            
            if( makerNmCount > 0)
            {
                json.put("resultYn", "N");
            }
            else
            {
                json.put("resultYn", "Y");
            }
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
        
        return json;
	}
	
	@RequestMapping(value="/am/site/makerManagerListModify")
    public ModelAndView makerManagerListModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("MRK_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("MRK_MST_UPD_ID", admin.getADM_MST_ID());
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String makerData = StringUtil.getString(commandMap.get("selectedMakerList"),"");
        List<Map<String, Object>> selectedMakerList = mapper.readValue(makerData, typeRef);
        
        commandMap.put("selectedMakerList", selectedMakerList);
        
        if(selectedMakerList != null && selectedMakerList.size() > 0)
        {
        	if("admin".equals(admin.getADM_MST_ID()))
        	{
                // 관리자 수정
                this.makerManagerService.updateMakerList(commandMap);
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/makerManagerList.do");
        	}
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/makerManagerList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
	
	@RequestMapping("/am/site/makerManagerListExcelDownload")
    public ModelAndView makerManagerListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        int totalCount = this.makerManagerService.selectMakerManagerListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
    	String searchMakerNm = StringUtil.getString(commandMap.get("searchMakerNm"), "").replaceAll(" ", "");
        commandMap.put("searchMakerNm", searchMakerNm);
        
        commandMap.put("excelDown", "Y");
        
        if(totalCount > 0){
        	 List<Map<String, Object>> list = null;
        	 
        	 String fileName = "makerList_"+DateUtil.getToday();

        	 String [] rowTitle = { "제조사코드","제조사명","등록일","상태"};      
             String [] cellSize = { "50","50","50","50"};
           	 String [] dataName = { "MRK_MST_IDX","MRK_MST_BRAND_NM", "MRK_MST_REG_DT","MRK_MST_USE_YN"};
             String [] dataType = { "String","String","Date","String"};
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
        	list = this.makerManagerService.selectMakerManagerList(commandMap);

        	if(list != null){
                // 제조사 목록 엑셀 다운로드
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
	
}
