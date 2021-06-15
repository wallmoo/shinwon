package com.market.mall.am.product.controller;

import java.net.URLEncoder;
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
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.product.service.EstimateManagementService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : EstimateManagementController.java
 * @Date : 2015. 10. 20.
 * @프로그램 설명 : 견적관리를 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class EstimateManagementController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="estimateManagementService") private EstimateManagementService estimateManagementService;
    @Resource(name="commonService") private CommonService commonService;
    
    /**
    * <pre>
    * 1. MethodName : EstimateManagementList
    * 2. ClassName : EstimateManagementController.java
    * 3. Comment : 견적관리 리스트 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 20.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/estimateManagementList")
    public ModelAndView estimateManagementList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
    	
    	//기본값 설정
        commandMap.put("searchPrdMstDelFlag", "N");        
        if( !commandMap.containsKey("searchDetailY")){ 
        	commandMap.put("searchDetailY", "none");	
        }
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ){
        	totalCount = 0 ;
        	paging = new Paging(totalCount, commandMap); 
        }
        else{
        	//페이징
        	totalCount = this.estimateManagementService.selectEstimateManagementListCount(commandMap);
        	paging = new Paging(totalCount, commandMap); 
        
        	if(totalCount>0)
        	{
        		list = this.estimateManagementService.selectEstimateManagementList(commandMap);
        	}
        }
    	
    	//견적관리 구분 코드
        mv.addObject("codeList", this.commonService.selectCode("ESTIMATE_MANAGEMENT_TYPE"));
        //견적관리 휴대폰 앞자리 코드
        mv.addObject("hpList", this.commonService.selectCode("HP_CODE"));
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : estimateManagementForm
    * 2. ClassName : EstimateManagementController.java
    * 3. Comment : MD견적 직접 등록 폼
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/estimateManagementForm")
    public ModelAndView estimateManagementForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
       
        //견적관리 구분 코드
        mv.addObject("codeList", this.commonService.selectCode("ESTIMATE_MANAGEMENT_TYPE"));
        //견적관리 문의 코드
        mv.addObject("qstList", this.commonService.selectCode("ESTIMATE_QUESTION_TYPE"));
        //견적관리 휴대폰 앞자리 코드
        mv.addObject("hpList", this.commonService.selectCode("HP_CODE"));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : estimateManagementRegist
    * 2. ClassName : EstimateManagementController.java
    * 3. Comment : MD견적 직접 등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/estimateManagementRegist")
    public ModelAndView estimateManagementRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="ESM_PRD_CD") String[] ESM_PRD_CD
    		, @RequestParams(value="ESM_PRD_WSH_PRICE") String[] ESM_PRD_WSH_PRICE
    		, @RequestParams(value="ESM_PRD_ESM_PRICE") String[] ESM_PRD_ESM_PRICE
    		, @RequestParams(value="OPT_DTL_IDXs") String[] OPT_DTL_IDXs
    		, @RequestParams(value="EMS_PRD_CNTs") String[] EMS_PRD_CNTs
    		, @RequestParams(value="ADD_PRD_MST_CDs") String[] ADD_PRD_MST_CDs
    		, @RequestParams(value="OPT_EST_CNTs") String[] OPT_EST_CNTs
    		, @RequestParams(value="PRD_OPT_EST_YNs") String[] PRD_OPT_EST_YNs) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int result = 0;
        String alertMsg = "";
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("ESM_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("ESM_MST_REG_ID", admin.getADM_MST_ID());
        
        commandMap.put("arrESM_PRD_CD", ESM_PRD_CD);
        commandMap.put("arrESM_PRD_WSH_PRICE", ESM_PRD_WSH_PRICE);
        commandMap.put("arrESM_PRD_ESM_PRICE", ESM_PRD_ESM_PRICE);
        commandMap.put("arrOPT_DTL_IDX", OPT_DTL_IDXs);
        commandMap.put("arrEMS_PRD_CNT", EMS_PRD_CNTs);
        commandMap.put("arrADD_PRD_MST_CD", ADD_PRD_MST_CDs);
        commandMap.put("arrOPT_EST_CNT", OPT_EST_CNTs);
        commandMap.put("arrPRD_OPT_EST_YN", PRD_OPT_EST_YNs);
        
        // 등록
        result = this.estimateManagementService.insertEstimateManagement(commandMap);
        
        if(result > 0)
        {
            alertMsg = "정상적으로 저장되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/estimateManagementList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : noticeBoardEdit
    * 2. ClassName : EstimateManagementController.java
    * 3. Comment : 견적 상세 및 견적 상품
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 20.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/estimateManagementEdit")
    public ModelAndView estimateManagementEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //사은품 상세 정보
        Map<String, Object> resultMap = this.estimateManagementService.selectestimateManagementInfo(commandMap);

        // 견적관리 구분 코드 리스트
        mv.addObject("estimateInfo",    resultMap.get("estimateInfo"));
        mv.addObject("mdPchList",    resultMap.get("mdPchList"));
        mv.addObject("mdPorductList",    resultMap.get("mdPorductList"));
        mv.addObject("productList", resultMap.get("productList"));
        mv.addObject("estimateQstNm", resultMap.get("estimateQstNm"));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : estimateManagementPurchaseRegist
    * 2. ClassName : EstimateManagementController.java
    * 3. Comment : 상품에 대한 구매여부 및 상품견적 등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/estimateManagementPurchaseRegist")
    public ModelAndView estimatePurchaseRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap
    		, @RequestParams(value="ESM_PRD_CD") String[] ESM_PRD_CD
    		, @RequestParams(value="ESM_PRD_WSH_PRICE") String[] ESM_PRD_WSH_PRICE
    		, @RequestParams(value="ESM_PRD_ESM_PRICE") String[] ESM_PRD_ESM_PRICE
    		, @RequestParams(value="OPT_DTL_IDXs") String[] OPT_DTL_IDXs
    		, @RequestParams(value="EMS_PRD_CNTs") String[] EMS_PRD_CNTs
    		, @RequestParams(value="ADD_PRD_MST_CDs") String[] ADD_PRD_MST_CDs
    		, @RequestParams(value="OPT_EST_CNTs") String[] OPT_EST_CNTs
    		, @RequestParams(value="PRD_OPT_EST_YNs") String[] PRD_OPT_EST_YNs) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //견적내용
        commandMap.put("arrESM_PRD_CD", ESM_PRD_CD);
        commandMap.put("arrESM_PRD_WSH_PRICE", ESM_PRD_WSH_PRICE);
        commandMap.put("arrESM_PRD_ESM_PRICE", ESM_PRD_ESM_PRICE);
        commandMap.put("arrOPT_DTL_IDX", OPT_DTL_IDXs);
        commandMap.put("arrEMS_PRD_CNT", EMS_PRD_CNTs);
        commandMap.put("arrADD_PRD_MST_CD", ADD_PRD_MST_CDs);
        commandMap.put("arrOPT_EST_CNT", OPT_EST_CNTs);
        commandMap.put("arrPRD_OPT_EST_YN", PRD_OPT_EST_YNs);
        
        int result = 0;
        String alertMsg = "";
        
        commandMap.put("ESM_PCH_REG_IP", request.getRemoteAddr());
        commandMap.put("ESM_PCH_REG_ID", admin.getADM_MST_ID());
        
        //견적 승인여부 저장
        result = this.estimateManagementService.insertEstimatePurchase(commandMap);
        
        if(result > 0)
        {
            alertMsg = "정상적으로 저장되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/estimateManagementList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : estimateManagementPurchaseModify
    * 2. ClassName : EstimateManagementController.java
    * 3. Comment : 견적 승인 수정
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/estimateManagementPurchaseModify")
    public ModelAndView estimatePurchaseModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        int result = 0;
        String alertMsg = "";
        
        commandMap.put("ESM_PCH_UPD_IP", request.getRemoteAddr());
        commandMap.put("ESM_PCH_UPD_ID", admin.getADM_MST_ID());
        
        //견적승인 수정
        result = this.estimateManagementService.updateEstimatePurchase(commandMap);
        
        if(result > 0)
        {
            alertMsg = "정상적으로 저장되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/estimateManagementEdit.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : estimatePurchaseModify
     * 2. ClassName : EstimateManagementController.java
     * 3. Comment : 견적에 대한 사용유무 수정
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 11. 3.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/product/estimateManagementModify")
     public ModelAndView estimateManagementModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         
         int result = 0;
         String alertMsg = "";
         
         commandMap.put("ESM_MST_UPD_IP", request.getRemoteAddr());
         commandMap.put("ESM_MST_UPD_ID", admin.getADM_MST_ID());
         
         //견적승인 수정
         result = this.estimateManagementService.updateEstimateManagement(commandMap);
         
         if(result > 0)
         {
             alertMsg = "정상적으로 저장되었습니다.";
         } 
         else 
         {
             alertMsg = "처리 중 오류가 발생하였습니다.";
         }
         
         //RETURN OBJECT
         mv.addObject("alertMsg", alertMsg);
         mv.addObject("returnUrl", "/am/product/estimateManagementList.do");
         mv.addObject("commandMap", commandMap);
         mv.setViewName("am/common/result");
         return mv;
     }
     
     /**
    * <pre>
    * 1. MethodName : estimateManagementRepInsertAjax
    * 2. ClassName : EstimateManagementController.java
    * 3. Comment : 견적관리 댓글등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 24.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/estimateManagementRepInsertAjax")
    public JSON estimateManagementRepInsertAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
         
         int result = 0;
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         
         commandMap.put("ESM_REP_GBN", "A");
         commandMap.put("ESM_REP_REG_IP", request.getRemoteAddr());
         commandMap.put("ESM_REP_REG_ID", admin.getADM_MST_ID());
         
         // 등록
         result = this.estimateManagementService.insertEstimateManagementRepAjax(commandMap);
         
         if(result > 0){
        	 json.put("result", "0000");
         }
         else{
        	 json.put("result", "-1");
         }
       
       return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : estimateManagementRepListAjax
    * 2. ClassName : EstimateManagementController.java
    * 3. Comment : 견적관리 댓글 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 24.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/estimateManagementRepListAjax")
    public JSON estimateManagementRepListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        List<Map<String, Object>> list = this.estimateManagementService.estimateManagementRepListAjax(commandMap);

        json.put("esmRepList", list);
        
        return json;
    }
}
