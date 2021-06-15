package com.market.mall.am.app.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.app.service.AppVersionManageService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.app.controller
 * @FileName : AppVersionManageController.java
 * @Date : 2016. 3. 2.
 * @프로그램 설명 : 관리자 > APP 관리 > APP VERSION관리를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class AppVersionManageController {

	@Resource(name="appVersionManageService")
	private AppVersionManageService appVersionManageService;
	
	/**
	* <pre>
	* 1. MethodName : appVersionManageList
	* 2. ClassName  : AppVersionManageController.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 목록  
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 2.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appVersionManageList")
	public ModelAndView appVersionList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// app version 목록 갯수
		int totalCount = this.appVersionManageService.selectAppVersionManageListCount(commandMap);
		
		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String,Object>> list = null;
        
        if(totalCount > 0)
        {
        	 // app version 목록
        	 list = this.appVersionManageService.selectAppVersionManageList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appVersionManageForm
	* 2. ClassName  : AppVersionManageController.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 등록 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 2.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appVersionManageForm")
	public ModelAndView appVersionManageForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();	
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appVersionManageRegist
	* 2. ClassName  : AppVersionManageController.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 7.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appVersionManageRegist")
	public ModelAndView appVersionManageRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		commandMap.put("APP_VER_REG_IP", request.getRemoteAddr());
        commandMap.put("APP_VER_REG_ID", admin.getADM_MST_ID());
		// APP VERSION 등록
		int result = this.appVersionManageService.insertAppVersionManage(commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/app/appVersionManageList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/app/appVersionManageList.do");
        }
        mv.setViewName("/am/common/result");

		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appVersionManageEdit
	* 2. ClassName  : AppVersionManageController.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 수정 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appVersionManageEdit")
	public ModelAndView appVersionManageEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("APP_VER_IDX"),"")))
		{
			Map<String,Object> appVersionManageInfo = this.appVersionManageService.selectAppVersionManageInfo(commandMap);
			
			mv.addObject("appVersionManageInfo", appVersionManageInfo);
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appVersionManageModify
	* 2. ClassName  : AppVersionManageController.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appVersionManageModify")
	public ModelAndView appVersionManageModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		commandMap.put("APP_VER_REG_IP", request.getRemoteAddr());
        commandMap.put("APP_VER_REG_ID", admin.getADM_MST_ID());
        
        if(!"".equals(StringUtil.getString(commandMap.get("APP_VER_IDX"),"")))
		{
        	// APP VERSION 수정
    		int result = this.appVersionManageService.updateAppVersionManage(commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/app/appVersionManageList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/app/appVersionManageList.do");
            }
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
		}

		return mv;
	}
	
	
}
