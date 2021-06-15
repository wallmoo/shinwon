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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.PlanService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Paging;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : PlanController.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 기획전관리를 처리하는 Controller Class
 * @author kanghk
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class PlanController {
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="planService")
    private PlanService planService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    @Autowired
    private TagService tagService;
    
    /**
    * <pre>
    * 1. MethodName : planList
    * 2. ClassName  : PlanController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/planList")
    public ModelAndView planList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 기획전관리 목록 갯수
        int totalCount = this.planService.selectPlanListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 기획전관리 목록
            list = this.planService.selectPlanList(commandMap);

            for(Map<String,Object> prePlanInfo : list){
                prePlanInfo.put("prePlanServerDomain",propertiesService.getString("server.domain"));
            }
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    
    /**
    * <pre>
    * 1. MethodName : planForm
    * 2. ClassName  : PlanController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 등록 폼 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/planForm")
    public ModelAndView planForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : planEdit
    * 2. ClassName  : PlanController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 수정 폼 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/planEdit")
    public ModelAndView planEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("PLN_MST_IDX"), "")))
        {
            // 기획전관리 상세정보
            Map<String, Object> resultMap = this.planService.selectPlanInfo(commandMap);
            
            // 기본 정보
            mv.addObject("row",resultMap.get("row"));
            
            // 첨부파일 목록
            mv.addObject("fileList", resultMap.get("fileList"));
            
            // 상품구성 그룹 목록
            mv.addObject("detailGroupList", resultMap.get("detailGroupList"));
            
            // 상품구성 목록
            mv.addObject("detailList", resultMap.get("detailList"));
            
            mv.addObject("tagList", resultMap.get("tagList"));
        }
        
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : planRegist
    * 2. ClassName  : PlanController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/planRegist")
    public ModelAndView planRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 기획전관리 관리자 등록
        int result = this.planService.insertPlan((MultipartHttpServletRequest)request, commandMap);

        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/planList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/planList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : planModify
    * 2. ClassName  : PlanController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/planModify")
    public ModelAndView planModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("PLN_MST_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.planService.updatePlan((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/planList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/planList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    /**
     * <pre>
     * 1. MethodName : searchProductPlanPopup
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 상품 기획전검색 팝업 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 13.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/marketing/searchProductPlanPopup")
    public ModelAndView searchProductPlanPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);

        //페이징
        int totalCount = 0;
        
        totalCount = this.planService.selectProductPlanCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
            list = this.planService.selectProductPlanList(commandMap);
        }

        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        
        return mv;
    }
    
    @RequestMapping("/am/marketing/planListModify")
    public ModelAndView planListModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //기본값 설정
        commandMap.put("PLN_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PLN_MST_UPD_ID", admin.getADM_MST_ID());
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String planData = StringUtil.getString(commandMap.get("selectedPlanList"),"");
        List<Map<String, Object>> selectedPlanList = mapper.readValue(planData, typeRef);
        
        commandMap.put("selectedPlanList", selectedPlanList);
        
        if(selectedPlanList != null && selectedPlanList.size() > 0)
        {
        	if("admin".equals(admin.getADM_MST_ID()))
        	{
                // 관리자 수정
                this.planService.updatePlanList(commandMap);
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/planList.do");
        	}
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/planList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
}
