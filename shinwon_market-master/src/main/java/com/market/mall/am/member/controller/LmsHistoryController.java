package com.market.mall.am.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.member.service.LmsHistoryService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.member.controller
 * @FileName : LmsHistoryController.java
 * @Date : 2015. 10. 22.
 * @프로그램 설명 : 관리자 > 회원관리 > LMS이력을 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class LmsHistoryController {
	
	@Resource(name="lmsHistoryService") private LmsHistoryService lmsHistoryService;

	/**
	* <pre>
	* 1. MethodName : lmsHistoryList
	* 2. ClassName  : LmsHistoryController.java
	* 3. Comment    : 관리자 > 회원관리 > LMS이력 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/member/lmsHistoryList")
	public ModelAndView lmsHistoryList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();

		// LMS이력 목록 갯수
        int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 :this.lmsHistoryService.selectLmsHistoryListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount > 0)
        {
            // LMS이력 목록
        	list = this.lmsHistoryService.selectLmsHistoryList(commandMap);
        }        

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
		return mv;
	}
}
