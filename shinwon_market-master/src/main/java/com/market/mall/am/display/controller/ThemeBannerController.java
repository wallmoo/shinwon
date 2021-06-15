package com.market.mall.am.display.controller;

import java.lang.reflect.Field;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DataConvertUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.display.service.ThemeBannerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.util.MakeCategoryHtmlUtil;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.display.controller
 * @FileName : ThemeBannerController.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시배너관리를 처리하는 Controller Class
 * @author jangsin
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class ThemeBannerController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="themeBannerService")
    private ThemeBannerService themeBannerService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    
    /**
    * <pre>
    * 1. MethodName : themeBannerView
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 관리자 > 전시관리 > 배너관리 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerView")
    public ModelAndView themeBannerView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
       
       // pc/mobile 구분
       String searchGubun = StringUtil.getString(commandMap.get("searchGubun"),"P");
       
       int PRD_CTG_ENV = Code.COMMON_THEME_BANNER;
       
        commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV);
    	
        ModelAndView mv = new ModelAndView();
        
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/display/themeBannerView");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : themeBannerAjax
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 관리자 > 전시관리 > 배너관리 트리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerAjax")
    public JSON themeBannerAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        commandMap.put("CODE", commandMap.get("BANNER_DISPLAY_ENV" ) );
        List<Map<String, Object>> list = this.themeBannerService.selectThemeBannerCodeList(commandMap);
        String categoryHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        json.put("themeBannerList", categoryHtml);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : themeBannerList
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 관리자 > 전시관리 > 배너관리 목록  
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerList")
    public ModelAndView themeBannerList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
        {
            List<Map<String, Object>> list = this.themeBannerService.selectThemeBannerList(commandMap);
            
            // 상위배너카테고리
            List<Map<String, Object>> bnrCatList = this.themeBannerService.selectBnrCatCodeList(commandMap);
            
            // 카테고리명
            mv.addObject("commandMap", commandMap);
            mv.addObject("bnrCatList", bnrCatList);
            mv.addObject("list", list);
        }
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : themeBannerForm
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 관리자 > 전시관리 > 배너관리 등록 폼 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerForm")
    public ModelAndView themeBannerForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : themeBannerEdit
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 관리자 > 전시관리 > 배너관리 수정 폼 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerEdit")
    public ModelAndView themeBannerEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
            mv.addObject("row", this.themeBannerService.selectThemeBannerInfo(commandMap));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
            
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : themeBannerRegist
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 관리자 > 전시관리 > 배너관리 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerRegist")
    public ModelAndView themeBannerRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String PRD_CTG_ENV = StringUtil.getString(commandMap.get("PRD_CTG_ENV"), "");
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            // 관리자 관리 관리자 등록
            int result = this.themeBannerService.insertThemeBanner((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeBannerView.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeBannerView.do");
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
    * 1. MethodName : themeBannerModify
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 관리자 > 전시관리 > 배너관리 수정 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerModify")
    public ModelAndView themeBannerModify(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	

        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.themeBannerService.updateThemeBanner((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeBannerView.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeBannerView.do");
            }
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerChangeStatus")
    public ModelAndView themeBannerChangeStatus(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.themeBannerService.updateThemeBannerStatus(commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeBannerView.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeBannerView.do");
            }
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerDelete")
    public ModelAndView themeBannerDelete(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String PRD_CTG_ENV = StringUtil.getString(commandMap.get("PRD_CTG_ENV"), "");
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            // 관리자 관리 관리자 등록
            int result = this.themeBannerService.deleteThemeBanner(commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "삭제가 완료되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeBannerView.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "삭제가 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/themeBannerView.do");
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
    
    @RequestMapping("/am/display/themeBannerBannerForm")
    public ModelAndView themeBannerBannerForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }

    @RequestMapping("/am/display/bannerDisplayFormTypeA")
    public ModelAndView bannerDisplayFormTypeA(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/bannerDisplayFormTypeB")
    public ModelAndView bannerDisplayFormTypeB(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/bannerDisplayFormTypeC")
    public ModelAndView bannerDisplayFormTypeC(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerBrandForm")
    public ModelAndView themeBannerBrandForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerBrandEdit")
    public ModelAndView themeBannerBrandEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
            mv.addObject("row", this.themeBannerService.selectThemeBannerInfo(commandMap));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    @RequestMapping("/am/display/themeBannerImgVideoForm")
    public ModelAndView themeBannerImgVideoForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerImgVideoEdit")
    public ModelAndView themeBannerImgVideoEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
            mv.addObject("row", this.themeBannerService.selectThemeBannerInfo(commandMap));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    @RequestMapping("/am/display/themeBannerVideoForm")
    public ModelAndView themeBannerVideoForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerVideoEdit")
    public ModelAndView themeBannerVideoEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
            mv.addObject("row", this.themeBannerService.selectThemeBannerInfo(commandMap));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    @RequestMapping("/am/display/themeBannerGNBForm")
    public ModelAndView themeBannerGNBForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerGNBEdit")
    public ModelAndView themeBannerGNBEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
            mv.addObject("row", this.themeBannerService.selectThemeBannerInfo(commandMap));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    @RequestMapping("/am/display/themeBannerTopSellerForm")
    public ModelAndView themeBannerTopSellerForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerTopSellerEdit")
    public ModelAndView themeBannerTopSellerEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        commandMap.put("TAG_BND_ID",BNR_MST_IDX);

        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
        	
        	commandMap.put("PRODUCT_THUMBNAIL_IMAGE_WIDTH" ,Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SHORT );
        	
            mv.addObject("row", this.themeBannerService.selectThemeBannerInfo(commandMap));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
            mv.addObject("tagList", defaultDAO.selectList("PcTag.selectTagListById", commandMap));
            mv.addObject("productList", this.themeBannerService.selectProductBanner(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    @RequestMapping("/am/display/themeBannerProductForm")
    public ModelAndView themeBannerProductForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/display/themeBannerProductEdit")
    public ModelAndView themeBannerProductEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
            mv.addObject("row", this.themeBannerService.selectThemeBannerInfo(commandMap));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        
        
        mv.addObject("categoryList", this.themeBannerService.selectThemeBannerCategory(commandMap));
        

        mv.addObject("commandMap", commandMap);
        return mv;
    }
    /**
    * <pre>
    * 1. MethodName : themeBannerSortArrayAjax
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 관리자 > 전시관리 > 배너관리 순서 변경
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerSortArrayAjax")
    public JSON commonCodeManagerSortArrayAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        JSON json = new JSON();
        int result = 0;
        
        if( (commandMap.get("BNR_DTL_IDX[]") != null && commandMap.get("BNR_DTL_ORDER[]") != null)
        		|| commandMap.get("ROLLING_TERM_SEC") != null )
        {
            result = this.themeBannerService.updateThemeBannerSortArray(request, commandMap);
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
    
    /**
    * <pre>
    * 1. MethodName : themeBannerEditorPreview
    * 2. ClassName  : ThemeBannerController.java
    * 3. Comment    : 에디터 배너 미리보기
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 2. 17.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/themeBannerEditorPreview")
    public ModelAndView themeBannerEditorPreview(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        if(!"".equals(BNR_MST_IDX))
        {
            mv.addObject("row", this.themeBannerService.selectThemeBannerInfo(commandMap));
        }
        return mv;
    }
}
