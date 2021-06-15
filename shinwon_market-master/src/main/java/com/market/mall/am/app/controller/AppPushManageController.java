package com.market.mall.am.app.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.AppPushService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.app.controller
 * @FileName : AppPushManageController.java
 * @Date : 2016. 3. 2.
 * @프로그램 설명 : 관리자 > APP관리 > APP 푸시관리를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class AppPushManageController {
	
	@Resource(name="appPushService") private AppPushService appPushService;
	
	/**
	* <pre>
	* 1. MethodName : appPushManageList
	* 2. ClassName  : AppPushManageController.java
	* 3. Comment    : 관리자 > APP관리 > APP 푸시관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appPushManageList")
	public ModelAndView appPushManageList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();

        // APP 푸시관리 목록 갯수
        int totalCount = this.appPushService.selectAppPushCount(commandMap);
        //페이징
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
        	// APP 푸시관리 목록
        	list = this.appPushService.selectAppPushList(commandMap);
        }
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);

        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appPushManageForm
	* 2. ClassName  : AppPushManageController.java
	* 3. Comment    : 관리자 > APP관리 > APP 푸시관리 등록 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appPushManageForm")
	public ModelAndView appPushManageForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appPushManageRegist
	* 2. ClassName  : AppPushManageController.java
	* 3. Comment    : 관리자 > APP관리 > APP 푸시관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appPushManageRegist")
	public ModelAndView appPushManageRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
        
        int result = this.appPushService.insertAppPush((MultipartHttpServletRequest)request, commandMap);
        
        if(result > 0)
        {
        	mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/app/appPushManageList.do");
        } 
        else 
        {
        	mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/app/appPushManageList.do");
        }
        
        //RETURN OBJECT
        mv.setViewName("am/common/result");

        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appPushManageEdit
	* 2. ClassName  : AppPushManageController.java
	* 3. Comment    : 관리자 > APP관리 > APP 푸시관리 상세정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appPushManageEdit")
	public ModelAndView appPushManageEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("APP_PSH_IDX"),"")))
		{
			//APP 푸시알림관리 상세 정보
	        Map<String, Object> resultMap = this.appPushService.selectAppPushView(commandMap);
	        
	        mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
		}
			
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appPushManageModify
	* 2. ClassName  : AppPushManageController.java
	* 3. Comment    : 관리자 > APP관리 > APP 푸시관리 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/app/appPushManageModify")
	public ModelAndView appPushManageModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		int result = this.appPushService.updateAppPush((MultipartHttpServletRequest)request, commandMap);
        
        if(result > 0)
        {
        	mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/app/appPushManageList.do");
        } 
        else 
        {
        	mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/app/appPushManageList.do");
        }
        
        //RETURN OBJECT
        mv.setViewName("am/common/result");
        mv.addObject("commandMap", commandMap);
        
        return mv;
	}
}
