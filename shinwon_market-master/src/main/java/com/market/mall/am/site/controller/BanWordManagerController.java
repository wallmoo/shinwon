package com.market.mall.am.site.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.site.service.BanWordManagerService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : BanWordManagerController.java
 * @Date : 2015. 10. 13.
 * @프로그램 설명 : 관리자 > 시스템관리 > 차단단어 관리를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class BanWordManagerController {

	@Resource(name="banWordManagerService") 
    private BanWordManagerService banWordManagerService;
	
	/**
	* <pre>
	* 1. MethodName : banWordManagerList
	* 2. ClassName  : BanWordManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/banWordManagerList")
	public ModelAndView banWordManagerList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 차단단어 관리 목록 갯수
		int totalCount = this.banWordManagerService.selectBanWordManagerListCount(commandMap);
		
		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject("paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String,Object>> list = null;
        if(totalCount > 0)
        {
        	// 차단단어 관리 목록
        	list = this.banWordManagerService.selectBanWordManagerList(commandMap);
        }
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : banWordManagerForm
	* 2. ClassName  : BanWordManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 등록 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/banWordManagerForm")
	public ModelAndView banWordManagerForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 차단단어 관리 목록 갯수
		commandMap.put("banWrdUserYn", "Y");
		mv.addObject("useCount",this.banWordManagerService.selectBanWordManagerListCount(commandMap));
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : banWordManagerRegist
	* 2. ClassName  : BanWordManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 등록 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/banWordManagerRegist")
	public ModelAndView banWordManagerRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 차단단어 관리 등록
		int result = this.banWordManagerService.insertBanWordManager(request, commandMap);
		
		// view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/banWordManagerList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/banWordManagerList.do");
        }
        mv.setViewName("/am/common/result");
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : banWordManagerEdit
	* 2. ClassName  : BanWordManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 수정 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/banWordManagerEdit")
	public ModelAndView banWordManagerEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("BAN_WRD_IDX"), "")))
        {
            // 차단단어 관리 상세정보
            mv.addObject("row", this.banWordManagerService.selectBanWordManagerInfo(commandMap));
        }
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : banWordManagerModify
	* 2. ClassName  : BanWordManagerController.java
	* 3. Comment    : 관리자 > 시스템 관리 > 차단단어 관리 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/banWordManagerModify")
	public ModelAndView banWordManagerModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		int result = this.banWordManagerService.updateBanWordManager(request, commandMap);
		// view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/banWordManagerList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/banWordManagerList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : banWordManagerTxtCheckAjax
	* 2. ClassName  : BanWordManagerController.java
	* 3. Comment    : 관리자 > 시스템 관리 > 차단단어 관리 > 차단단어(금지어) 중복체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/site/banWordManagerTxtCheckAjax")
	public JSON banWordManagerTxtCheckAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
        
		if(!"".equals(StringUtil.getString(commandMap.get("BAN_WRD_TXT"), "")))
        {
            // 금지어 중복 체크
            int banWordTxtCount = this.banWordManagerService.selectBanWordManagerTxtCheckCount(commandMap);
            
            if( banWordTxtCount > 0)
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
	
	@RequestMapping("/am/site/banWordManagerListExcelDownload")
    public ModelAndView banWordManagerListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        int totalCount = this.banWordManagerService.selectBanWordManagerListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        commandMap.put("excelDown", "Y");
        
        if(totalCount > 0){
        	 List<Map<String, Object>> list = null;
        	 
        	 String fileName = "banWordList_"+DateUtil.getToday();

        	 String [] rowTitle = { "NO","금지어","등록일","사용 설정"};      
             String [] cellSize = { "20","100","50","50"};
           	 String [] dataName = { "RNUM","BAN_WRD_TXT","BAN_WRD_REG_DT", "BAN_WRD_USE_YN"};
             String [] dataType = { "String", "String", "Date", "String"};
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
        	list = this.banWordManagerService.selectBanWordManagerList(commandMap);

        	if(list != null){
                // 차단단어 목록 엑셀 다운로드
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
	
	
	
}
