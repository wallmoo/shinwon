package com.market.mall.mobile.theme.category.controller;

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
import com.market.mall.mobile.theme.category.service.SingleService;
import com.market.mall.mobile.theme.category.service.WeddingService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.product.service.EstimateManagementService;

/**
 * @PackageName: com.market.mall.mobile.theme.category.controller
 * @FileName : SingleController.java
 * @Date : 2016. 2. 15.
 * @프로그램 설명 : 모바일 > 테마카테고리 > 싱글 Controller Class
 * @author Lee
 */
@Controller("mSingleController")
public class SingleController {

	@Resource(name="mSingleService")
	private SingleService mSingleService;
	
	@Resource(name="pcEstimateManagementService") 
	private EstimateManagementService pcEstimateManagementService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private CartService cartService;
	
	@Resource(name="mWeddingService")
    private WeddingService mWeddingService;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : singleMain
	 * 2. ClassName : SingleController.java
	 * 3. Comment : 모바일 > 테마카테고리 > 싱글 > 메인화면 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/themecategory/singleMain")
	public ModelAndView singleMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv 			= new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		
		Map<String, Object> dataMap = this.mSingleService.selectSinglegMain(commandMap);
		
		mv.setViewName("mobile/themecategory/singleMain");
        
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
	 * 3. Comment : 모바일 > 테마카테고리 > 싱글 > 컨테츠 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/themecategory/singleConList")
	public ModelAndView singleConList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		List list				= null;
		
		commandMap.put("CMN_COM_UP_IDX", 		"2252");
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
        
        mv.setViewName("/mobile/themecategory/singleConList");
        
		return mv;
	}
	
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getWeddingConListAjax
	 * 2. ClassName : SingleController.java
	 * 3. Comment : 모바일 > 테마카테고리 > 싱글 > 메인 > 컨테츠 리스트 Ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mobile/themecategory/singleConListAjax", method = RequestMethod.POST)
	public JSON getSingleConListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json 			= new JSON();
		
		Map resultMap		= new HashMap();
		List list			= null;
		
		commandMap.put("CMN_COM_UP_IDX", 		"2252");
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
	 * 1. MethodName : getSingleConView
	 * 2. ClassName : SingleController.java
	 * 3. Comment : 모바일 > 테마카테고리 > 싱글 > 메인 > 컨테츠 상세
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/themecategory/singleConView")
	public ModelAndView getSingleConView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv	= new ModelAndView();
		commandMap.put("DSP_MST_ENV", Code.CATEGORY_TYPE_MOBILE);
		
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
		
		Map<String,Object> info = this.mWeddingService.selectWeddingContenInfo(commandMap);
		List list				= this.mWeddingService.selectWeddingProductList(commandMap);
		
		mv.addObject("info", info);	
		mv.addObject("list", list);
		
		mv.setViewName("mobile/themecategory/singleConView");
		
		return mv;
	}
}
