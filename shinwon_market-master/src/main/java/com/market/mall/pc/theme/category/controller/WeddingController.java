package com.market.mall.pc.theme.category.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.product.service.EstimateManagementService;
import com.market.mall.pc.theme.category.service.WeddingService;

/**
 * @PackageName: com.market.mall.pc.theme.category.controller
 * @FileName : WeddingController.java
 * @Date : 2016. 1. 11.
 * @프로그램 설명 : 프론트 > 테마카테고리 > 웨딩 Controller Class
 * @author Lee
 */
@Controller("pcWeddingController")
public class WeddingController {
	
	@Resource(name="pcWeddingService")
    private WeddingService pcWeddingService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	private CartService cartService;

	@Resource(name="pcEstimateManagementService") 
	private EstimateManagementService pcEstimateManagementService;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : weddingMain
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인화면 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 11.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/weddingMain")
	public ModelAndView weddingMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("PRD_MST_CNL_PC_YN", "Y");
		
		Map<String, Object> dataMap = this.pcWeddingService.selectWeddingMain(commandMap);
		
		mv.setViewName("pc/themecategory/weddingMain");
        
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
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인 > 웨딩가이드 3depth 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 11.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/guide3DepListAjax")
	public JSON getGuide3DepListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json = new JSON();
	
		List list 		= this.pcWeddingService.getGuide3DepList(commandMap);
		json.addObject("list", list);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getWeddingContentsListAjax
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인 > 컨테츠 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 11.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/weddingConListAjax")
	public JSON getWeddingConListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json 			= new JSON();
		
		Map resultMap		= new HashMap();
		List list			= null;
		
		commandMap.put("pageSize", 				"4");
		commandMap.put("searchMgzMstCtg", 		"2279");
		commandMap.put("searchMgzMstThmCtg1", 	"2251");
		
        int totalCount 		= this.pcWeddingService.selectThemeGuideContentsListCount(commandMap);
        Paging paging 		= new Paging(totalCount, commandMap); 
        
        resultMap.put("paging"					, paging);
       
        if(totalCount>0){
        	// 목록
        	list = this.pcWeddingService.selectThemeGuideContentsList(commandMap);
        }
        
        resultMap.put("totalCount", 			totalCount);
        resultMap.put("list", 					list);

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
		
	@RequestMapping("/pc/themecategory/cleanKingConListAjax")
	public JSON getCleanKingConListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json 			= new JSON();
		
		Map resultMap		= new HashMap();
		List list			= null;
		
		commandMap.put("pageSize", 				"4");
		commandMap.put("searchMgzMstCtg", 		"2279");
		commandMap.put("searchMgzMstThmCtg1", 	"2253");
		
        int totalCount 		= this.pcWeddingService.selectThemeGuideContentsListCount(commandMap);
        Paging paging 		= new Paging(totalCount, commandMap); 
        
        resultMap.put("paging"					, paging);
       
        if(totalCount>0){
        	// 목록
        	list = this.pcWeddingService.selectThemeGuideContentsList(commandMap);
        }
        
        resultMap.put("totalCount", 			totalCount);
        resultMap.put("list", 					list);

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
	 * 1. MethodName : estimateProcess
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 프론트  > 테마카테고리 > 웨딩 > 메인 > MD 추가혜택 견정 상담 등록 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 2.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/estimateProcess")
	public ModelAndView estimateProcess(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv		= new ModelAndView();
		
		int result = 0;
		String alertMsg = "에러가 발생했습니다.";
		
		String[] PRD_MST_CDs		= StringUtil.getString(commandMap.get("PRD_MST_CDs")).split(",");
		
		HttpSession session = request.getSession();
		
     // 로그인 회원정보
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
						
		commandMap.put("MEM_CRT_DLV_GBN", 2096);
		commandMap.put("PRD_MST_CNL_PC_YN", "Y");

		String strOldPrdMstCd	= "";
		
		String strEsmMstType	= StringUtil.getString(commandMap.get("ESM_MST_TYPE"));
		session.setAttribute("ESM_MST_TYPE", strEsmMstType);
		
		if(PRD_MST_CDs.length > 0){

//			String[] TEMP_OPT_DTL_IDXx = new String[PRD_MST_CDs.length];
		
			for(int i=0; i < PRD_MST_CDs.length; i++){
				
				String[] arrPrdMstCds	= PRD_MST_CDs[i].split("\\^");
				String strPrdMstCd		= arrPrdMstCds[0];		// 상품코드
				String strPrdDtlPrice	= arrPrdMstCds[1];		// 계산된 적용 금액
				String strOptIdx		= arrPrdMstCds[2];		// 옵션 IDX
				String strOptCnt		= arrPrdMstCds[3];		// 수량
				String strEstYN			= arrPrdMstCds[4];		// 필수 여부 
						
				commandMap.put("PRD_MST_CD", strPrdMstCd);
				commandMap.put("PRD_PRICE", strPrdDtlPrice);
//				commandMap.put("OPT_DTL_IDXs", strOptIdx);
				commandMap.put("REQUEST_CNT_" + strOptIdx, strOptCnt);
				commandMap.put("PRD_OPT_EST_YN", strEstYN);
				
				List<String> OPT_DTL_IDXs	= Arrays.asList(strOptIdx);
				commandMap.put("OPT_DTL_IDXs", OPT_DTL_IDXs);
				
				strOldPrdMstCd			= strPrdMstCd;
				
				// 재고 체크
				Map<String, Object> prdStock = this.cartService.selectPrdStock(commandMap, request);
				
//				System.out.println(strPrdMstCd + "::::::>" + (Integer)prdStock.get("result"));
				if((Integer)prdStock.get("result") > 0){//재고 있음
					// 장바구니 상품 추가
					result = this.pcEstimateManagementService.insertEsmCart(commandMap);
				}else{//재고 없음
					result = (Integer)prdStock.get("result");
					alertMsg = StringUtil.getString(prdStock.get("resultMsg"));
				}
			}
			
		}
		
		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/product/myEstimateMain.do");
		mv.setViewName("/pc/common/result");
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : weddingConList
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 컨테츠 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 2.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/weddingConList")
	public ModelAndView weddingConList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		List list				= null;
		
		String strCmnComIdx		= StringUtil.getString(commandMap.get("CMN_COM_IDX"));
		String searchKeyword	= StringUtil.getString(commandMap.get("searchKeyword"));
			
		// 컨테츠 클릭 
		if("".equals(searchKeyword) && !("").equals(strCmnComIdx)){
			Map	info				= this.pcWeddingService.selectCodeInfo(commandMap);
		}

		String strCmnComUpIdx	= StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG1"), "2251") ;
		
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
        
        mv.setViewName("/pc/themecategory/weddingConList");
        
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getThemeConView
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인 > 컨테츠 상세 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 2.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/weddingConView")
	public ModelAndView weddingConView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv	= new ModelAndView();
		commandMap.put("DSP_MST_ENV", Code.CATEGORY_TYPE_PC);
		
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
		
		Map<String,Object> info = this.pcWeddingService.selectWeddingContenInfo(commandMap);
		List list				= this.pcWeddingService.selectWeddingProductList(commandMap);
		
		mv.addObject("info", info);	
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap);
		mv.setViewName("pc/themecategory/weddingConView");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : weddingSearch
	 * 2. ClassName : WeddingController.java
	 * 3. Comment : 웨딩 카테고리 > 컨테츠 > 통합검색  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 12.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/weddingSearch")
	public ModelAndView weddingSearch(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		request.setAttribute("themaCode", "2251");  //테마코드(wisenut)
        mv.setViewName("/pc/themecategory/weddingSearch");
        
		return mv;
	}
	
}
