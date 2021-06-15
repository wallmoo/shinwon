package com.market.mall.pc.marketing.controller;

import java.util.HashMap;
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
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.marketing.service.PcKingerService;

@Controller
public class PcKingerController {

	 @Resource(name="pcKingerService")
	 private PcKingerService pcKingerService;
	
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : kingerMain
	  * 2. ClassName : PcKingerController.java
	  * 3. Comment : 고객체험단 > 킹저 메인 
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 13.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/marketing/kingerMain")
	 public ModelAndView kingerMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
		 }else{
			 commandMap.put("MEM_LOGIN_YN", "N");
		 }
		
		 // 탑에 들어갈 킹저 정보
		 Map info			= this.pcKingerService.getPcKingerIngInfo(commandMap);
		 mv.addObject("info", 				info);
		 
		 if(info != null){
			 commandMap.put("NOT_EXP_MST_CD", 	info.get("EXP_MST_CD"));
			 commandMap.put("pageSize", 		"12");
			 
			 int totalCount 	= this.pcKingerService.selectKingerListCount(commandMap);
			 Paging paging 		= new Paging(totalCount, commandMap); 
			 mv.addObject( "paging", 			paging );
			 mv.addObject("commandMap",			commandMap);
			 
			 if(totalCount>0){
				 // 목록
				 mv.addObject("list", 			this.pcKingerService.selectKingerList(commandMap));
		     }
		 }
		 mv.setViewName("pc/marketing/kingerMain");
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : kingerView
	  * 2. ClassName : PcKingerController.java
	  * 3. Comment : 고객 체험단 > 킹저 상세
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 13.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/marketing/kingerView")
	 public ModelAndView kingerView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv		= new ModelAndView();
		 
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
		 }else{
			 commandMap.put("MEM_LOGIN_YN", "N");
		 }
		 
		 String cPage			= StringUtil.getString(commandMap.get("cPage"));		 
		 commandMap.put("page", cPage);
		 
		 Map info				= this.pcKingerService.selectKingerViewInfo(commandMap);
		 
		 if(info != null){
			 commandMap.put("pageSize", 9);
	     	
			 Map reqInfo			= this.pcKingerService.selectKingerReqInfo(commandMap);
			 Map reviewInfo			= this.pcKingerService.selectKingerReviewInfo(commandMap);
			 int iMyReqCnt			= this.pcKingerService.selectKingerMyReqCnt(commandMap);
			 int iMyRevCnt			= this.pcKingerService.selectKingerMyRevCnt(commandMap);
			 
			 mv.addObject("info",			info);
			 mv.addObject("reqList",		reqInfo.get("reqList"));
			 mv.addObject("reqPaging",		reqInfo.get("reqPaging"));
			 mv.addObject("reviewList",		reviewInfo.get("reviewList"));
			 mv.addObject("reviewPaging",	reviewInfo.get("reviewPaging"));
			 mv.addObject("iMyReqCnt", 		iMyReqCnt);
			 mv.addObject("iMyRevCnt",		iMyRevCnt);
			 mv.addObject("commandMap",		commandMap);
			 
			 mv.setViewName("pc/marketing/kingerView");
		 }else{
			 mv.addObject("alertMsg", "종료된 이벤트입니다.");
			 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/marketing/kingerMain.do");
		     mv.setViewName("pc/common/result");
		 }
		 
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : kingerReqAjax
	  * 2. ClassName : PcKingerController.java
	  * 3. Comment : 고객 체험단 > 킹저 > 신청하기 
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 14.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/marketing/kingerReqAjax")
	 public JSON kingerReqAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 JSON json 			= new JSON();
		 
		 String strResultMsg					= "";
		 int iCnt								= 0;
		 
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
			 strResultMsg	= this.pcKingerService.insertKigerReq(request, commandMap);
			 
			 iCnt		= this.pcKingerService.selectKingerMyReqCnt(commandMap);
			 
		 }else{
			 commandMap.put("MEM_LOGIN_YN", "N");
			 strResultMsg	= "로그인 후 글을 남길 수 있습니다.";
		 }
		 
		 json.addObject("resultMsg", strResultMsg);
		 json.addObject("iCnt", iCnt);
		 
		 return json;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : kingerReqDelAjax
	  * 2. ClassName : PcKingerController.java
	  * 3. Comment : 고객체험단 > 킹저 > 신청하기 삭제
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 15.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/marketing/kingerReqDelAjax")
	 public JSON kingerReqDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 
		 String strResultMsg					= "";
		 int iCnt								= 0;
		 
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
			 strResultMsg	= this.pcKingerService.deleteKigerReq(request, commandMap);
			 
			 iCnt		= this.pcKingerService.selectKingerMyReqCnt(commandMap);
			 
		 }else{
			 commandMap.put("MEM_LOGIN_YN", "N");
			 strResultMsg	= "로그인 후 글을 삭제 할  있습니다.";
		 }
		 
		 json.addObject("resultMsg", strResultMsg);
		 json.addObject("iCnt", iCnt);
		 
		 return json;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : kingerReqListAjax
	  * 2. ClassName : PcKingerController.java
	  * 3. Comment : 고객체험단 > 킹저 > 신청하기 리스트 ajax
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 15.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/marketing/kingerReqListAjax")
	 public JSON kingerReqListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 commandMap.put("pageSize", 9);
		 
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
		 }else{
			 commandMap.put("MEM_LOGIN_YN", "N");
		 }
		 
		 Map reqInfo			= this.pcKingerService.selectKingerReqInfo(commandMap);
		 
		 resultMap.put("reqList",		reqInfo.get("reqList"));
		 resultMap.put("reqPaging",		reqInfo.get("reqPaging"));
		 
		 Paging paging			= (Paging) reqInfo.get("reqPaging");
		 
		 json.addObject("resultMap", 				resultMap);
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
	       
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : kingerRevListAjax
	  * 2. ClassName : PcKingerController.java
	  * 3. Comment : 고객체험단 > 킹저 > 리뷰 리스트 ajax
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 15.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/marketing/kingerRevListAjax")
	 public JSON kingerRevListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 commandMap.put("pageSize", 9);
		 
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
		 }else{
			 commandMap.put("MEM_LOGIN_YN", "N");
		 }
		 
		 Map reqInfo			= this.pcKingerService.selectKingerReviewInfo(commandMap);
		 
		 resultMap.put("revList",		reqInfo.get("reviewList"));
		 resultMap.put("revPaging",		reqInfo.get("reviewPaging"));
		 
		 Paging paging			= (Paging) reqInfo.get("reviewPaging");
		 
		 json.addObject("resultMap", 				resultMap);
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
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : kingerRevView
	  * 2. ClassName : PcKingerController.java
	  * 3. Comment : 고객체험단 > 킹저 > 리뷰 상세 
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 15.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	@RequestMapping("/pc/marketing/kingerRevView")	
	public ModelAndView kingerRevView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv				= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map info 					= this.pcKingerService.selectKingerRevView(commandMap);
		
		mv.addObject("info", 		info);
		mv.addObject("commandMap", 	commandMap);
		mv.setViewName("pc/marketing/kingerRevView");
		
		return mv;
	}
		
	/**
	 * 	
	 * <pre>
	 * 1. MethodName : kingerWinList
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerWinList")
	public ModelAndView kingerWinList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv				= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int totalCount				= this.pcKingerService.selectKingerWinListCount(commandMap);

		Paging paging 				= new Paging(totalCount, commandMap);
		
		List<Map<String, Object>> list = null;
		
        mv.addObject("paging", paging );
        if (totalCount > 0){
        	list					= this.pcKingerService.selectKingerWinList(commandMap);
        }

        mv.addObject("list", list);
        mv.addObject("commandMap",			commandMap);
        mv.addObject("paging", paging);
		mv.setViewName("pc/marketing/kingerWinList");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerWinView
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 상세
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerWinView")
	public ModelAndView kingerWinView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv				= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map info					= this.pcKingerService.selectKingerWinView(commandMap);
		List list					= this.pcKingerService.selectKingerWinerList(commandMap);
		
		// 조쇠수 증가
		this.pcKingerService.updateKingerWinVist(commandMap);
		
		mv.setViewName("pc/marketing/kingerWinView");
		
		mv.addObject("info", info);
		mv.addObject("list", list);
		mv.addObject("commandMap",			commandMap);
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getWinerSearchAjax
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 검색
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerWinerSearchAjax")
    public JSON getKingerWinerSearchAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	JSON json = new JSON();
    	
    	User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
    	List<Map<String, Object>> list		= this.pcKingerService.selectKingerWinerSearchList(commandMap);
    	
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
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 고객체험단 > 킹저 > 응모자 정보 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerMissionInfo")
	public ModelAndView kingerMissionInfo(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv	= new ModelAndView();
	
		commandMap.put("EXP_ETR_WIN_YN", "Y");
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map info		= this.pcKingerService.selectKingerMissionInfo(commandMap);
		int icnt		= this.pcKingerService.selectKingerMissionInfoCnt(commandMap);
		 
		mv.addObject("info", info);
		mv.addObject("icnt", icnt);
		mv.addObject("commandMap",			commandMap);
		mv.setViewName("pc/marketing/kingerMissionInfo");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerConsentPopUp
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 고객체험단 > 킹저 > 동의서 제출 팝업
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/popup/kingerConsentPopUp")
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
		mv.setViewName("pc/marketing/popup/kingerConsentPopUp");
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerConsentSendAjax
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 고객체험단 > 킹저 > 동의서 제출하기 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerConsentSendAjax")
	public JSON kingerConsentSendAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json 			= new JSON();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int iResult			= this.pcKingerService.updateKingerConsntSend(commandMap);
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
	 * 1. MethodName : kinngerReviewPopUpWrite
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 고객체험단 > 킹저 > 리뷰등록화면 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerReviewPopUpWrite")
	public ModelAndView kinngerReviewPopUpWrite(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv		= new ModelAndView();

		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map info			= this.pcKingerService.selectKingerMissionInfo(commandMap);
		
		mv.addObject("info", info);
		mv.addObject("commandMap", commandMap);
		
		mv.setViewName("pc/marketing/popup/kingerReviewPopUpWrite");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerReviewRegist
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 고객체험단 > 킹저 > 리뷰 등록 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerReviewRegist")
	public ModelAndView kingerReviewRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		// 기획전관리 관리자 등록
        int result = this.pcKingerService.insertKingerReview((MultipartHttpServletRequest)request, commandMap);
        
        if(result > 0){
        	mv.addObject("closeMsg", "등록 되었습니다.");
        	mv.addObject("parentReload", "Y");
        }else{
        	mv.addObject("closeMsg", "등록에 실패하였습니다.");
        }
        
        mv.setViewName("pc/marketing/popup/result");
        	
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kinngerReviewPopUpEdit
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 프론트 > 고객체험단 > 리뷰 수정 페이지 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 31.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerReviewPopUpEdit")
	public ModelAndView kinngerReviewPopUpEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv		= new ModelAndView();

		User user = SessionsUser.getSessionUser(request);
		 
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Map info			= this.pcKingerService.selectKingerMissionInfo(commandMap);
		commandMap.put("edit", "Y");
		Map revInfo			= this.pcKingerService.selectKingerRevView(commandMap);
		
		mv.addObject("info", info);
		mv.addObject("revInfo", revInfo);
		mv.addObject("commandMap", commandMap);
		
		mv.setViewName("pc/marketing/popup/kingerReviewPopUpEdit");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : kingerReviewEditRegist
	 * 2. ClassName : PcKingerController.java
	 * 3. Comment : 프론트 > 고객체험단 > 리뷰 수정 처리
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 31.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/kingerReviewEditRegist")
	public ModelAndView kingerReviewEditRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
	
		User user 	= SessionsUser.getSessionUser(request);
		int result	= 0;
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			// 기획전관리 관리자 등록
	        result = this.pcKingerService.updateKingerReview((MultipartHttpServletRequest)request, commandMap);
			
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
        
        if(result > 0){
        	mv.addObject("closeMsg", "수정 되었습니다.");
        	mv.addObject("parentReload", "Y");
        }else{
        	mv.addObject("closeMsg", "수정에 실패하였습니다.");
        }
        
        mv.setViewName("pc/marketing/popup/result");
        
        return mv;
	}
}
