package com.market.mall.pc.theme.category.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.product.service.EstimateManagementService;
import com.market.mall.pc.theme.category.service.CleanKingService;
import com.market.mall.pc.theme.category.service.WeddingService;

@Controller
public class CleanKingController {
	
	@Resource(name="pcWeddingService")
    private WeddingService pcWeddingService;

	@Resource(name="pcEstimateManagementService") 
	private EstimateManagementService pcEstimateManagementService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="pcCleanKingService")
	private CleanKingService pcCleanKingService;
	
	@Resource
	private CartService cartService;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : cleanKingMain
	 * 2. ClassName : CleanKingController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 클린킹  Controller Class
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 3.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/cleanKingMain")
	public ModelAndView cleanKingMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv 			= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("PRD_MST_CNL_PC_YN", "Y");
		commandMap.put("MENU", "CLEAN");
		
		Map<String, Object> dataMap = this.pcCleanKingService.selectCleanKingMain(commandMap);
		
		mv.setViewName("pc/themecategory/cleanKingMain");
        
		mv.addObject("guide2DepList", 	dataMap.get("guide2DepList"));
		mv.addObject("guide3DepList", 	dataMap.get("guide3DepList"));
		mv.addObject("productList", 	dataMap.get("productList"));
		mv.addObject("movieList", 		dataMap.get("movieList"));
		mv.addObject("issueList", 		dataMap.get("issueList"));
		
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
	 * 1. MethodName : directPurchaseProcess
	 * 2. ClassName : CleanKingController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 클린킹 > 바로구매
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 3.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/directPurchaseProcess")
	public JSON directPurchaseProcess(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
		JSON json = new JSON();
		
		int result = 0;
		String alertMsg = "에러가 발생했습니다.";
		
		String[] PRD_MST_CDs		= StringUtil.getString(commandMap.get("PRD_MST_CDs")).split(",");
		
		User user = SessionsUser.getSessionUser(request);
//		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
		
		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
				
		commandMap.put("MEM_CRT_DLV_GBN", 2098);			// 무형 배송
		commandMap.put("PRD_MST_CNL_PC_YN", "Y");
		
		String strOldPrdMstCd	= "";
		
//		if("Y".equals(commandMap.get("MEM_LOGIN_YN"))){
			
			if(PRD_MST_CDs.length > 0){
				
				// 기존에 담겨져있던 바로구매 상품은 삭제한다.
				result  = this.pcCleanKingService.deleteDirectCart(commandMap);
	//			String[] TEMP_OPT_DTL_IDXx = new String[PRD_MST_CDs.length];
				List<String> memCrtIdxList = new ArrayList<String>();
				
				for(int i=0; i < PRD_MST_CDs.length; i++){
					
					String[] arrPrdMstCds	= PRD_MST_CDs[i].split("\\^");
					String strPrdMstCd		= arrPrdMstCds[0];		// 상품코드
					String strPrdDtlPrice	= arrPrdMstCds[1];		// 계산된 적용 금액
					String strOptIdx		= arrPrdMstCds[2];		// 옵션 IDX
					String strOptCnt		= arrPrdMstCds[3];		// 수량
					String strEstYN			= arrPrdMstCds[4];		// 필수 여부 
					
					if(i != 0 && strOldPrdMstCd.equals(strPrdMstCd) && ("N").equals(strEstYN) && !("0").equals(strOptIdx)) {
						commandMap.put("MEM_CRT_UP_IDX", 	strOldPrdMstCd);
					}
	
					commandMap.put("PRD_MST_CD", strPrdMstCd);
					commandMap.put("PRD_PRICE", strPrdDtlPrice);
	//				commandMap.put("OPT_DTL_IDXs", strOptIdx);
					commandMap.put("REQUEST_CNT_" + strOptIdx, strOptCnt);
					commandMap.put("PRD_OPT_EST_YN", strEstYN);
					
	//				TEMP_OPT_DTL_IDXx[i]		= strOptIdx;
					List<String> OPT_DTL_IDXs	= Arrays.asList(strOptIdx);
					commandMap.put("OPT_DTL_IDXs", OPT_DTL_IDXs);
					
					// 재고 체크
					Map<String, Object> prdStock = this.cartService.selectPrdStock(commandMap, request);
					
//					System.out.println(strPrdMstCd + "::::::>" + prdStock);
					if((Integer)prdStock.get("result") > 0){//재고 있음
						// 장바구니 상품 추가
						result = this.pcCleanKingService.insertDirectPurchase(commandMap);
						memCrtIdxList.add(String.valueOf(result));
					}else{//재고 없음
						result = (Integer)prdStock.get("result");
						alertMsg = StringUtil.getString(prdStock.get("resultMsg"));
					}
				}
				
				// memCrtIdxList 나중에 로직 추가
				
				// 임시 주문 생성
				commandMap.put("MEM_CRT_IDXs", memCrtIdxList);
				String ORD_MST_CD = this.pcCleanKingService.insertTempOrder(commandMap);
				
				if(!"".equals(ORD_MST_CD)){
					commandMap.put("ORD_MST_CD", ORD_MST_CD);
					result = 1;
				}else{
					result = -2;
				}
				
				json.addObject("result", result);
				json.addObject("resultMsg", alertMsg);
				json.addObject("ORD_MST_CD", ORD_MST_CD);
			}
//		}else{
//			json.addObject("result", -3);
//			json.addObject("resultMsg", "로그인이 필요한 서비스입니다.");
//		}
//		

		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertCartAjax
	 * 2. ClassName : CleanKingController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 클린킹 > 장바구니
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 4.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping(value = "/pc/themecategory/insertCartAjax.do", method = RequestMethod.POST)
	public JSON insertCartAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		
		JSON json = new JSON();
		
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
				
		String[] PRD_MST_CDs		= StringUtil.getString(commandMap.get("PRD_MST_CDs")).split(",");
		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);

		// -- 세션정보 (비회원으로 장바구니에 넣으면 session_id로 저장되고, 로그인 시 session_id가 MEM_CRT_SES_ID = ''로 update 하고  MEM_MST_MEM_ID = '회원아이디' 로 update
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
		
		commandMap.put("MEM_CRT_DLV_GBN", 2098);			// 무형 배송
		commandMap.put("PRD_MST_CNL_PC_YN", "Y");
		
		String strOldPrdMstCd	= "";
		
//		if("Y".equals(commandMap.get("MEM_LOGIN_YN"))){
			
			if(PRD_MST_CDs.length > 0){
				
				// 기존에 담겨져있던 바로구매 상품은 삭제한다.
//				result  = this.pcCleanKingService.deleteDirectCart(commandMap);
	//			String[] TEMP_OPT_DTL_IDXx = new String[PRD_MST_CDs.length];
				List<String> memCrtIdxList = new ArrayList<String>();
				
				for(int i=0; i < PRD_MST_CDs.length; i++){
					
					String[] arrPrdMstCds	= PRD_MST_CDs[i].split("\\^");
					String strPrdMstCd		= arrPrdMstCds[0];		// 상품코드
					String strPrdDtlPrice	= arrPrdMstCds[1];		// 계산된 적용 금액
					String strOptIdx		= arrPrdMstCds[2];		// 옵션 IDX
					String strOptCnt		= arrPrdMstCds[3];		// 수량
					String strEstYN			= arrPrdMstCds[4];		// 필수 여부 
					
					if(i != 0 && strOldPrdMstCd.equals(strPrdMstCd) && ("N").equals(strEstYN) && !("0").equals(strOptIdx)) {
						commandMap.put("MEM_CRT_UP_IDX", 	strOldPrdMstCd);
					}
	
					commandMap.put("PRD_MST_CD", strPrdMstCd);
					commandMap.put("PRD_PRICE", strPrdDtlPrice);
	//				commandMap.put("OPT_DTL_IDXs", strOptIdx);
					commandMap.put("REQUEST_CNT_" + strOptIdx, strOptCnt);
					commandMap.put("PRD_OPT_EST_YN", strEstYN);
					
	//				TEMP_OPT_DTL_IDXx[i]		= strOptIdx;
					List<String> OPT_DTL_IDXs	= Arrays.asList(strOptIdx);
					commandMap.put("OPT_DTL_IDXs", OPT_DTL_IDXs);
					
					// 재고 체크
					Map<String, Object> prdStock = this.cartService.selectPrdStock(commandMap, request);
					
					if((Integer)prdStock.get("result") > 0){//재고 있음
						// 장바구니 상품 추가
						result = this.pcCleanKingService.insertCart(commandMap);
					}else{//재고 없음
						result = (Integer)prdStock.get("result");
						resultMsg = StringUtil.getString(prdStock.get("resultMsg"));
					}
				}
			}
			
			json.addObject("result", result);
			json.addObject("resultMsg", resultMsg);

			// 카트 수량 가져오기
			Map<String, Object> paramMap = new HashMap<String, Object>();
			if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
				paramMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			}
			paramMap.put("MEM_CRT_SES_ID", (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id")));
			// 상품 채널 타입
			paramMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
			json.addObject("cartCnt", String.valueOf(this.cartService.selectCartCnt(paramMap)));
			
//		}else{
//			json.addObject("result", -3);
//			json.addObject("resultMsg", "로그인이 필요한 서비스입니다.");
//		}
		    	
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : cleanKingConList
	 * 2. ClassName : CleanKingController.java
	 * 3. Comment :프론트 > 테마카테고리 > 클린킹 > 메인 > 컨테츠 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/cleanKingConList")
	public ModelAndView cleanKingConList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		List list				= null;
		
		String strCmnComIdx		= StringUtil.getString(commandMap.get("CMN_COM_IDX"));
		String searchKeyword	= StringUtil.getString(commandMap.get("searchKeyword"));
			
		// 컨테츠 클릭 
		if("".equals(searchKeyword) && !("").equals(strCmnComIdx)){
			Map	info				= this.pcWeddingService.selectCodeInfo(commandMap);
		
		}

		String strCmnComUpIdx	= StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG1"), "2253") ;
		commandMap.put("CMN_COM_UP_IDX", 		strCmnComUpIdx);
		commandMap.put("pageSize", 				"16");
		commandMap.put("searchMgzMstCtg", 		"2279");
		commandMap.put("searchMgzMstThmCtg1",	strCmnComUpIdx);
		commandMap.put("searchMgzMstThmCtg2",	StringUtil.getString(commandMap.get("searchMgzMstThmCtg2"), ""));
		commandMap.put("searchMgzMstThmCtg3",	StringUtil.getString(commandMap.get("searchMgzMstThmCtg3"), ""));
		

		Map<String, Object> dataMap = this.pcWeddingService.selectWeddingDepList(commandMap);
		
		mv.addObject("guide2DepList", dataMap.get("guide2DepList"));
		mv.addObject("guide3DepList", dataMap.get("guide3DepList"));
		
        int totalCount 		= this.pcWeddingService.selectThemeGuideContentsListCount(commandMap);
        Paging paging 		= new Paging(totalCount, commandMap); 
        
        mv.addObject("paging", 				paging);
       
        if(totalCount > 0){
        	// 목록
        	list = this.pcWeddingService.selectThemeGuideContentsList(commandMap);
        }
        
        mv.addObject("totalCount", 			totalCount);
        mv.addObject("list", 				list);
        mv.addObject("commandMap", 			commandMap);
        
        mv.setViewName("/pc/themecategory/cleanKingConList");
        
		return mv;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : cleanKingConView
	 * 2. ClassName : CleanKingController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 클린킹 > 메인 > 컨테츠 상세 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/cleanKingConView")
	public ModelAndView cleanKingConView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv	= new ModelAndView();
		commandMap.put("DSP_MST_ENV", Code.CATEGORY_TYPE_PC);
		
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
		
		Map<String,Object> info = this.pcWeddingService.selectWeddingContenInfo(commandMap);
		List list				= this.pcWeddingService.selectWeddingProductList(commandMap);
		
		mv.addObject("info", info);	
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap);
		mv.setViewName("pc/themecategory/cleanKingConView");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : cleanKingSearch
	 * 2. ClassName : CleanKingController.java
	 * 3. Comment : 클린킹 > 컨테츠 > 통합검색  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 12.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/cleanKingSearch")
	public ModelAndView cleanKingSearch(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		request.setAttribute("themaCode", "2253"); //테마코드(wisenut)
        mv.setViewName("/pc/themecategory/cleanKingSearch");
        
		return mv;
	}
}

