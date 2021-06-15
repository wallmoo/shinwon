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
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.SpecialService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Paging;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class SpecialController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="specialService") private SpecialService specialService;
    @Resource(name="commonService") private CommonService commonService;    

    /**
     * <pre>
     * 1. MethodName : specialList
     * 2. ClassName  : SpecialController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 스페셜 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/specialList")
    public ModelAndView specialList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();

        //페이징
        int totalCount = this.specialService.selectSpecialCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount > 0)
        {
        	list = this.specialService.selectSpecialList(commandMap);
        }
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : specialForm
     * 2. ClassName  : SpecialController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 스페셜 등록 화면 
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/specialForm")
    public ModelAndView specialForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : specialEdit
     * 2. ClassName  : SpecialController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 스페셜 수정 화면  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/specialEdit")
    public ModelAndView specialEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            // 채널ON 관리 상세정보
            Map<String, Object> resultMap = this.specialService.selectSpecialInfo(commandMap);
            Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            
            // 기본 정보
            mv.addObject("row", resultMap.get("row"));
            
            // 첨부파일 목록
            mv.addObject("fileList", resultMap.get("fileList"));
            
            // 상품구성 목록
            mv.addObject("detailList", resultMap.get("detailList"));
            
            // 태그 리스트
            mv.addObject("tagList", resultMap.get("tagList"));
        }

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : specialRegist
     * 2. ClassName  : SpecialController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 스페셜 등록 처리 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/specialRegist")
    public ModelAndView specialRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자 ID, IP
        commandMap.put("CNT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_REG_ID", admin.getADM_MST_ID());
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL);
        result = this.specialService.insertSpecial((MultipartHttpServletRequest)request, commandMap);
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
        mv.addObject("returnUrl", "/am/marketing/specialList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : specialModify
     * 2. ClassName  : SpecialController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 스페셜 수정 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/specialModify")
    public ModelAndView specialModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL);
        result = this.specialService.updateSpecial((MultipartHttpServletRequest)request, commandMap);
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
        mv.addObject("returnUrl", "/am/marketing/specialList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("am/common/result");

        return mv;
    }
    
    @RequestMapping(value="/am/marketing/specialListModify")
    public ModelAndView specialListModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SPECIAL);
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String specialData = StringUtil.getString(commandMap.get("selectedSpecialList"),"");
        List<Map<String, Object>> selectedSpecialList = mapper.readValue(specialData, typeRef);
        
        commandMap.put("selectedSpecialList", selectedSpecialList);
        
        if(selectedSpecialList != null && selectedSpecialList.size() > 0)
        {
        	if("admin".equals(admin.getADM_MST_ID()))
        	{
                // 관리자 수정
                this.specialService.updateSpecialList(commandMap);
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/specialList.do");
        	}
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/specialList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
}
