package com.market.mall.pc.theme.category.controller;

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
import com.market.mall.common.SessionsUser;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.product.service.EstimateManagementService;
import com.market.mall.pc.theme.category.service.SingleService;
import com.market.mall.pc.theme.category.service.WeddingService;

@Controller
public class SingleController {

	@Resource(name="pcSingleService")
	private SingleService pcSingleService;
	
	@Resource(name="pcEstimateManagementService") 
	private EstimateManagementService pcEstimateManagementService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private CartService cartService;
	
	@Resource(name="pcWeddingService")
    private WeddingService pcWeddingService;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : singleMain
	 * 2. ClassName : SingleController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 싱글 > 메인화면
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 2.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/singleMain")
	public ModelAndView singleMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv 			= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("PRD_MST_CNL_PC_YN", "Y");
		
		Map<String, Object> dataMap = this.pcSingleService.selectSinglegMain(commandMap);
		
		mv.setViewName("pc/themecategory/singleMain");
        
		mv.addObject("guide2DepList", dataMap.get("guide2DepList"));
		mv.addObject("guide3DepList", dataMap.get("guide3DepList"));
		mv.addObject("productList1", dataMap.get("productList1"));
		mv.addObject("productList2", dataMap.get("productList2"));
		mv.addObject("productList3", dataMap.get("productList3"));
		mv.addObject("banner1", dataMap.get("banner1"));
		mv.addObject("banner2", dataMap.get("banner2"));
		mv.addObject("banner3", dataMap.get("banner3"));
		
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
	 * 1. MethodName : singleConList
	 * 2. ClassName : SingleController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 싱글 > 컨테츠 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/singleConList")
	public ModelAndView singleConList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		List list				= null;
		
		String strCmnComIdx		= StringUtil.getString(commandMap.get("CMN_COM_IDX"));
		String searchKeyword	= StringUtil.getString(commandMap.get("searchKeyword"));
			
		// 컨테츠 클릭 
		if("".equals(searchKeyword) && !("").equals(strCmnComIdx)){
			Map	info				= this.pcWeddingService.selectCodeInfo(commandMap);
		
		}

		String strCmnComUpIdx	= StringUtil.getString(commandMap.get("MGZ_MST_THM_CTG1"), "2252") ;
	
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
        mv.setViewName("/pc/themecategory/singleConList");
        
		return mv;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : singleConView
	 * 2. ClassName : SingleController.java
	 * 3. Comment : 프론트 > 테마카테고리 > 싱글 > 메인 > 컨테츠 상세 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/singleConView")
	public ModelAndView singleConView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv	= new ModelAndView();
		commandMap.put("DSP_MST_ENV", Code.CATEGORY_TYPE_PC);
		
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
		
		Map<String,Object> info = this.pcWeddingService.selectWeddingContenInfo(commandMap);
		List list				= this.pcWeddingService.selectWeddingProductList(commandMap);
		
		mv.addObject("info", info);	
		mv.addObject("list", list);
		mv.addObject("commandMap", commandMap);
		mv.setViewName("pc/themecategory/singleConView");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : singleSearch
	 * 2. ClassName : SingleController.java
	 * 3. Comment : 싱글 카테고리 > 컨테츠 > 통합검색 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 12.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/themecategory/singleSearch")
	public ModelAndView singleSearch(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		request.setAttribute("themaCode", "2252"); //테마코드(wisenut)
        mv.setViewName("/pc/themecategory/singleSearch");
        
		return mv;
	}
}
