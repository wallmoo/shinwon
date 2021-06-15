package com.market.mall.am.display.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

@SuppressWarnings("restriction")
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class SellerRoomProductController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="productDisplayService")
    private ProductDisplayService productDisplayService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    @RequestMapping("/am/display/sellerRoomProductView")
    public ModelAndView sellerRoomProductView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
       // pc/mobile 구분
       //String searchGubun = StringUtil.getString(commandMap.get("searchGubun"),"P");
       String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), Code.USER_ENV_TYPE_PC);
       
       int PRD_CTG_ENV = 0;
       
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
    
    @RequestMapping("/am/display/sellerRoomProductAjax")
    public JSON sellerRoomProductAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        commandMap.put("CODE", commandMap.get("PRODUCT_DISPLAY_ENV" ) );
        List<Map<String, Object>> list = this.productDisplayService.selectProductDisplayCodeList(commandMap);
        String categoryHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        
        //RETURN OBJECT
        json.put("productList", categoryHtml);
        
        return json;
    }
    
	@RequestMapping("/am/display/sellerRoomProductList")
    public ModelAndView sellerRoomProductList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
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
            commandMap.put("PRODUCT_THUMBNAIL_IMAGE_WIDTH", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
            
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
    
	@RequestMapping("/am/display/sellerRoomProductCatTabList")
    public ModelAndView sellerRoomProductCatTabList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if("".equals(StringUtil.getString(commandMap.get("PRD_CTG_IDX"), ""))){
        	return mv;
        }
        commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        commandMap.put("PRD_CTG_IDX", StringUtil.getString(commandMap.get("PRD_CTG_IDX"), ""));
        
        List<Map<String, Object>> tabList = new ArrayList<Map<String, Object>>();
        tabList = this.productDisplayService.selectDisplayCatTabList(commandMap);
        
        List<Map<String, Object>> productList = new ArrayList<Map<String, Object>>();
        productList = this.productDisplayService.selectDisplayCatTabProductList(commandMap);
        
        List<Map<String, Object>> productCatList = this.productDisplayService.selectProductCatCodeList(commandMap);
        mv.addObject("productCatList", productCatList);
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("tabList", tabList);
        mv.addObject("productList", productList);
           
        return mv;
    }
	
	@RequestMapping("/am/display/sellerRoomProductTabRegistAjax")
    public JSON sellerRoomProductTabRegistAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		
		int displayTabIdx = 0;
		displayTabIdx = this.productDisplayService.insertDisplayTab(commandMap);
		
		if(displayTabIdx > 0){
		    result.put("resultCode", "200");
		    result.put("DSP_TAB_IDX", StringUtil.getString(displayTabIdx));
		} else{
		    result.put("resultCode", "300");
		}

        return result;
    }
		
	@RequestMapping("/am/display/sellerRoomProductTabProductListAjax")
    public JSON sellerRoomProductTabProductListAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		
		commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
		
		List<Map<String, Object>> productList = new ArrayList<Map<String, Object>>();
		productList = this.productDisplayService.selectDisplayTapProductList(commandMap);
		
		if(productList != null){
		    result.put("resultCode", "200");
		    result.put("productList", productList);
		} else{
		    result.put("resultCode", "300");
		}
        return result;
    }
	
	@RequestMapping("/am/display/sellerRoomProductTabProductDelAjax")
    public JSON sellerRoomProductTabProductDelAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
            , @RequestParams(value="DSP_MST_IDX") String[] DSP_MST_IDX ) throws Exception
    {
		JSON result = new JSON();
		
		int deleteResult = 0;
		commandMap.put("arrDSP_MST_IDX", DSP_MST_IDX);
		
		deleteResult = this.productDisplayService.deleteProductDisplay(commandMap);
		
		if(deleteResult >0){
		    result.put("resultCode", "200");
		} else {
		    result.put("resultCode", "300");
		}
		return result;
    }
	
	@RequestMapping("/am/display/sellerRoomProductTabDelAjax")
    public JSON sellerRoomProductTabDelAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
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
	
	@RequestMapping("/am/display/sellerRoomProductTabProductEditAjax")
    public JSON sellerRoomProductTabProductEditAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		JSON result = new JSON();
		int updateResult = 0;
		//commandMap.put("productList", productList);
		
		updateResult = this.productDisplayService.updateProductDisplayTab(commandMap);
		
		if(updateResult > 0){
		    result.put("resultCode", "200");  
		} else {
		    result.put("resultCode", "300");  
		}
			
		return result;
    }
	
    @RequestMapping("/am/display/sellerRoomProductRegist")
    public ModelAndView sellerRoomProductRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
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
    
    @RequestMapping("/am/display/sellerRoomProductRemove")
    public ModelAndView sellerRoomProductRemove(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
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
    
    @RequestMapping("/am/display/sellerRoomProductOrderAjax")
    public JSON sellerRoomProductOrderAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
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
    
    @RequestMapping("/am/display/sellerRoomProductSortArrayAjax")
    public JSON sellerRoomProductSortArrayAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        JSON json = new JSON();
        int result = 0;
        
        if(commandMap.get("DSP_CTG_IDX[]") != null && commandMap.get("DSP_CTG_SRT[]") != null && commandMap.get("DSP_CTG_USE[]") != null)
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
