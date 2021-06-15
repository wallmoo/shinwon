package com.market.mall.mobile.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.marketing.service.PointService;
import com.market.mall.common.SessionsUser;
import com.market.mall.mobile.event.service.EventService;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;

@Controller("mEventController")
public class EventController {

	@Resource(name="mEventService")
	private EventService mEventService;
	
	@Resource(name="cartService") 
	private CartService cartService;
	
	@Resource(name="pointService")
    private PointService pointService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventMain
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 메인 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventMain")
	public ModelAndView eventMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv				= new ModelAndView();
	    	
		commandMap.put("CMM_FLE_TB_TYPE", "M");
		commandMap.put("whereType", "ing");
		commandMap.put("pageSize", "10");
		
	    int ingTotalCount			= this.mEventService.selectEventListCount(commandMap);
	    Paging ingPaging			= new Paging(ingTotalCount, commandMap);
	    	
		if(ingTotalCount > 0){		
			List ingList			= this.mEventService.selectEventList(commandMap);
			mv.addObject("ingList", ingList);
			mv.addObject("ingPaging", ingPaging);
		}
		
		commandMap.put("whereType", "end");
		
		int endTotalCount			= this.mEventService.selectEventListCount(commandMap);
		Paging endPaging			= new Paging(endTotalCount, commandMap);
		
		if(endTotalCount > 0){		
			List endList			= this.mEventService.selectEventList(commandMap);
			mv.addObject("endList", endList);
			mv.addObject("endPaging", endPaging);
		}
		
		mv.addObject("menu", "event");
		mv.addObject("commandMap", commandMap);
		mv.setViewName("mobile/event/eventMain");
			
		return mv;
	}
	
	/**
     * @api {POST} /mobile/event/eventList.do
     * @apiName EVENT 목록 화면
     * @apiGroup Mobile EVENT
     *
     * @apiParam {String} whereType : (진행중:ing / 종료:end / 당첨자발표:win)
     *
     * @apiSuccess {Object[]} bannerList 이벤트 상단 배너   [{IMG_THUMBNAIL : 썸네일 이미지, CMN_FLE_ALT_TXT = 대체텍스트, BNR_MST_TITLE:제목, BNR_MST_URL:URL}]
     * @apiSuccess {Object[]} EVT_ING_LIST 진행중 이벤트 리스트  [{TAG_MST_TITLE=태그타이틀, EVT_MST_ST_DT=20200123, EVT_MST_TITLE=test, EVT_MST_ST_DT_CHAR=2020.01.23, EVT_MST_TYPE=2929, RNUM=1, EVT_MST_IDX=353, EVT_MST_ED_DT_CHAR=2020.01.30, EVT_MST_PRE_WIN=5, EVT_MST_ED_DT=20200130, EVT_MST_USE_YN=Y, EVT_MST_MB_YN=Y, FILE_NM=/attach/marketing/2020/01/23/99e6df4d-a644-4f69-bdef-66d4e9d7013a.png, EVT_MST_PC_YN=Y, EVT_MST_LET_PLY_YN=N, EVT_WIN_USE_YN=0}]
     * @apiSuccess {Object[]} EVT_END_LIST 종료 이벤트 리스트 [{TAG_MST_TITLE=태그타이틀, EVT_MST_ST_DT=20200123, EVT_MST_TITLE=test, EVT_MST_ST_DT_CHAR=2020.01.23, EVT_MST_TYPE=2929, RNUM=1, EVT_MST_IDX=353, EVT_MST_ED_DT_CHAR=2020.01.30, EVT_MST_PRE_WIN=5, EVT_MST_ED_DT=20200130, EVT_MST_USE_YN=Y, EVT_MST_MB_YN=Y, FILE_NM=/attach/marketing/2020/01/23/99e6df4d-a644-4f69-bdef-66d4e9d7013a.png, EVT_MST_PC_YN=Y, EVT_MST_LET_PLY_YN=N, EVT_WIN_USE_YN=0}]
     * @apiSuccess {Object[]} EVT_WIN_LIST 당첨자 발표 리스트
     */
    @RequestMapping("/mobile/event/eventList")
    public ModelAndView eventList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        ModelAndView mv             = new ModelAndView();
        
        commandMap.put("whereType", "ing");
        commandMap.put("pageSize", "15");
        commandMap.put("CMM_FLE_TB_TYPE", "P");
        
        if("".equals(StringUtil.getString(commandMap.get("ingPage")))){
            commandMap.put("ingPage", 1);
            commandMap.put("cPage", 1);
        }else{
            commandMap.put("cPage", commandMap.get("ingPage"));
        }
        
        int ingTotalCount               = this.mEventService.selectEventListCount(commandMap);
        Paging ingPaging                = new Paging(ingTotalCount, commandMap); 
        
        if(ingTotalCount > 0){
            List ingList                = this.mEventService.selectEventList(commandMap);
            mv.addObject("ingList", ingList);
            mv.addObject("ingPaging", ingPaging);
        }
        
        if("".equals(StringUtil.getString(commandMap.get("endPage")))){
            commandMap.put("endPage", 1);
            commandMap.put("cPage", 1);
        }else{
            commandMap.put("cPage", commandMap.get("endPage"));
        }
        
        commandMap.put("whereType", "end");
        int endTotalCount               = this.mEventService.selectEventListCount(commandMap);
        Paging endPaging                = new Paging(endTotalCount, commandMap);
        
        if(endTotalCount > 0){
            List endList                = this.mEventService.selectEventList(commandMap);
            mv.addObject("endList", endList);
            mv.addObject("endPaging", endPaging);
        }
        
        mv.addObject("menu", "event");
        mv.setViewName("/mobile/event/eventList");
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	 
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventListAjax
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventListAjax")
	public JSON eventListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json		= new JSON();
		
		Map resultMap	= new HashMap();
		 
		commandMap.put("pageSize", "10");
		commandMap.put("CMM_FLE_TB_TYPE", "M");
		
		int totalCount					= this.mEventService.selectEventListCount(commandMap);
		Paging paging					= new Paging(totalCount, commandMap); 
		
		if(totalCount > 0){
			List list					= this.mEventService.selectEventList(commandMap);
			
			json.addObject("list", list);
			json.addObject("firstpageno", 				paging.getFirstPageNo());
			json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
			json.addObject("totalPageCount",  			paging.getTotalPageCount());
			json.addObject("lastPageNoOnPageList", 		paging.getLastPageNoOnPageList());	
			json.addObject("cPage", 					paging.getcPage());
			json.addObject("lastPageNo", 				paging.getLastPageNo());
			json.addObject("pageSize",  				paging.getPageSize());
			json.addObject("pagingSize", 				paging.getPagingSize());
			json.addObject("listNum",					paging.getListNum());
			json.addObject("totalRecordCount",			paging.getTotalRecordCount());  
		}
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventView
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 상세 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventView")
	public ModelAndView eventView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv			= new ModelAndView();
		
		boolean bSucces			= false;
		
		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
		
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""))){
			
			commandMap.put("CMM_FLE_TB_TYPE", "M");
			
			Map info			= this.mEventService.selectEventInfo(commandMap);
			
			if(info != null ){
				
				mv.addObject("menu", "event");
				
				String strEvtType				= StringUtil.getString(info.get("EVT_MST_TYPE"));
				String strIngType				= (String) info.get("EVT_ING_YN");
				String strEvtMstUseYn			= (String) info.get("EVT_MST_USE_YN");
				
				commandMap.put("whereType", strIngType);
				
				// 일반형(응모형)
				if("708".equals(strEvtType)){
					mv.setViewName("/mobile/event/eventView");
				// 설문형
				}else if("713".equals(strEvtType)){
					mv.setViewName("/mobile/event/eventSurvey");
					List surveyList				= this.mEventService.selectEventyDtlList(commandMap);
					mv.addObject("surveyList", surveyList);
				// 덧글형
				}else if("710".equals(strEvtType)){		 
					mv.setViewName("/mobile/event/eventComment");
					
					commandMap.put("pageSize", "20");
					
					int iCommCount				= this.mEventService.selectEventCommentCount(commandMap);
					Paging paging				= new Paging(iCommCount, commandMap);
					
					mv.addObject("paging", paging);
					
					if(iCommCount > 0){
						List commList			= this.mEventService.selectEventCommentList(commandMap);
						mv.addObject("commList", commList);
					}
					
					mv.addObject("iCommCount", iCommCount);
					
				// 이미지형 
				}else if("1842".equals(strEvtType)){
					mv.setViewName("/mobile/event/eventImage");
					
					int imgListCount			= this.mEventService.selectEventImageListCount(commandMap);
					List imgList				= this.mEventService.selectEventImageList(commandMap);
					
					commandMap.put("orderType", "top");
					int bestListCount			= this.mEventService.selectEventImageListCount(commandMap);
					
					if(bestListCount > 5){
						bestListCount 			= 5;
					}
					
					commandMap.put("startNum", 			1);
					commandMap.put("endNum", 			bestListCount);
					
					List bestList				= this.mEventService.selectEventImageList(commandMap);
					
					mv.addObject("imgList", imgList);
					mv.addObject("bestList", bestList);
					mv.addObject("imgListCount", imgListCount);
					mv.addObject("bestListCount", bestListCount);
				}
				
				bSucces	= true;
				
				mv.addObject("info", info);
				
				// 이벤트 select box 리스트 start  
				int totalCount					= this.mEventService.selectEventListCount(commandMap);
				
				commandMap.put("startNum", 1);
				commandMap.put("endNum", totalCount);
				
				List list						= this.mEventService.selectEventList(commandMap);
				mv.addObject("list", list);
				// 이벤트 select box 리스트 end 
			}
		}
		
		if(!bSucces){
			mv.addObject("alertMsg", "종료된 이벤트입니다.");
        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/event/eventMain.do");
        	mv.setViewName("mobile/common/result");
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
     * @api {GET} /mobile/event/eventLuckyDraw.do
     * @apiName 럭키드로우 이벤트
     * @apiGroup Mobile EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/event/eventLuckyDraw")
    public ModelAndView eventLuckyDraw (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /mobile/event/eventRandom.do
     * @apiName 랜덤쿠폰 이벤트
     * @apiGroup Mobile EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/event/eventRandom")
    public ModelAndView eventRandom (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /mobile/event/eventRoulette.do
     * @apiName 룰렛 이벤트
     * @apiGroup Mobile EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/event/eventRoulette")
    public ModelAndView eventRoulette (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /mobile/event/eventQuiz.do
     * @apiName 퀴즈이벤트
     * @apiGroup Mobile EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/event/eventQuiz")
    public ModelAndView eventQuiz (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /mobile/event/eventGuid.do
     * @apiName 안내 이벤트
     * @apiGroup Mobile EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/event/eventGuid")
    public ModelAndView eventGuid (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /mobile/event/eventCheck.do
     * @apiName 출석체크 이벤트
     * @apiGroup Mobile EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/event/eventCheck")
    public ModelAndView eventCheck (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /mobile/event/eventGroupBuying.do
     * @apiName 공동구매 이벤트
     * @apiGroup Mobile EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/event/eventGroupBuying")
    public ModelAndView eventGroupBuying (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /mobile/event/eventVote.do
     * @apiName 투표 이벤트
     * @apiGroup Mobile EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/event/eventVote")
    public ModelAndView eventVote (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventEntryAjax
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 응모 처리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventEntryAjax")
	public JSON eventEntryAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json				= new JSON();
		String strResultMsg		= "";
		boolean bSucces			= false;
		boolean pass			= true;
		
		Map info				= this.mEventService.selectEventInfo(commandMap);
		
		if(info == null){
			strResultMsg		= "잘못된 접근입니다.";
		}else{
		
			String strEvtType		= StringUtil.getString(info.get("EVT_MST_TYPE"));
			String strIngType		= (String) info.get("EVT_ING_YN");
			String strOverlap		= (String) info.get("EVT_MST_DUP_ETR");
			String strEvtMstMemGbn	= String.valueOf(info.get("EVT_MST_MEM_GBN"));			// 0:전체 , 1:통합 , 2:간편
			String strEvtMstPitGbn	= (String) info.get("EVT_MST_PIT_GBN"); // 포인트적립차감구분
			String strEvtMstPitYN	= (String) info.get("EVT_MST_PIT_YN");	// 포인트 사용 유무
			
			int intEvtMstPit		= Integer.parseInt(String.valueOf(info.get("EVT_MST_PIT")));
			
			// 로그인 회원정보
			User user = SessionsUser.getSessionUser(request);
			
	      	if(SessionsUser.isLogin(request) ){
				commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
				commandMap.put("MEM_LOGIN_YN", "Y");
			}else{
				commandMap.put("MEM_LOGIN_YN", "N");
			}
		
	      	if("Y".equals(commandMap.get("MEM_LOGIN_YN"))){
			
				commandMap.put("EVT_REG_IP", request.getRemoteAddr());
				commandMap.put("CMM_FLE_TB_TYPE", "M");
				
				Map<String, Object> userInfo 	= this.cartService.selectUserInfo(commandMap);
				commandMap.put("MEM_PIT_MEM_ID", user.getMEM_MST_MEM_ID());
				Map<String, Object> pointInfo	= this.pointService.selectMemberPointSum(commandMap);
				
				String memGbn		= userInfo.get("MEM_MST_MEM_GBN").toString();				// 682: 일반회원 , 683:기업회원, 1961:간편회원
				int userPoint		= 0;
				
				if(pointInfo != null){
					userPoint = Integer.parseInt(String.valueOf(pointInfo.get("CUR_POINT")));
				}
				
				// 해당 이벤트의 포인트 적립 및 차감 유무(내역이 있다면 이미 참가한 사용자..포인트 체크를 하지 않으며 적립하지 않는다.)
				int intEvtMstPointUseYN	= this.mEventService.selectEvtPointUseYN(commandMap);
				
				if(intEvtMstPointUseYN == 0){
					// 포인트사용 
					if("Y".equals(strEvtMstPitYN)){
						// 차감  일 경우 사용자의 포인트가 차감보다 같거나 많아야 한다. 
						if("A".equals(strEvtMstPitGbn) && userPoint >= intEvtMstPit){		
							pass	= true;
						}else if("Y".equals(strEvtMstPitGbn)){
							pass	= true;
						}else{
							pass	= false;
						}
					}
				}
				
				json.addObject("popup", false);
				
				if("end".equals(strIngType)){
					strResultMsg		= "이미 종료된 이벤트 입니다.";
				}else{
					if(("1".equals(strEvtMstMemGbn) && "682".equals(memGbn)) || ("1961".equals(memGbn) && "2".equals(strEvtMstMemGbn)) || ("0".equals(strEvtMstMemGbn) && !"683".equals(memGbn))){
						
						if(pass){
							if("N".equals(strOverlap)){
								int total		= 0;
								
								// 일반형(응모형)
								if("708".equals(strEvtType)){
									total		= this.mEventService.selectEventEntryCount(commandMap);
								// 설문형
								}else if("713".equals(strEvtType)){
									total		= this.mEventService.selectEventSurveyCount(commandMap);
								// 덧글형
								}else if("710".equals(strEvtType)){		 
									total		= this.mEventService.selectEventCommentCount(commandMap);
								// 이미지형 
								}else if("1842".equals(strEvtType)){
									total		= this.mEventService.selectEventImageListCount(commandMap);
								}
								
								if(total > 0){
									strResultMsg	= "이미 응모하셨습니다.";
								}else{
									bSucces			= true;
								}
							}else{
								bSucces				= true;
							}
			
							if(bSucces){
								// 일반형(응모형)
								if("708".equals(strEvtType)){
									this.mEventService.insertEventEntry(commandMap);
								// 설문형
								}else if("713".equals(strEvtType)){
									this.mEventService.insertEventSurvey(commandMap);
								// 덧글형
								}else if("710".equals(strEvtType)){		 
									this.mEventService.insertEventComment(commandMap);
								// 이미지형 
								}else if("1842".equals(strEvtType)){
									// 이미지형은 팝업 띄움.
									json.addObject("popup", true);
								}
								
								commandMap.put("PIT_MST_BRK_DWN", "2762");		// 이벤트 적립 코드 
								commandMap.put("PIT_MST_PIT", intEvtMstPit);
								
								commandMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
						        commandMap.put("PIT_MST_REG_ID", user.getMEM_MST_MEM_ID());
						        
						        commandMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
						        commandMap.put("MEM_PIT_REG_ID", user.getMEM_MST_MEM_ID());
						        
						        commandMap.put("MEM_PIT_MEM_ID", user.getMEM_MST_MEM_ID());
						        
								if(!"1842".equals(strEvtType)){
									if(intEvtMstPointUseYN == 0){
										// 포인트 사용 처리 (적립/차감)
										if("Y".equals(strEvtMstPitYN)){
											
											int iCnt	= this.mEventService.selectEvnetPointCount(commandMap);
											
											if(iCnt == 0){
												if("A".equals(strEvtMstPitGbn)){		// 차감		
													commandMap.put("PIT_MST_GBN", "M");		// 차감 코드
													this.mEventService.insertPoint(request, commandMap);
													
												}else if("Y".equals(strEvtMstPitGbn)){	// 적립
													commandMap.put("PIT_MST_GBN", "P");		// 적립 코드 
													this.mEventService.insertPoint(request, commandMap);
												}
											}
										}
									}
								
									strResultMsg		= "이벤트 응모가 완료되었습니다.\n이벤트 마감 후 고객센터>당첨자발표에서 당첨 여부를 확인해주세요";
								}
							}
						}else{
							strResultMsg		= "응모하실 수 없습니다.\n1:1문의를 통해 문의하세요."; 
						}
					}else{
						strResultMsg			= "응모 대상이 아닙니다.";
					}
				}
			}else{
				strResultMsg			= "로그인 후 이벤트 참여가 가능합니다.";
			}
		}
		
		json.addObject("loginChk" , commandMap.get("MEM_LOGIN_YN"));
		json.addObject("bSucces", bSucces);
		json.addObject("resultMsg", strResultMsg);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventCommetnListAjax
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 댓글 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventCommetnListAjax")
	public JSON eventCommetnListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json				= new JSON();
		
		commandMap.put("pageSize", 			"20");
		commandMap.put("CMM_FLE_TB_TYPE", 	"M");
		
		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
      	if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int iCommCount				= this.mEventService.selectEventCommentCount(commandMap);
		Paging paging				= new Paging(iCommCount, commandMap);
		
		json.addObject("iCommCount", 		iCommCount);
		
		if(iCommCount > 0){
			List commList			= this.mEventService.selectEventCommentList(commandMap);
			
			json.addObject("commList", 					commList);
			
			json.addObject("firstpageno", 				paging.getFirstPageNo());
			json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
			json.addObject("totalPageCount",  			paging.getTotalPageCount());
			json.addObject("lastPageNoOnPageList", 		paging.getLastPageNoOnPageList());	
			json.addObject("cPage", 					paging.getcPage());
			json.addObject("lastPageNo", 				paging.getLastPageNo());
			json.addObject("pageSize",  				paging.getPageSize());
			json.addObject("pagingSize", 				paging.getPagingSize());
			json.addObject("listNum",					paging.getListNum());
			json.addObject("totalRecordCount",			paging.getTotalRecordCount());
			json.addObject("MEM_MST_MEM_ID",			commandMap.get("MEM_MST_MEM_ID"));
		}
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventCommetnDelAjax
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 댓글 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventCommentDelAjax")
	public JSON eventCommentDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json				= new JSON();
		
		String strResultMsg		= "";
		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			Map info			= this.mEventService.selectEventInfo(commandMap);
			
			if(info != null){
				
				String strIngType		= (String) info.get("EVT_ING_YN");
				
				if("ing".equals(strIngType)){
					
					int iResult			= this.mEventService.deleteEventComment(commandMap);
					
					if(iResult > 0){
						strResultMsg	= "삭제 되었습니다.";
					}else{
						strResultMsg	= "실패했습니다.";
					}
					
					json.addObject("result", iResult);
				}else{
					strResultMsg	= " 이벤트 기간에만 삭제가 가능합니다.";
					json.addObject("result", 0);
				}
			}else{
				strResultMsg =  " 잘못된 정근입니다.. 1:1 문의 게시판을 통해 관라자에게 문의 해 주세요.";
				json.addObject("result", 0);
			}
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			strResultMsg		= "로그인 후 이용 가능합니다.";
		}
		
		json.put("resultMsg", strResultMsg);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventImageDelAjax
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 이미지 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventImageDelAjax")
	public JSON eventImageDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json				= new JSON();
		
		String strResultMsg		= "";
		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			Map info			= this.mEventService.selectEventInfo(commandMap);
			
			if(info != null){
				
				String strIngType		= (String) info.get("EVT_ING_YN");
				
				if("ing".equals(strIngType)){
					int iResult			= this.mEventService.deleteEventImage(commandMap);
				
					if(iResult > 0){
						strResultMsg	= "삭제 되었습니다.";
					}else{
						strResultMsg	= "실패했습니다.";
					}
					
					json.addObject("result", iResult);
				}else{
					strResultMsg	= "이벤트 기간에만 삭제가 가능합니다.";
					json.addObject("result", 0);
				}
			}else{
				strResultMsg = "잘못된 정근입니다.. 1:1 문의 게시판을 통해 관라자에게 문의 해 주세요.";
				json.addObject("result", 0);
			}
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			strResultMsg		= "로그인 후 이용 가능합니다.";
		}
		
		json.put("resultMsg", strResultMsg);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventImageRecommAjax
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 이미지 추천 처리  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventImageRecommAjax")
	public JSON eventImageRecommAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		
		boolean bSuccess	= false;
		
		String strResultMsg	= "";
		
		if("".equals(StringUtil.getString(commandMap.get("EVT_IMG_IDX")))){
			strResultMsg		= "잘못된 접근입니다";
		}else{
			
			if(true){
				commandMap.put("MEM_MST_MEM_ID", "etland1");
				commandMap.put("MEM_LOGIN_YN", "Y");
				commandMap.put("EVT_REG_IP", request.getRemoteAddr());
			}else{
				commandMap.put("MEM_LOGIN_YN", "N");
			}
			
			if("Y".equals(commandMap.get("MEM_LOGIN_YN"))){
				int total			= this.mEventService.selectEventImageRcmCount(commandMap);
				
				if(total > 0){
					strResultMsg	= "이미 추천하신 이미지입니다.";
				}else{
					int iResult	= this.mEventService.insertEventImageRcm(commandMap);
					
					if(iResult > 0){
						this.mEventService.updateEventImageRemCnt(commandMap);
						
						strResultMsg		= "추천했습니다.";
						bSuccess			= true;
					}else{
						strResultMsg		= "추천에 실패 했습니다.";
					}
				}
			}else{
				strResultMsg		= "로그인 후 추천 가능합니다.";
			}
			
		}
		
		json.addObject("succss", bSuccess);
		json.addObject("resultMsg", strResultMsg);
		
		return json;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventImageView
	 * 2. ClassName : EventController.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 이미지형 > 이미지 상세 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/eventImgView")
	public ModelAndView eventImageView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		commandMap.put("EVT_MST_MB_YN", "M");
		
		Map info				= this.mEventService.selectEventImageInfo(commandMap);
		
		mv.addObject("info", info);
		mv.addObject("commandMap", commandMap);
		
		mv.setViewName("/mobile/event/eventImgView");
		
		return mv;
	}
}
