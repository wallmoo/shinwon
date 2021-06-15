package com.market.mall.mobile.kinger.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.mobile.kinger.service.KingerService;
import com.market.mall.model.Paging;
import com.market.mall.model.User;

@Controller("mKingerController")
public class KingerController {

	@Resource(name="mKingerService")
	private KingerService mKingerService;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerMain
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger main 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerMain")
	public ModelAndView kingerMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv	= new ModelAndView();
		 
		 // 탑에 들어갈 킹저 정보
		 Map info			= this.mKingerService.getPcKingerIngInfo(commandMap);
		 mv.addObject("info", 				info);
		 
		 commandMap.put("NOT_EXP_MST_CD", 	info.get("EXP_MST_CD"));
		 commandMap.put("pageSize", 		"20");
		 
		 int totalCount 	= this.mKingerService.selectKingerListCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap); 
		 mv.addObject("paging", 			paging);
		 mv.addObject("commandMap",			commandMap);
		 
		 if(totalCount>0){
			 // 목록
			 mv.addObject("list", 			this.mKingerService.selectKingerList(commandMap));
	     }
		 
		 mv.setViewName("mobile/kinger/kingerMain");
		 return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerView
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger 상세  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerView")
	public ModelAndView kingerView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv		= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			commandMap.put("MYREVIEW", "");
			commandMap.put("MYASK", "");
			commandMap.put("REV", "");
		}
		
		String cPage			= StringUtil.getString(commandMap.get("cPage"));		 
		commandMap.put("page", cPage);
		
		Map info				= this.mKingerService.selectKingerViewInfo(commandMap);
			
		if(info != null){
			commandMap.put("pageSize", 10);
		
			Map reqInfo				= this.mKingerService.selectKingerReqInfo(commandMap);
			Map reviewInfo			= this.mKingerService.selectKingerReviewInfo(commandMap);
			
			int iMyReqCnt			= this.mKingerService.selectKingerMyReqCnt(commandMap);
			int iMyRevCnt			= this.mKingerService.selectKingerMyRevCnt(commandMap);
			 
			mv.addObject("info",			info);
			mv.addObject("reqList",			reqInfo.get("reqList"));
			mv.addObject("reqPaging",		reqInfo.get("reqPaging"));
			mv.addObject("reviewList",		reviewInfo.get("reviewList"));
			mv.addObject("reviewPaging",	reviewInfo.get("reviewPaging"));
			mv.addObject("iMyReqCnt", 		iMyReqCnt);
			mv.addObject("iMyRevCnt",		iMyRevCnt);
			mv.addObject("commandMap",		commandMap);
	 
			mv.setViewName("mobile/kinger/kingerView");
		}else{
			 mv.addObject("alertMsg", "종료된 이벤트입니다.");
			 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/pc/marketing/kingerMain.do");
		     mv.setViewName("mobile/common/result");
		}
 
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerListAjax
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerListAjax")
	public JSON kingerListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json 		= new JSON();
		
		commandMap.put("NOT_EXP_MST_CD", 	commandMap.get("EXP_MST_CD"));
		
		int totalCount 	= this.mKingerService.selectKingerListCount(commandMap);
		Paging paging 	= new Paging(totalCount, commandMap);
		 
		json.addObject("commandMap",		commandMap);
		 
		if(totalCount>0){
			 // 목록
			 json.addObject("list", 					this.mKingerService.selectKingerList(commandMap));
			 json.addObject("firstpageno", 				paging.getFirstPageNo());
			 json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
			 json.addObject("totalPageCount",  			paging.getTotalPageCount());
			 json.addObject("lastPageNoOnPageList", 	paging.getLastPageNoOnPageList());	
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
	 * 1. MethodName : kingerReqAjax
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger 신청 등록 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerReqAjax")
	public JSON kingerReqAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json 			= new JSON();
	 
		String strResultMsg					= "";
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request)){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			strResultMsg	= this.mKingerService.insertKigerReq(request, commandMap);
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			strResultMsg	= "로그인 후 글을 남길 수 있습니다.";
		}
 
		json.addObject("resultMsg", strResultMsg);
	 
		return json;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerReqListAjax
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger 신청글 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/reqListAjax")
	public JSON reqListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json			= new JSON();
		
		commandMap.put("pageSize", 10);
		
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request)){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map reqInfo				= this.mKingerService.selectKingerReqInfo(commandMap);
		Paging paging			= (Paging) reqInfo.get("reqPaging");
		
		json.addObject("list",						reqInfo.get("reqList"));
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
		
		
		return json;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerReviewListAjax
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger 리뷰 글  리스트 ajax 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/reviewListAjax")
	public JSON reviewListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json			= new JSON();
		
		commandMap.put("pageSize", 10);
		
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request)){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map reviewInfo			= this.mKingerService.selectKingerReviewInfo(commandMap);
		Paging paging			= (Paging) reviewInfo.get("reviewPaging");
		
		json.addObject("list",						reviewInfo.get("reviewList"));
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
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerReqDelAjax
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger 신청 글 삭제 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerReqDelAjax")
	public JSON kingerReqDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		 
		String strResultMsg					= "";
		
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			strResultMsg	= this.mKingerService.deleteKigerReq(request, commandMap);
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			strResultMsg	= "로그인 후 글을 삭제 할  있습니다.";
		}
		 
		json.addObject("resultMsg", strResultMsg);
		 
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerReviewDelAjax
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger 리뷰 글 삭제 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerReviewDelAjax")
	public JSON kingerReviewDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		 
		String strResultMsg					= "";
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request)){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			strResultMsg	= this.mKingerService.deleteKigerReview(request, commandMap);
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			strResultMsg	= "로그인 후 글을 삭제 할  있습니다.";
		}
		 
		json.addObject("resultMsg", strResultMsg);
		 
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerWinList
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger 당첨자 발표
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerWinList")
	public ModelAndView kingerWinList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv				= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int totalCount				= this.mKingerService.selectKingerWinListCount(commandMap);
		
		commandMap.put("pageSize", 4);
		Paging paging 				= new Paging(totalCount, commandMap);
		
		List<Map<String, Object>> list = null;
		
        mv.addObject("paging", paging );
        
        if (totalCount > 0){
        	list					= this.mKingerService.selectKingerWinList(commandMap);
        }

        mv.addObject("list", list);
        mv.addObject("commandMap",			commandMap);
		mv.setViewName("mobile/kinger/kingerWinList");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerWinView
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger > 당첨자 상세
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerWinView")
	public ModelAndView kingerWinView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv				= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map info					= this.mKingerService.selectKingerWinView(commandMap);
		List list					= this.mKingerService.selectKingerWinerList(commandMap);
		
		mv.setViewName("mobile/kinger/kingerWinView");
		
		mv.addObject("info", info);
		mv.addObject("list", list);
		mv.addObject("commandMap",			commandMap);
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getKingerWinerSearchAjax
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > kinger > 당첨자 검색
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerWinerSearchAjax")
    public JSON getKingerWinerSearchAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	JSON json = new JSON();
    	
    	User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
    	List<Map<String, Object>> list		= this.mKingerService.selectKingerWinerSearchList(commandMap);
    	
    	String strResultMsg					= "";
    	
    	if(list.size() > 0){
    		strResultMsg			= "축하합니다.\nKINGER 당첨되셨습니다.";
//    		for(int i=0; i < list.size(); i++){
//    			HashMap row					= (HashMap) list.get(i);
    			
//    			if(i == 0){
//    				strResultMsg			= "축하합니다.\n"+ row.get("WIN_INF_MEM_NM") + "KINGER 당첨되셨습니다.";
//    			}else{
//    				strResultMsg			+= "\n"+ row.get("WIN_INF_MEM_NM") + "님은 [" + row.get("WIN_INF_NM") + "]에 당첨되셨습니다.";
//    			}
//    		}
    	}else{
    		strResultMsg					= "아쉽지만\n당첨되지 않았습니다. 다음 KINGER에 참여해주세요.";
    	}
    	
    	json.addObject("strResultMsg", strResultMsg);
    	
    	return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerMissionInfo
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > 킹저 > 응모자 정보 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerMissionInfo")
	public ModelAndView kingerMissionInfo(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv	= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		commandMap.put("EXP_ETR_WIN_YN", "Y");
		Map info		= this.mKingerService.selectKingerMissionInfo(commandMap);
		int icnt		= this.mKingerService.selectKingerMissionInfoCnt(commandMap);
		
		mv.addObject("info", info);
		mv.addObject("icnt", icnt);
		mv.addObject("commandMap",			commandMap);
		mv.setViewName("mobile/kinger/kingerMissionInfo");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerConsentPopUp
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > 킹저 > 동의서 제출 팝업
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/popup/kingerConsentPopUp")
	public ModelAndView kingerConsentPopUp(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv	= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		mv.addObject("commandMap",			commandMap);
		mv.setViewName("mobile/kinger/popup/kingerConsentPopUp");
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerConsentSendAjax
	 * 2. ClassName : KingerController.java
	 * 3. Comment : 모바일 > 고객체험단 > 킹저 > 동의서 제출하기 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/kinger/kingerConsentSendAjax")
	public JSON kingerConsentSendAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json 			= new JSON();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int iResult			= this.mKingerService.updateKingerConsntSend(commandMap);
		String strResultMsg	= "";
		
		if(iResult > 0){
			strResultMsg = "제출되었습니다.";
		}else{
			strResultMsg = "실패했습니다.";
		}
		json.addObject("strResultMsg", strResultMsg);
		
		return json;
	}
	
	/**
	  * 
	  * <pre>
	  * 1. MethodName : kingerRevView
	  * 2. ClassName : PcKingerController.java
	  * 3. Comment : 고객체험단 > 킹저 > 리뷰 상세 
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 3. 29.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	@RequestMapping("/mobile/kinger/kingerRevView")	
	public ModelAndView kingerRevView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv				= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map info 					= this.mKingerService.selectKingerRevView(commandMap);
		
		mv.addObject("info", 		info);
		mv.addObject("commandMap", 	commandMap);
		mv.setViewName("mobile/kinger/kingerRevView");
		
		return mv;
	}
}
