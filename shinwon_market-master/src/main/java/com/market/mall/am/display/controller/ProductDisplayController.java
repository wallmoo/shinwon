package com.market.mall.am.display.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.display.service.ProductDisplayService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.util.MakeCategoryHtmlUtil;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.display.controller
 * @FileName : ProductDisplayController.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Controller Class
 * @author 이미정
 */
@SuppressWarnings("restriction")
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class ProductDisplayController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="productDisplayService")
    private ProductDisplayService productDisplayService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    /**
    * <pre>
    * 1. MethodName : productDisplayView
    * 2. ClassName  : ProductDisplayController.java
    * 3. Comment    : 관리자 > 전시관리 > 상품관리 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/productDisplayView")
    public ModelAndView productDisplayView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
       // pc/mobile 구분
       String searchGubun = StringUtil.getString(commandMap.get("searchGubun"),"P");
       
       int PRD_CTG_ENV = Code.COMMON_PRODUCT_DISPLAY_PC;
       
       if("P".equals(searchGubun))
       {
       	PRD_CTG_ENV = Code.COMMON_PRODUCT_DISPLAY_PC;//default는 MarketPlant pc
       }
       else
       {
       	PRD_CTG_ENV = Code.COMMON_PRODUCT_DISPLAY_MOBILE;	// mobile
       }
       
        commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV);
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("searchGubun", searchGubun);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : productDisplayAjax
    * 2. ClassName  : ProductDisplayController.java
    * 3. Comment    : 관리자 > 전시관리 > 상품관리 트리 목록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/productDisplayAjax")
    public JSON productDisplayAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        commandMap.put("CODE", commandMap.get("PRODUCT_DISPLAY_ENV" ) );
        List<Map<String, Object>> list = this.productDisplayService.selectProductDisplayCodeList(commandMap);
        String categoryHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        
        //RETURN OBJECT
        json.put("productList", categoryHtml);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : productDisplayList
    * 2. ClassName  : ProductDisplayController.java
    * 3. Comment    : 관리자 > 전시관리 > 상품관리 목록  
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
	@RequestMapping("/am/display/productDisplayList")
    public ModelAndView productDisplayList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
        {
            String searchBnrMstTitle = StringUtil.getString(commandMap.get("searchBnrMstTitle"), "");
            if(!"".equals(searchBnrMstTitle))
            {
                BASE64Decoder decoder = new BASE64Decoder();
                searchBnrMstTitle = new String(decoder.decodeBuffer(searchBnrMstTitle));
                commandMap.put("searchBnrMstTitle", searchBnrMstTitle);
            }
            commandMap.put("PRODUCT_THUMBNAIL_IMAGE_WIDTH", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
            
            // 배너관리 목록 갯수
            int totalCount = this.productDisplayService.selectProductDisplayListCount(commandMap);
            
            Paging paging = new Paging(totalCount, commandMap);
            mv.addObject( "paging", paging );
            
            List<Map<String, Object>> list = null;
            if (totalCount > 0){
                
                // 상품관리 목록
                list = this.productDisplayService.selectProductDisplayList(commandMap);
            }
            
            // 상위배너카테고리
            List<Map<String, Object>> productCatList = this.productDisplayService.selectProductCatCodeList(commandMap);
            
            mv.addObject("totalCount", totalCount);
            mv.addObject("productCatList", productCatList);
            mv.addObject("commandMap", commandMap);
            mv.addObject("list", list);
        }        
        return mv;
    }
    
	@RequestMapping("/am/display/productDisplayCatTabList")
    public ModelAndView productDisplayCatTabList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if("".equals(StringUtil.getString(commandMap.get("PRD_CTG_IDX"), ""))){
        	return mv;
        }
        commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        commandMap.put("PRD_CTG_IDX", StringUtil.getString(commandMap.get("PRD_CTG_IDX"), ""));
        
        List<Map<String, Object>> tabList = this.productDisplayService.selectDisplayCatTabList(commandMap);
        String[] dspTabType = new String[2];
        for(int index = tabList.size()-1; index >= 0; index--) {
        	if("T".equals(tabList.get(index).get("DSP_TAB_TYP"))) {
        		dspTabType[0] = tabList.get(index).get("DSP_TAB_IDX").toString();
        	}
        	else if("N".equals(tabList.get(index).get("DSP_TAB_TYP"))) {
        		dspTabType[1] = tabList.get(index).get("DSP_TAB_IDX").toString();
        	}
        }
        
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("THUMBNAIL_SIZE", commandMap.get("THUMBNAIL_SIZE"));
        param.put("PRD_CTG_IDX", commandMap.get("PRD_CTG_IDX"));
        param.put("DSP_TAB_IDXs", dspTabType);
        
        List<Map<String, Object>> productList = this.productDisplayService.selectDisplayCatTabProductList(param);
        
        List<Map<String, Object>> productCatList = this.productDisplayService.selectProductCatCodeList(commandMap);
        mv.addObject("productCatList", productCatList);
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("tabList", tabList);
        mv.addObject("productList", productList);
           
        return mv;
    }
	
    /**
     * @api {POST} /am/display/productDisplayTabRegistAjax.do
     * @apiName 탭 추가 Ajax
     * @apiGroup SB전시상품관리
     *
     * @apiParam {String} PRD_CTG_IDX 카테고리 IDX
     * @apiParam {String} DSP_TAB_USE_YN 탭 사용여부 
     * @apiParam {String} DSP_TAB_TYP 탭 타입(T/N)
     * @apiParam {String} DSP_TAB_NM 탭 이름
     *
     * @apiSuccess {String} resultCode 200(성공)
     * @apiSuccess {String} resultCode 300(실패)
     * @apiSuccess {String} DSP_TAB_IDX 생성된 탭 IDX
     */
	@RequestMapping("/am/display/productDisplayTabRegistAjax")
    public JSON productDisplayTabRegistAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		
		int displayTabIdx = 0;
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		
		commandMap.put("DSP_TAB_REG_IP", request.getRemoteAddr());
        commandMap.put("DSP_TAB_REG_ID", admin.getADM_MST_ID());
		
		displayTabIdx = this.productDisplayService.insertDisplayTab(commandMap);
		
		if(displayTabIdx > 0){
		    result.put("resultCode", "200");
		    result.put("DSP_TAB_IDX", StringUtil.getString(displayTabIdx));
		} else{
		    result.put("resultCode", "300");
		}

        return result;
    }
	
	
	@RequestMapping("/am/display/productDisplayTabProductListAjax")
    public JSON productDisplayTabProductListAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		
		commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
		
		List<Map<String, Object>> productList = this.productDisplayService.selectDisplayTapProductList(commandMap);
		
		if(productList != null){
		    result.put("resultCode", "200");
		    result.put("productList", productList);
		} else{
		    result.put("resultCode", "300");
		}
        return result;
    }
	 /**
     * @api {POST} /am/display/productDisplayTabProductRegistAjax.do
     * @apiName 탭별 상품 등록
     * @apiGroup SB전시상품관리
     *
     * @apiParam {String} DSP_TAB_IDX 탭 IDX
     * @apiParam {String} PRD_MST_CD 상품코드
     * @apiParam {String} DSP_MST_TXT 전시상품 타이틀
     * @apiParam {String} DSP_MST_SRT 전시순서
     * @apiParam {String} DSP_MST_USE_YN 사용여부
     *
     * @apiSuccess {String} resultCode 200(성공)
     * @apiSuccess {String} resultCode 300(실패)
     * @apiSuccess {Object} product {DSP_MST_IDX, PRD_MST_CD=S0011984, DSP_MST_REG_DT=2020041000412, DSP_TAB_TYP=T, DSP_MST_TXT=상품테스트, PRD_MST_SEL_STATE=I(I:판매중,T:품절,S미판매), DSP_MST_USE_YN=Y, PRD_IMAGE = 썸네일이미지}
     */
	@RequestMapping("/am/display/productDisplayTabProductRegistAjax")
    public JSON productDisplayTabProductRegistAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		Map<String, Object> product = new HashMap<String, Object>();
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		
		commandMap.put("DSP_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("DSP_MST_REG_ID", admin.getADM_MST_ID());
        commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        
		int insertResult = this.productDisplayService.insertDisplayTabProduct(commandMap);
		if(insertResult > 0){
		    
		    product = this.productDisplayService.selectProductTabDisplayInfo(commandMap);
		    
		    result.put("resultCode", "200");
		    result.put("product", product);
		} else {
		    result.put("resultCode", "300");
		}
        return result;
    }
	
	@RequestMapping("/am/display/productDisplayTabProductDelAjax")
    public JSON productDisplayTabProductDelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		
		int deleteResult = 0;
		String sJsonArrDSP_MST_IDX = StringUtil.getString(commandMap.get("arrDSP_MST_IDX"),"");
		TypeReference<List<String>> typeRef = new TypeReference<List<String>>(){};
		ObjectMapper mapper = new ObjectMapper();
        List<String> arrDSP_MST_IDX = mapper.readValue(sJsonArrDSP_MST_IDX, typeRef);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("arrDSP_MST_IDX", arrDSP_MST_IDX);
		deleteResult = this.productDisplayService.deleteTabProductDisplay(param);
		
		if(deleteResult >0){
		    result.put("resultCode", "200");
		} else {
		    result.put("resultCode", "300");
		}
		return result;
    }
	
	@RequestMapping("/am/display/productDisplayTabDelAjax")
    public JSON productDisplayTabDelAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		
		int deleteResult = 0;
		deleteResult = this.productDisplayService.deleteProductDisplayTab(commandMap);
		
		if(deleteResult > 0){
		    result.put("resultCode", "200");
		} else {
		    result.put("resultCode", "300");
		}
		return result;
    }
	
	@RequestMapping("/am/display/productDisplayTabProductEditAjax")
    public JSON productDisplayTabProductEditAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		int updateResult = 0;
		
		updateResult = this.productDisplayService.updateProductDisplayTab(commandMap);
		
		if(updateResult > 0){
		    result.put("resultCode", "200");  
		} else {
		    result.put("resultCode", "300");  
		}
			
		return result;
    }
	
    /**
    * <pre>
    * 1. MethodName : productDisplayRegist
    * 2. ClassName  : ProductDisplayController.java
    * 3. Comment    : 관리자 > 전시관리 > 상품관리 등록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/productDisplayRegist")
    public ModelAndView productDisplayRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="REG_DSP_MST_IDX") String[] REG_DSP_MST_IDX
    		, @RequestParams(value="DSP_MST_TXTs") String[] DSP_MST_TXTs) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String PRD_CTG_ENV = StringUtil.getString(commandMap.get("PRD_CTG_ENV"), "");
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            commandMap.put("arrDSP_MST_IDX", REG_DSP_MST_IDX);
            commandMap.put("arrDSP_MST_TXTs", DSP_MST_TXTs);
            
        	Admin admin = SessionsAdmin.getSessionAdmin(request);
        	commandMap.put("DSP_CTG_REG_IP", request.getRemoteAddr());
            commandMap.put("DSP_CTG_REG_ID", admin.getADM_MST_ID());
            
            // 관리자 관리 관리자 등록
            int result = this.productDisplayService.insertProductDisplay(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/productDisplayView.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/productDisplayView.do");
            }
            commandMap.clear();
            commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
            commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV);
            commandMap.put("searchGubun", searchGubun);
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : productDisplayRemove
    * 2. ClassName  : ProductDisplayController.java
    * 3. Comment    : 관리자 > 전시관리 > 상품관리 수정 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/productDisplayRemove")
    public ModelAndView productDisplayRemove(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="DSP_CTG_IDX") String[] DSP_CTG_IDX) throws Exception
    {
        ModelAndView mv = new ModelAndView();

       	Admin admin = SessionsAdmin.getSessionAdmin(request);
		commandMap.put("DSP_MST_REG_IP", request.getRemoteAddr());
		commandMap.put("DSP_MST_REG_ID", admin.getADM_MST_ID());
		commandMap.put("arrDSP_CTG_IDX", DSP_CTG_IDX);

		int result = this.productDisplayService.deleteProductDisplay(commandMap);

		// view Page Info
		if (result > 0) {
			mv.addObject("alertMsg", "삭제 되었습니다.");
			mv.addObject("returnUrl", "/am/display/productDisplayView.do");
		} else {
			mv.addObject("alertMsg", "삭제에 실패하였습니다.");
			mv.addObject("returnUrl", "/am/display/productDisplayView.do");
		}

		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : productDisplayOrderAjax
    * 2. ClassName : ProductDisplayController.java
    * 3. Comment : 관리자 > 전시관리 > 상품관리 정렬 순서 변경
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 21.
    * </pre>
    *
    * @param response
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/productDisplayOrderAjax")
    public JSON productDisplayOrderAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.productDisplayService.updateProductDisplayOrder(request,commandMap);
		
		if(result > 0)
        {
            json.put("result", "success");
        }     
		else
		{
			json.put("result", "error");
		}
        
        return json;
	}
    
    @RequestMapping("/am/display/productDisplaySortArrayAjax")
    public JSON productDisplaySortArrayAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        JSON json = new JSON();
        int result = 0;
        
        if(commandMap.get("DSP_CTG_IDX[]") != null && commandMap.get("DSP_CTG_USE[]") != null)
        {
            result = this.productDisplayService.updateProductDisplayOrder(request, commandMap);
        }
        else
        {	
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        if(result > 0)
        {
            json.put("message", "저장에 성공하였습니다.");
        }
        else
        {
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        return json;
    }
}
