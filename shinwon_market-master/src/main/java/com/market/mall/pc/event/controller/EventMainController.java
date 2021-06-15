package com.market.mall.pc.event.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.marketing.service.PointService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.SessionsUser;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.event.service.BenefitService;
import com.market.mall.pc.event.service.EventMainService;

import sun.swing.StringUIClientPropertyKey;

@Controller("pcEventMainController")
public class EventMainController {

	@Resource(name="pcEventMainService")
	private EventMainService pcEventMainService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="cartService") 
	private CartService cartService;

	@Resource(name="benefitService")
	private BenefitService benefitService;

	@Resource(name="pointService")
    private PointService pointService;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventMain
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 메인  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 20.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
    @RequestMapping("/pc/event/eventMain")
    public ModelAndView eventMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	ModelAndView mv				= new ModelAndView();
    	
    	commandMap.put("CMM_FLE_TB_TYPE", "P");
    	commandMap.put("whereType", "ing");

    	int totalCount = this.pcEventMainService.selectEventListCount(commandMap);
    	
		if(totalCount > 0){
			commandMap.put("startNum", 1);
			commandMap.put("endNum", 2);
			
			List<Map<String, Object>> eveList = this.pcEventMainService.selectEventList(commandMap);
			
			mv.addObject("eveList", eveList);
		}
		
		commandMap.put("endNum", 3);
		
		// 상단 프로모션
		commandMap.put("CMN_COM_IDX", "1272");
		List<Map<String, Object>> top = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("top", top);
		
		commandMap.put("endNum", 1);
		// 이달의 카드 헤택 
		commandMap.put("CMN_COM_IDX", "1273");
		List<Map<String, Object>> month = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("month", month);
		
		// 최근 이벤트 
		commandMap.put("endNum", 2);
		commandMap.put("CMN_COM_IDX", "1275");
		List<Map<String, Object>> late = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("late", late);
		mv.addObject("lateSize", late.size());
		
		commandMap.put("endNum", 1);
		// 기타혜택 왼쪽배터
		commandMap.put("CMN_COM_IDX", "1292");
		List<Map<String, Object>> left = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("left", left);
		
		// 기타혜택 중앙배너
		commandMap.put("CMN_COM_IDX", "1293");
		List<Map<String, Object>> mid = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("mid", mid);
		
		// 기타혜택 오른쪽배너
		commandMap.put("CMN_COM_IDX", "1294");
		List<Map<String, Object>> right = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("right", right);

		// 마일리지 
		commandMap.put("CMN_COM_IDX", "1286");
		List<Map<String, Object>> mileage = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("mileage", mileage);
		
		// 혜택 1 배너
		commandMap.put("CMN_COM_IDX", "1287");
		List<Map<String, Object>> benefit1 = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("benefit1", benefit1);
		
		// 혜택 2 배너
		commandMap.put("CMN_COM_IDX", "1288");
		List<Map<String, Object>> benefit2 = this.benefitService.selectCardBannerList(commandMap);
		mv.addObject("benefit2", benefit2);
		
		mv.addObject("commandMap", commandMap);
    	mv.setViewName("pc/event/eventMain");
    	
    	return mv;
    }
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventList
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 21.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	/**
	 * @api {POST} /pc/event/eventList.do
	 * @apiName EVENT 목록 화면
	 * @apiGroup EVENT
	 *
	 * @apiParam {String} whereType : (진행중:ing / 종료:end / 당첨자발표:win)
	 *
	 * @apiSuccess {Object[]} bannerList 이벤트 상단 배너   [{IMG_THUMBNAIL : 썸네일 이미지, CMN_FLE_ALT_TXT = 대체텍스트, BNR_MST_TITLE:제목, BNR_MST_URL:URL}]
	 * @apiSuccess {Object[]} EVT_ING_LIST 진행중 이벤트 리스트  [{TAG_MST_TITLE=태그타이틀, EVT_MST_ST_DT=20200123, EVT_MST_TITLE=test, EVT_MST_ST_DT_CHAR=2020.01.23, EVT_MST_TYPE=2929, RNUM=1, EVT_MST_IDX=353, EVT_MST_ED_DT_CHAR=2020.01.30, EVT_MST_PRE_WIN=5, EVT_MST_ED_DT=20200130, EVT_MST_USE_YN=Y, EVT_MST_MB_YN=Y, FILE_NM=/attach/marketing/2020/01/23/99e6df4d-a644-4f69-bdef-66d4e9d7013a.png, EVT_MST_PC_YN=Y, EVT_MST_LET_PLY_YN=N, EVT_WIN_USE_YN=0}]
	 * @apiSuccess {Object[]} EVT_END_LIST 종료 이벤트 리스트 [{TAG_MST_TITLE=태그타이틀, EVT_MST_ST_DT=20200123, EVT_MST_TITLE=test, EVT_MST_ST_DT_CHAR=2020.01.23, EVT_MST_TYPE=2929, RNUM=1, EVT_MST_IDX=353, EVT_MST_ED_DT_CHAR=2020.01.30, EVT_MST_PRE_WIN=5, EVT_MST_ED_DT=20200130, EVT_MST_USE_YN=Y, EVT_MST_MB_YN=Y, FILE_NM=/attach/marketing/2020/01/23/99e6df4d-a644-4f69-bdef-66d4e9d7013a.png, EVT_MST_PC_YN=Y, EVT_MST_LET_PLY_YN=N, EVT_WIN_USE_YN=0}]
	 * @apiSuccess {Object[]} EVT_WIN_LIST 당첨자 발표 리스트
	 */
	@RequestMapping("/pc/event/eventList")
	public ModelAndView eventList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv				= new ModelAndView();
		
		
		commandMap.put("CMN_COM_IDX", 0);
		commandMap.put("BNR_MST_ENV", "P");
		List<Map<String, Object>> bannerList = this.pcEventMainService.selectEventBannerList(commandMap);
		
		mv.addObject("BannerList", bannerList);
	
		mv.setViewName("/pc/event/eventList");
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventListAjax
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 21.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/eventListAjax")
	public JSON eventListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json 			= new JSON();
		
		
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "16"));
        
        commandMap.put("startNum", offset); 
        commandMap.put("endNum", offset + pageSize - 1); 
        
        commandMap.put("CMM_FLE_TB_TYPE", "P");
        
        List<Map<String, Object>> list = this.pcEventMainService.selectEventList(commandMap);

        json.put("list", list);
        
        return json;
        
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventView
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 상세  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 21.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/eventView")
	public ModelAndView eventView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv	= new ModelAndView();

		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
      	}else{
      		commandMap.put("MEM_LOGIN_YN", "N");
      	}
		
		if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""))){
			
			commandMap.put("CMM_FLE_TB_TYPE", "P");
			
			Map<String, Object> info			= this.pcEventMainService.selectEventInfo(commandMap);
			List<Map<String, Object>> imgList = this.pcEventMainService.selectImageAllList(commandMap);
			List<Map<String, Object>> prdList = this.pcEventMainService.selectEventAllProductList(commandMap);
			
			mv.addObject("info", info);
			mv.addObject("imgList", imgList);
			mv.addObject("prdList", prdList);
			
			if(info != null ){
				
				int strEvtType = Integer.parseInt(StringUtil.getString(info.get("EVT_MST_TYPE"), "0"));
				String strIngType = (String) info.get("EVT_STATUS");

				switch (strEvtType) {
					case Code.EVENT_MASTER_TYPE_GUIDE: // 안내
						mv.setViewName("/pc/event/eventGuid");
						break;
						
					case Code.EVENT_MASTER_TYPE_LUCKYDRAW: // 럭키드로우
						mv.setViewName("/pc/event/eventLuckyDraw");
						break;
						
					case Code.EVENT_MASTER_TYPE_RANDOM: // 랜덤쿠폰
						mv.setViewName("/pc/event/eventRandom");
						break;
				
					case Code.EVENT_MASTER_TYPE_ROULETTE: // 룰렛
						mv.setViewName("/pc/event/eventRoulette");
						break;
						
					case Code.EVENT_MASTER_TYPE_QUIZ: // 퀴즈
						mv.setViewName("/pc/event/eventQuiz");
						break;
						
					case Code.EVENT_MASTER_TYPE_ATTENDANCE: // 츨석체크
						mv.setViewName("/pc/event/eventCheck");
						break;
						
					case Code.EVENT_MASTER_TYPE_GROUPBUY: // 공동구매
						mv.setViewName("/pc/event/eventGroupBuying");
						break;
						
					case Code.EVENT_MASTER_TYPE_VOTE: // 투표
						mv.setViewName("/pc/event/eventVote");
						break;	
					default:
						
						break;
				}

				/*
				// 일반형(응모형)
				if("708".equals(strEvtType)){
					mv.setViewName("/pc/event/eventView");
				// 설문형
				}else if("713".equals(strEvtType)){
					mv.setViewName("/pc/event/eventSurvey");
					List surveyList				= this.pcEventMainService.selectEventyDtlList(commandMap);
					mv.addObject("surveyList", surveyList);
				// 덧글형
				}else if("710".equals(strEvtType)){		 
					mv.setViewName("/pc/event/eventComment");
					
					commandMap.put("pageSize", "10");
					
					int iCommCount				= this.pcEventMainService.selectEventCommentCount(commandMap);
					Paging paging				= new Paging(iCommCount, commandMap);
					
					mv.addObject("paging", paging);
					
					if(iCommCount > 0){
						List commList			= this.pcEventMainService.selectEventCommentList(commandMap);
						mv.addObject("commList", commList);
					}
					
					mv.addObject("iCommCount", iCommCount);
					
				// 이미지형 
				}else if("1842".equals(strEvtType)){
					mv.setViewName("/pc/event/eventImage");
					
					int imgListCount			= this.pcEventMainService.selectEventImageListCount(commandMap);
					List imgList				= this.pcEventMainService.selectEventImageList(commandMap);
					
					commandMap.put("orderType", "top");
					int bestListCount			= this.pcEventMainService.selectEventImageListCount(commandMap);
					
					if(bestListCount > 5){
						bestListCount 			= 5;
					}
					
					commandMap.put("startNum", 			1);
					commandMap.put("endNum", 			bestListCount);
					
					List bestList				= this.pcEventMainService.selectEventImageList(commandMap);
					
					mv.addObject("imgList", imgList);
					mv.addObject("bestList", bestList);
					mv.addObject("imgListCount", imgListCount);
					mv.addObject("bestListCount", bestListCount);
				}else if("2929".equals(strIngType)){
					mv.setViewName("/pc/event/eventBoardView");
				}
				*/

			}
		} else {
			mv.addObject("alertMsg", "종료된 이벤트입니다.");
        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/event/eventList.do");
        	mv.setViewName("pc/common/result");
		}
		

		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	

    @RequestMapping("/pc/event/eventLuckyDraw")
    public ModelAndView eventLuckyDraw (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();
        User user = SessionsUser.getSessionUser(request);

        commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        
        String alertMsg = "응모에 실패했습니다.";
        if(StringUtils.isEmpty(user.getMEM_MST_MEM_ID())) {
        	alertMsg = "로그인을 하셔야 응모가 가능합니다.";
        } else {
        	
        	Map<String, Object> info = this.pcEventMainService.selectEventInfo(commandMap);
        	int strEvtType = Integer.parseInt(StringUtil.getString(info.get("EVT_MST_TYPE"), "0"));
        	String strIngType = (String) info.get("EVT_STATUS");

        	int totCount = this.pcEventMainService.selectEventEntryCount(commandMap);
        	if(totCount > 0) {
        		alertMsg = "이미 응모를 하셨습니다.";
        	} else if (strEvtType != Code.EVENT_MASTER_TYPE_LUCKYDRAW) {
        		alertMsg = "잘못된 경로로 접근하셨습니다.";
        	} else if (strIngType != "ing") {
        		alertMsg = "진행중인 이벤트가 아닙니다.";
        	} else {
        	
        		commandMap.put("EVT_ETR_WIN_YN", "N");
        		commandMap.put("EVT_ETR_REG_IP", request.getRemoteAddr());
        		commandMap.put("EVT_ETR_CHN_TYPE", Code.USER_ENV_TYPE_PC);
        		
        		if(this.pcEventMainService.insertEventEntry(commandMap) > 0) {
        			alertMsg = "응모에 성공했습니다.";
        		}  	
        	}
        }

        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/pc/event/eventView.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");
        
        return mv;
    }

    
    /**
     * @api {GET} /pc/event/eventRandom.do
     * @apiName 랜덤쿠폰이벤트
     * @apiGroup EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/event/eventRandom")
    public ModelAndView eventRandom (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /pc/event/eventRoulette.do
     * @apiName 룰렛이벤트
     * @apiGroup EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/event/eventRoulette")
    public ModelAndView eventRoulette (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /pc/event/eventQuiz.do
     * @apiName 퀴즈이벤트
     * @apiGroup EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/event/eventQuiz")
    public ModelAndView eventQuiz (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /pc/event/eventGuid.do
     * @apiName 안내 이벤트
     * @apiGroup EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/event/eventGuid")
    public ModelAndView eventGuid (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /pc/event/eventCheck.do
     * @apiName 출석체크 이벤트
     * @apiGroup EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/event/eventCheck")
    public ModelAndView eventCheck (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /pc/event/eventGroupBuying.do
     * @apiName 공동구매 이벤트
     * @apiGroup EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/event/eventGroupBuying")
    public ModelAndView eventGroupBuying (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /pc/event/eventVote.do
     * @apiName 투표 이벤트
     * @apiGroup EVENT
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/event/eventVote")
    public ModelAndView eventVote (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventEntryAjax
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 응모 처리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 22.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/eventEntryAjax")
	public JSON eventEntryAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json				= new JSON();
		
		String strResultMsg		= "";
		
		boolean bSucces			= false;
		boolean pass			= true;			 	
		
		Map info				= this.pcEventMainService.selectEventInfo(commandMap);
		
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
				commandMap.put("CMM_FLE_TB_TYPE", "P");
				
				Map<String, Object> userInfo 	= this.cartService.selectUserInfo(commandMap);
				commandMap.put("MEM_PIT_MEM_ID", user.getMEM_MST_MEM_ID());
				Map<String, Object> pointInfo	= this.pointService.selectMemberPointSum(commandMap);
				
				String memGbn		= userInfo.get("MEM_MST_MEM_GBN").toString();				// 682: 일반회원 , 683:기업회원, 1961:간편회원
				int userPoint		= 0;
				
				if(pointInfo != null){
					userPoint = Integer.parseInt(String.valueOf(pointInfo.get("CUR_POINT")));
				}
				
				// 해당 이벤트의 크라운 적립 및 차감 유무(내역이 있다면 이미 참가한 사용자..포인트 체크를 하지 않으며 적립하지 않는다.)
				int intEvtMstPointUseYN	= this.pcEventMainService.selectEvtPointUseYN(commandMap);
				
				if(intEvtMstPointUseYN == 0){
					// 크라운사용 
					if("Y".equals(strEvtMstPitYN)){
						// 차감  일 경우 사용자의 크라운이 차감보다 같거나 많아야 한다. 
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
					strResultMsg		= "종료된 이벤트입니다.";
				}else{
					if(("1".equals(strEvtMstMemGbn) && "682".equals(memGbn)) || ("1961".equals(memGbn) && "2".equals(strEvtMstMemGbn)) || ("0".equals(strEvtMstMemGbn) && !"683".equals(memGbn))){
					
						if(pass){
							
							if("N".equals(strOverlap)){
								int total		= 0;
								
								//commandMap.put("WIN_YN", "Y");
								//commandMap.put("MY", "Y");
								
								// 일반형(응모형)
								if("708".equals(strEvtType)){
									total		= this.pcEventMainService.selectEventEntryCount(commandMap);
								// 설문형
								}else if("713".equals(strEvtType)){
									total		= this.pcEventMainService.selectEventSurveyCount(commandMap);
								// 덧글형
								}else if("710".equals(strEvtType)){		 
									total		= this.pcEventMainService.selectEventCommentCount(commandMap);
								// 이미지형 
								}else if("1842".equals(strEvtType)){
									total		= this.pcEventMainService.selectEventImageListCount(commandMap);
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
									this.pcEventMainService.insertEventEntry(commandMap);
								// 설문형
								}else if("713".equals(strEvtType)){
									this.pcEventMainService.insertEventSurvey(commandMap);
								// 덧글형
								}else if("710".equals(strEvtType)){		 
									this.pcEventMainService.insertEventComment(commandMap);
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
											
											int iCnt	= this.pcEventMainService.selectEvnetPointCount(commandMap);
											
											if(iCnt == 0){
												if("A".equals(strEvtMstPitGbn)){		// 차감		
													commandMap.put("PIT_MST_GBN", "M");		// 차감 코드
													this.pcEventMainService.insertPoint(request, commandMap);
													
												}else if("Y".equals(strEvtMstPitGbn)){	// 적립
													commandMap.put("PIT_MST_GBN", "P");		// 적립 코드 
													this.pcEventMainService.insertPoint(request, commandMap);
												}
											}
										}
									}
									
									strResultMsg		= "이벤트 응모가 완료되었습니다.\n이벤트 마감 후 고객센터>당첨자발표에서 당첨 여부를 확인해주세요";
								}
							}
						}else{
							strResultMsg		= "크라운이 부족하여 참여하실 수 없습니다."; 
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
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 댓글 리스트 ajax 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 25.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/eventCommetnListAjax")
	public JSON eventCommetnListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json				= new JSON();
		
		commandMap.put("pageSize", 			"10");
		commandMap.put("CMM_FLE_TB_TYPE", 	"P");
		
		int iCommCount				= this.pcEventMainService.selectEventCommentCount(commandMap);
		Paging paging				= new Paging(iCommCount, commandMap);
		
		json.addObject("iCommCount", 		iCommCount);
		
		if(iCommCount > 0){
			List commList			= this.pcEventMainService.selectEventCommentList(commandMap);
			
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
		}
		
		json.addObject("totalCount", iCommCount);
		return json;
	}
	
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventImagePopUp
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 등록 팝업  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/popup/eventImagePopUp")
	public ModelAndView eventImagePopUp(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		boolean bcheck			= false; 
		String strResultMsg		= "";
		
		if("".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX")))){
			strResultMsg		= "잘못된 접근입니다";
		}else{
			
			commandMap.put("CMM_FLE_TB_TYPE", "P");
			
			Map info					= this.pcEventMainService.selectEventInfo(commandMap);
			
			if(info.size() > 0){
				
				String strEvtType		= StringUtil.getString(info.get("EVT_MST_TYPE"));
				String strIngType		= (String) info.get("EVT_ING_YN");
				String strOverlap		= (String) info.get("EVT_MST_DUP_ETR");
				
				User user = SessionsUser.getSessionUser(request);
//				
				if(SessionsUser.isLogin(request) ){
					commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
					commandMap.put("MEM_LOGIN_YN", "Y");
				}else{
					commandMap.put("MEM_LOGIN_YN", "N");
				}
				
				
				if("Y".equals(commandMap.get("MEM_LOGIN_YN"))){
					
					commandMap.put("EVT_REG_IP", request.getRemoteAddr());
					commandMap.put("CMM_FLE_TB_TYPE", "P");
					commandMap.put("MY", "Y");
					
					if("end".equals(strIngType)){
						strResultMsg		= "이미 종료된 이벤트 입니다.";
					}else{
					
						if("N".equals(strOverlap)){
							int total		= this.pcEventMainService.selectEventImageListCount(commandMap);
							
							if(total > 0){
								strResultMsg	= "이미 응모하셨습니다.";
							}else{
								bcheck			= true;
							}
						}else{
							bcheck			= true;
						}
					}
				}else{
					strResultMsg		= "로그인 후 응모 가능합니다.";
				}
			}
			mv.addObject("info", info);
		}
		
		if(bcheck){
			mv.setViewName("pc/event/popup/eventImagePopUp");
		}else{
			mv.addObject("closeMsg", strResultMsg);
			mv.setViewName("pc/marketing/popup/result");
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventImageRegist
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 응모 처리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/eventImageRegist")
	public ModelAndView eventImageRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		boolean bcheck			= false; 
		boolean pass			= true;	
		
		int intEvtMstPit		= 0;
		int intEvtMstPointUseYN	= 0;
		
		String strResultMsg		= "";
		String strEvtMstMemGbn	= "";
		String strEvtMstPitGbn	= "";
		String strEvtMstPitYN	= "";
		
		User user = SessionsUser.getSessionUser(request);
//		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		if("".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX")))){
			strResultMsg		= "잘못된 접근입니다";
		}else{
			
			commandMap.put("CMM_FLE_TB_TYPE", "P");
			
			Map info					= this.pcEventMainService.selectEventInfo(commandMap);
			
			if(info.size() > 0){
				
				String strEvtType		= StringUtil.getString(info.get("EVT_MST_TYPE"));
				String strIngType		= (String) info.get("EVT_ING_YN");
				String strOverlap		= (String) info.get("EVT_MST_DUP_ETR");
				strEvtMstMemGbn			= String.valueOf(info.get("EVT_MST_MEM_GBN"));			// 0:전체 , 1:통합 , 2:간편
				strEvtMstPitGbn			= (String) info.get("EVT_MST_PIT_GBN"); // 포인트적립차감구분
				strEvtMstPitYN			= (String) info.get("EVT_MST_PIT_YN");	// 포인트 사용 유무
				
				intEvtMstPit		= Integer.parseInt(String.valueOf(info.get("EVT_MST_PIT")));
				
				if("Y".equals(commandMap.get("MEM_LOGIN_YN"))){
					
					commandMap.put("EVT_REG_IP", request.getRemoteAddr());
					commandMap.put("CMM_FLE_TB_TYPE", "P");
					
					Map<String, Object> userInfo 	= this.cartService.selectUserInfo(commandMap);
					commandMap.put("MEM_PIT_MEM_ID", user.getMEM_MST_MEM_ID());
					Map<String, Object> pointInfo	= this.pointService.selectMemberPointSum(commandMap);
					
					String memGbn		= userInfo.get("MEM_MST_MEM_GBN").toString();				// 682: 일반회원 , 683:기업회원, 1961:간편회원
					int userPoint		= 0;
					
					if(pointInfo != null){
						userPoint = Integer.parseInt(String.valueOf(pointInfo.get("CUR_POINT")));
					}
					
					// 해당 이벤트의 크라운 적립 및 차감 유무(내역이 있다면 이미 참가한 사용자..포인트 체크를 하지 않으며 적립하지 않는다.)
					intEvtMstPointUseYN	= this.pcEventMainService.selectEvtPointUseYN(commandMap);
					
					if(intEvtMstPointUseYN == 0){
						// 크라운사용 
						if("Y".equals(strEvtMstPitYN)){
							// 차감  일 경우 사용자의 크라운이 차감보다 같거나 많아야 한다. 
							if("A".equals(strEvtMstPitGbn) && userPoint >= intEvtMstPit){		
								pass	= true;
							}else if("Y".equals(strEvtMstPitGbn)){
								pass	= true;
							}else{
								pass	= false;
							}
						}
					}
					
					if("end".equals(strIngType)){
						strResultMsg		= "이미 종료된 이벤트 입니다.";
					}else{
						
						if(("1".equals(strEvtMstMemGbn) && "682".equals(memGbn)) || ("1961".equals(memGbn) && "2".equals(strEvtMstMemGbn)) || ("0".equals(strEvtMstMemGbn) && !"683".equals(memGbn))){
							if(pass){
								if("N".equals(strOverlap)){
									int total		= this.pcEventMainService.selectEventImageListCount(commandMap);
									
									if(total > 0){
										strResultMsg	= "이미 응모하셨습니다.";
									}else{
										bcheck			= true;
									}
								}else{
									bcheck			= true;
								}
							}else{
								strResultMsg		= "응모하실 수 없습니다.\n1:1문의를 통해 문의하세요.";
							}
						}else{
							strResultMsg			= "응모 대상이 아닙니다.";
						}
					}
				}else{
					strResultMsg		= "로그인 후 응모 가능합니다.";
				}
			}
		}
		
		if(bcheck){
			int result = this.pcEventMainService.insertEventImage((MultipartHttpServletRequest)request, commandMap);
			
			if(result > 0){
				
				commandMap.put("PIT_MST_BRK_DWN", "2762");		// 이벤트 적립 코드 
				commandMap.put("PIT_MST_PIT", intEvtMstPit);
				
				commandMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
		        commandMap.put("PIT_MST_REG_ID", user.getMEM_MST_MEM_ID());
		        
		        commandMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
		        commandMap.put("MEM_PIT_REG_ID", user.getMEM_MST_MEM_ID());
		        
		        commandMap.put("MEM_PIT_MEM_ID", user.getMEM_MST_MEM_ID());
		        
		        if(intEvtMstPointUseYN == 0){
		        	
			        if("Y".equals(strEvtMstPitYN)){
						
						int iCnt	= this.pcEventMainService.selectEvnetPointCount(commandMap);
						
						if(iCnt == 0){
							if("A".equals(strEvtMstPitGbn)){		// 차감		
								commandMap.put("PIT_MST_GBN", "M");		// 차감 코드
								this.pcEventMainService.insertPoint(request, commandMap);
								
							}else if("Y".equals(strEvtMstPitGbn)){	// 적립
								commandMap.put("PIT_MST_GBN", "P");		// 적립 코드 
								this.pcEventMainService.insertPoint(request, commandMap);
							}
						}
			        }
				}
		        
				strResultMsg		= "이벤트 응모가 완료되었습니다.";
	        	mv.addObject("parentReload", "Y");
	        }else{
	        	strResultMsg		= "등록에 실패하였습니다.";
	        }
		}
		
		mv.addObject("closeMsg", strResultMsg);
		mv.setViewName("pc/marketing/popup/result");
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventImageRecommAjax
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 추천 처리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/eventImageRecommAjax")
	public JSON eventImageRecommAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		
		boolean bSuccess	= false;
		
		String strResultMsg	= "";
		
		if("".equals(StringUtil.getString(commandMap.get("EVT_IMG_IDX")))){
			strResultMsg		= "잘못된 접근입니다";
		}else{
			User user = SessionsUser.getSessionUser(request);

			if(SessionsUser.isLogin(request) ){

				commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
				commandMap.put("MEM_LOGIN_YN", "Y");
				json.addObject("loginChk", "Y");
			}else{
				commandMap.put("MEM_LOGIN_YN", "N");
				json.addObject("loginChk", "N");
			}

			if("Y".equals(commandMap.get("MEM_LOGIN_YN"))){
				
				int total			= this.pcEventMainService.selectEventImageRcmCount(commandMap);
				
				if(total > 0){
					strResultMsg	= "이미 추천하신 이미지입니다.";
				}else{
					int iResult	= this.pcEventMainService.insertEventImageRcm(commandMap);
					
					if(iResult > 0){
						this.pcEventMainService.updateEventImageRemCnt(commandMap);
						
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
	 * 1. MethodName : eventDetailImgPopUp
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 팝업 이미지 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 9.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/popup/eventDetailImgPopUp")
	public ModelAndView eventDetailImgPopUp(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		Map info					= this.pcEventMainService.selectEventDetailImg(commandMap);
		
		mv.addObject("info", info);
		mv.setViewName("pc/event/popup/eventDetailImgPopUp");
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : delEventImg
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트 팝업 이미지 > 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 10.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/delEventImg")
	public JSON delEventImg(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json			= new JSON();
		
		User user = SessionsUser.getSessionUser(request);
//		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			Map info			= this.pcEventMainService.selectEventInfo(commandMap);
			
			if(info != null){
				
				String strIngType		= (String) info.get("EVT_ING_YN");
				
				if("ing".equals(strIngType)){
					int result	= this.pcEventMainService.updateEventImgDpl(commandMap);
					
					if(result > 0){
						json.addObject("resultMsg", "삭제 되었습니다.");
					}else{
						json.addObject("resultMsg", "실패했습니다. 1:1 문의 게시판을 통해 관라자에게 문의 해 주세요.");
					}
				
					json.addObject("result", result);
				}else{
					json.addObject("resultMsg", " 이벤트 기간에만 삭제가 가능합니다.");
					json.addObject("result", 0);
				}
			}else{
				json.addObject("resultMsg", " 잘못된 정근입니다.. 1:1 문의 게시판을 통해 관라자에게 문의 해 주세요.");
				json.addObject("result", 0);
			}
			
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			json.addObject("resultMsg", "로그인이 필요합니다.");
			json.addObject("result", 0);
		}

		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : delEventRpl
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트  댓글 > 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/delEventRpl")
	public JSON delEventRpl(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		
		User user = SessionsUser.getSessionUser(request);
//		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			Map info			= this.pcEventMainService.selectEventInfo(commandMap);
			
			if(info != null){
				
				String strIngType		= (String) info.get("EVT_ING_YN");
				
				if("ing".equals(strIngType)){
					
					int result	= this.pcEventMainService.updateEventRplDpl(commandMap);
					
					if(result > 0){
						json.addObject("resultMsg", "삭제 되었습니다.");
					}else{
						json.addObject("resultMsg", "실패했습니다. 1:1 문의 게시판을 통해 관라자에게 문의 해 주세요.");
					}
					
					json.addObject("result", result);
				}else{
					json.addObject("resultMsg", " 이벤트 기간에만 삭제가 가능합니다.");
					json.addObject("result", 0);
				}
			}else{
				json.addObject("resultMsg", " 잘못된 정근입니다.. 1:1 문의 게시판을 통해 관라자에게 문의 해 주세요.");
				json.addObject("result", 0);
			}
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			json.addObject("resultMsg", "로그인이 필요합니다.");
			json.addObject("result", 0);
		}
		
		return json;
	}
	
	
}
