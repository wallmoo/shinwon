package com.market.mall.mobile.product.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.mobile.product.service.EstimateManagementService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.product.service.CategoryService;

@Controller("mEstimateManagementController")
public class EstimateManagementController {
	
	@Resource(name="mEstimateManagementService")
	private EstimateManagementService mEstimateManagementService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="categoryService") 
	private CategoryService categoryService;
	
	@Resource
	private CartService cartService;
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;

	@Resource private Sms sms;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateMain
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 맞춤 견적 > Main
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/myEstimateMain")
	public ModelAndView myEstimateMain(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
		int totalCount	= 0;
		
		commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("PRD_CTG_IDX", "-1");
		commandMap.put("PRD_CTG_DSP_YN", "Y");
		commandMap.put("PRD_MST_CNL_MB_YN", "Y");		  
    	commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_MOBILE);
    	commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
    	
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			Map<String, Object> userInfo 	= this.cartService.selectUserInfo(commandMap);
			
			commandMap.put("MEM_MST_MEM_NM", user.getMEM_MST_MEM_NM());
			commandMap.put("MEM_MST_HP1", userInfo.get("MEM_MST_HP1"));
			commandMap.put("MEM_MST_HP2", userInfo.get("MEM_MST_HP2"));
			commandMap.put("MEM_MST_HP3", userInfo.get("MEM_MST_HP3"));
			commandMap.put("MEM_MST_MAIL", userInfo.get("MEM_MST_MAIL"));
		
			commandMap.put("pageSize", 			"10");
			
			totalCount				= this.mEstimateManagementService.selectEsmCartCnt(commandMap);
			List optList			= this.mEstimateManagementService.selectEsmCartOptDetailList(commandMap);
			
			int keepTotalCount		= this.mEstimateManagementService.selectMyEstimateKeepingListCount(commandMap);
					
			if(keepTotalCount > 0){
				Paging keepPaging		= new Paging(keepTotalCount, commandMap);
				List keepList			= this.mEstimateManagementService.selectMyEstimateKeepingList(commandMap);
				
				mv.addObject("keepList", keepList);
				mv.addObject("keepPaging", keepPaging);
			}
			
			int cartTotalCount		= this.mEstimateManagementService.selectMyEstimateCartListCount(commandMap);
			if(cartTotalCount > 0){
				Paging cartPaging		= new Paging(cartTotalCount, commandMap);
				List cartList			= this.mEstimateManagementService.selectMyEstimateCartList(commandMap);
				
				mv.addObject("cartList", cartList);
				mv.addObject("cartPaging", cartPaging);
			}
			
			mv.addObject("optList", optList);
			mv.addObject("commandMap", commandMap);
			
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		 // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        
        List<Map<String, Object>> categoryList = this.categoryService.selectSubCategoryProductList(commandMap);
        mv.addObject("categoryList", categoryList);
        
		mv.setViewName("/mobile/product/myEstimateMain");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateKeepingAjax
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 맞춤 견적 > keeping 상품 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/myEstimateKeepingAjax")
	public JSON myEstimateKeepingAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		JSON json 				= new JSON();
		
		String strMemLoginYN	= "";
		User user = SessionsUser.getSessionUser(request);
		
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			strMemLoginYN		= "Y";
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			
			strMemLoginYN		= "N";
		}
		
		json.addObject("MEM_LOGIN_YN", strMemLoginYN);
		
		commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_MOBILE);
		
		if("Y".equals(strMemLoginYN)){
			commandMap.put("pageSize", 			"10");
			
			int totalCount		= this.mEstimateManagementService.selectMyEstimateKeepingListCount(commandMap);

			json.addObject("totalCount", 		totalCount);
			
			if(totalCount > 0){
				Paging paging	= new Paging(totalCount, commandMap);
				
				commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
	        	commandMap.put("IMG_THUMBNAIL_SIZE_BIG", 	Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_BIG);
	        	
				List list		= this.mEstimateManagementService.selectMyEstimateKeepingList(commandMap);
				json.addObject("list", 						list);
				
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
		}
		
		return json;
	}
	

	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateCateSearchAjax
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 맞춤 > 카테고리 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/myEstimateCateSearchAjax")
	public JSON myEstimateCateSearchAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		JSON json				= new JSON();
		
		String strMemLoginYN	= "";
		User user 				= SessionsUser.getSessionUser(request);
		
    	String strCategory1 	= StringUtil.getString(commandMap.get("category1"),"");
    	String strCategory2 	= StringUtil.getString(commandMap.get("category2"),"");
    	String strCategory3 	= StringUtil.getString(commandMap.get("category3"),"");
    	String searchPrdCtgIdx	= "";
    	String searchPrdMstNm	= StringUtil.getString(commandMap.get("productName"), "");
    	String searchPrdMstCd	= StringUtil.getString(commandMap.get("productNumber"), "");
    	
    	if(!"".equals(strCategory1)){
    		searchPrdCtgIdx	= strCategory1;
    	}
    	if(!"".equals(strCategory2)){
    		searchPrdCtgIdx	= strCategory2;
    	}
    	if(!"".equals(strCategory3)){
    		searchPrdCtgIdx	= strCategory3;
    	}
    	
    	if(!"".equals(searchPrdCtgIdx)){
    		commandMap.put("searchPrdCtgIdx", "Y");    	
    	}
    	if(!"".equals(searchPrdMstNm)){
    		commandMap.put("searchPrdMstNm", searchPrdMstNm);
    	}
    	if(!"".equals(searchPrdMstCd)){
    		commandMap.put("searchPrdMstCd", searchPrdMstCd);
    	}
    	
    	commandMap.put("searchPrdCtgEnv", Code.USER_ENV_TYPE_MOBILE);
    	commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
    	commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_MOBILE);
    	
    	if(SessionsUser.isLogin(request) ){
    		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			strMemLoginYN		= "Y";
		}else{
			strMemLoginYN		= "N";
		}
		
		json.addObject("MEM_LOGIN_YN", strMemLoginYN);
		
		if("Y".equals(strMemLoginYN)){
			commandMap.put("pageSize", 			"10");
			
			int totalCount		= this.mEstimateManagementService.selectMyEstimateCateListCount(commandMap);

			json.addObject("totalCount", 		totalCount);
			
			if(totalCount > 0){
				Paging paging	= new Paging(totalCount, commandMap);
				
				commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
	        	commandMap.put("IMG_THUMBNAIL_SIZE_BIG", 	Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_BIG);
	        	
				List list		= this.mEstimateManagementService.selectMyEstimateCateList(commandMap);
				json.addObject("list", 						list);
				
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
		}
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateCartAjax
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 맞춤 견적 > 장바구니 상품 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/myEstimateCartAjax")
	public JSON myEstimateCartAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		
		String strMemLoginYN	= "";
		User user = SessionsUser.getSessionUser(request);
		
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			strMemLoginYN		= "Y";
		}else{
			strMemLoginYN		= "N";
		}
		
		json.addObject("MEM_LOGIN_YN", strMemLoginYN);
		
		commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_MOBILE);
		
		if("Y".equals(strMemLoginYN)){
			commandMap.put("pageSize", 			"10");
			
			int totalCount		= this.mEstimateManagementService.selectMyEstimateCartListCount(commandMap);

			json.addObject("totalCount", 		totalCount);
			
			if(totalCount > 0){
				Paging paging	= new Paging(totalCount, commandMap);
				
				commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
	        	commandMap.put("IMG_THUMBNAIL_SIZE_BIG", 	Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_BIG);
	        	
				List list		= this.mEstimateManagementService.selectMyEstimateCartList(commandMap);
				json.addObject("list", 						list);
				
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
		}
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateList
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 맞춤견적서 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/myEstimateList")
	public ModelAndView myEstimateList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		String strMemLoginYN	="";
		
		User user = SessionsUser.getSessionUser(request);
		
		HttpSession session = request.getSession();
		String strEsmMstType				= (String) session.getAttribute("ESM_MST_TYPE");
		
//		System.out.println("strEsmMstType:::::::>" + strEsmMstType);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			strMemLoginYN		= "Y";
		}else{
			strMemLoginYN		= "N";
		}
		
		commandMap.put("MEM_LOGIN_YN", strMemLoginYN);
		
		commandMap.put("PRD_MST_CNL_MB_YN", "Y");
		commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
    	commandMap.put("IMG_THUMBNAIL_SIZE_BIG", 	Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_BIG);
    	commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
    	
    	 // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
        
		int totalCount			= this.mEstimateManagementService.selectEsmCartCnt(commandMap);
		List list				= this.mEstimateManagementService.selectMyEstimateList(commandMap);
		List optList			= this.mEstimateManagementService.selectEsmCartOptDetailList(commandMap);
		
		mv.addObject("list", list);
		mv.addObject("totalCount", totalCount);
		mv.addObject("optList", optList);
		mv.addObject("commandMap", commandMap);
		
		mv.setViewName("/mobile/product/myEstimateList");
		
		return mv;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateDelAjax
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 맞춤 견적 > 장바구니 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/myEstimateDelAjax")
	public JSON myEstimateDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json 		= new JSON();
		
		String resultMsg = "에러가 발생했습니다.";
		
		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
      	if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int result		= this.mEstimateManagementService.deleteMyEstimateDelAjax(commandMap);
		
		if(result > 0){
			resultMsg = "삭제했습니다.";
		}
		
		json.addObject("resultMsg", resultMsg);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateProcess
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 견적 > 견적요청 처리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @param PRD_MST_CDs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/myEstimateProcess")
	public ModelAndView myEstimateProcess(HttpServletRequest request, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs) throws Exception {
		
		ModelAndView mv			= new ModelAndView();
		
		int result 				= 0;
        String alertMsg 		= "";
		
     // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
		
        if(SessionsUser.isLogin(request) ){
        	
        	HttpSession session = request.getSession();
        	
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			commandMap.put("CART_PC_MOBILE_GUBUN",  "M");
			commandMap.put("MEM_MST_REG_IP", request.getRemoteAddr());
			commandMap.put("PRD_MST_CDs", PRD_MST_CDs);
			
			String strEsmMstType				= (String) session.getAttribute("ESM_MST_TYPE");
			
			if("".equals(strEsmMstType) || strEsmMstType == null){
				strEsmMstType					= "1816";
			}
			
//			System.out.println("strEsmMstType:::::::>" + strEsmMstType);
			commandMap.put("ESM_MST_TYPE", 		strEsmMstType); 			// 견적 구분 '개별상품'
			
			result		= this.mEstimateManagementService.insertMyEstimateProcess(commandMap);
			
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
	
		
		if(result > 0){
			alertMsg = "견적신청이 접수되었습니다.";
	            
            Map<String, Object> smsMap = new HashMap<String, Object>();
            
            smsMap.put("TR_PHONE", smsMap.get("MEM_MST_HP"));  
    		smsMap.put("TR_NAME", smsMap.get("MEM_MST_MEM_NM"));  		
//	    		smsMap.put("TR_SUBJECT", "제목입니다."); 		
    		smsMap.put("TR_MSG", pcCommonService.getAppName()+" "+ smsMap.get("MEM_MST_MEM_NM") + "님, 맞춤견적 신청이 완료되었습니다.자세한 내용은 MYLAND>쇼핑활동>MY견적에서 확인 가능합니다.");
    		
    		Map<String, Object> resultMap = this.sms.sendLongMessage(smsMap);
        }else{
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
		 //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/mobile/product/myEstimateMain.do");
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("mobile/common/result");
        
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : estimateProcess
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 대량구매 견적 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 29.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @param PRD_MST_CDs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/estimateProcess")
	public ModelAndView estimateProcess(HttpServletRequest request, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs) throws Exception {
		
		ModelAndView mv			= new ModelAndView();
		
		int result 				= 0;
        String alertMsg 		= "";
	  
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
		
      	if(SessionsUser.isLogin(request) ){
      		
      		HttpSession session = request.getSession();
      		
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			String strEsmMstType				= (String) session.getAttribute("ESM_MST_TYPE");
			
			if("".equals(strEsmMstType) || strEsmMstType == null){
				strEsmMstType					= "1818";
			}
			
			Map<String, Object> userInfo 	= this.cartService.selectUserInfo(commandMap);
			
			commandMap.put("CART_PC_MOBILE_GUBUN",  "M");
			commandMap.put("MEM_MST_REG_IP", request.getRemoteAddr());
			commandMap.put("PRD_MST_CDs", PRD_MST_CDs);
			commandMap.put("ESM_MST_TYPE", 		strEsmMstType); 			// 견적 구분 '개별상품'
			
			result		= this.mEstimateManagementService.insertMyEstimateProcess(commandMap);
			
			if(result > 0){
	            alertMsg = "견적신청이 접수되었습니다.";
	            
	            Map<String, Object> smsMap = new HashMap<String, Object>();
	            
	            smsMap.put("TR_PHONE", smsMap.get("MEM_MST_HP"));  
	    		smsMap.put("TR_NAME", smsMap.get("MEM_MST_MEM_NM"));  	
//	    		smsMap.put("TR_SUBJECT", "제목입니다."); 	
	    		smsMap.put("TR_MSG", pcCommonService.getAppName()+ " "+ smsMap.get("MEM_MST_MEM_NM") + "님, 대량구매 견적 신청이 완료되었습니다.자세한 내용은 MYLAND>쇼핑활동>MY견적에서 확인 가능합니다.");
	    		
	    		Map<String, Object> resultMap = this.sms.sendLongMessage(smsMap);
	    		
	        }else{
	            alertMsg = "처리 중 오류가 발생하였습니다.";
	        }
			
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
      	
      	
		 //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/product/estimateMain.do");
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("mobile/common/result");
        
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateCateAjax
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 맞춤 > 카테고리 selecbox 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 5. 04.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/myEstimateCateAjax")
	public JSON myEstimateCateAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		
		String strMemLoginYN	= "";
		
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			
			strMemLoginYN		= "Y";
		}else{
			strMemLoginYN		= "N";
		}
		
		json.addObject("MEM_LOGIN_YN", strMemLoginYN);
		
		commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("PRD_CTG_DSP_YN", "Y");
		
		//if("Y".equals(strMemLoginYN)){
		List<Map<String, Object>> list = this.categoryService.selectSubCategoryProductList(commandMap);
        json.put("categoryList", list);
		//}
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertCartAjax
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 견적 > 견적 장바구니 담기  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 5. 09.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mobile/product/insertEsmCartAjax", method = RequestMethod.POST)
	public JSON insertCartAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
		commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
		commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_PC);
		
		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);

		// -- 세션정보 (비회원으로 장바구니에 넣으면 session_id로 저장되고, 로그인 시 session_id가 MEM_CRT_SES_ID = ''로 update 하고  MEM_MST_MEM_ID = '회원아이디' 로 update
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);

		// 상품 옵션 idx
		String[] TEMP_OPT_DTL_IDXs = request.getParameterValues("OPT_DTL_IDXs");
		List<String> OPT_DTL_IDXs = Arrays.asList(TEMP_OPT_DTL_IDXs);
		commandMap.put("OPT_DTL_IDXs", OPT_DTL_IDXs);
		
		// 재고 체크
		Map<String, Object> prdStock = this.cartService.selectPrdStock(commandMap, request);
		
		if((Integer)prdStock.get("result") > 0){//재고 있음
			// 장바구니 상품 추가
			result = this.mEstimateManagementService.insertEsmCart(commandMap);
		}else{//재고 없음
			result = (Integer)prdStock.get("result");
			resultMsg = StringUtil.getString(prdStock.get("resultMsg"));
		}

		json.addObject("result", result);
		json.addObject("resultMsg", resultMsg);

		// 카트 수량 가져오기
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			paramMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		}
		// 상품 채널 타입
		paramMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
		json.addObject("cartCnt", String.valueOf(this.mEstimateManagementService.selectEsmCartCnt(paramMap)));    	
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateMain
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 나만의 맞춤 견적 > Main
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/estimateMain")
	public ModelAndView estimateMain(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
		int totalCount	= 0;
		
		commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("PRD_CTG_IDX", "-1");
		commandMap.put("PRD_CTG_DSP_YN", "Y");
		commandMap.put("PRD_MST_CNL_MB_YN", "Y");		  
    	commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_MOBILE);
    	commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
    	
		if(SessionsUser.isLogin(request) ){
			
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			Map<String, Object> userInfo 	= this.cartService.selectUserInfo(commandMap);
			
			commandMap.put("MEM_MST_MEM_NM", user.getMEM_MST_MEM_NM());
			commandMap.put("MEM_MST_HP1", userInfo.get("MEM_MST_HP1"));
			commandMap.put("MEM_MST_HP2", userInfo.get("MEM_MST_HP2"));
			commandMap.put("MEM_MST_HP3", userInfo.get("MEM_MST_HP3"));
			commandMap.put("MEM_MST_MAIL", userInfo.get("MEM_MST_MAIL"));
		
			commandMap.put("pageSize", 			"10");
			
			totalCount				= this.mEstimateManagementService.selectEsmCartCnt(commandMap);
			List optList			= this.mEstimateManagementService.selectEsmCartOptDetailList(commandMap);
			
			mv.addObject("optList", optList);
			mv.addObject("commandMap", commandMap);
			
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		 // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        
        List<Map<String, Object>> categoryList = this.categoryService.selectSubCategoryProductList(commandMap);
        mv.addObject("categoryList", categoryList);
        
		mv.setViewName("/mobile/product/estimateMain");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : estimateList
	 * 2. ClassName : EstimateManagementController.java
	 * 3. Comment : 모바일 > 대량견적서 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 5. 10.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/product/estimateList")
	public ModelAndView estimateList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		String strMemLoginYN	="";
		
		User user = SessionsUser.getSessionUser(request);
		
		HttpSession session = request.getSession();
		String strEsmMstType				= (String) session.getAttribute("ESM_MST_TYPE");
		
//		System.out.println("strEsmMstType:::::::>" + strEsmMstType);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			strMemLoginYN		= "Y";
		}else{
			strMemLoginYN		= "N";
		}
		
		commandMap.put("MEM_LOGIN_YN", strMemLoginYN);
		
		commandMap.put("PRD_MST_CNL_MB_YN", "Y");
		commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
    	commandMap.put("IMG_THUMBNAIL_SIZE_BIG", 	Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_BIG);
    	commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
    	
    	 // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
        
		int totalCount			= this.mEstimateManagementService.selectEsmCartCnt(commandMap);
		List list				= this.mEstimateManagementService.selectMyEstimateList(commandMap);
		List optList			= this.mEstimateManagementService.selectEsmCartOptDetailList(commandMap);
		
		mv.addObject("list", list);
		mv.addObject("totalCount", totalCount);
		mv.addObject("optList", optList);
		mv.addObject("commandMap", commandMap);
		
		mv.setViewName("/mobile/product/estimateList");
		
		return mv;
	}
}
