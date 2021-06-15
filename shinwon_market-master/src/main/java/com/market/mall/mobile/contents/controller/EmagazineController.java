package com.market.mall.mobile.contents.controller;

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
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.mobile.contents.service.EmagazineService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.contents.service.PcEmagazineService;

@Controller("mobileEmagazineController")
public class EmagazineController {

	 @Resource(name="mobileEmagazineService")
	 private EmagazineService mobileEmagazineService;
	 
	 @Resource(name="pcEmagazineService")
	 private PcEmagazineService pcEmagazineService;
	 
	 /**
	 * 
	 * <pre>
	 * 1. MethodName : noticeBoardList
	 * 2. ClassName : NoticeBoardController.java
	 * 3. Comment : 이매거진 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	 @RequestMapping("/mobile/contents/emagazineMain")
	 public ModelAndView emagazineMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	 {
		 ModelAndView mv = new ModelAndView();
	         
	     // 공지사항 목록 갯수
	     commandMap.put("pageSize", "10");
	     
	     String MGZ_MST_CTG = StringUtil.getString(commandMap.get("MGZ_MST_CTG"), "");
	     String searchGb = StringUtil.getString(commandMap.get("searchGb"), "N");
	     
	     commandMap.put("searchGb",searchGb);
	     
	     int totalCount = this.mobileEmagazineService.selectEmagazineMainCount(commandMap);
	     String ctgNm = this.mobileEmagazineService.selectEmagazineCtgName(MGZ_MST_CTG);
	     
	     Paging paging = new Paging(totalCount, commandMap); 
	     mv.addObject("totalCount", totalCount);
	     mv.addObject("ctgNm", ctgNm);
	     
	     if(totalCount>0){
	     	// 공지사항  목록
	         mv.addObject("list",  this.mobileEmagazineService.selectEmagazineMain(commandMap));
	     }     
	     
	     mv.addObject("commandMap", commandMap);
	     
	     mv.setViewName("mobile/contents/emagazineMain");
		 return mv;
	 }
	 
//	 /**
//	  * 
//	  * <pre>
//	  * 1. MethodName : emagazineMain
//	  * 2. ClassName : EmagazineController.java
//	  * 3. Comment : 이메거진 메인 
//	  * 4. 작성자 : khcho
//	  * 5. 작성일 : 2016. 01. 18.
//	  * </pre>
//	  *
//	  * @param request
//	  * @param commandMap
//	  * @return
//	  * @throws Exception
//	  */
//	 @RequestMapping("/mobile/contents/emagazineMain")
//	 public ModelAndView emagazineMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
//		 ModelAndView mv	= new ModelAndView();
//		 
////		 mv.addObject("manyList", 			this.mobileEmagazineService.selectEmagazineManyRead(commandMap));
////		 commandMap.put("pageSize", 		"16");
//		 
////		 int totalCount 	= this.mobileEmagazineService.selectEmagazineMainCount(commandMap);
////		 Paging paging 		= new Paging(totalCount, commandMap); 
////		 mv.addObject( "paging", 			paging );
////		 mv.addObject("commandMap",			commandMap);
////		 
////		 if(totalCount>0){
////			 // 목록
////			 mv.addObject("list", 			this.mobileEmagazineService.selectEmagazineMain(commandMap));
////	     }
//		 
//		 mv.setViewName("mobile/contents/emagazineMain");
//		 return mv;
//	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineListAjax
	  * 2. ClassName : EmagazineController.java
	  * 3. Comment : 이매거진  리스트 ajax
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 15.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/mobile/contents/emagazineListAjax.do", method = RequestMethod.POST)
	 public JSON emagazineListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
	     String cPage		= StringUtil.getString(commandMap.get("cPage"), ""); 		// 좌측 lnb 에서 클릭한 값
	   	
		 commandMap.put("pageSize", 10);
		 
		 int totalCount 	= this.mobileEmagazineService.selectEmagazineMainCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap); 
		 
		 resultMap.put("list", 	this.mobileEmagazineService.selectEmagazineMain(commandMap));
		 
		 json.addObject("resultMap", 				resultMap);
		   
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineManyAjax
	  * 2. ClassName : EmagazineController.java
	  * 3. Comment : 이매거진  리스트 ajax
	  * 4. 작성자 : Lee
	  * 5. 작성일 : 2016. 1. 15.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/mobile/contents/emagazineManyAjax")
	 public JSON emagazineManyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		   		 
		 resultMap.put("manyList", 	this.mobileEmagazineService.selectEmagazineManyRead(commandMap));
		 
		 json.addObject("resultMap", 				resultMap);
		   
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineView
	  * 2. ClassName : EmagazineController.java
	  * 3. Comment : 이메거진상세
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 1. 19.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/mobile/contents/emagazineView")
	 public ModelAndView emagazineView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv		= new ModelAndView();
		 
		 
		 //String MGZ_MST_IDX = (String)commandMap.get("MGZ_MST_IDX");
		 
	     // 로그인 회원정보
		 User user = SessionsUser.getSessionUser(request);
		
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		 }else{
			 commandMap.put("MEM_MST_MEM_ID", "");
		 }
        
		 Map info				= this.mobileEmagazineService.selectEmagazineViewInfo(commandMap);
		 
		 int iMyReqCnt			= this.pcEmagazineService.selectEmagazineMyReqCnt(commandMap);
		 
		 this.mobileEmagazineService.updateEmagazineReadCount(commandMap);
		 
		//commandMap.put("pageSize", 19);
		 
		// Map reqInfo			= this.mobileEmagazineService.selectEmagazineReqInfo(commandMap);
		// Map reviewInfo			= this.mobileEmagazineService.selectEmagazineReviewInfo(commandMap);
		 
		 commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
		 commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
		 commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
		 
		 mv.addObject("info",			info);
		 mv.addObject("listProduct",		this.mobileEmagazineService.selectMobileEmagazineProductList(commandMap));
//		 mv.addObject("reqPaging",		reqInfo.get("reqPaging"));
//		 mv.addObject("reviewList",		reviewInfo.get("reviewList"));
//		 mv.addObject("reviewPaging",	reviewInfo.get("reviewPaging"));
		 mv.addObject("commandMap",		commandMap);
		 mv.addObject("iMyReqCnt", 		iMyReqCnt);
		 
		 mv.setViewName("mobile/contents/emagazineView");
		 
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineQnaListAjax
	  * 2. ClassName : EmagazineController.java
	  * 3. Comment : 이매거진 qna 리스트 ajax
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 1. 20.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/mobile/contents/emagazineQnaListAjax.do", method = RequestMethod.POST)
	 public JSON emagazineQnaListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 commandMap.put("pageSize", 20);
		
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
		 }else{
			 commandMap.put("MEM_MST_MEM_ID", "");
			 commandMap.put("MEM_LOGIN_YN", "N");
		 }
		 
		 int totalCount 	= this.mobileEmagazineService.selectPcEmagazineQnaCount(commandMap);
		 resultMap.put("totalCount", totalCount);
		 Paging paging 		= new Paging(totalCount, commandMap); 
		 
		 int iMyReqCnt			= this.pcEmagazineService.selectEmagazineMyReqCnt(commandMap);
		 
		 resultMap.put("qnaList", 	this.mobileEmagazineService.selectPcEmagazineQnaList(commandMap));
		 
		 json.addObject("resultMap", 				resultMap);
		 json.addObject("listNum",					paging.getListNum());
		 json.addObject("iMyReqCnt", 				iMyReqCnt);
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineQnaAjax
	  * 2. ClassName : EmagazineController.java
	  * 3. Comment :이매거진 상세> 질문하기 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 1. 20.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/mobile/contents/emagazineQnaAjax")
	 public JSON emagazineQnaAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 JSON json 			= new JSON();
		 
		 String strResultMsg					= "";
		 
		 strResultMsg	= this.mobileEmagazineService.insertEmagazineQna(request, commandMap);
		 
		 json.addObject("resultMsg", strResultMsg);
		 
		 return json;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineDelAjax
	  * 2. ClassName : EmagazineController.java
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
	 @RequestMapping("/mobile/contents/emagazineDelAjax")
	 public JSON kingerReqDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 
		 String strResultMsg					= "";
		 
//		 if(SessionsUser.isLogin(request)){
			 strResultMsg	= this.mobileEmagazineService.deleteEmagazineQna(request, commandMap);
//		 }else{
//			 strResultMsg	= "로그인 후 글을 삭제 할  있습니다.";
//		 }
		 
		 json.addObject("resultMsg", strResultMsg);
		 
		 return json;
	 }
	 
	 @RequestMapping("/mobile/contents/getSubCodeAjax")
	 public JSON getSubCodeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	 {
	  	 JSON json = new JSON();
	     String code = (String)commandMap.get("code");
	         
	     List<Map<String, Object>> subCodeList =this.mobileEmagazineService.selectCodeByCode(code);
	         
	     json.put("list",  subCodeList);
	         
	 
	     return json;
	 }    
	 
	 
	 
//	 
//	 /**
//	  * 
//	  * <pre>
//	  * 1. MethodName : kingerReqListAjax
//	  * 2. ClassName : EmagazineController.java
//	  * 3. Comment : 고객체험단 > 킹저 > 신청하기 리스트 ajax
//	  * 4. 작성자 : Lee
//	  * 5. 작성일 : 2016. 1. 15.
//	  * </pre>
//	  *
//	  * @param request
//	  * @param commandMap
//	  * @return
//	  * @throws Exception
//	  */
//	 @RequestMapping("/mobile/marketing/kingerReqListAjax")
//	 public JSON kingerReqListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
//		 JSON json			= new JSON();
//		 Map resultMap		= new HashMap();
//		 
//		 commandMap.put("pageSize", 9);
//	     	
//		 Map reqInfo			= this.mobileEmagazineService.selectEmagazineReqInfo(commandMap);
//		 
//		 resultMap.put("reqList",		reqInfo.get("reqList"));
//		 resultMap.put("reqPaging",		reqInfo.get("reqPaging"));
//		 
//		 Paging paging			= (Paging) reqInfo.get("reqPaging");
//		 
//		 json.addObject("resultMap", 				resultMap);
//		 json.addObject("firstpageno", 				paging.getFirstPageNo());
//		 json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
//		 json.addObject("totalPageCount",  			paging.getTotalPageCount());
//		 json.addObject("lastPageNoOnPageList", 	paging.getLastPageNoOnPageList());	
//		 json.addObject("cPage", 					paging.getcPage());
//		 json.addObject("lastPageNo", 				paging.getLastPageNo());
//		 json.addObject("pageSize",  				paging.getPageSize());
//		 json.addObject("pagingSize", 				paging.getPagingSize());
//		 json.addObject("listNum",					paging.getListNum());
//		 json.addObject("totalRecordCount",			paging.getTotalRecordCount());
//	       
////		 System.out.println("json start::::::>" + json);
//		 return json;
//	 }
//	 
//	 /**
//	  * 
//	  * <pre>
//	  * 1. MethodName : kingerRevListAjax
//	  * 2. ClassName : EmagazineController.java
//	  * 3. Comment : 고객체험단 > 킹저 > 리뷰 리스트 ajax
//	  * 4. 작성자 : Lee
//	  * 5. 작성일 : 2016. 1. 15.
//	  * </pre>
//	  *
//	  * @param request
//	  * @param commandMap
//	  * @return
//	  * @throws Exception
//	  */
//	 @RequestMapping("/mobile/marketing/kingerRevListAjax")
//	 public JSON kingerRevListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
//		 JSON json			= new JSON();
//		 Map resultMap		= new HashMap();
//		 
//		 commandMap.put("pageSize", 9);
//	     	
//		 Map reqInfo			= this.mobileEmagazineService.selectEmagazineReviewInfo(commandMap);
//		 
//		 resultMap.put("revList",		reqInfo.get("reviewList"));
//		 resultMap.put("revPaging",		reqInfo.get("reviewPaging"));
//		 
//		 Paging paging			= (Paging) reqInfo.get("reviewPaging");
//		 
//		 json.addObject("resultMap", 				resultMap);
//		 json.addObject("firstpageno", 				paging.getFirstPageNo());
//		 json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
//		 json.addObject("totalPageCount",  			paging.getTotalPageCount());
//		 json.addObject("lastPageNoOnPageList", 	paging.getLastPageNoOnPageList());	
//		 json.addObject("cPage", 					paging.getcPage());
//		 json.addObject("lastPageNo", 				paging.getLastPageNo());
//		 json.addObject("pageSize",  				paging.getPageSize());
//		 json.addObject("pagingSize", 				paging.getPagingSize());
//		 json.addObject("listNum",					paging.getListNum());
//		 json.addObject("totalRecordCount",			paging.getTotalRecordCount());  
////		 System.out.println("json start::::::>" + json);
//		 return json;
//	 }
//	 
//	 /**
//	  * 
//	  * <pre>
//	  * 1. MethodName : kingerRevView
//	  * 2. ClassName : EmagazineController.java
//	  * 3. Comment : 고객체험단 > 킹저 > 리뷰 상세 
//	  * 4. 작성자 : Lee
//	  * 5. 작성일 : 2016. 1. 15.
//	  * </pre>
//	  *
//	  * @param request
//	  * @param commandMap
//	  * @return
//	  * @throws Exception
//	  */
//	@RequestMapping("/mobile/marketing/kingerRevView")	
//	public ModelAndView kingerRevView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
//		
//		ModelAndView mv				= new ModelAndView();
//		
//		Map info 					= this.mobileEmagazineService.selectEmagazineRevView(commandMap);
//		
//		mv.addObject("info", 		info);
//		mv.addObject("commandMap", 	commandMap);
//		mv.setViewName("mobile/marketing/kingerRevView");
//		
//		return mv;
//	}
//		
//	/**
//	 * 	
//	 * <pre>
//	 * 1. MethodName : kingerWinList
//	 * 2. ClassName : EmagazineController.java
//	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 리스트
//	 * 4. 작성자 : Lee
//	 * 5. 작성일 : 2016. 1. 15.
//	 * </pre>
//	 *
//	 * @param request
//	 * @param commandMap
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/mobile/marketing/kingerWinList")
//	public ModelAndView kingerWinList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
//		ModelAndView mv				= new ModelAndView();
//		
//		int totalCount				= this.mobileEmagazineService.selectEmagazineWinListCount(commandMap);
//
//		Paging paging 				= new Paging(totalCount, commandMap);
//		
//		List<Map<String, Object>> list = null;
//		
//        mv.addObject("paging", paging );
//        if (totalCount > 0){
//        	list					= this.mobileEmagazineService.selectEmagazineWinList(commandMap);
//        }
//
//        mv.addObject("list", list);
//        mv.addObject("commandMap",			commandMap);
//		mv.setViewName("mobile/marketing/kingerWinList");
//		
//		return mv;
//	}
//	
//	/**
//	 * 
//	 * <pre>
//	 * 1. MethodName : kingerWinView
//	 * 2. ClassName : EmagazineController.java
//	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 상세
//	 * 4. 작성자 : Lee
//	 * 5. 작성일 : 2016. 1. 18.
//	 * </pre>
//	 *
//	 * @param request
//	 * @param commandMap
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/mobile/marketing/kingerWinView")
//	public ModelAndView kingerWinView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
//		ModelAndView mv				= new ModelAndView();
//		
//		Map info					= this.mobileEmagazineService.selectEmagazineWinView(commandMap);
//		List list					= this.mobileEmagazineService.selectEmagazineWinerList(commandMap);
//		
//		mv.setViewName("mobile/marketing/kingerWinView");
//		
//		mv.addObject("info", info);
//		mv.addObject("list", list);
//		mv.addObject("commandMap",			commandMap);
//		
//		return mv;
//	}
//	
//	/**
//	 * 
//	 * <pre>
//	 * 1. MethodName : getWinerSearchAjax
//	 * 2. ClassName : EmagazineController.java
//	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 검색
//	 * 4. 작성자 : Lee
//	 * 5. 작성일 : 2016. 1. 18.
//	 * </pre>
//	 *
//	 * @param request
//	 * @param commandMap
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/mobile/marketing/kingerWinerSearchAjax")
//    public JSON getEmagazineWinerSearchAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
//    	JSON json = new JSON();
//    	
//    	List<Map<String, Object>> list		= this.mobileEmagazineService.selectEmagazineWinerSearchList(commandMap);
//    	
//    	String strResultMsg					= "";
//    	
//    	if(list.size() > 0){
//    		strResultMsg			= "축하합니다.\nKINGER 당첨되셨습니다.";
////    		for(int i=0; i < list.size(); i++){
////    			HashMap row					= (HashMap) list.get(i);
//    			
////    			if(i == 0){
////    				strResultMsg			= "축하합니다.\n"+ row.get("WIN_INF_MEM_NM") + "KINGER 당첨되셨습니다.";
////    			}else{
////    				strResultMsg			+= "\n"+ row.get("WIN_INF_MEM_NM") + "님은 [" + row.get("WIN_INF_NM") + "]에 당첨되셨습니다.";
////    			}
////    		}
//    	}else{
//    		strResultMsg					= "아쉽지만\n당첨되지 않았습니다. 다음 KINGER에 참여해주세요.";
//    	}
//    	
//    	json.addObject("strResultMsg", strResultMsg);
//    	
//    	return json;
//    }
//	
//	/**
//	 * 
//	 * <pre>
//	 * 1. MethodName : kingerMissionInfo
//	 * 2. ClassName : EmagazineController.java
//	 * 3. Comment : 고객체험단 > 킹저 > 응모자 정보 
//	 * 4. 작성자 : Lee
//	 * 5. 작성일 : 2016. 1. 18.
//	 * </pre>
//	 *
//	 * @param request
//	 * @param commandMap
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/mobile/marketing/kingerMissionInfo")
//	public ModelAndView kingerMissionInfo(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
//		ModelAndView mv	= new ModelAndView();
//	
//		Map info		= this.mobileEmagazineService.selectEmagazineMissionInfo(commandMap);
//		int icnt		= this.mobileEmagazineService.selectEmagazineMissionInfoCnt(commandMap);
//		
//		mv.addObject("info", info);
//		mv.addObject("icnt", icnt);
//		mv.addObject("commandMap",			commandMap);
//		mv.setViewName("mobile/marketing/kingerMissionInfo");
//		
//		return mv;
//	}
//	
//	/**
//	 * 
//	 * <pre>
//	 * 1. MethodName : kingerConsentPopUp
//	 * 2. ClassName : EmagazineController.java
//	 * 3. Comment : 고객체험단 > 킹저 > 동의서 제출 팝업
//	 * 4. 작성자 : Lee
//	 * 5. 작성일 : 2016. 1. 18.
//	 * </pre>
//	 *
//	 * @param request
//	 * @param commandMap
//	 * @return
//	 * @throws Exception
//	 */
//	public ModelAndView kingerConsentPopUp(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
//		ModelAndView mv	= new ModelAndView();
//		
//		mv.addObject("commandMap",			commandMap);
//		mv.setViewName("mobile/marketing/popup/kingerConsentPopUp");
//		return mv;
//	}
	 
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertInterestProductAjax
	 * 2. ClassName : EmagazineController.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping("/mobile/contents/insertInterestContentsAjax")
	public JSON insertInterestProductAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		int insertResult = 0;
		
		if(SessionsUser.isLogin(request))
		{
			// 관심상품 중복체크
			int interestProductCount = this.pcEmagazineService.selectInterestContentsCheckCount(request,commandMap);
			
			if(interestProductCount == 0){
				// 관심상품 등록
				insertResult = this.pcEmagazineService.insertInterestContents(request, commandMap);
				
				if(insertResult > 0)
				{
					result = 1;
					resultMsg = "MY 키핑 컨텐츠로 등록되었습니다.";
				}
				else
				{
					result = -1;
					resultMsg = "에러가 발생했습니다.";
				}
			}else{
				result = 1;
				resultMsg = "MY 키핑 컨텐츠로 등록되었습니다.";
			}
		}
		else
		{
			resultMsg = "로그인이 필요한 서비스입니다.\n로그인하시겠습니까?";
		}
		
		json.addObject("result", result);
		json.addObject("resultMsg", resultMsg);
		
		return json;
	}
}
