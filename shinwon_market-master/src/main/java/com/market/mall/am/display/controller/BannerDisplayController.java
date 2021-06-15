package com.market.mall.am.display.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.display.service.BannerDisplayService;
import com.market.mall.am.site.service.BasicManagerService;
import com.market.mall.am.site.service.BrandManagerService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Code;
import com.market.util.MakeCategoryHtmlUtil;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.display.controller
 * @FileName : BannerDisplayController.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시배너관리를 처리하는 Controller Class
 * @author jangsin
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class BannerDisplayController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="bannerDisplayService")
    private BannerDisplayService bannerDisplayService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    @Resource(name="basicManagerService") 
    private BasicManagerService basicManagerService;
    
    @Resource(name="brandManagerService") 
    private BrandManagerService brandManagerService;
    
    /**
    * <pre>
    * 1. MethodName : bannerDisplayView
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplayView")
    public ModelAndView bannerDisplayView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
    	// pc/mobile 구분
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"),"P");
       
        int PRD_CTG_ENV = 0;
        
        if("P".equals(searchGubun))
        {
        	PRD_CTG_ENV = Code.COMMON_BANNER_DISPLAY_PC;//default는 MarketPlant pc
        }
        else
        {
        	PRD_CTG_ENV = Code.COMMON_BANNER_DISPLAY_MOBILE;	// mobile
        }
       
	    commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV);
	    
    	ModelAndView mv = new ModelAndView();
    	
	    mv.addObject("commandMap", commandMap);
	    mv.addObject("searchGubun", searchGubun);
	    mv.setViewName("/am/display/bannerDisplayView");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerDisplayAjax
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplayAjax")
    public JSON bannerDisplayAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        commandMap.put("CODE", commandMap.get("BANNER_DISPLAY_ENV" ) );
        List<Map<String, Object>> list = this.bannerDisplayService.selectBannerDisplayCodeList(commandMap);
        String bannerListHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        
        json.put("bannerList", bannerListHtml);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerDisplayList
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplayList")
    public ModelAndView bannerDisplayList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
        {
            List<Map<String, Object>> list = this.bannerDisplayService.selectBannerDisplayList(commandMap);
            
            // 상위배너카테고리
            List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);

            // 카테고리명
            mv.addObject("commandMap", commandMap);
            mv.addObject("bnrCatList", bnrCatList);
            mv.addObject("list", list);
        }
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerDisplayForm
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplayForm")
    public ModelAndView bannerDisplayForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_GBN = StringUtil.getString(commandMap.get("BNR_MST_GBN"), "A");
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        //전시 타입별로 등록 폼 셋팅
        if(BNR_MST_GBN.equals("A")){//배너1개등록 템플릿
        	mv.setViewName("/am/display/bannerDisplayFormTypeA");
        }else if(BNR_MST_GBN.equals("B")){//배너2개등록 템플릿
        	mv.setViewName("/am/display/bannerDisplayFormTypeB");
        }else if(BNR_MST_GBN.equals("C")){//상품상세 공지 템플릿
        	mv.setViewName("/am/display/bannerDisplayFormTypeC");
        }else{
        	mv.setViewName("/am/display/bannerDisplayFormTypeA");
        }
        
        // 상위배너카테고리
        List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
        mv.addObject("bnrCatList", bnrCatList);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerDisplayEdit
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplayEdit")
    public ModelAndView bannerDisplayEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        String BNR_MST_GBN = StringUtil.getString(commandMap.get("BNR_MST_GBN"), "A");
        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
        	Map<String, Object> resultMap = this.bannerDisplayService.selectBannerDisplayInfo(commandMap);
        	mv.addObject("row", resultMap.get("row"));
        	mv.addObject("fileList", resultMap.get("fileList"));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
            //전시 타입별로 등록 폼 셋팅
            if(BNR_MST_GBN.equals("A")){//배너1개등록 템플릿
            	mv.setViewName("/am/display/bannerDisplayEditTypeA");
            }else if(BNR_MST_GBN.equals("B")){//배너2개등록 템플릿
            	mv.setViewName("/am/display/bannerDisplayEditTypeB");
            }else if(BNR_MST_GBN.equals("C")){//상품상세 공지 템플릿
            	mv.setViewName("/am/display/bannerDisplayEditTypeC");
            }else{
            	mv.setViewName("/am/display/bannerDisplayEditTypeA");
            }
        }
        // 상위배너카테고리
        List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
        mv.addObject("bnrCatList", bnrCatList);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerDisplayRegist
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplayRegist")
    public ModelAndView bannerDisplayRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String PRD_CTG_ENV = StringUtil.getString(commandMap.get("PRD_CTG_ENV"), "");
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            // 관리자 관리 관리자 등록
            int result = this.bannerDisplayService.insertBannerDisplay((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerDisplayView.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerDisplayView.do");
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
    * 1. MethodName : bannerDisplayModify
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplayModify")
    public ModelAndView bannerDisplayModify(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")) && !"".equals(StringUtil.getString(commandMap.get("BNR_MST_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.bannerDisplayService.updateBannerDisplay((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerDisplayView.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerDisplayView.do");
            }
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }


    /**
    * <pre>
    * 1. MethodName : bannerDisplaySortArrayAjax
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplaySortArrayAjax")
    public JSON commonCodeManagerSortArrayAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        JSON json = new JSON();
        int result = 0;
        
        if(commandMap.get("BNR_MST_IDX[]") != null && commandMap.get("BNR_MST_SRT[]") != null)
        {
            result = this.bannerDisplayService.updateBannerDisplaySortArray(request, commandMap);
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
    * 1. MethodName : bannerDisplayEditorPreview
    * 2. ClassName  : BannerDisplayController.java
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
    @RequestMapping("/am/display/bannerDisplayEditorPreview")
    public ModelAndView bannerDisplayEditorPreview(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        if(!"".equals(BNR_MST_IDX))
        {
            mv.addObject("row", this.bannerDisplayService.selectBannerDisplayInfo(commandMap));
        }
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : deleteBannerDisplay
    * 2. ClassName : BannerDisplayController.java
    * 3. Comment : 배너삭제 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 3.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/bannerDisplayDelete")
    public ModelAndView bannerDisplayDelete(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")) && !"".equals(StringUtil.getString(commandMap.get("BNR_MST_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.bannerDisplayService.deleteBannerDisplay((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {

            	if ( StringUtil.getString(commandMap.get("CMN_COM_IDX"), "").equals(  StringUtil.getString( Code.COMMON_SELLER_ROOM_DISPLAY_SELLER_PICK ,"")) ) {
            		this.bannerDisplayService.deleteBannerCNT(request, commandMap);	
            	}
            	
                mv.addObject("alertMsg", "삭제 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerDisplayView.do");
            }
            else
            {
                mv.addObject("alertMsg", "삭제에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerDisplayView.do");
            }
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/display/bannerDisplayListDeleteAjax")
    public JSON bannerDisplayListDeleteAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        json.put("resultCode", "200");
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<Map<String, Object>>> typeRef = new TypeReference<List<Map<String, Object>>>(){};
        
        List<Map<String,Object>> bannerList = mapper.readValue(commandMap.get("bannerList").toString(),typeRef);
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("bannerList", bannerList);
        this.bannerDisplayService.deleteBannerDisplayBatch(request, param);
        
    	if ( StringUtil.getString(commandMap.get("CMN_COM_IDX"), "").equals(  StringUtil.getString( Code.COMMON_SELLER_ROOM_DISPLAY_SELLER_PICK ,"")) ) {
    		this.bannerDisplayService.deleteBannerCNTBatch(request, commandMap);	
    	}
    	        
        
        return json;
    }
    
    @RequestMapping("/am/display/bannerDisplayListUseYNAjax")
    public JSON bannerDisplayListUseYNAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        json.put("resultCode", "200");
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<Map<String, Object>>> typeRef = new TypeReference<List<Map<String, Object>>>(){};
        List<Map<String,Object>> bannerList = mapper.readValue(commandMap.get("bannerList").toString(),typeRef);
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("bannerList", bannerList);
        this.bannerDisplayService.updateBannerDisplayUseYNBatch(request, param);
        return json;
    }
    /**
    * <pre>
    * 1. MethodName : bannerProductNotice
    * 2. ClassName : BannerDisplayController.java
    * 3. Comment : 브랜드공지 / MD공지 관리
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 4.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/bannerProduct{path}NoticeList")
    public ModelAndView bannerProductNotice(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @PathVariable("path") String path) throws Exception  
    {
       
       // pc/mobile 구분
       String searchGubun = StringUtil.getString(commandMap.get("searchGubun"),"P");
       int CMN_COM_IDX = 0;
       //리스트 타이틀
       String noticeStateNm = "브랜드공지관리";
       String BNR_MST_GBN = "D";
       if("Brand".equals(path)) // 브랜드공지관리
       {
    	   noticeStateNm = "브랜드공지관리";
    	   BNR_MST_GBN = "D";
    	   CMN_COM_IDX = Code.COMMON_PRODUCT_DISPLAY_BRAND;
       }else{
    	   noticeStateNm = "MD공지관리";
    	   BNR_MST_GBN = "E";
    	   CMN_COM_IDX = Code.COMMON_PRODUCT_DISPLAY_MD;
       }
       commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
       commandMap.put("path", path);
       //공지리스트
       List<Map<String, Object>> list = this.bannerDisplayService.selectBannerDisplayList(commandMap);
       
       //MD리스트
       commandMap.put("MD_ADMINISTRATOR_IDX", Code.MD_ADMINISTRATOR_IDX);		// MD 관리자 idx
       List<Map<String, Object>> basicMdList = this.basicManagerService.selectBasicManagerTypeList(commandMap);
       
       //브랜드 리스트
       commandMap.put("searchBrandUseYn", "Y");
       List<Map<String, Object>> basicBrandList =  this.brandManagerService.selectBrandManagerList(commandMap);
       int PRD_CTG_ENV = Code.COMMON_BANNER_DISPLAY_PC;//default는 MarketPlant pc
       
       commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV);
        
       // 상위배너카테고리
       List<Map<String, Object>> bnrCatList = this.bannerDisplayService.selectBnrCatCodeList(commandMap);
    	
       ModelAndView mv = new ModelAndView();
        
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("searchGubun", searchGubun);
        mv.addObject("path", path);
        mv.addObject("noticeStateNm", noticeStateNm);
        mv.addObject("BNR_MST_GBN", BNR_MST_GBN);
        mv.addObject("CMN_COM_IDX", CMN_COM_IDX);
        mv.addObject("list", list);
        mv.addObject("bnrCatList", bnrCatList);
        mv.addObject("basicMdList", basicMdList);
        mv.addObject("basicBrandList", basicBrandList);
        mv.setViewName("/am/display/bannerProductNoticeList");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerProductNoticeForm
    * 2. ClassName : BannerDisplayController.java
    * 3. Comment : 브랜드공지/MD공지 등록 폼
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 4.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @param path
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/bannerProduct{path}NoticeForm")
    public ModelAndView bannerProductNoticeForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @PathVariable("path") String path) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_GBN = StringUtil.getString(commandMap.get("BNR_MST_GBN"), "D");
        String noticeStateNm = "";
        if("Brand".equals(path)) // 브랜드공지관리
        {
     	   noticeStateNm = "브랜드공지관리";
        }else{
     	   noticeStateNm = "MD공지관리";
        }
        
        if(!"".equals(CMN_COM_IDX))
        {
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        System.out.println("===============BNR_MST_GBN=======>"+BNR_MST_GBN);
        
        //MD리스트
        commandMap.put("MD_ADMINISTRATOR_IDX", Code.MD_ADMINISTRATOR_IDX);		// MD 관리자 idx
        List<Map<String, Object>> basicMdList = this.basicManagerService.selectBasicManagerTypeList(commandMap);
        
        //브랜드 리스트
        commandMap.put("searchBrandUseYn", "Y");
        List<Map<String, Object>> basicBrandList =  this.brandManagerService.selectBrandManagerList(commandMap);
        
        mv.setViewName("/am/display/bannerProductNoticeForm");
        mv.addObject("commandMap", commandMap);
        mv.addObject("noticeStateNm", noticeStateNm);
        mv.addObject("basicMdList", basicMdList);
        mv.addObject("basicBrandList", basicBrandList);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerProductNoticeRegist
    * 2. ClassName : BannerDisplayController.java
    * 3. Comment : 브랜드관리/MD관리 등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 4.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/bannerProduct{path}NoticeRegist")
    public ModelAndView bannerProductNoticeRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @PathVariable("path") String path) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String PRD_CTG_ENV = StringUtil.getString(commandMap.get("PRD_CTG_ENV"), "");
        String searchGubun = StringUtil.getString(commandMap.get("searchGubun"), "");
        if(!"".equals(CMN_COM_IDX))
        {
            // 관리자 관리 관리자 등록
            int result = this.bannerDisplayService.insertBannerDisplay((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerProduct"+path+"NoticeList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerProduct"+path+"NoticeList.do");
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
    * 1. MethodName : bannerProductNoticeEdit
    * 2. ClassName : BannerDisplayController.java
    * 3. Comment : 브랜드관리/MD관리 수정 폼
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 4.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @param path
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/bannerProduct{path}NoticeEdit")
    public ModelAndView bannerProductNoticeEdit(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @PathVariable("path") String path) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
        String BNR_MST_IDX = StringUtil.getString(commandMap.get("BNR_MST_IDX"), "");
        
        String noticeStateNm = "";
        if("Brand".equals(path)) // 브랜드공지관리
        {
     	   noticeStateNm = "브랜드공지관리";
        }else{
     	   noticeStateNm = "MD공지관리";
        }

        if(!"".equals(CMN_COM_IDX) && !"".equals(BNR_MST_IDX))
        {
        	Map<String, Object> resultMap = this.bannerDisplayService.selectBannerDisplayInfo(commandMap);
        	mv.addObject("row", resultMap.get("row"));
        	mv.addObject("fileList", resultMap.get("fileList"));
            mv.addObject("codeRow", this.commonService.selectCodeInfo(commandMap));
        }
        
        //MD리스트
        commandMap.put("MD_ADMINISTRATOR_IDX", Code.MD_ADMINISTRATOR_IDX);		// MD 관리자 idx
        List<Map<String, Object>> basicMdList = this.basicManagerService.selectBasicManagerTypeList(commandMap);
        
        //브랜드 리스트
        commandMap.put("searchBrandUseYn", "Y");
        List<Map<String, Object>> basicBrandList =  this.brandManagerService.selectBrandManagerList(commandMap);
        
        mv.setViewName("/am/display/bannerProductNoticeEdit");
        mv.addObject("commandMap", commandMap);
        mv.addObject("noticeStateNm", noticeStateNm);
        mv.addObject("basicMdList", basicMdList);
        mv.addObject("basicBrandList", basicBrandList);
        mv.addObject("path", path);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerProductNoticeModify
    * 2. ClassName : BannerDisplayController.java
    * 3. Comment : 브랜드관리/MD관리 수정
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 4.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @param path
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/bannerProduct{path}NoticeModify")
    public ModelAndView bannerProductNoticeModify(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @PathVariable("path") String path) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")) && !"".equals(StringUtil.getString(commandMap.get("BNR_MST_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.bannerDisplayService.updateBannerDisplay((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerProduct"+path+"NoticeList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerProduct"+path+"NoticeList.do");
            }
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerProductNoticeDelete
    * 2. ClassName : BannerDisplayController.java
    * 3. Comment : 브랜드관리/MD관리 삭제
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 4.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @param path
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/bannerProduct{path}NoticeDelete")
    public ModelAndView bannerProductNoticeDelete(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap
    		, @PathVariable("path") String path) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")) && !"".equals(StringUtil.getString(commandMap.get("BNR_MST_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.bannerDisplayService.deleteBannerDisplay((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "삭제 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerProduct"+path+"NoticeList.do");
            }
            else
            {
                mv.addObject("alertMsg", "삭제에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/bannerProduct"+path+"NoticeList.do");
            }
            
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : bannerProductNoticeImgShow
    * 2. ClassName : BannerDisplayController.java
    * 3. Comment : 브랜드/MD 관리 배너 이미지 미리보기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 4.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @param path
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/bannerDisplayImagePopup")
    public ModelAndView bannerDisplayImagePopup(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")) && !"".equals(StringUtil.getString(commandMap.get("BNR_MST_IDX"), "")))
        {
        	Map<String, Object> resultMap = this.bannerDisplayService.selectBannerDisplayInfo(commandMap);
        	mv.addObject("row", resultMap.get("row"));
        	mv.addObject("fileList", resultMap.get("fileList"));
        	mv.setViewName("/am/display/bannerDisplayImagePopup");
            mv.addObject("commandMap", commandMap);
        }
        return mv;
    }
}
