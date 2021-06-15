package com.market.mall.am.marketing.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.FundingService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : FundingController.java
 * @Date : 2020. 06. 10.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 펀딩를 처리하는 Controller Class
 * @author hjkim
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class FundingController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="fundingService") private FundingService fundingService;
    @Resource(name="commonService") private CommonService commonService;    

    /**
     * <pre>
     * 1. MethodName : FundingList
     * 2. ClassName  : FundingController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 목록
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/fundingList")
    public ModelAndView FundingList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
    	
    	String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        //페이징
        int totalCount = this.fundingService.selectFundingCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
        	commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
        	list = this.fundingService.selectFundingList(commandMap);
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
     * 1. MethodName : FundingEdit
     * 2. ClassName  : FundingController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 수정 화면  
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/fundingEdit")
    public ModelAndView FundingEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //검색어관리 상세 정보
        Map<String, Object> resultMap = this.fundingService.selectFundingInfo(commandMap);
        
        //RETURN OBJECT
        mv.addObject("info", resultMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : FundingRegist
     * 2. ClassName  : FundingController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 등록 처리 
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/fundingRegist")
    public ModelAndView FundingRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자 ID, IP
        commandMap.put("FND_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("FND_MST_REG_ID", admin.getADM_MST_ID());
        
        result = this.fundingService.insertFunding((MultipartHttpServletRequest)request, commandMap);
        if(result > 0) {
            alertMsg = "정상적으로 등록되었습니다.";
        } else{
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/marketing/fundingList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : FundingModify
     * 2. ClassName  : FundingController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 수정 처리  
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 06. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/fundingModify")
    public ModelAndView FundingModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("FND_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("FND_MST_UPD_ID", admin.getADM_MST_ID());

        result = this.fundingService.updateFunding((MultipartHttpServletRequest)request, commandMap);
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
        mv.addObject("returnUrl", "/am/marketing/fundingList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }


    /**
    * <pre>
    * 1. MethodName : FundingForm
    * 2. ClassName  : FundingController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 펀딩 수정
    * 4. 작성자       : hjkim
    * 5. 작성일       : 2020. 06. 08
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/fundingListModify")
    public ModelAndView kingerListModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("FND_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("FND_MST_UPD_ID", admin.getADM_MST_ID());

        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String fndMstData = StringUtil.getString(commandMap.get("selectedFndMstList"),"");
        List<Map<String, Object>> selectedFndMstList = mapper.readValue(fndMstData, typeRef);
        
        commandMap.put("selectedFndMstList", selectedFndMstList);


        if(selectedFndMstList != null && selectedFndMstList.size() > 0)
        {
        	if("admin".equals(admin.getADM_MST_ID()))
        	{
                this.fundingService.updateFundingList(commandMap);
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/fundingList.do");
        	}
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/fundingList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : FundingForm
     * 2. ClassName  : FundingController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 등록 화면 
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 6. 09.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/fundingForm")
    public ModelAndView FundingForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        // 광고 노출 페이지
        List<Map<String, Object>> wchList = this.commonService.selectCode("COMMON_AD_WCH");
        mv.addObject("wchList", wchList);
        
        return mv;
    }
    
}
