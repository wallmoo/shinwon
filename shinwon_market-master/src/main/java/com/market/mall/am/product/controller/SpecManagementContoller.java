package com.market.mall.am.product.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.epasscni.util.DataConvertUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.product.service.SpecManagementService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : SpecManagementContoller.java
 * @Date : 2015. 10. 14.
 * @프로그램 설명 : 스펙관리를 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class SpecManagementContoller {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="specManagementService") private SpecManagementService specManagementService;
    
    /**
    * <pre>
    * 1. MethodName : specManagementList
    * 2. ClassName : SpecManagementContoller.java
    * 3. Comment : 관리자 > 상품관리 > 스펙카테고리 기본 페이지 호출
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/specManagementList")
    public ModelAndView specManagementList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("SPC_MST_ENV",Code.CATEGORY_TYPE_PC);
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/product/specManagementList");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryProductEdit
     * 2. ClassName  : SpecManagementContoller.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 수정 페이지
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/specManagementEdit")
    public ModelAndView categoryProductEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> categoryProductView = this.specManagementService.selectSpecManagementView(commandMap);
        
        int CHILD_CNT = 0;
        int SPC_MST_LEVEL = 0;
        try {
        	CHILD_CNT = StringUtil.getInt(categoryProductView.get("CHILD_CNT"), 0);
        	SPC_MST_LEVEL = StringUtil.getInt(categoryProductView.get("SPC_MST_LEVEL"), 0);
        }
        catch(NullPointerException e){
        	 CHILD_CNT = 0;
        	 SPC_MST_LEVEL = 0;
        }
        
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> specList = null;
        if (CHILD_CNT > 0){
            commandMap.put("useYn", "all"); //전체 카테고리
            list = this.specManagementService.selectSubSpecManagementList(commandMap);
        }else{
        	commandMap.put("SPC_MST_ENV",Code.CATEGORY_TYPE_PC);
        }
        
      //3뎁스일때 카테고리에 추가 된 스펙정보를 불러온다
        if(SPC_MST_LEVEL == 3){
        	specList = this.specManagementService.selectSpecCategoryList(commandMap);
        }
        
        mv.addObject("categoryProductView", categoryProductView);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        mv.addObject("specList", specList);
        mv.setViewName("/am/product/specManagementEdit");
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : specManagementModify
     * 2. ClassName  : SpecManagementContoller.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 수정 처리
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param SPC_MST_IDXs
     * @return
     * @throws Exception
     */
    @FrontBannerSkip
    @RequestMapping(value="/am/product/specManagementModify")
    public ModelAndView categoryProductModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="SPC_MST_IDXs") String[] SPC_MST_IDXs) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("SPC_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("SPC_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;
        commandMap.put("SPC_MST_IDXs", SPC_MST_IDXs);
        
        result = this.specManagementService.updateSpecManagement(commandMap);
        
    	if(result > 0){
            mv.addObject("alertMsg", "정상적으로 처리되었습니다.");
        } else {
            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
        }
    	
        mv.addObject("returnUrl", "/am/product/specManagementList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : specManagementAjax
    * 2. ClassName : SpecManagementContoller.java
    * 3. Comment : 상품관리 > 스펙관리 > 스펙카테고리 트리 정보 조회
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/specManagementAjax")
    public JSON specManagementAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        commandMap.put("useYn", "all"); //전체 카테고리
        List<Map<String, Object>> list = this.specManagementService.selectSpecManagementList(commandMap);
        DataConvertUtil dataConvertUtil = new DataConvertUtil();
        ArrayList<Map<String, Object>> result = dataConvertUtil.convertTreeData(list, true, "SPC_MST_IDX", "SPC_MST_UP_IDX", "SPC_MST_NM", "SPC_MST_LEVEL");

        json.put("data", result);
        
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryProductFormPopup
     * 2. ClassName  : SpecManagementContoller.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 하위 카테고리 등록 화면
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param SPC_MST_IDX
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/specManagementFormPopup")
    public ModelAndView specManagementFormPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
        
    	int iPrdCtgIdx = -1;
    	Map<String, Object> categoryProductView = null;
    	int CHILD_CNT = 0;
    	
    	try{
    		iPrdCtgIdx = Integer.parseInt( (String)commandMap.get("SPC_MST_IDX") );
    		categoryProductView = this.specManagementService.selectSpecManagementView(commandMap);
    	}catch(RuntimeException e){
    		
    		categoryProductView = new HashMap<String, Object>();
    		categoryProductView.put("SPC_MST_IDX", -1);
    		categoryProductView.put("SPC_MST_UP_IDX", -1);
    		categoryProductView.put("SPC_MST_TOP_IDX", -1);
    		categoryProductView.put("SPC_MST_LEVEL", 0);
    		categoryProductView.put("SPC_MST_ENV", commandMap.get("SPC_MST_ENV"));
    	}
        
        
    	// root에 등록하는 경우 categoryProductView이 null임.
        try {
        	CHILD_CNT = StringUtil.getInt(categoryProductView.get("CHILD_CNT"), 0);
        }
        catch(NullPointerException e){
        	 CHILD_CNT = 0;
        }    
        
        List<Map<String, Object>> list = null;
        if (CHILD_CNT > 0){
            commandMap.put("useYn", "all"); //전체 카테고리
            list = this.specManagementService.selectSubSpecManagementList(commandMap);
        }
        mv.addObject("categoryProductView", categoryProductView);
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/product/specManagementFormPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : specManagementRootEdit
     * 2. ClassName  : SpecManagementContoller.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 수정 페이지
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/specManagementRootEdit")
    public ModelAndView specManagementRootEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> list = null;
        commandMap.put("useYn", "all"); //전체 카테고리
        list = this.specManagementService.selectSubSpecManagementList(commandMap);
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/product/specManagementEdit");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : specManagementRegist
     * 2. ClassName  : SpecManagementContoller.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 하위 카테고리 등록 처리
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param SPC_MST_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/specManagementRegist")
    public ModelAndView specManagementRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="SPC_MST_IDXs") String[] SPC_MST_IDXs) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("SPC_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("SPC_MST_REG_ID", admin.getADM_MST_ID());
        
        int result = 0;

        result = this.specManagementService.insertSpecManagement(commandMap);
        if(result > 0){
            mv.addObject("alertMsg", "정상적으로 등록되었습니다.");
            commandMap.put("SPC_MST_IDX", result );
            int level = 1;
            try{
            	level = Integer.parseInt((String) commandMap.get("SPC_MST_LEVEL"))+1;
            }catch( NumberFormatException e){
            }
            commandMap.put("SPC_MST_LEVEL", level );
        } else {
            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
        }
        
        mv.addObject("returnUrl", "/am/product/specManagementList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : specManagementDelete
     * 2. ClassName  : SpecManagementContoller.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 삭제 처리
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param SPC_MST_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/specManagementDelete")
    public ModelAndView categoryProductDelete(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("SPC_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("SPC_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;
        int useProduct = 0;
        
        //해당 카테고리로 상품이 등록 되어있는 확인
        useProduct = this.specManagementService.selectSpecProductCount(commandMap);
        
        if(useProduct > 0){
        	mv.addObject("alertMsg", "해당 스펙은 상품에서 사용되고 있습니다.\\n스펙이 등록 된 상품을 삭제하고 진행해주세요.");
        }
        else{
	        Map<String, Object> specProductView = this.specManagementService.selectSpecManagementView(commandMap);
	        
	        int CHILD_CNT = 0;
	        try {
	        	CHILD_CNT = StringUtil.getInt(specProductView.get("CHILD_CNT"), 0);
	        }
	        catch(NullPointerException e){
	        	 CHILD_CNT = 0;
	        }
	        
	        //해당 스펙의 하위 스펙 확인 
	        
	        if(CHILD_CNT > 0){
	        	mv.addObject("alertMsg", "하위 스펙을 모두 삭제 후 스펙 삭제를 해주세요.");
	        }
	        else{
		        result = this.specManagementService.deleteSpecManagement(commandMap);
		        if(result > 0){
		            mv.addObject("alertMsg", "삭제 되었습니다.");
		        } else {
		            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
		        }
	        }
        }
        
        commandMap.put("SPC_MST_IDX", "");
        mv.addObject("returnUrl", "/am/product/specManagementList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : searchCategoryPopup
    * 2. ClassName : SpecManagementContoller.java
    * 3. Comment : 스펙 팝업 호출
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 23.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/searchSpecCategoryPopup")
    public ModelAndView searchCategoryPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

}
