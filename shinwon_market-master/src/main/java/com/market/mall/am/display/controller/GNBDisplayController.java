package com.market.mall.am.display.controller;

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
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;

import com.market.mall.am.display.service.GnbDisplayService;
import com.market.mall.am.product.service.BasicProductService;
import com.market.mall.am.product.service.SpecManagementService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.util.MakeCategoryHtmlUtil;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class GNBDisplayController {
private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="gnbDisplayService") private GnbDisplayService gnbDisplayService;
    @Resource(name="specManagementService") private SpecManagementService specManagementService;
    @Resource(name="basicProductService") private BasicProductService basicProductService;
    
    @RequestMapping(value="/am/display/gnbDisplayList")
    public ModelAndView gnbDisplayList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        if(!Code.USER_ENV_TYPE_MOBILE.equals(commandMap.get("DSP_GNB_ENV"))){
            commandMap.put("DSP_GNB_ENV",Code.USER_ENV_TYPE_PC);
        }
        
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    
    // 삭제 해야하나?
    @RequestMapping(value="/am/display/gnbChangePopup")
    public ModelAndView gnbChangePopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping(value="/am/display/gnbDisplayAjax")
    public JSON gnbDisplayAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        JSON json = new JSON();

        commandMap.put("useYn", "all"); //전체 카테고리
        List<Map<String, Object>> list = this.gnbDisplayService.selectGnbDisplayList(commandMap);
        
        String gnbHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "DSP_GNB_LEVEL", "DSP_GNB_IDX", "DSP_GNB_NM");
        
        json.put("gnbList", gnbHtml);
        
        return json;
    }
    
    @RequestMapping(value="/am/display/gnbDisplayEdit")
    public ModelAndView gnbDisplayEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> gnbDisplayView = null;
        
        if(!"".equals(StringUtil.getString(commandMap.get("DSP_GNB_IDX")))){
            gnbDisplayView = this.gnbDisplayService.selectGnbDisplayView(commandMap);
        }
        
        int CHILD_CNT = 0;
        int DSP_GNB_LEVEL = 0;
        try{
            CHILD_CNT = StringUtil.getInt(gnbDisplayView.get("CHILD_CNT"), 0);
            DSP_GNB_LEVEL = StringUtil.getInt(gnbDisplayView.get("DSP_GNB_LEVEL"), 0);
        }catch(NullPointerException e){
             CHILD_CNT = 0;
             DSP_GNB_LEVEL = 0;
        }
        
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> specList = null;
        
        if (CHILD_CNT > 0){
            commandMap.put("useYn", "all"); //전체 카테고리
            list = this.gnbDisplayService.selectSubGnbDisplayList(commandMap);
        
        }
        
        //3뎁스일때 카테고리에 추가 된 스펙정보를 불러온다
        if(DSP_GNB_LEVEL == 3){
            specList = this.gnbDisplayService.selectSpecGnbList(commandMap);
        }
        mv.addObject("gnbDisplayView", gnbDisplayView);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        mv.addObject("specList", specList);
        mv.setViewName("/am/display/gnbDisplayEdit");
        
        return mv;
    }
    
    @RequestMapping(value="/am/display/gnbDisplayRootEdit")
    public ModelAndView gnbDisplayRootEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> list = null;
        commandMap.put("useYn", "all"); //전체 카테고리
        list = this.gnbDisplayService.selectSubGnbDisplayList(commandMap);
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/display/gnbDisplayEdit");
        return mv;
    }

    @RequestMapping(value="/am/display/gnbDisplayRegist")
    public ModelAndView gnbDisplayRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
            , @RequestParams(value="DSP_GNB_IDXs") String[] DSP_GNB_IDXs) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("DSP_GNB_REG_IP", request.getRemoteAddr());
        commandMap.put("DSP_GNB_REG_ID", admin.getADM_MST_ID());
        
        int result = 0;

        result = this.gnbDisplayService.insertGnbDisplay(commandMap);
        if(result > 0){
            mv.addObject("alertMsg", "정상적으로 등록되었습니다.");
            commandMap.put("DSP_GNB_IDX", result );
            int level = 1;
            
            try{
                level = Integer.parseInt((String) commandMap.get("DSP_GNB_LEVEL"))+1;
            }catch( NumberFormatException e){
            
            }
            
            commandMap.put("DSP_GNB_LEVEL", level );
        }else{
            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
        }
        
        mv.addObject("returnUrl", "/am/display/gnbDisplayList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    @FrontBannerSkip
    @RequestMapping(value="/am/display/gnbDisplayModify")
    public ModelAndView gnbDisplayModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
            , @RequestParams(value="DSP_GNB_IDXs") String[] DSP_GNB_IDXs) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("DSP_GNB_UPD_IP", request.getRemoteAddr());
        commandMap.put("DSP_GNB_UPD_ID", admin.getADM_MST_ID());

        int result = 0;
        
        commandMap.put("DSP_GNB_IDXs", DSP_GNB_IDXs);
        
        result = this.gnbDisplayService.updateGnbDisplay(commandMap);
        if(result > 0){
            mv.addObject("alertMsg", "정상적으로 처리되었습니다.");
        } else {
            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
        }
        
        mv.addObject("returnUrl", "/am/display/gnbDisplayList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    @RequestMapping(value="/am/display/subGnbDisplayAjax")
    public JSON subGnbDisplayAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        JSON json = new JSON();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        //입점업체 여부
        if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
            commandMap.put("searchGnbDisVdrYn", "Y");
        }

        List<Map<String, Object>> list = this.gnbDisplayService.selectSubGnbDisplayList(commandMap);

        json.put("gnbList", list);
        
        return json;
    }
    
    @RequestMapping(value="/am/display/subSpecManagementDisplayAjax")
    public JSON subSpecManagementDisplayAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        JSON json = new JSON();

        List<Map<String, Object>> list = this.specManagementService.subSpecManagementProductAjax(commandMap);

        json.put("gnbList", list);
        
        return json;
    }

    @RequestMapping(value="/am/display/searchgnbPopup")
    public ModelAndView searchgnbPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    @RequestMapping(value="/am/display/gnbDisplayFormPopup")
    public ModelAndView gnbDisplayFormPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        int iDspGnbIdx = -1;
        Map<String, Object> gnbDisplayView = null;
        int CHILD_CNT = 0;
        
        try{
            iDspGnbIdx = Integer.parseInt( (String)commandMap.get("DSP_GNB_IDX") );
            gnbDisplayView = this.gnbDisplayService.selectGnbDisplayView(commandMap);
        }catch(RuntimeException e){
            
            gnbDisplayView = new HashMap<String, Object>();
            gnbDisplayView.put("DSP_GNB_IDX", -1);
            gnbDisplayView.put("DSP_GNB_UP_IDX", -1);
            gnbDisplayView.put("DSP_GNB_TOP_IDX", -1);
            gnbDisplayView.put("DSP_GNB_LEVEL", 0);
            gnbDisplayView.put("DSP_GNB_ENV", commandMap.get("DSP_GNB_ENV"));
        }
        
        
        // root에 등록하는 경우 gnbDisplayView이 null임.
        try {
            CHILD_CNT = StringUtil.getInt(gnbDisplayView.get("CHILD_CNT"), 0);
        }catch(NullPointerException e){
             CHILD_CNT = 0;
        }    
        
        List<Map<String, Object>> list = null;
        if (CHILD_CNT > 0){
            commandMap.put("useYn", "all"); //전체 카테고리
            list = this.gnbDisplayService.selectSubGnbDisplayList(commandMap);
        }
        mv.addObject("gnbDisplayView", gnbDisplayView);
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : gnbDisplayDelete
     * 2. ClassName  : gnbDisplayController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 삭제 처리
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param DSP_GNB_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/gnbDisplayDelete")
    public ModelAndView gnbDisplayDelete(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("DSP_GNB_UPD_IP", request.getRemoteAddr());
        commandMap.put("DSP_GNB_UPD_ID", admin.getADM_MST_ID());
        
        int useDisplay = 0;
        int result = 0;
        
        //해당 카테고리로 상품이 등록 되어있는 확인
        commandMap.put("searchYn", "Y");
        commandMap.put("searchDspGnbEnv", commandMap.get("DSP_GNB_ENV"));
        commandMap.put("searchDspGnbIdx", commandMap.get("DSP_GNB_IDX"));
        useDisplay = this.basicProductService.selectBasicProductCount(commandMap);
        
        if(useDisplay > 0){
            mv.addObject("alertMsg", "해당 카테고리는 상품에서 사용되고 있습니다.\\n카테고리가 등록 된 상품을 삭제하고 진행해주세요.");
        }else{
            result = this.gnbDisplayService.deleteGnbDisplay(commandMap);
            if(result > 0){
                mv.addObject("alertMsg", "삭제 되었습니다.");
            }else{
                mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
            }
        }
        
        commandMap.put("DSP_GNB_IDX", "");
        mv.addObject("returnUrl", "/am/display/gnbDisplayList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : gnbDisplayRegist
     * 2. ClassName  : gnbDisplayController.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙 등록  
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param DSP_GNB_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/gnbDisplaySpecRegist")
    public ModelAndView gnbSpecRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("DSP_GNB_REG_IP", request.getRemoteAddr());
        commandMap.put("DSP_GNB_REG_ID", admin.getADM_MST_ID());
        commandMap.put("DSP_GNB_SPC_IDX", commandMap.get("searchDspGnbDepth3"));
        
        int DSP_GNB_IDX = Integer.parseInt((String) commandMap.get("DSP_GNB_IDX"));
        int DSP_GNB_LEVEL = Integer.parseInt((String) commandMap.get("DSP_GNB_LEVEL"));
        int result = 0;
        int resultCnt = 0;
        
        resultCnt = this.gnbDisplayService.selectGnbSpecCount(commandMap);
        
        if(resultCnt > 0){
            mv.addObject("alertMsg", "동일한 스펙이 이미 추가 되어 있습니다.");
        }else{
            result = this.gnbDisplayService.insertGnbSpec(commandMap);
            if(result > 0){
                mv.addObject("alertMsg", "정상적으로 등록되었습니다.");
                commandMap.put("DSP_GNB_IDX", DSP_GNB_IDX );
                commandMap.put("DSP_GNB_LEVEL", DSP_GNB_LEVEL );
            } else {
                mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
            }
        }
        mv.addObject("returnUrl", "/am/display/gnbDisplayList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : gnbDisplayDelete
     * 2. ClassName  : gnbDisplayController.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙삭제
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param DSP_GNB_IDXs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/gnbDisplaySpecDelete")
    public ModelAndView gnbSpecDelete(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("DSP_GNB_UPD_IP", request.getRemoteAddr());
        commandMap.put("DSP_GNB_UPD_ID", admin.getADM_MST_ID());
        
        int DSP_GNB_IDX = Integer.parseInt((String) commandMap.get("DSP_GNB_IDX"));
        int DSP_GNB_LEVEL = Integer.parseInt((String) commandMap.get("DSP_GNB_LEVEL"));
        
        int result = 0;
        
        //해당 카테고리로 상품이 등록 되어있는 확인
        
        result = this.gnbDisplayService.deleteGnbSpec(commandMap);
        if(result > 0){
            mv.addObject("alertMsg", "삭제 되었습니다.");
            commandMap.put("DSP_GNB_IDX", DSP_GNB_IDX );
            commandMap.put("DSP_GNB_LEVEL", DSP_GNB_LEVEL );
        } else {
            mv.addObject("alertMsg", "처리 중 오류가 발생하였습니다.");
        }
        
        mv.addObject("returnUrl", "/am/display/gnbDisplayList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
}
