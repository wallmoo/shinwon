package com.market.mall.pc.contents.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.contents.service.PcEmagazineService;

@Controller
public class PcEmagazineController {

	 @Resource(name="pcEmagazineService")
	 private PcEmagazineService pcEmagazineService;
	
	 @Resource(name="commonService")
	 private CommonService commonService;
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineMain
	  * 2. ClassName : PcEmagazineController.java
	  * 3. Comment : 이메거진 메인 
	  * 4. 작성자 : khcho
	  * 5. 작성일 : 2016. 01. 18.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/contents/emagazineMain")
	 public ModelAndView emagazineMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv	= new ModelAndView();
		 
		 
//		 mv.addObject("manyList", 			this.pcEmagazineService.selectEmagazineManyRead(commandMap));
//		 commandMap.put("pageSize", 		"16");
		 
//		 int totalCount 	= this.pcEmagazineService.selectEmagazineMainCount(commandMap);
//		 Paging paging 		= new Paging(totalCount, commandMap); 
//		 mv.addObject( "paging", 			paging );
		 mv.addObject("commandMap",			commandMap);
//		 
//		 if(totalCount>0){
//			 // 목록
//			 mv.addObject("list", 			this.pcEmagazineService.selectEmagazineMain(commandMap));
//	     }
		 
		 mv.setViewName("pc/contents/emagazineMain");
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineListAjax
	  * 2. ClassName : PcEmagazineController.java
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
	 @RequestMapping("/pc/contents/emagazineListAjax")
	 public JSON emagazineListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 commandMap.put("pageSize", 16);
		
		 int totalCount 	= this.pcEmagazineService.selectEmagazineMainCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap); 
		 
		 resultMap.put("reqList", 	this.pcEmagazineService.selectEmagazineMain(commandMap));
		 
		 resultMap.put("reqPaging",		paging);
		 
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
	  * 1. MethodName : emagazineManyAjax
	  * 2. ClassName : PcEmagazineController.java
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
	 @RequestMapping("/pc/contents/emagazineManyAjax")
	 public JSON emagazineManyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		   		 
		 resultMap.put("manyList", 	this.pcEmagazineService.selectEmagazineManyRead(commandMap));
		 
		 json.addObject("resultMap", 				resultMap);
		   
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineView
	  * 2. ClassName : PcEmagazineController.java
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
	 @RequestMapping("/pc/contents/emagazineView")
	 public ModelAndView emagazineView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 ModelAndView mv		= new ModelAndView();
		 
		 
		 //String MGZ_MST_IDX = (String)commandMap.get("MGZ_MST_IDX");
		 
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
		 }else{
			 commandMap.put("MEM_MST_MEM_ID", "");
			 commandMap.put("MEM_LOGIN_YN", "N");
		 }
		 
		 Map info				= this.pcEmagazineService.selectEmagazineViewInfo(commandMap);
		 
		 int iMyReqCnt			= this.pcEmagazineService.selectEmagazineMyReqCnt(commandMap);
		 
		 this.pcEmagazineService.updateEmagazineReadCount(commandMap);
		 
		//commandMap.put("pageSize", 19);
		 
		// Map reqInfo			= this.pcEmagazineService.selectEmagazineReqInfo(commandMap);
		// Map reviewInfo			= this.pcEmagazineService.selectEmagazineReviewInfo(commandMap);
		 
		 commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
		 commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
		 
		 mv.addObject("info",			info);
		 mv.addObject("listProduct",		this.pcEmagazineService.selectEmagazineProductList(commandMap));
//		 mv.addObject("reqPaging",		reqInfo.get("reqPaging"));
//		 mv.addObject("reviewList",		reviewInfo.get("reviewList"));
//		 mv.addObject("reviewPaging",	reviewInfo.get("reviewPaging"));
		 mv.addObject("commandMap",		commandMap);
		 mv.addObject("iMyReqCnt", 		iMyReqCnt);
		 
		 mv.setViewName("pc/contents/emagazineView");
		 
		 return mv;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineQnaListAjax
	  * 2. ClassName : PcEmagazineController.java
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
	 @RequestMapping("/pc/contents/emagazineQnaListAjax")
	 public JSON emagazineQnaListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 commandMap.put("pageSize", 10);
		
		 User user = SessionsUser.getSessionUser(request);
		 
		 if(SessionsUser.isLogin(request) ){
			 commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			 commandMap.put("MEM_LOGIN_YN", "Y");
		 }else{
			 commandMap.put("MEM_MST_MEM_ID", "");
			 commandMap.put("MEM_LOGIN_YN", "N");
		 }

		 int iMyReqCnt			= this.pcEmagazineService.selectEmagazineMyReqCnt(commandMap);
		 
		 int totalCount 	= this.pcEmagazineService.selectPcEmagazineQnaCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap); 
		 
		 resultMap.put("qnaList", 	this.pcEmagazineService.selectPcEmagazineQnaList(commandMap));
		 
		 resultMap.put("reqPaging",		paging);
		 
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
		 
		 json.addObject("totalCount",			totalCount);
	     json.addObject("iMyReqCnt",			iMyReqCnt);
//		 System.out.println("json start::::::>" + json);
		 return json;
	 }
	 
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineQnaAjax
	  * 2. ClassName : PcEmagazineController.java
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
	 @RequestMapping("/pc/contents/emagazineQnaAjax")
	 public JSON emagazineQnaAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		 JSON json 			= new JSON();
		 
		 String strResultMsg					= "";
		 
		 strResultMsg	= this.pcEmagazineService.insertEmagazineQna(request, commandMap);
		 
		 json.addObject("resultMsg", strResultMsg);
		 
		 return json;
	 }
	 
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : emagazineDelAjax
	  * 2. ClassName : PcEmagazineController.java
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
	 @RequestMapping("/pc/contents/emagazineDelAjax")
	 public JSON kingerReqDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 
		 String strResultMsg					= "";
		 
//		 if(SessionsUser.isLogin(request)){
			 strResultMsg	= this.pcEmagazineService.deleteEmagazineQna(request, commandMap);
//		 }else{
//			 strResultMsg	= "로그인 후 글을 삭제 할  있습니다.";
//		 }
		 
		 json.addObject("resultMsg", strResultMsg);
		 
		 return json;
	 }
	/**
	* <pre>
	* 1. MethodName : insertInterestContentsAjax
	* 2. ClassName  : PcEmagazineController.java
	* 3. Comment    : 프론트 > 장바구니 > 관심상품 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/pc/contents/insertInterestContentsAjax")
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
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getSubCodeAjax
	 * 2. ClassName : PcEmagazineController.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 23.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/marketing/getSubCodeAjax")
	public JSON getSubCodeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
   	 	JSON json = new JSON();
        String code = (String)commandMap.get("code");
        
        List<Map<String, Object>> subCodeList =this.commonService.selectCodeByCode(code);
        
        json.put("list",  subCodeList);
        

        return json;
    }    
}
