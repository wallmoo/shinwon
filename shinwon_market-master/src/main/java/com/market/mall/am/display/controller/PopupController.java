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
import com.market.mall.am.display.service.PopupService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;

import oracle.sql.CLOB;

import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.display.controller
 * @FileName : PopupController.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 팝업관리를 처리하는 Controller Class
 * @author ejpark
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class PopupController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="popupService") private PopupService popupService;
    @Resource(name="commonService") private CommonService commonService;    

    /**
     * <pre>
     * 1. MethodName : popupList
     * 2. ClassName  : PopupController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 목록 갯수 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/popupList")
    public ModelAndView popupList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //페이징
        int totalCount = this.popupService.selectPopupCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
        	list = this.popupService.selectPopupList(commandMap);
        }
        
        // 팝업 노출 페이지
        List<Map<String, Object>> viewLocationList = this.commonService.selectCode("COMMON_POPUP_VIEW_LOCATION");
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("viewLocationList", viewLocationList);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : popupEdit
     * 2. ClassName  : PopupController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 수정 화면  
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/popupEdit")
    public ModelAndView popupEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //검색어관리 상세 정보
        Map<String, Object> resultMap = this.popupService.selectPopupView(commandMap);
        
        String popMstCnt = StringUtil.getString(resultMap.get("POP_MST_CNT"),"");
        if(!"".equals(popMstCnt)){
           if(resultMap.get("POP_MST_CNT") instanceof CLOB) {
        	   resultMap.put("POP_MST_CNT", StringUtil.clobToStr((CLOB)resultMap.get("POP_MST_CNT")));
           }
        }
        //RETURN OBJECT
        mv.addObject("popupInfo", resultMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : popupRegist
     * 2. ClassName  : PopupController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 등록 처리 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/popupRegist")
    public ModelAndView popupRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자 ID, IP
        commandMap.put("POP_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("POP_MST_REG_ID", admin.getADM_MST_ID());
        
        result = this.popupService.insertPopup((MultipartHttpServletRequest)request, commandMap);
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
        mv.addObject("returnUrl", "/am/display/popupList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : popupModify
     * 2. ClassName  : PopupController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 수정 처리  
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/popupModify")
    public ModelAndView popupModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("POP_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("POP_MST_UPD_ID", admin.getADM_MST_ID());

        result = this.popupService.updatePopup((MultipartHttpServletRequest)request, commandMap);
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
        mv.addObject("returnUrl", "/am/display/popupList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    

    /**
     * <pre>
     * 1. MethodName : popupFormPc
     * 2. ClassName  : PopupController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 PC팝업 등록 화면 
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/popupFormPc")
    public ModelAndView popupFormPc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        // 팝업 노출 페이지
       // List<Map<String, Object>> viewLocationList = this.commonService.selectCode("COMMON_POPUP_VIEW_LOCATION");
       // mv.addObject("viewLocationList", viewLocationList);
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : popupForm
     * 2. ClassName  : PopupController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 모바일팝업 등록 화면  
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/popupFormMobile")
    public ModelAndView popupFormMobile(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : popupEditPc
     * 2. ClassName  : PopupController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 PC팝업 수정 화면  (노출페이지 목록)
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/popupEditPc")
    public ModelAndView popupEditPc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("POP_MST_IDX"), "")))
        {
        	//검색어관리 상세 정보
	        Map<String, Object> resultMap = this.popupService.selectPopupView(commandMap);
	        
	        Map<String, Object> popupInfo = (Map<String, Object>)resultMap.get("row"); 
	        
	        String popMstCnt = StringUtil.getString(popupInfo.get("POP_MST_CNT"),"");
	        if(!"".equals(popMstCnt)){
	           if(popupInfo.get("POP_MST_CNT") instanceof CLOB) {
	        	   popupInfo.put("POP_MST_CNT", StringUtil.clobToStr((CLOB)popupInfo.get("POP_MST_CNT")));
	           }
	        }
	        
	        //RETURN OBJECT
	        mv.addObject("fileList", resultMap.get("fileList"));
	        mv.addObject("popupInfo", popupInfo);    
        }
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : popupEditMobile
     * 2. ClassName  : PopupController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 모바일팝업 수정 화면  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/display/popupEditMobile")
    public ModelAndView popupEditMobile(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("POP_MST_IDX"), "")))
        {
        	//검색어관리 상세 정보
	        Map<String, Object> resultMap = this.popupService.selectPopupView(commandMap);
	        
	        Map<String, Object> popupInfo = (Map<String, Object>)resultMap.get("row"); 
	        
	        String popMstCnt = StringUtil.getString(popupInfo.get("POP_MST_CNT"),"");
	        if(!"".equals(popMstCnt)){
	           if(popupInfo.get("POP_MST_CNT") instanceof CLOB) {
	        	   popupInfo.put("POP_MST_CNT", StringUtil.clobToStr((CLOB)popupInfo.get("POP_MST_CNT")));
	           }
	        }
	        
	        //RETURN OBJECT
	        mv.addObject("fileList", resultMap.get("fileList"));
	        mv.addObject("popupInfo", popupInfo);    
        }
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }    
    
    /**
    * <pre>
    * 1. MethodName : getPopViewPageListAjax
    * 2. ClassName : PopupController.java
    * 3. Comment : 팝업 노출페이지 리스트 불러오기
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 8. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/getPopViewPageListAjax")
    public JSON getPopViewPageListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
    	
    	// 팝업 노출 페이지 목록
        List<Map<String, Object>> viewLocationList = this.popupService.popupFormMobile(commandMap);

        json.addObject("viewLocationList", viewLocationList);
    	
    	return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : viewPageCheckAjax
    * 2. ClassName : PopupController.java
    * 3. Comment : 노출페이지 중복 체크
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 8. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/viewPageCheckAjax")
    public JSON viewPageCheckAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("POP_MST_VIEW_LOCATION"), "")))
        {
        	Map<String, Object> resultMap = this.popupService.selectViewPageCnt(commandMap);
    		if ( resultMap != null )
    		{
        		json.put("cnt", StringUtil.getString(resultMap.get("cnt")));
    		}
        }
        
        return json;
    }
    
    @RequestMapping("/am/display/popupListStatusChangeAjax")
    public JSON channelOnListStatusChangeAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap
            , @RequestParams String USE_YN_LIST) throws Exception{
    	
        JSON json = new JSON();
        int result = 0;
        
        commandMap.put("USE_YN_LIST", USE_YN_LIST);
        
        if(USE_YN_LIST != null){
            result = this.popupService.updatePopupStatus(request, commandMap);
        }else{
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        
        if(result > 0) {
            json.put("message", "저장에 성공하였습니다.");
        }
        else{
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        
        return json;
    }
}
