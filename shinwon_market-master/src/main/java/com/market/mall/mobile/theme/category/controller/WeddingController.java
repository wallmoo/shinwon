package com.market.mall.mobile.theme.category.controller;

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
import com.market.mall.mobile.theme.category.service.WeddingService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.product.service.EstimateManagementService;

/**
 * @PackageName: com.market.mall.mobile.theme.category.controller
 * @FileName : WeddingController.java
 * @Date : 2016. 2. 11.
 * @프로그램 설명 : 모바일 > 테마카테고리 > 웨딩 Controller Class
 * @author Lee
 */
@Controller("mWeddingController")
public class WeddingController {
	
	@Resource(name="mWeddingService")
    private WeddingService mWeddingService;

	@Resource(name="pcEstimateManagementService") 
	private EstimateManagementService pcEstimateManagementService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	private CartService cartService;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : weddingMain
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 모바일 > 테마카테고리 > 웨딩 > 메인화면 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 11.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/themecategory/weddingMain")
	public ModelAndView weddingMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv 			= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("PRD_MST_CNL_MB_YN", "Y");
//		commandMap.put("PRD_MST_CNL_PC_YN", "Y");
		
		Map<String, Object> dataMap = this.mWeddingService.selectWeddingMain(commandMap);
		
		mv.setViewName("mobile/themecategory/weddingMain");
        
		mv.addObject("guide2DepList", dataMap.get("guide2DepList"));
		mv.addObject("guide3DepList", dataMap.get("guide3DepList"));
		mv.addObject("product300List", dataMap.get("product300List"));
		mv.addObject("product500List", dataMap.get("product500List"));
		mv.addObject("product800List", dataMap.get("product800List"));
		mv.addObject("product1000List", dataMap.get("product1000List"));
		mv.addObject("banner300", dataMap.get("banner300"));
		mv.addObject("banner500", dataMap.get("banner500"));
		mv.addObject("banner800", dataMap.get("banner800"));
		mv.addObject("banner1000", dataMap.get("banner1000"));
        
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		//RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getGuide3DepListAjax
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 모바일 > 테마카테고리 > 웨딩 > 메인 > 웨딩가이드 3depth 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 11.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/themecategory/guide3DepListAjax")
	public JSON getGuide3DepListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json 		= new JSON();
	
		List list 		= this.mWeddingService.getGuide3DepList(commandMap);
		json.addObject("list", list);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : estimateProcess
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 모바일  > 테마카테고리 > 웨딩 > 메인 > MD 추가혜택 견정 상담 등록 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 11.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @param PRD_MST_CDs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/themecategory/estimateProcess")
	public ModelAndView estimateProcess(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv		= new ModelAndView();
		
		int result = 0;
		String alertMsg = "에러가 발생했습니다.";
		
		String[] PRD_MST_CDs		= StringUtil.getString(commandMap.get("PRD_MST_CDs")).split(",");

		HttpSession session = request.getSession();
		
//       로그인 회원정보
      	User user = SessionsUser.getSessionUser(request);
		
      	if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			String strEsmMstType	= StringUtil.getString(commandMap.get("ESM_MST_TYPE"));
			
			session.setAttribute("ESM_MST_TYPE", strEsmMstType);
			
			commandMap.put("user", user);
			
			// -- 사용자 아이피
			String remote_addr = request.getRemoteAddr();
			commandMap.put("remote_addr", remote_addr);
					
			commandMap.put("MEM_CRT_DLV_GBN", 2096);
			commandMap.put("PRD_MST_CNL_MB_YN", "Y");
//			commandMap.put("ESM_MST_TYPE", session.getAttribute("ESM_MST_TYPE"));
			String strOldPrdMstCd	= "";
			
			if(PRD_MST_CDs.length > 0){
							
				for(int i=0; i < PRD_MST_CDs.length; i++){
					
					//System.out.println("PRD_MST_CDs::::::>" + PRD_MST_CDs[i]);
					String[] arrPrdMstCds	= PRD_MST_CDs[i].split("\\^");
					String strPrdMstCd		= arrPrdMstCds[0];		// 상품코드
					String strPrdDtlPrice	= arrPrdMstCds[1];		// 계산된 적용 금액
					String strOptIdx		= arrPrdMstCds[2];		// 옵션 IDX
					String strOptCnt		= arrPrdMstCds[3];		// 수량
					String strEstYN			= arrPrdMstCds[4];		// 필수 여부 
					
					commandMap.put("PRD_MST_CD", strPrdMstCd);
					commandMap.put("PRD_PRICE", strPrdDtlPrice);
//					commandMap.put("OPT_DTL_IDXs", strOptIdx);
					commandMap.put("REQUEST_CNT_" + strOptIdx, strOptCnt);
					commandMap.put("PRD_OPT_EST_YN", strEstYN);
					
					List<String> OPT_DTL_IDXs	= Arrays.asList(strOptIdx);
					commandMap.put("OPT_DTL_IDXs", OPT_DTL_IDXs);
					
					strOldPrdMstCd			= strPrdMstCd;
					
					// 재고 체크
					Map<String, Object> prdStock = this.cartService.selectPrdStock(commandMap, request);
					
					if((Integer)prdStock.get("result") > 0){//재고 있음
						// 장바구니 상품 추가
						result = this.pcEstimateManagementService.insertEsmCart(commandMap);
					}else{//재고 없음
						result = (Integer)prdStock.get("result");
						alertMsg = StringUtil.getString(prdStock.get("resultMsg"));
					}
				}
			}
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		
	
		//mv.addObject("alertMsg", alertMsg);
		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/product/myEstimateMain.do");
		mv.setViewName("/mobile/common/result");
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : weddingConList
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 모바일 > 테마카테고리 > 웨딩 > 컨테츠 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 12.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/themecategory/weddingConList")
	public ModelAndView weddingConList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		List list				= null;
		
		commandMap.put("CMN_COM_UP_IDX", 		"2251");
		commandMap.put("pageSize", 				"10");
		commandMap.put("searchMgzMstCtg", 		"2279");
		commandMap.put("searchMgzMstThmCtg1",	StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG1")));
		commandMap.put("searchMgzMstThmCtg2",	StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG2")));
		commandMap.put("searchMgzMstThmCtg3",	StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG3")));
		
		Map<String, Object> dataMap = this.mWeddingService.selectWeddingDepList(commandMap);
		
		mv.addObject("guide2DepList", dataMap.get("guide2DepList"));
		mv.addObject("guide3DepList", dataMap.get("guide3DepList"));
		
        int totalCount 		= this.mWeddingService.selectThemeGuideContentsListCount(commandMap);
        Paging paging 		= new Paging(totalCount, commandMap); 
        
        mv.addObject("paging", 				paging);
       
        if(totalCount > 0){
        	// 목록
        	list = this.mWeddingService.selectThemeGuideContentsList(commandMap);
        }
        
        mv.addObject("totalCount", 			totalCount);
        mv.addObject("list", 				list);
        mv.addObject("commandMap", 			commandMap);
        
        mv.setViewName("/mobile/themecategory/weddingConList");
        
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getWeddingContentsListAjax
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 모바일 > 테마카테고리 > 웨딩 > 메인 > 컨테츠 리스트 Ajax 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 11.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mobile/themecategory/weddingConListAjax", method = RequestMethod.POST)
	public JSON getWeddingConListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json 			= new JSON();
		
		Map resultMap		= new HashMap();
		List list			= null;
		
		commandMap.put("CMN_COM_UP_IDX", 		"2251");
		commandMap.put("pageSize", 				"10");
		commandMap.put("searchMgzMstCtg", 		"2279");
		commandMap.put("searchMgzMstThmCtg1",	StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG1")));
		commandMap.put("searchMgzMstThmCtg2",	StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG2")));
		commandMap.put("searchMgzMstThmCtg3",	StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG3")));
	
        int totalCount 		= this.mWeddingService.selectThemeGuideContentsListCount(commandMap);
        Paging paging 		= new Paging(totalCount, commandMap); 
        
        resultMap.put("paging"					, paging);
       
        if(totalCount>0){
        	// 목록
        	list = this.mWeddingService.selectThemeGuideContentsList(commandMap);
        }
        
        json.addObject("totalCount", 			totalCount);
        json.addObject("list", 					list);

        json.addObject("resultMap", 			resultMap);
        json.addObject("firstpageno", 			paging.getFirstPageNo());
        json.addObject("firstPageNoOnPageList", paging.getFirstPageNoOnPageList());
        json.addObject("totalPageCount",  		paging.getTotalPageCount());
        json.addObject("lastPageNoOnPageList", 	paging.getLastPageNoOnPageList());
        json.addObject("cPage", 				paging.getcPage());
        json.addObject("lastPageNo", 			paging.getLastPageNo());
        json.addObject("pageSize",  			paging.getPageSize());
        json.addObject("pagingSize", 			paging.getPagingSize());
        
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : weddingConView
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 모바일 > 테마카테고리 > 웨딩 > 메인 > 컨테츠 상세
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 12.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/themecategory/weddingConView")
	public ModelAndView weddingConView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv	= new ModelAndView();
		commandMap.put("DSP_MST_ENV", Code.CATEGORY_TYPE_MOBILE);
		
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
		
		Map<String,Object> info = this.mWeddingService.selectWeddingContenInfo(commandMap);
		List list				= this.mWeddingService.selectWeddingProductList(commandMap);
		
		mv.addObject("info", info);	
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/mobile/themecategory/weddingConView");
		
		return mv;
	}

	@RequestMapping("/mobile/themecategory/qnaReqAjax")
	public JSON qnaReqAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		String strResultMsg	= "";
		// 로그인 회원정보
//      User user = SessionsUser.getSessionUser(request);
//		
//      if(SessionsUser.isLogin(request) ){
//			commandMap.put("MEM_MST_MEMBER_GROUP", user.getMEM_MST_MEMBER_GROUP());
//			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
//			commandMap.put("MEM_LOGIN_YN", "Y");
//		}else{
//			commandMap.put("MEM_LOGIN_YN", "N");
//		}
		
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
		
		if(SessionsUser.isLogin(request) ){
			
			User user = SessionsUser.getSessionUser(request);
			
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			strResultMsg		= this.mWeddingService.qnaReqAjax(commandMap);
			
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			strResultMsg		= "로그인 후 등록 가능합니다.";
		}

		 json.addObject("resultMsg", strResultMsg);
		
		return json;
	}
}
