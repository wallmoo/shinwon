package com.market.mall.am.product.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DataConvertUtil;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.product.service.BasicProductService;
import com.market.mall.am.product.service.CategoryProductService;
import com.market.mall.am.product.service.SpecManagementService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.util.MakeCategoryHtmlUtil;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : CategoryProductController.java
 * @Date : 2014. 5. 29.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품카테고리관리를 처리하는 Controller Class
 * @author 이미정
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class CategoryProductController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="categoryProductService") private CategoryProductService categoryProductService;
    @Resource(name="specManagementService") private SpecManagementService specManagementService;
    @Resource(name="basicProductService") private BasicProductService basicProductService;
    
    /**
     * <pre>
     * 1. MethodName : categoryProductList
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 기본 페이지 호출
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 5. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductList")
    public ModelAndView categoryProductList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        if(!Code.CATEGORY_TYPE_MOBILE.equals(commandMap.get("PRD_CTG_ENV"))){
            commandMap.put("PRD_CTG_ENV",Code.CATEGORY_TYPE_PC);
        }
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/product/categoryProductList");

        return mv;
    }
    
    @RequestMapping(value="/am/product/categoryChangePopup")
    public ModelAndView categoryChangePopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : categoryProductAjax
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 트리 정보 조회
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 5. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductAjax")
    public JSON categoryProductAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        JSON json = new JSON();

        commandMap.put("useYn", "all"); //전체 카테고리
        List<Map<String, Object>> list = this.categoryProductService.selectCategoryProductList(commandMap);
        
        String categoryHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "PRD_CTG_LEVEL", "PRD_CTG_IDX", "PRD_CTG_NM");
        
        json.put("categoryList", categoryHtml);
        
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : categoryProductEdit
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 수정 페이지
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 5. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductEdit")
    public ModelAndView categoryProductEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> categoryProductView = null;
        
        if(!"".equals(StringUtil.getString(commandMap.get("PRD_CTG_IDX")))){
            categoryProductView = this.categoryProductService.selectCategoryProductView(commandMap);
        }
        
        int CHILD_CNT = 0;
        int PRD_CTG_LEVEL = 0;
        try{
            CHILD_CNT = StringUtil.getInt(categoryProductView.get("CHILD_CNT"), 0);
            PRD_CTG_LEVEL = StringUtil.getInt(categoryProductView.get("PRD_CTG_LEVEL"), 0);
        }catch(NullPointerException e){
             CHILD_CNT = 0;
             PRD_CTG_LEVEL = 0;
        }
        
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> specList = null;
        
        if (CHILD_CNT > 0){
            commandMap.put("useYn", "all"); //전체 카테고리
            list = this.categoryProductService.selectSubCategoryProductList(commandMap);
        
        }
        
        //3뎁스일때 카테고리에 추가 된 스펙정보를 불러온다
        if(PRD_CTG_LEVEL == 3){
            specList = this.categoryProductService.selectSpecCategoryList(commandMap);
        }
        mv.addObject("categoryProductView", categoryProductView);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        mv.addObject("specList", specList);
        mv.setViewName("/am/product/categoryProductEdit");
        
        return mv;
    }
    

    /**
     * <pre>
     * 1. MethodName : categoryProductRootEdit
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 수정 페이지
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 11. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductRootEdit")
    public ModelAndView categoryProductRootEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> list = null;
        commandMap.put("useYn", "all"); //전체 카테고리
        list = this.categoryProductService.selectSubCategoryProductList(commandMap);
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/product/categoryProductEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : categoryProductRegist
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 하위 카테고리 등록 처리
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 5. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param PRD_CTG_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductRegist")
    public ModelAndView categoryProductRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
            , @RequestParams(value="PRD_CTG_IDXs") String[] PRD_CTG_IDXs) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("PRD_CTG_REG_IP", request.getRemoteAddr());
        commandMap.put("PRD_CTG_REG_ID", admin.getADM_MST_ID());
        
        int result = 0;

        result = this.categoryProductService.insertCategoryProduct((MultipartHttpServletRequest)request, commandMap);
        if(result > 0){
            mv.addObject("alertMsg", "정상적으로 등록되었습니다.");
            commandMap.put("PRD_CTG_IDX", result );
            int level = 1;
            
            try{
                level = Integer.parseInt((String) commandMap.get("PRD_CTG_LEVEL"))+1;
            }catch( NumberFormatException e){
            
            }
            
            commandMap.put("PRD_CTG_LEVEL", level );
        }else{
            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
        }
        
        mv.addObject("returnUrl", "/am/product/categoryProductList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : categoryProductModify
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 수정 처리
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 5. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param PRD_CTG_IDXs
     * @return
     * @throws Exception
     */
    @FrontBannerSkip
    @RequestMapping(value="/am/product/categoryProductModify")
    public ModelAndView categoryProductModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
            , @RequestParams(value="PRD_CTG_IDXs") String[] PRD_CTG_IDXs) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("PRD_CTG_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_CTG_UPD_ID", admin.getADM_MST_ID());

        int result = 0;
        commandMap.put("PRD_CTG_IDXs", PRD_CTG_IDXs);
        
        result = this.categoryProductService.updateCategoryProduct((MultipartHttpServletRequest)request, commandMap);
        if(result > 0){
            mv.addObject("alertMsg", "정상적으로 처리되었습니다.");
        } else {
            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
        }
        
        mv.addObject("returnUrl", "/am/product/categoryProductList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : subCategoryProductAjax
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 하위 상품카테고리 리스트 조회 AJAX
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 5. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/subCategoryProductAjax")
    public JSON subCategoryProductAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        JSON json = new JSON();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        //입점업체 여부
        if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
            commandMap.put("searchPrdMstVdrYn", "Y");
        }

        List<Map<String, Object>> list = this.categoryProductService.selectSubCategoryProductList(commandMap);

        json.put("categoryList", list);
        
        return json;
    }
   
    /**
    * <pre>
    * 1. MethodName : subSpecManagementProductAjax
    * 2. ClassName : CategoryProductController.java
    * 3. Comment : 관리자 > 스펙 리스트 조회 AJAX
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 19.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/subSpecManagementProductAjax")
    public JSON subSpecManagementProductAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        JSON json = new JSON();

        List<Map<String, Object>> list = this.specManagementService.subSpecManagementProductAjax(commandMap);

        json.put("categoryList", list);
        
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : searchCategoryPopup
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품카테고리 검색 팝업 호출
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 5. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/searchCategoryPopup")
    public ModelAndView searchCategoryPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : categoryProductFormPopup
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 하위 카테고리 등록 화면
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 5. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param PRD_CTG_IDX
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductFormPopup")
    public ModelAndView categoryProductFormPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        int iPrdCtgIdx = -1;
        Map<String, Object> categoryProductView = null;
        int CHILD_CNT = 0;
        
        try{
            iPrdCtgIdx = Integer.parseInt( (String)commandMap.get("PRD_CTG_IDX") );
            categoryProductView = this.categoryProductService.selectCategoryProductView(commandMap);
        }catch(RuntimeException e){
            
            categoryProductView = new HashMap<String, Object>();
            categoryProductView.put("PRD_CTG_IDX", -1);
            categoryProductView.put("PRD_CTG_UP_IDX", -1);
            categoryProductView.put("PRD_CTG_TOP_IDX", -1);
            categoryProductView.put("PRD_CTG_LEVEL", 0);
            categoryProductView.put("PRD_CTG_ENV", commandMap.get("PRD_CTG_ENV"));
        }
        
        
        // root에 등록하는 경우 categoryProductView이 null임.
        try {
            CHILD_CNT = StringUtil.getInt(categoryProductView.get("CHILD_CNT"), 0);
        }catch(NullPointerException e){
             CHILD_CNT = 0;
        }    
        
        List<Map<String, Object>> list = null;
        if (CHILD_CNT > 0){
            commandMap.put("useYn", "all"); //전체 카테고리
            list = this.categoryProductService.selectSubCategoryProductList(commandMap);
        }
        mv.addObject("categoryProductView", categoryProductView);
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryProductDelete
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 삭제 처리
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param PRD_CTG_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductDelete")
    public ModelAndView categoryProductDelete(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("PRD_CTG_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_CTG_UPD_ID", admin.getADM_MST_ID());
        
        int useProduct = 0;
        int result = 0;
        
        //해당 카테고리로 상품이 등록 되어있는 확인
        commandMap.put("searchYn", "Y");
        commandMap.put("searchPrdCtgEnv", commandMap.get("PRD_CTG_ENV"));
        commandMap.put("searchPrdCtgIdx", commandMap.get("PRD_CTG_IDX"));
        useProduct = this.basicProductService.selectBasicProductCount(commandMap);
        
        if(useProduct > 0){
            mv.addObject("alertMsg", "해당 카테고리는 상품에서 사용되고 있습니다.\\n카테고리가 등록 된 상품을 삭제하고 진행해주세요.");
        }else{
            result = this.categoryProductService.deleteCategoryProduct(commandMap);
            if(result > 0){
                mv.addObject("alertMsg", "삭제 되었습니다.");
            }else{
                mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
            }
        }
        
        commandMap.put("PRD_CTG_IDX", "");
        mv.addObject("returnUrl", "/am/product/categoryProductList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryProductRegist
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙 등록  
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param PRD_CTG_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductSpecRegist")
    public ModelAndView categorySpecRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("PRD_CTG_REG_IP", request.getRemoteAddr());
        commandMap.put("PRD_CTG_REG_ID", admin.getADM_MST_ID());
        commandMap.put("DSP_PRD_SPC_IDX", commandMap.get("searchPrdCtgDepth3"));
        
        int PRD_CTG_IDX = Integer.parseInt((String) commandMap.get("PRD_CTG_IDX"));
        int PRD_CTG_LEVEL = Integer.parseInt((String) commandMap.get("PRD_CTG_LEVEL"));
        int result = 0;
        int resultCnt = 0;
        
        resultCnt = this.categoryProductService.selectCategorySpecCount(commandMap);
        
        if(resultCnt > 0){
            mv.addObject("alertMsg", "동일한 스펙이 이미 추가 되어 있습니다.");
        }else{
            result = this.categoryProductService.insertcategorySpec(commandMap);
            if(result > 0){
                mv.addObject("alertMsg", "정상적으로 등록되었습니다.");
                commandMap.put("PRD_CTG_IDX", PRD_CTG_IDX );
                commandMap.put("PRD_CTG_LEVEL", PRD_CTG_LEVEL );
            } else {
                mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
            }
        }
        mv.addObject("returnUrl", "/am/product/categoryProductList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryProductDelete
     * 2. ClassName  : CategoryProductController.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙삭제
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param PRD_CTG_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/categoryProductSpecDelete")
    public ModelAndView categorySpecDelete(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("PRD_CTG_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_CTG_UPD_ID", admin.getADM_MST_ID());
        
        int PRD_CTG_IDX = Integer.parseInt((String) commandMap.get("PRD_CTG_IDX"));
        int PRD_CTG_LEVEL = Integer.parseInt((String) commandMap.get("PRD_CTG_LEVEL"));
        
        int result = 0;
        
        //해당 카테고리로 상품이 등록 되어있는 확인
        
        result = this.categoryProductService.deleteCategorySpec(commandMap);
        if(result > 0){
            mv.addObject("alertMsg", "삭제 되었습니다.");
            commandMap.put("PRD_CTG_IDX", PRD_CTG_IDX );
            commandMap.put("PRD_CTG_LEVEL", PRD_CTG_LEVEL );
        } else {
            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
        }
        
        mv.addObject("returnUrl", "/am/product/categoryProductList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
}
