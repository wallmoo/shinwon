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
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.site.service.DelivCompanyService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : DelivCompanyController.java
 * @Date : 2014. 4. 1.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 배송업체 관리를 처리하는 Controller Class
 * @author jangsin
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class DelivCompanyController {

    @Resource(name="delivCompanyService")
    private DelivCompanyService delivCompanyService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
    * <pre>
    * 1. MethodName : delivCompanyList
    * 2. ClassName  : DelivCompanyController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/delivCompanyList")
    public ModelAndView delivCompanyList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 배송업체 관리 목록 갯수
        int totalCount = this.delivCompanyService.selectDelivCompanyListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            
            // 배송업체 관리 목록
            list = this.delivCompanyService.selectDelivCompanyList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : delivCompanyForm
    * 2. ClassName  : DelivCompanyController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 등록 폼
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/delivCompanyForm")
    public ModelAndView delivCompanyForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("codeList",this.commonService.selectCode("TEL_CODE"));
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : delivCompanyEdit
    * 2. ClassName  : DelivCompanyController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 수정 폼 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/delivCompanyEdit")
    public ModelAndView delivCompanyEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("DLV_CPN_IDX"), "")))
        {
            mv.addObject("row", this.delivCompanyService.selectDelivCompanyInfo(commandMap));
        }
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : delivCompanyRegist
    * 2. ClassName  : DelivCompanyController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/delivCompanyRegist")
    public ModelAndView delivCompanyRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int result = 0;
        result = this.delivCompanyService.insertDelivCompany(request, commandMap);
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/delivCompanyList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/delivCompanyList.do");
        }
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : delivCompanyModify
    * 2. ClassName  : DelivCompanyController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 수정
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/delivCompanyModify")
    public ModelAndView delivCompanyModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        int result = 0;
        
        if(!"".equals(StringUtil.getString(commandMap.get("DLV_CPN_IDX"), "")))
        {
            result = this.delivCompanyService.updateDelivCompany(request, commandMap);
        }
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/delivCompanyList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/delivCompanyList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
        return mv;
    }
}
