package com.market.mall.am.createboard.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.createboard.service.CreateBoardCommonService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.createboard.controller
 * @FileName : CreateBoardCommonController.java
 * @Date : 2015. 3. 17.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 생성된 게시판 공통 Controller Class
 * @author kimsy
 */
@Controller
public class CreateBoardCommonController {
	
	@Resource(name="createBoardCommonService")
	private CreateBoardCommonService createBoardCommonService;
	
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;

	/**
	    * <pre>
	    * 1. MethodName : createBoardCommonForm
	    * 2. ClassName  : CreateBoardCommonController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 등록 폼
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/create{BRD_MST_IDX}BoardCommonForm")
	public ModelAndView createBoardCommonForm(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap
			,@PathVariable() String BRD_MST_IDX) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		commandMap.put("BRD_MST_IDX", BRD_MST_IDX);
		
		// 공통 게시판 상위 마스터 게시판 속성
		Map<String,Object> resultMap = this.createBoardCommonService.selectCreateBoardCommonMstInfo(commandMap);
		
		mv.addObject("resultMap", resultMap);
		mv.setViewName("/am/createboard/createBoardCommonForm");
		
		return mv;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardCommonRegist
	    * 2. ClassName  : CreateBoardCommonController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 등록 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/create{BRD_MST_IDX}BoardCommonRegist")
	public ModelAndView createBoardCommonRegist(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap
			,@PathVariable() String BRD_MST_IDX) throws Exception
	{
		ModelAndView mv = new ModelAndView();
	
		int result = this.createBoardCommonService.insertCreateBoardCommon((MultipartHttpServletRequest)request, commandMap);
		
		if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/createboard/create"+ BRD_MST_IDX +"BoardCommonList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/createboard/create"+ BRD_MST_IDX +"BoardCommonList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;

	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardCommonList
	    * 2. ClassName  : CreateBoardCommonController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 목록 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/create{BRD_MST_IDX}BoardCommonList")
	public ModelAndView createBoardCommonList(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap
			,@PathVariable() String BRD_MST_IDX) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		commandMap.put("BRD_MST_IDX", BRD_MST_IDX);
		
		// 공통 게시판 상위 마스터 게시판 속성 
		Map<String,Object> resultMap = this.createBoardCommonService.selectCreateBoardCommonMstInfo(commandMap);		
		
		if(resultMap != null){
	        // 일반게시판, 이미지게시판 구분 값 commandMap에 담기
	        commandMap.put("BRD_MST_TYPE",resultMap.get("BRD_MST_TYPE"));   
	        
	        // 상단
	        if(resultMap.get("BRD_MST_TOP_YN").equals("Y"))
	        {           
	            commandMap.put("BRD_DTL_TOP_YN", "Y");          
	            List<Map<String,Object>> topList = this.createBoardCommonService.selectCreateBoardCommonList(commandMap);
	            mv.addObject("topList", topList);
	        }
	        
	        commandMap.put("BRD_DTL_TOP_YN", "N");  
	        int totalCount = this.createBoardCommonService.selectCreateBoardCommonListCount(commandMap);
	        
	        Paging paging = new Paging(totalCount, commandMap);
	        mv.addObject( "paging", paging );

	        commandMap.put("startNum", paging.getStartNum());
	        commandMap.put("endNum", paging.getEndNum());
	        
	        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	        
	        if(totalCount > 0)
	        {
	            list = this.createBoardCommonService.selectCreateBoardCommonList(commandMap);
	        }
	            
	        mv.addObject("list", list);
	        mv.addObject("resultMap",resultMap);		    
		}
		
        mv.addObject("commandMap",commandMap);
        
        mv.setViewName("/am/createboard/createBoardCommonList");

        return mv;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardCommonEdit
	    * 2. ClassName  : CreateBoardCommonController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 수정 폼
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping(value="/am/createboard/create{BRD_MST_IDX}BoardCommonEdit")
	public ModelAndView createBoardCommonEdit(HttpServletRequest request, @RequestParams() Map<String,Object> commandMap
			,@PathVariable() String BRD_MST_IDX) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		commandMap.put("BRD_MST_IDX", BRD_MST_IDX);
		
		// 공통 게시판 상위 마스터 게시판 속성
		Map<String,Object> resultMstMap = this.createBoardCommonService.selectCreateBoardCommonMstInfo(commandMap);
			
		if(!"".equals(StringUtil.getString(commandMap.get("BRD_DTL_IDX"), "")))
		{
			// 공통 게시판 상세보기
			Map<String,Object> resultMap = this.createBoardCommonService.selectCreateBoardCommonInfo(commandMap);
			
			mv.addObject("row", resultMap.get("row"));
	        mv.addObject("fileList", resultMap.get("fileList"));		        

		}
		
		mv.addObject("resultMap", resultMstMap);
		mv.addObject("commandMap", commandMap);
		
		mv.setViewName("/am/createboard/createBoardCommonEdit");
		
        return mv;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardCommonModify
	    * 2. ClassName  : CreateBoardCommonController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 수정
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping("/am/createboard/create{BRD_MST_IDX}BoardCommonModify")
	public ModelAndView createBoardCommonModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap
			,@PathVariable() String BRD_MST_IDX) throws Exception
	{
		ModelAndView mv = new ModelAndView();
				
		int result = this.createBoardCommonService.updateCreateBoardCommon((MultipartHttpServletRequest)request, commandMap);
				
		if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("commandMap",commandMap);
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/createboard/create"+ BRD_MST_IDX +"BoardCommonList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("commandMap",commandMap);
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/createboard/create"+ BRD_MST_IDX +"BoardCommonList.do");
        }
        mv.setViewName("/am/common/result");
        
        return mv;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : createBoardCommonTopCountAjax
	    * 2. ClassName  : CreateBoardCommonController.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 상단 리스트 갯수 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@RequestMapping("/am/createboard/createBoardCommonTopCountAjax")
    public JSON noticeBoardTopCountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
                        
        int result = this.createBoardCommonService.selectCreateBoardCommonTopCount(commandMap);
        
        if(result > 5)
        {
            json.put("resultYn", "N");           
        }
        else if(result == 5)
        {
       	 json.put("resultYn", "F");		//FULL
        }
        else 
        {
            json.put("resultYn", "Y");	
        }
        return json;
    }
	
	/**
	* <pre>
	* 1. MethodName : createBoardCommonReplyDelAjax
	* 2. ClassName : CreateBoardCommonController.java
	* 3. Comment : 관리자 > 게시판 관리 > 게시판 수정 폼 > 선택된 덧글 삭제
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 3. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/createboard/createBoardCommonReplyDelAjax")
	public JSON createBoardCommonReplyDelAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.createBoardCommonService.deleteCreateBoardCommonReply(request,commandMap);
		
		if(result > 0)
        {
            json.put("result", "success");
        }     
		else
		{
			json.put("result", "error");
		}
        
        return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : createBoardCommonReplyListAjax
	* 2. ClassName : CreateBoardCommonController.java
	* 3. Comment : 관리자 > 게시판 관리 > 게시판 수정 폼 > 덧글 목록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 3. 24.
	* </pre>
	*
	* @param response
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/createboard/createBoardCommonReplyListAjax")
	public JSON createBoardCommonReplyListAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		List<Map<String,Object>> replyList = new ArrayList<Map<String,Object>>();
        
        // 덧글 목록 갯수 
        int replyCount = this.createBoardCommonService.selectCreateBoardCommonReplyListCount(commandMap);
        
        commandMap.put("pageSize", 20);
        commandMap.put("orderAscYn", "Y");
        Paging paging = new Paging(replyCount, commandMap);
        PagingRenderer pagingRenderer = new PagingRenderer("ADMIN");
        String page = pagingRenderer.renderPagination(paging, "getCreateBoardCommonReplyListAjax");
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());		
        
        if(replyCount > 0)
        {
        	// 덧글 목록
        	replyList = this.createBoardCommonService.selectCreateBoardCommonReplyList(commandMap);
        }
        
        json.put("list", replyList);
        json.put("page", page);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : createBoardCommonReplyInsertAjax
	* 2. ClassName : CreateBoardCommonController.java
	* 3. Comment : 관리자 > 게시판 관리 > 게시판 수정 폼 > 관리자 덧글 등록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 3. 24.
	* </pre>
	*
	* @param response
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/createboard/createBoardCommonReplyInsertAjax")
	public JSON createBoardCommonReplyInsertAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		int result = this.createBoardCommonService.insertCreateBoardCommonReply(request,commandMap);
		
		if(result > 0)
        {
            json.put("result", "success");
        }     
		else
		{
			json.put("result", "error");
		}
		
		return json;
	}

}
