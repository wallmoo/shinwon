package com.market.mall.am.marketing.controller;

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
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.OneDayService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : OneDayController.java
 * @Date : 2015. 11. 26.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 원데이특가를 처리하는 Controller Class
 * @author khcho
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class OneDayController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="oneDayService") private OneDayService oneDayService;
    @Resource(name="commonService") private CommonService commonService;    

    /**
     * <pre>
     * 1. MethodName : oneDayList
     * 2. ClassName  : OneDayController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/oneDayList")
    public ModelAndView oneDayList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
    	
    	String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        //페이징
        int totalCount = this.oneDayService.selectOneDayCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
        	list = this.oneDayService.selectOneDayList(commandMap);
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
     * 1. MethodName : oneDayEdit
     * 2. ClassName  : OneDayController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 수정 화면  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/oneDayEdit")
    public ModelAndView oneDayEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //검색어관리 상세 정보
        Map<String, Object> resultMap = this.oneDayService.selectOneDayInfo(commandMap);
        
        //RETURN OBJECT
        mv.addObject("info", resultMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : oneDayRegist
     * 2. ClassName  : OneDayController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 등록 처리 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/oneDayRegist")
    public ModelAndView oneDayRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자 ID, IP
        commandMap.put("ONE_DAY_REG_IP", request.getRemoteAddr());
        commandMap.put("ONE_DAY_REG_ID", admin.getADM_MST_ID());
        
        result = this.oneDayService.insertOneDay((MultipartHttpServletRequest)request, commandMap);
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
        mv.addObject("returnUrl", "/am/marketing/oneDayList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : oneDayModify
     * 2. ClassName  : OneDayController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 수정 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/oneDayModify")
    public ModelAndView oneDayModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("ONE_DAY_UPD_IP", request.getRemoteAddr());
        commandMap.put("ONE_DAY_UPD_ID", admin.getADM_MST_ID());

        result = this.oneDayService.updateOneDay((MultipartHttpServletRequest)request, commandMap);
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
        mv.addObject("returnUrl", "/am/marketing/oneDayList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    

    /**
     * <pre>
     * 1. MethodName : oneDayForm
     * 2. ClassName  : OneDayController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 등록 화면 
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/oneDayForm")
    public ModelAndView oneDayForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        // 광고 노출 페이지
        List<Map<String, Object>> wchList = this.commonService.selectCode("COMMON_AD_WCH");
        mv.addObject("wchList", wchList);
        
        return mv;
    }
    
    
    
    
    
}
