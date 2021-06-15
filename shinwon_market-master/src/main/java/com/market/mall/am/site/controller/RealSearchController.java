/*package com.market.mall.am.site.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.site.service.RealSearchService;
import com.market.mall.common.SessionsAdmin;

*//**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : RealSearchController.java
 * @Date : 2015. 5. 6.
 * @프로그램 설명 : 관리자 > 사이트관리 > 실시간 검색어 관리를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 *//*
@Controller
public class RealSearchController 
{
	
	@Resource(name="realSearchService")
	private RealSearchService realSearchService;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	*//**
	* <pre>
	* 1. MethodName : realSearchForm
	* 2. ClassName : RealSearchController.java
	* 3. Comment : 관리자 > 사이트관리 > 실시간 검색어 관리 등록/수정 폼
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*//*
	@RequestMapping(value="/am/site/realSearchForm")
	public ModelAndView realSearchForm(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
    //	commandMap.put("REL_SCH_BRAND_CD", StringUtil.getString(commandMap.get("REL_SCH_BRAND_CD")));
        
        // 실시간 검색어 관리 갯수
      //  int totalCount = this.realSearchService.selectRealSearchListCount(commandMap);
        
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
      //  if(totalCount > 0)
      //  {
      //  	// 실시간 검색어 관리 목록
      //  	list = this.realSearchService.selectRealSearchList(commandMap);
      //  }
        
     //   mv.addObject("list",list);
        mv.addObject("commandMap", commandMap);
		return mv;
	}
	
	*//**
	* <pre>
	* 1. MethodName : realSearchRegist
	* 2. ClassName : RealSearchController.java
	* 3. Comment : 관리자 > 사이트관리 > 실시간 검색어 관리 등록/수정  
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*//*
	@RequestMapping(value="/am/site/realSearchRegist")
	public ModelAndView realSearchRegist(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		int result = this.realSearchService.insertRealSearch(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/realSearchForm.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/realSearchForm.do");
        }
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
		
        return mv;
	}
}
*/