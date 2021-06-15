package com.market.mall.am.display.controller;

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
import com.market.mall.am.display.service.ThemeProductService;
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
 * @FileName : ThemeProductController.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Controller Class
 * @author 이미정
 */
@SuppressWarnings("restriction")
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class ThemeProductController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="themeProductService")
    private ThemeProductService themeProductService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    /**
    * <pre>
    * 1. MethodName : themeProductView
    * 2. ClassName  : ThemeProductController.java
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
    @RequestMapping("/am/display/themeProductView")
    public ModelAndView themeProductView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
       // pc/mobile 구분
       String searchGubun = StringUtil.getString(commandMap.get("searchGubun"),"P");
       
       int CMN_COM_IDX = Code.COMMON_THEME_PRODUCT;
       
        commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
        commandMap.put("PRD_CTG_ENV", searchGubun);
        
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("searchGubun", searchGubun);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : themeProductAjax
    * 2. ClassName  : ThemeProductController.java
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
    @RequestMapping("/am/display/themeProductAjax")
    public JSON themeProductAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        commandMap.put("CODE", commandMap.get("PRODUCT_DISPLAY_ENV" ) );
        List<Map<String, Object>> list = this.themeProductService.selectThemeProductCodeList(commandMap);
        String categoryHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        //RETURN OBJECT
        json.put("themeProductList", categoryHtml);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : themeProductList
    * 2. ClassName  : ThemeProductController.java
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
	@RequestMapping("/am/display/themeProductList")
    public ModelAndView themeProductList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
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
            int totalCount = this.themeProductService.selectThemeProductListCount(commandMap);
            
            Paging paging = new Paging(totalCount, commandMap);
            mv.addObject( "paging", paging );
            
            List<Map<String, Object>> list = null;
            if (totalCount > 0){
                
                // 상품관리 목록
                list = this.themeProductService.selectThemeProductList(commandMap);
            }
            
            // 상위배너카테고리
            List<Map<String, Object>> productCatList = this.themeProductService.selectProductCatCodeList(commandMap);
            
            mv.addObject("totalCount", totalCount);
            mv.addObject("productCatList", productCatList);
            mv.addObject("commandMap", commandMap);
            mv.addObject("list", list);
        }        
        return mv;
    }
        
    /**
    * <pre>
    * 1. MethodName : themeProductRegist
    * 2. ClassName  : ThemeProductController.java
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
    @RequestMapping("/am/display/themeProductRegist")
    public ModelAndView themeProductRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
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
        	commandMap.put("DSP_MST_REG_IP", request.getRemoteAddr());
            commandMap.put("DSP_MST_REG_ID", admin.getADM_MST_ID());
            
            // 관리자 관리 관리자 등록
            int result = this.themeProductService.insertThemeProduct(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeProductView.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeProductView.do");
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
    * 1. MethodName : themeProductRemove
    * 2. ClassName  : ThemeProductController.java
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
    @RequestMapping("/am/display/themeProductRemove")
    public ModelAndView themeProductRemove(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="DSP_MST_IDX") String[] DSP_MST_IDX) throws Exception
    {
        ModelAndView mv = new ModelAndView();

       	Admin admin = SessionsAdmin.getSessionAdmin(request);
		commandMap.put("DSP_MST_REG_IP", request.getRemoteAddr());
		commandMap.put("DSP_MST_REG_ID", admin.getADM_MST_ID());
		commandMap.put("arrDSP_MST_IDX", DSP_MST_IDX);

		int result = this.themeProductService.deleteThemeProduct(commandMap);

		// view Page Info
		if (result > 0) {
			mv.addObject("alertMsg", "수정 되었습니다.");
			mv.addObject("returnUrl", "/am/display/themeProductView.do");
		} else {
			mv.addObject("alertMsg", "수정에 실패하였습니다.");
			mv.addObject("returnUrl", "/am/display/themeProductView.do");
		}

		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : themeProductOrderAjax
    * 2. ClassName : ThemeProductController.java
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
    @RequestMapping("/am/display/themeProductOrderAjax")
    public JSON themeProductOrderAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.themeProductService.updateThemeProductOrder(commandMap);
		
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
}
