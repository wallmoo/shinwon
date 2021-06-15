package com.market.mall.am.display.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.display.service.AdService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.display.controller
 * @FileName : AdController.java
 * @Date : 2015. 11. 26.
 * @프로그램 설명 : 관리자 > 전시관리 > 광고관리를 처리하는 Controller Class
 * @author khcho
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class AdController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="adService") private AdService adService;
    @Resource(name="commonService") private CommonService commonService;    

    /**
     * <pre>
     * 1. MethodName : adList
     * 2. ClassName  : AdController.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/adList")
    public ModelAndView adList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //페이징
        int totalCount = this.adService.selectAdCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
        	list = this.adService.selectAdList(commandMap);
        }
        
        // 광고 노출 페이지
        //List<Map<String, Object>> viewLocationList = this.commonService.selectCode("COMMON_POPUP_VIEW_LOCATION");
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        //mv.addObject("viewLocationList", viewLocationList);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : adEdit
     * 2. ClassName  : AdController.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 수정 화면  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/adEdit")
    public ModelAndView adEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //검색어관리 상세 정보
        Map<String, Object> resultMap = this.adService.selectAdView(commandMap);
        
        //RETURN OBJECT
        mv.addObject("adInfo", resultMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : adRegist
     * 2. ClassName  : AdController.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 등록 처리 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/adRegist")
    public ModelAndView adRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자 ID, IP
        commandMap.put("POP_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("POP_MST_REG_ID", admin.getADM_MST_ID());
        
        result = this.adService.insertAd((MultipartHttpServletRequest)request, commandMap);
        if(result > 0)
        {
            alertMsg = "정상적으로 등록되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/display/adList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : adModify
     * 2. ClassName  : AdController.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 수정 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/adModify")
    public ModelAndView adModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("AD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("AD_MST_UPD_ID", admin.getADM_MST_ID());

        result = this.adService.updateAd((MultipartHttpServletRequest)request, commandMap);
        if(result > 0)
        {
            alertMsg = "정상적으로 수정되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/display/adList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    

    /**
     * <pre>
     * 1. MethodName : adFormPc
     * 2. ClassName  : AdController.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 PC광고 등록 화면 
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/adFormPc")
    public ModelAndView adFormPc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        // 광고 노출 페이지
        List<Map<String, Object>> wchList = this.commonService.selectCode("COMMON_AD_WCH");
        mv.addObject("wchList", wchList);
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : adForm
     * 2. ClassName  : AdController.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 모바일광고 등록 화면  
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/adFormMobile")
    public ModelAndView adFormMobile(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	 ModelAndView mv = new ModelAndView();
         
         // 광고 노출 페이지
         List<Map<String, Object>> wchList = this.commonService.selectCode("COMMON_AD_WCH");
         mv.addObject("wchList", wchList);
         
         return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : adEditPc
     * 2. ClassName  : AdController.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 PC광고 수정 화면  (노출페이지 목록)
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/adEditPc")
    public ModelAndView adEditPc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("AD_MST_IDX"), "")))
        {
            Map<String, Object> resultMap = this.adService.selectAdView(commandMap);
            Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            
            mv.addObject("adInfo",resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
        
        }
        List<Map<String, Object>> wchList = this.commonService.selectCode("COMMON_AD_WCH");
        mv.addObject("wchList", wchList);
                   
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : adEditMobile
     * 2. ClassName  : AdController.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 모바일광고 수정 화면  
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/adEditMobile")
    public ModelAndView adEditMobile(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("AD_MST_IDX"), "")))
        {
            Map<String, Object> resultMap = this.adService.selectAdView(commandMap);
            Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            
            mv.addObject("adInfo",resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
        
        }
        List<Map<String, Object>> wchList = this.commonService.selectCode("COMMON_AD_WCH");
        mv.addObject("wchList", wchList);
                   
        mv.addObject("commandMap", commandMap);
        
        return mv;	
    }    
    
     
    
//    /**
//    * <pre>
//    * 1. MethodName : viewPageCheckAjax
//    * 2. ClassName : AdController.java
//    * 3. Comment : 노출페이지 중복 체크
//    * 4. 작성자 : DEV_KIMSOYOUNG
//    * 5. 작성일 : 2015. 8. 18.
//    * </pre>
//    *
//    * @param request
//    * @param commandMap
//    * @return
//    * @throws Exception
//    */
//    @RequestMapping("/am/display/viewPageCheckAjax")
//    public JSON viewPageCheckAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        JSON json = new JSON();
//        if(!"".equals(StringUtil.getString(commandMap.get("POP_MST_VIEW_LOCATION"), "")))
//        {
//        	Map<String, Object> resultMap = this.adService.selectViewPageCnt(commandMap);
//    		if ( resultMap != null )
//    		{
//        		json.put("cnt", StringUtil.getString(resultMap.get("cnt")));
//    		}
//        }
//        
//        return json;
//    }
}
