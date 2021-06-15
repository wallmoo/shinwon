package com.market.mall.pc.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.FileUploadException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.EventService;
import com.market.mall.pc.customer.service.FaqBoardService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.customer.controller
 * @FileName : EventController.java
 * @Date : 2014. 7. 28.
 * @프로그램 설명 : 프론트 > 고객센터 > 이벤트 처리하는 Controller Class
 * @author kanghk
 */
@Controller("pcEventController")
public class EventController {
	
	@Resource(name="pcEventService")
    private EventService pcEventService;
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;

	@Resource(name = "propertiesService") 
	private EgovPropertyService propertiesService;
	
	@Resource(name="pcFaqBoardService")
    private FaqBoardService pcFaqBoardService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	* <pre>
	* 1. MethodName : eventList
	* 2. ClassName  : EventController.java
	* 3. Comment    : 이벤트 목록 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 28.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/eventList")
    public ModelAndView eventList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchEvtMstShopType", "Y"); //PC용 이벤트
        commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");// PC용 이미지 
        commandMap.put("CMM_FLE_TB_TYPE", "P"); //PC용 이미지
        commandMap.put("CMM_FLE_SORT", "1"); //PC용 목록 이미지
        
        // 브랜드 코드 가져오기
        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));

        // 이벤트 목록 갯수
        commandMap.put("pageSize", "15");
        int totalCount = this.pcEventService.selectEventListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        
        if(totalCount>0)
        {
        	// 이벤트  목록
            mv.addObject("list",  this.pcEventService.selectEventList(commandMap));
        }        
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/customer/eventList");
        
        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : eventView
	* 2. ClassName  : EventController.java
	* 3. Comment    : 이벤트 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 28.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/eventView")
    public ModelAndView eventView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
       
        int totalCount = 0;
        
        if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
        {
        	commandMap.put("searchEvtMstShopType", "Y"); //PC용 이벤트
        	commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");// PC용 이미지
        	commandMap.put("CMM_FLE_TB_TYPE", "P"); //PC용 이미지
            commandMap.put("CMM_FLE_SORT", "2"); //PC용 상세 이미지
            
            Map<String,Object> row = this.pcEventService.selectEventInfo(commandMap); 
            
            mv.addObject("row", row);	
            
            if(StringUtil.getInt(row.get("EVT_MST_TYPE")) == Code.EVENT_MASTER_TYPE_REPLY)	// 덧글형
            {
            	Map<String,Object> pagingMap = new HashMap<String, Object>();
                pagingMap.putAll(commandMap);
                pagingMap.put("pageSize", "20");
                totalCount = this.pcEventService.selectReplyEventListCount(pagingMap);
                pagingMap.put("cPage",pagingMap.get("pPage"));
                Paging paging = new Paging(totalCount, pagingMap); 
                
                if(totalCount > 0)
                {
                	mv.addObject("replyList",  this.pcEventService.selectReplyEventList(pagingMap));
                }
                
                mv.addObject("replyPaging",paging);
            }
            else if(StringUtil.getInt(row.get("EVT_MST_TYPE")) == Code.EVENT_MASTER_TYPE_BOARD)	// 게시판형
            {
            	Map<String,Object> boardMap = new HashMap<String, Object>();
            	boardMap.putAll(commandMap);
            	boardMap.put("pageSize", "20");
                totalCount = this.pcEventService.selectBoardEventListCount(boardMap);
                boardMap.put("cPage",boardMap.get("bPage"));
                Paging paging = new Paging(totalCount, boardMap); 
                
                if(totalCount > 0)
                {
                	mv.addObject("boardList",  this.pcEventService.selectBoardEventList(boardMap));
                }
                
                mv.addObject("boardPaging",paging);
            }
            else if(StringUtil.getInt(row.get("EVT_MST_TYPE")) == Code.EVENT_MASTER_TYPE_AUCTION)// 경매형
            {
            	totalCount = this.pcEventService.selectAuctionEventListCount(commandMap);
            	
            	if(totalCount > 0)
            	{
            		mv.addObject("auctionMap" , this.pcEventService.selectAuctionEventTopInfo(commandMap));
            	}
            }
            else if(StringUtil.getInt(row.get("EVT_MST_TYPE")) == Code.EVENT_MASTER_TYPE_SURVEY)// 설문형
            {
        		mv.addObject("surveyList", this.pcEventService.selectSurveyEventList(commandMap));
        		commandMap.put("CMM_FLE_TB_TYPE", "P");
            }
        }
        
        // 진행 중인 이벤트
        List<Map<String,Object>> ingEventList = this.pcEventService.selectIngEventList(commandMap);
        // 해당 브랜드로 이동
        mv.setViewName("pc/customer/eventView");
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("ingEventList", ingEventList);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : eventInsertAjax
	* 2. ClassName  : EventController.java
	* 3. Comment    : 이벤트 응모
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 28.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/pc/customer/eventInsertAjax.do", method = RequestMethod.POST)
	public JSON eventInsertAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		 if(SessionsUser.isLogin(request)){
			returnMap = this.pcEventService.insertEvent(request, commandMap);
			json.put("status", returnMap.get("status").toString());
        }else{
        	json.put("status", "login");
        }

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : replyEventRegist
	* 2. ClassName : EventController.java
	* 3. Comment : 덧글형 이벤트 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 2.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/pc/customer/replyEventRegist", method = RequestMethod.POST)
	public ModelAndView replyEventRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	        
			commandMap.put("EVT_REPLY_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("EVT_REPLY_REG_IP", request.getRemoteAddr());
			
			int result = this.pcEventService.insertReplyEvent(commandMap);
			
			if(result > 0)
			{
				mv.addObject("alertMsg", "등록되었습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
				
			}
			else if(result == -1)
			{
				mv.addObject("alertMsg", "이미 이벤트에 참여하셨습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			else
			{
				mv.addObject("alertMsg", "등록 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			Map<String,Object> resultMap = new HashMap();
			resultMap.put("EVT_MST_IDX", commandMap.get("EVT_MST_IDX"));
			resultMap.put("BRAND_CD", commandMap.get("BRAND_CD"));
			resultMap.put("cPage", commandMap.get("cPage"));
			
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
	* 1. MethodName : boardEventForm
	* 2. ClassName : EventController.java
	* 3. Comment : 게시판형 이벤트 게시글 등록 폼
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/boardEventForm")
	public ModelAndView boardEventForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	
			if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
	        {
	        	commandMap.put("searchEvtMstShopType", "Y"); //PC용 이벤트
	        	commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");// PC용 이미지
	        	commandMap.put("CMM_FLE_TB_TYPE", "P"); //PC용 이미지
	            commandMap.put("CMM_FLE_SORT", "2"); //PC용 상세 이미지
	            
	            Map<String,Object> row = this.pcEventService.selectEventInfo(commandMap); 
	            
	            mv.addObject("row", row);	
	        
	            //게시판형 이벤트 목록 갯수
				int totalCount = this.pcEventService.selectBoardEventListCount(commandMap);
				
				mv.addObject("totalCount", totalCount);
	        }
			
			// 진행 중인 이벤트
	        List<Map<String,Object>> ingEventList = this.pcEventService.selectIngEventList(commandMap);
			
			mv.addObject("commandMap", commandMap);
			mv.addObject("ingEventList", ingEventList);
			
			// 해당 브랜드로 이동
	        mv.setViewName("pc/customer/boardEventForm");
	        
			return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : boardEventInsert
	* 2. ClassName : EventController.java
	* 3. Comment : 게시판형 이벤트 게시글 등록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/pc/customer/boardEventInsert", method = RequestMethod.POST)
	public JSON boardEventInsert (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		String resultMsg = "";
		String isSuccessYn = "";
		
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			//사용자 정보
			User user = SessionsUser.getSessionUser(request);
			
			if(SessionsUser.isLogin(request)){
				commandMap.put("EVT_BOARD_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			}
			commandMap.put("EVT_BOARD_REG_IP", request.getRemoteAddr());
			
			try
			{
				int result = this.pcEventService.insertBoardEvent((MultipartHttpServletRequest)request,commandMap);
				
				if(result > 0)
				{
		            isSuccessYn = "Y";
		            resultMsg = "등록 되었습니다.";
				}
				else if(result == -1)
				{
					isSuccessYn="N";
					resultMsg = "이미 이벤트에 참여하셨습니다.";
				}
				else
				{
					isSuccessYn="N";
					resultMsg = "등록에 실패하였습니다.";
				}
			}
			catch(FileUploadException e)
			{
				logger.debug("productCommentRegist Error : " + e.getMessage());
				isSuccessYn="N";
				resultMsg = e.getMessage();
			}
			catch(Exception e)
			{
				logger.debug("productCommentRegist Error : " + e.getMessage());
				isSuccessYn="N";
				resultMsg = "등록에 실패하였습니다.";
			}
			
			json.addObject("resultMsg", resultMsg);
			json.addObject("isSuccessYn", isSuccessYn);
	        
			return json;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : boardEventView
	* 2. ClassName : EventController.java
	* 3. Comment : 게시판형 이벤트 상세정보
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/boardEventView")
	public ModelAndView boardEventView (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
        
		if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
        {
        	commandMap.put("searchEvtMstShopType", "Y"); //PC용 이벤트
        	commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");// PC용 이미지
        	commandMap.put("CMM_FLE_TB_TYPE", "P"); //PC용 이미지
            commandMap.put("CMM_FLE_SORT", "2"); //PC용 상세 이미지
            
            Map<String,Object> row = this.pcEventService.selectEventInfo(commandMap); 
            
            mv.addObject("row", row);	
        
            //게시판형 이벤트 목록 갯수
			int totalCount = this.pcEventService.selectBoardEventListCount(commandMap);
			
			// 진행 중인 이벤트
	        List<Map<String,Object>> ingEventList = this.pcEventService.selectIngEventList(commandMap);
			
			mv.addObject("totalCount", totalCount);
			mv.addObject("ingEventList", ingEventList);
        }
		
		if(!"".equals(StringUtil.getString(commandMap.get("EVT_BOARD_IDX"), "")))
        {
            // 게시판형 이벤트 상세정보
        	Map<String, Object> resultMap = this.pcEventService.selectBoardEventInfo(commandMap);
            mv.addObject("boardRow", resultMap.get("row"));
            
            List<Map<String,Object>> fileList = (List<Map<String,Object>>)resultMap.get("fileList");
            
            String filename_ext = "";	// 파일 확장자
            
            //이미지 검증 배열변수
            String[] allow_file = propertiesService.getString("file.AllowedExtensions.image").split("\\|"); //이미지 확장자 배열
            
            List<Map<String,Object>> imageList = new ArrayList<Map<String, Object>>();
            for(int i=0; i < fileList.size(); i++)
            {
            	filename_ext = (String)fileList.get(i).get("CMM_FLE_ATT_EXT");
            	
            	for(int j=0; j<allow_file.length; j++) 
                {
                    if(filename_ext.equals(allow_file[j]))
                    {
                    	imageList.add(fileList.get(i));
                    }
                }
            }
            
            mv.addObject("imageList", imageList);
        }
        
		mv.addObject("commandMap", commandMap);
        // 해당 브랜드로 이동
        mv.setViewName("pc/customer/boardEventView");
        
        return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : boardEventDelete
	* 2. ClassName : EventController.java
	* 3. Comment : 게시판형 이벤트 게시글 삭제
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/boardEventDelete")
	public ModelAndView boardEventDelete (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();

			//사용자 정보
			User user = SessionsUser.getSessionUser(request);
			
			if(SessionsUser.isLogin(request)){
				commandMap.put("EVT_BOARD_UPD_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			}
			commandMap.put("EVT_BOARD_UPD_IP", request.getRemoteAddr());
			
			int result = this.pcEventService.deleteBoardEvent(commandMap);
			
			if(result > 0)
			{
				mv.addObject("alertMsg", "삭제되었습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			else
			{
				mv.addObject("alertMsg", "삭제 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			mv.addObject("commandMap", commandMap);
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
	* 1. MethodName : boardEventEdit
	* 2. ClassName : EventController.java
	* 3. Comment : 게시판형 이벤트 수정 폼
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/boardEventEdit")
	public ModelAndView boardEventEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
	
			if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
	        {
	        	commandMap.put("searchEvtMstShopType", "Y"); //PC용 이벤트
	        	commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");// PC용 이미지
	        	commandMap.put("CMM_FLE_TB_TYPE", "P"); //PC용 이미지
	            commandMap.put("CMM_FLE_SORT", "2"); //PC용 상세 이미지
	            
	            Map<String,Object> row = this.pcEventService.selectEventInfo(commandMap); 
	            
	            mv.addObject("row", row);	
	        
	            //게시판형 이벤트 목록 갯수
				int totalCount = this.pcEventService.selectBoardEventListCount(commandMap);
				
				// 진행 중인 이벤트
		        List<Map<String,Object>> ingEventList = this.pcEventService.selectIngEventList(commandMap);
		        
				mv.addObject("totalCount", totalCount);
				mv.addObject("ingEventList", ingEventList);
	        }
			
			if(!"".equals(StringUtil.getString(commandMap.get("EVT_BOARD_IDX"), "")))
	        {
	            // 게시판형 이벤트 상세정보
	        	Map<String, Object> resultMap = this.pcEventService.selectBoardEventInfo(commandMap);
	            mv.addObject("boardRow", resultMap.get("row"));
	            mv.addObject("fileList", resultMap.get("fileList"));
	        }
			
			mv.addObject("commandMap", commandMap);
			
			// 해당 브랜드로 이동
	        mv.setViewName("pc/customer/boardEventEdit");
	        
			return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : boardEventUpdate
	* 2. ClassName : EventController.java
	* 3. Comment : 게시판형 이벤트 수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/customer/boardEventUpdate")
	public JSON boardEventUpdate (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		String resultMsg = "";
		String isSuccessYn = "";
		
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();

			//사용자 정보
			User user = SessionsUser.getSessionUser(request);
			
			if(SessionsUser.isLogin(request)){
				commandMap.put("EVT_BOARD_UPD_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			}
			commandMap.put("EVT_BOARD_UPD_IP", request.getRemoteAddr());
			
			try
			{
				if(this.pcEventService.updateBoardEvent((MultipartHttpServletRequest) request,commandMap) > 0)
				{
					isSuccessYn = "Y";
					resultMsg = "수정 되었습니다.";
				}
				else
				{
					isSuccessYn = "N";
					resultMsg = "수정 실패하였습니다";
				}
			}
			catch(FileUploadException e)
			{
				logger.debug("productCommentRegist Error : " + e.getMessage());
				isSuccessYn = "N";
				resultMsg = e.getMessage();
			}
			catch(Exception e)
			{
				logger.debug("productCommentRegist Error : " + e.getMessage());
				isSuccessYn = "N";
				resultMsg = "수정 실패하였습니다";
			}
			
			json.addObject("isSuccessYn", isSuccessYn);
			json.addObject("resultMsg", resultMsg);
			
		    return json;
        }
  		else
          {
          	throw new PcAuthenticationException();
          }
	}
	
	/**
	* <pre>
	* 1. MethodName : auctionEventRegist
	* 2. ClassName : EventController.java
	* 3. Comment : 경매형 이벤트 입찰 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/pc/customer/auctionEventRegist", method = RequestMethod.POST)
	public ModelAndView auctionEventRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			//사용자 정보
			User user = SessionsUser.getSessionUser(request);
			
			if(SessionsUser.isLogin(request)){
				commandMap.put("EVT_AUCTION_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			}
			commandMap.put("EVT_AUCTION_REG_IP", request.getRemoteAddr());
			
			int result = 0;
			
			if(StringUtil.getInt(commandMap.get("bestAuctionPrice")) < StringUtil.getInt(commandMap.get("EVT_AUCTION_PRICE")))
			{
				result = this.pcEventService.insertAuctionEvent(commandMap);
			}
			else
			{
				result = -2;
			}
			
			if(result > 0)
			{
				mv.addObject("alertMsg", "등록되었습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			else if(result == -1)
			{
				mv.addObject("alertMsg", "이미 이벤트에 참여하셨습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			else if(result == -2)
			{
				mv.addObject("alertMsg", "현재가보다 높게 입찰가를 입력하셔야합니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			else
			{
				mv.addObject("alertMsg", "등록 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			
			Map<String,Object> resultMap = new HashMap();
			
			resultMap.put("EVT_MST_IDX", commandMap.get("EVT_MST_IDX"));
			resultMap.put("BRAND_CD", commandMap.get("BRAND_CD"));
			
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
	* 1. MethodName : surveyEventRegist
	* 2. ClassName : EventController.java
	* 3. Comment : 설문형 이벤트 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/pc/customer/surveyEventRegist", method = RequestMethod.POST)
	public ModelAndView surveyEventRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			//사용자 정보
			User user = SessionsUser.getSessionUser(request);
			
			if(SessionsUser.isLogin(request)){
				commandMap.put("EVT_SURVEY_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			}
			commandMap.put("EVT_SURVEY_REG_IP", request.getRemoteAddr());
			
			int result = this.pcEventService.insertSurveyEvent(commandMap);
			
			if(result > 0)
			{
				mv.addObject("alertMsg", "등록되었습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			else if(result == -1)
			{
				mv.addObject("alertMsg", "이미 이벤트에 참여하셨습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			else
			{
				mv.addObject("alertMsg", "등록 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/eventView.do");
			}
			
			Map<String,Object> resultMap = new HashMap();
			
			resultMap.put("EVT_MST_IDX", commandMap.get("EVT_MST_IDX"));
			resultMap.put("BRAND_CD", commandMap.get("BRAND_CD"));
			
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
	* 1. MethodName : preEventView
	* 2. ClassName : EventController.java
	* 3. Comment : 관리자에서 이벤트 상세 미리보기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 1.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("pc/customer/preEventView")
	public ModelAndView preEventView (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
	       
		int totalCount = 0;
        
        if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
        {
        	commandMap.put("searchEvtMstShopType", "Y"); //PC용 이벤트
        	commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");// PC용 이미지
        	commandMap.put("CMM_FLE_TB_TYPE", "P"); //PC용 이미지
            commandMap.put("CMM_FLE_SORT", "2"); //PC용 상세 이미지
            commandMap.put("preEvent", "Y");	// 미리보기 
            
            Map<String,Object> row = this.pcEventService.selectEventInfo(commandMap); 
            
            mv.addObject("row", row);	
            
            if(StringUtil.getInt(row.get("EVT_MST_TYPE")) == Code.EVENT_MASTER_TYPE_REPLY)	// 덧글형
            {
            	commandMap.put("pageSize", "20");
                totalCount = this.pcEventService.selectReplyEventListCount(commandMap);
                Paging paging = new Paging(totalCount, commandMap); 
                
                if(totalCount > 0)
                {
                	mv.addObject("replyList",  this.pcEventService.selectReplyEventList(commandMap));
                }
                
                mv.addObject("paging",paging);
            }
            else if(StringUtil.getInt(row.get("EVT_MST_TYPE")) == Code.EVENT_MASTER_TYPE_BOARD)	// 게시판형
            {
            	commandMap.put("pageSize", "20");
                totalCount = this.pcEventService.selectBoardEventListCount(commandMap);
                Paging paging = new Paging(totalCount, commandMap); 
                
                if(totalCount > 0)
                {
                	mv.addObject("boardList",  this.pcEventService.selectBoardEventList(commandMap));
                }
                
                mv.addObject("paging",paging);
            }
            else if(StringUtil.getInt(row.get("EVT_MST_TYPE")) == Code.EVENT_MASTER_TYPE_AUCTION)// 경매형
            {
            	totalCount = this.pcEventService.selectAuctionEventListCount(commandMap);
            	
            	if(totalCount > 0)
            	{
            		mv.addObject("auctionMap" , this.pcEventService.selectAuctionEventTopInfo(commandMap));
            	}
            }
            else if(StringUtil.getInt(row.get("EVT_MST_TYPE")) == Code.EVENT_MASTER_TYPE_SURVEY)// 설문형
            {
        		mv.addObject("surveyList", this.pcEventService.selectSurveyEventList(commandMap));
        		commandMap.put("CMM_FLE_TB_TYPE", "P");
            }
        }
        
        // 진행 중인 이벤트
        List<Map<String,Object>> ingEventList = this.pcEventService.selectIngEventList(commandMap);
        // 해당 브랜드로 이동
        mv.setViewName("pc/customer/preEventView");
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("ingEventList", ingEventList);
        
        return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventWinerList
	 * 2. ClassName : EventController.java
	 * 3. Comment : 당첨자 발표 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("pc/customer/eventWinList")
	public ModelAndView eventWinList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv		= new ModelAndView();
		
		 String faqCode	= "105";
	        
        // FAQ 좌측 하위 카테고리 목록
        mv.addObject("fqaCodeList", this.pcFaqBoardService.selectFaqCodeList(faqCode));
	        
		// 이벤트 목록 갯수
        int totalCount 		= this.pcEventService.selectEventWinListCount(commandMap);
        
        commandMap.put("pageSize", "10");
        Paging paging 		= new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        
        List<Map<String, Object>> list = null;
        
        if (totalCount > 0){
            // 이벤트 목록
            list = this.pcEventService.selectEventWinList(commandMap);
            mv.addObject("list", list);
        }
        
        mv.setViewName("pc/customer/eventWinList");
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("boardType", "eveWin");
        
		return mv;
	}
	

	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventWinView
	 * 2. ClassName : EventController.java
	 * 3. Comment : 당첨자 발표 상세 보기 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 7.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/customer/eventWinView")
    public ModelAndView eventWinView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        String faqCode	= "105";
        
        // FAQ 좌측 하위 카테고리 목록
        mv.addObject("fqaCodeList", this.pcFaqBoardService.selectFaqCodeList(faqCode));
        
        if(!"".equals(StringUtil.getString(commandMap.get("EVT_WIN_IDX"), ""))){
            // 공지사항 상세정보
        	Map<String, Object> resultMap = this.pcEventService.selectEventWinInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("winList", resultMap.get("winList"));
//            mv.addObject("fileList", resultMap.get("fileList"));
        }
        
        mv.setViewName("pc/customer/eventWinView");
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("boardType", "eveWin");
        // 해당 브랜드로 이동
            
        return mv;
    }
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getEventWinSearchAjax
	 * 2. ClassName : EventController.java
	 * 3. Comment : 당첨자 검색 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 7.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/pc/customer/eventWinSearchAjax")
    public JSON getEventWinSearchAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	JSON json = new JSON();
    	
    	List<Map<String, Object>> list		= this.pcEventService.selectEventWinSearchList(commandMap);
    	
    	String strResultMsg					= "";
    	
    	if(list.size() > 0){
    		for(int i=0; i < list.size(); i++){
    			HashMap row					= (HashMap) list.get(i);
    			
    			if(i == 0){
    				strResultMsg			= "축하합니다.\n"+ row.get("WIN_INF_MEM_NM") + "님은 [" + row.get("WIN_INF_NM") + "]에 당첨되셨습니다.";
    			}else{
    				strResultMsg			+= "\n"+ row.get("WIN_INF_MEM_NM") + "님은 [" + row.get("WIN_INF_NM") + "]에 당첨되셨습니다.";
    			}
    		}
    	}else{
    		strResultMsg					= "아쉽지만\n당첨되지 않았습니다.";
    	}
    	
    	json.addObject("strResultMsg", strResultMsg);
    	
    	return json;
    }
   
}
