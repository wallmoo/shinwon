package com.market.mall.am.createboard.controller;

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
import com.market.mall.am.createboard.service.CreateBoardService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.createboard.controller
 * @FileName : CreateBoardController.java
 * @Date : 2015. 3. 16.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 게시판 생성 Controller Class
 * @author kimsy
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class CreateBoardController {
	
	@Resource(name="createBoardService")
	private CreateBoardService createBoardService;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardList
	    * 2. ClassName  : CreateBoardController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 목록 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/createBoardList")
	public ModelAndView createBoardList(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		int totalCount = this.createBoardService.selectCreateBoardListCount(commandMap);
		
		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        
		if(totalCount > 0)
		{
			list = this.createBoardService.selectCreateBoardList(commandMap);
			
			for(Map<String,Object> preBoardInfo : list){
            	preBoardInfo.put("preBoardServerDomain",propertiesService.getString("server.domain"));
            }
		}
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardForm
	    * 2. ClassName  : CreateBoardController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 등록 폼 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/createBoardForm")
	public ModelAndView createBoardForm(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardRegist
	    * 2. ClassName  : CreateBoardController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 등록 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/createBoardRegist")
	public ModelAndView createBoardRegist(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
				
		int result = this.createBoardService.insertCreateBoard(request,commandMap);		
		
		if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/createboard/createBoardList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/createboard/createBoardList.do");
        }
        
		mv.setViewName("/am/common/result");
        
        return mv;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardEdit
	    * 2. ClassName  : CreateBoardController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 수정 폼 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/createBoardEdit")
	public ModelAndView createBoardEdit(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
        
		if(!"".equals(StringUtil.getString(commandMap.get("BRD_MST_IDX"), "")))
        {
			// 게시판 생성 상세정보
			Map<String,Object> resultMap = this.createBoardService.selectCreateBoardInfo(commandMap);
			mv.addObject("row", resultMap.get("row"));
        }
		
        mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardModify
	    * 2. ClassName  : CreateBoardController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 수정
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/createBoardModify")
	public ModelAndView createBoardModify(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		int result = this.createBoardService.updateCreateBoard(request,commandMap);
		
		if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/createboard/createBoardList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/createboard/createBoardList.do");
        }
        
		mv.setViewName("/am/common/result");
        
        return mv;
	}
	
}
