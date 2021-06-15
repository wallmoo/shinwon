package com.market.mall.pc.customer.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.model.Code;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.ShoppingGuideBoardService;

/**
 * @PackageName: com.market.mall.pc.customer.controller
 * @FileName : ShoppingGuideBoardController.java
 * @Date : 2014. 7. 23.
 * @프로그램 설명 : 프론트 > 고객센터 > 쇼핑/상품가이드 처리하는 Controller Class
 * @author kanghk
 */
@Controller("pcShoppingGuideBoardController")
public class ShoppingGuideBoardController {
	
	@Resource(name="pcShoppingGuideBoardService")
    private ShoppingGuideBoardService pcShoppingGuideBoardService;
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
//	/**
//	* <pre>
//	* 1. MethodName : shoppingGuideMain
//	* 2. ClassName  : ShoppingGuideBoardController.java
//	* 3. Comment    : 쇼핑 가이드 메인
//	* 4. 작성자       : kanghk
//	* 5. 작성일       : 2014. 7. 23.
//	* </pre>
//	*
//	* @param request
//	* @param commandMap
//	* @return
//	* @throws Exception
//	*/
//	@RequestMapping("/pc/customer/shoppingGuideMain")
//    public ModelAndView shoppingGuideMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        ModelAndView mv = new ModelAndView();
//        
//        // 브랜드 코드 가져오기
//        commandMap.put("BRD_SHG_BRAND_CD", request.getAttribute("serverBrandCd"));
//
//        // 쇼핑 가이드 목록
//        commandMap.put("productTechInfoIdx", Code.COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO);//상품기술정보는 제외하고 가져온다.
//        mv.addObject("shoppingGuideList", this.pcShoppingGuideBoardService.selectShoppingGuideBoardList(commandMap));
//        
//        // 해당 브랜드로 이동
//        mv.setViewName("pc/customer/shoppingGuideMain");
//        
//        //RETURN OBJECT
//        mv.addObject("commandMap", commandMap);
//        return mv;
//    }
//	
//	/**
//	* <pre>
//	* 1. MethodName : shoppingGuideDetailAjax
//	* 2. ClassName  : ShoppingGuideBoardController.java
//	* 3. Comment    : 쇼핑가이드 상세
//	* 4. 작성자       : kanghk
//	* 5. 작성일       : 2014. 7. 23.
//	* </pre>
//	*
//	* @param request
//	* @param commandMap
//	* @return
//	* @throws Exception
//	*/
//	@RequestMapping("/pc/customer/shoppingGuideDetailAjax")
//    public ModelAndView shoppingGuideDetailAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        ModelAndView mv = new ModelAndView();
//        
//        if(!"".equals(StringUtil.getString(commandMap.get("BRD_SHG_IDX"), "")))
//        {
//            // 쇼핑 가이드 상세정보
//            mv.addObject("row", this.pcShoppingGuideBoardService.selectShoppingGuideBoardInfo(commandMap));
//        }
//        
//        //RETURN OBJECT
//        mv.addObject("commandMap", commandMap);
//        return mv;
//    }
//	
//	/**
//	 * 
//	 * <pre>
//	 * 1. MethodName	: shoppingGuideBoardPopup
//	 * 2. ClassName		: ShoppingGuideBoardController.java
//	 * 3. Commnet		: 쇼핑가이드 팝업 
//	 * 4. 작성자			: LeeJongHo
//	 * 5. 작성일			: 2014. 8. 29. 오후 1:40:22
//	 * </pre>
//	 *
//	 * @return ModelAndView
//	 * @param request
//	 * @param commandMap
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/pc/customer/shoppingGuideBoardPopup")
//    public ModelAndView shoppingGuideBoardPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        ModelAndView mv = new ModelAndView();
//        
//        if(!"".equals(StringUtil.getString(commandMap.get("BRD_SHG_IDX"), "")))
//        {
//            mv.addObject("row", this.pcShoppingGuideBoardService.selectShoppingGuideBoardInfo(commandMap));
//        }
//        
//        mv.addObject("commandMap", commandMap);
//        return mv;
//    }
//
//	/**
//	* <pre>
//	* 1. MethodName : productGuideMain
//	* 2. ClassName  : ShoppingGuideBoardController.java
//	* 3. Comment    : 상품가이드 메인
//	* 4. 작성자       : kanghk
//	* 5. 작성일       : 2014. 7. 23.
//	* </pre>
//	*
//	* @param request
//	* @param commandMap
//	* @return
//	* @throws Exception
//	*/
//	@RequestMapping("/pc/customer/productGuideMain")
//    public ModelAndView productGuideMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        ModelAndView mv = new ModelAndView();
//
//        // 상품가이드 목록
//        mv.addObject("subCategoryList", this.pcCommonService.selectCode("COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO"));
//        
//        //RETURN OBJECT
//        mv.addObject("commandMap", commandMap);
//        return mv;
//    }
//	
//	/**
//	* <pre>
//	* 1. MethodName : productGuideDetailAjax
//	* 2. ClassName  : ShoppingGuideBoardController.java
//	* 3. Comment    : 상품 가이드 상세 
//	* 4. 작성자       : kanghk
//	* 5. 작성일       : 2014. 7. 23.
//	* </pre>
//	*
//	* @param request
//	* @param commandMap
//	* @return
//	* @throws Exception
//	*/
//	@RequestMapping("/pc/customer/productGuideDetailAjax")
//    public ModelAndView productGuideDetailAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        ModelAndView mv = new ModelAndView();
//        
//        if(!"".equals(StringUtil.getString(commandMap.get("BRD_CMN_COM_SUB_IDX"), "")))
//        {
//            // 상품 가이드 상세정보
//            mv.addObject("detailList", this.pcShoppingGuideBoardService.selectProductGuideBoardInfoList(commandMap));
//        }
//        
//        //RETURN OBJECT
//        mv.addObject("commandMap", commandMap);
//        return mv;
//    }
	
}
