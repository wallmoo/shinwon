package com.market.mall.mobile.customer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.mobile.customer.service.NoticeBoardService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.pc.common.service.CommonService;

/**
 * @PackageName: com.market.mall.mobile.customer.controller
 * @FileName : NoticeBoardController.java
 * @Date : 2016. 2. 15.
 * @프로그램 설명 : 모바일 > 고객센터 > 공지사항을 처리하는 Controller Class
 * @author khcho
 */
@Controller("mobileNoticeBoardController")
public class NoticeBoardController {
	
	@Resource(name="mobileNoticeBoardService")
    private NoticeBoardService mobileNoticeBoardService;
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
 	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : noticeBoardList
	 * 2. ClassName : NoticeBoardController.java
	 * 3. Comment : 공지사항 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/customer/noticeBoardList")
    public ModelAndView noticeBoardList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String faqCode	= "105";
        
        // FAQ 좌측 하위 카테고리 목록
        //mv.addObject("fqaCodeList", this.pcFaqBoardService.selectFaqCodeList(faqCode));
        
        //상단공지 리스트 먼저 가져오기
        commandMap.put("BRD_NTS_TOP_YN", "Y");
        List<Map<String, Object>> topList = this.mobileNoticeBoardService.selectNoticeBoardList(commandMap);
        
        // 공지사항 목록 갯수
        commandMap.put("BRD_NTS_TOP_YN", "N");
        commandMap.put("pageSize", "20");
        int totalCount = this.mobileNoticeBoardService.selectNoticeBoardListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        mv.addObject("totalCount", totalCount);
        if(totalCount>0){
        	// 공지사항  목록
            mv.addObject("list",  this.mobileNoticeBoardService.selectNoticeBoardList(commandMap));
        }      
        
        // 공지사항 유형 리스트
//        mv.addObject("codeList", this.pcCommonService.selectCode("COMMON_NOTICE_TYPE"));

        // 해당 브랜드로 이동
        mv.setViewName("mobile/customer/noticeBoardList");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("topList", topList);
        mv.addObject("commandMap", commandMap);
        mv.addObject("boardType", "noti");
        
        return mv;
    }
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : noticeBoardListAjax
	 * 2. ClassName : NoticeBoardController.java
	 * 3. Comment : 공지사항 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mobile/customer/noticeBoardListAjax.do", method = RequestMethod.POST)
    public JSON noticeBoardListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
	     String cPage		= StringUtil.getString(commandMap.get("cPage"), ""); 		// 좌측 lnb 에서 클릭한 값
	   	
		 commandMap.put("pageSize", 20);
		 commandMap.put("BRD_NTS_TOP_YN", "N");
		 int totalCount 	= this.mobileNoticeBoardService.selectNoticeBoardListCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap); 
		 
		 resultMap.put("list", 	this.mobileNoticeBoardService.selectNoticeBoardList(commandMap));
		 
		 json.addObject("resultMap", 				resultMap);
		   
//		 System.out.println("json start::::::>" + json);
		 return json;
		 
        
        
    }
	
	
	/**
	* <pre>
	* 1. MethodName : noticeBoardView
	* 2. ClassName  : NoticeBoardController.java
	* 3. Comment    : 공지사항 상세
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/noticeBoardView")
    public ModelAndView noticeBoardView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_NTS_IDX"), ""))){
            // 공지사항 상세정보
        	Map<String, Object> resultMap = this.mobileNoticeBoardService.selectNoticeBoardInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
        }
        
        // 공지사항 유형 리스트
        //mv.addObject("codeList", this.pcCommonService.selectCode("COMMON_NOTICE_TYPE"));
        mv.addObject("commandMap", commandMap);
        // 해당 브랜드로 이동
        mv.setViewName("mobile/customer/noticeBoardView");
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : preBoardList
	* 2. ClassName : NoticeBoardController.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 일반게시판 미리보기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/preBoardList")
	public ModelAndView preBoardList(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
        
        //미리보기 게시판 상단공지 리스트 먼저 가져오기
        commandMap.put("BRD_DTL_TOP_YN", "Y");
        List<Map<String, Object>> topList = this.mobileNoticeBoardService.selectPreBoardList(commandMap);
        
        // 미리보기 게시판 목록 갯수
        commandMap.put("BRD_DTL_TOP_YN", "N");
        commandMap.put("pageSize", "10");
        int totalCount = this.mobileNoticeBoardService.selectPreBoardListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        if(totalCount>0)
        {
        	// 미리보기 게시판  목록
            mv.addObject("list",  this.mobileNoticeBoardService.selectPreBoardList(commandMap));
        }      
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/customer/preBoardList");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("topList", topList);
        mv.addObject("commandMap", commandMap);
        
        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : preBoardView
	* 2. ClassName : NoticeBoardController.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/preBoardView")
	public ModelAndView preBoardView(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
        int totalCount = 0;
		
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_DTL_IDX"), "")))
        {
            // 게시판 미리보기 상세정보
        	Map<String, Object> resultMap = this.mobileNoticeBoardService.selectPreBoardInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
            
            Map<String,Object> pagingMap = new HashMap<String, Object>();
            pagingMap.putAll(commandMap);
            pagingMap.put("pageSize", "20");	
            totalCount = this.mobileNoticeBoardService.selectReplyListCount(pagingMap);
            pagingMap.put("cPage",pagingMap.get("pPage"));
            Paging replyPaging = new Paging(totalCount, pagingMap); 
            
            if(totalCount > 0)
            {
            	mv.addObject("replyList",  this.mobileNoticeBoardService.selectReplyList(pagingMap));
            }
            
            mv.addObject("replyPaging",replyPaging);
        }
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("totalCount", totalCount);
        // 해당 브랜드로 이동
        mv.setViewName("pc/customer/preBoardView");
        
        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : preReplyRegist
	* 2. ClassName : NoticeBoardController.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세 > 댓글 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/mobile/customer/preReplyRegist", method = RequestMethod.POST)
	public ModelAndView preReplyRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	        
			commandMap.put("BRD_REPLY_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("BRD_REPLY_REG_IP", request.getRemoteAddr());
			
			int result = this.mobileNoticeBoardService.insertReply(commandMap);
			
			if(result > 0)
			{
				mv.addObject("alertMsg", "등록되었습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/pc/customer/preBoardView.do");
				
			}
			else
			{
				mv.addObject("alertMsg", "등록 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/pc/customer/preBoardView.do");
			}
			
			Map<String,Object> resultMap = new HashMap();
			
			resultMap.put("BRD_DTL_IDX", commandMap.get("BRD_DTL_IDX"));
			resultMap.put("BRD_MST_IDX", commandMap.get("BRD_MST_IDX"));
			resultMap.put("BRD_DTL_TOP_YN", commandMap.get("BRD_DTL_TOP_YN"));
			resultMap.put("cPage", commandMap.get("cPage"));
			resultMap.put("BRD_MST_TYPE", commandMap.get("BRD_MST_TYPE"));
			
			mv.addObject("commandMap", resultMap);
			mv.addObject("methodType", "get");
			// 해당 브랜드로 이동
	        mv.setViewName("pc/common/result");
			return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : preImageBoardList
	* 2. ClassName : NoticeBoardController.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 이미지게시판 미리보기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/customer/preImageBoardList")
	public ModelAndView preImageBoardList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
        
        //미리보기 게시판 상단공지 리스트 먼저 가져오기
        commandMap.put("BRD_DTL_TOP_YN", "Y");
        List<Map<String, Object>> topList = this.mobileNoticeBoardService.selectPreImageBoardList(commandMap);
        
        // 미리보기 게시판 목록 갯수
        commandMap.put("BRD_DTL_TOP_YN", "N");
        commandMap.put("pageSize", "10");		
        int totalCount = this.mobileNoticeBoardService.selectPreImageBoardListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        if(totalCount>0)
        {
        	// 미리보기 게시판  목록
            mv.addObject("list",  this.mobileNoticeBoardService.selectPreImageBoardList(commandMap));
        }      
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/customer/preImageBoardList");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("topList", topList);
        mv.addObject("commandMap", commandMap);
        
        return mv;
	}

}
