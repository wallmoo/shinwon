package com.market.mall.am.site.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.DeliveryStateService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class DeliveryStateController {

	@Resource(name="deliveryStateService") private DeliveryStateService deliveryStateService;
    /**
	 * 
	 * <pre>
	 * 1. MethodName	: deliveryStateList
	 * 2. ClassName		: DeliveryStateEditController.java
     * 3. Comment    	: 관리자 > 시스템관리 > 배송/교환/반품정보관리 목록
	 * 4. 작성자			: KimHyeWon
	 * 
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/am/site/deliveryStateList")
    public ModelAndView deliveryStateList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
     
        //입점업체일 경우 입점업체로만 검색
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("searchVdrMstIdx", admin.getADM_MST_SUB_IDX());
            }
        }
        List<Map<String, Object>> list = null;
        int totalCount = this.deliveryStateService.selectDeliveryStateListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        if(totalCount > 0) {
        	list = this.deliveryStateService.selectDeliveryStateList(commandMap);
        }
        mv.addObject("paging", paging );
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    @RequestMapping("/am/site/deliveryStateModify")
    public ModelAndView deliveryStateModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("DLV_INF_REG_IP", request.getRemoteAddr());
        commandMap.put("DLV_INF_REG_ID", admin.getADM_MST_ID());
        
        String serverName = request.getServerName().toString();
        //입점업체 등록
        if(serverName.indexOf("scm") >= 0)
        {
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
            }
        }

        int result = this.deliveryStateService.insertDeliveryState(commandMap);
     
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            if(serverName.indexOf("scm") >= 0)
            {
            	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
            		commandMap.put("DLV_INF_IDX", commandMap.get("DLV_INF_IDX"));
            		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/deliveryStateEdit.do");
            	}
            }
            else
            {
            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/deliveryStateList.do");
            }
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            if(serverName.indexOf("scm") >= 0) {
            	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
            		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/deliveryStateEdit.do");
            	}
            }
            else
            {
            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/deliveryStateList.do");
            }
        }
        mv.setViewName("/am/common/result");
        
        return mv;
    }
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: deliveryStateEdit
	 * 2. ClassName		: DeliveryStateEditController.java
     * 3. Comment    	: 관리자 > 시스템관리 > 배송/교환/반품정보관리 상세
	 * 4. 작성자			: KimHyeWon
	 * 
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/am/site/deliveryStateEdit")
    public ModelAndView deliveryStateEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String serverName = request.getServerName().toString();
        if(serverName.indexOf("scm") >= 0) {
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("searchVdrMstIdx", admin.getADM_MST_SUB_IDX());
        	}
        }
        else
        {
        	commandMap.put("DLV_INF_IDX", commandMap.get("DLV_INF_IDX"));
        }
        Map<String, Object> resultMap = this.deliveryStateService.selectDeliveryStateInfo(commandMap);
        
        mv.addObject("detailList", resultMap.get("detailList"));
        mv.addObject("DLV_INF_IDX", resultMap.get("DLV_INF_IDX"));
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

};
  