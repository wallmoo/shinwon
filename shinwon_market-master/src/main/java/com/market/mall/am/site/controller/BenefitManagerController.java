package com.market.mall.am.site.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.BenefitManagerService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Paging;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class BenefitManagerController {
    
    @Resource(name="benefitManagerService") private BenefitManagerService benefitManagerService;

	@RequestMapping("/am/site/benefitManagerList")
    public ModelAndView benefitManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int totalCount = this.benefitManagerService.selectBenefitManagerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0)
        {
            // 추가혜택 관리 목록
            list = this.benefitManagerService.selectBenefitManagerList(commandMap);
        }
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
	
   @RequestMapping("/am/site/benefitManagerForm")
    public ModelAndView benefitManagerForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
   
   @RequestMapping("/am/site/benefitManagerRegist")
    public ModelAndView benefitManagerRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
       ModelAndView mv = new ModelAndView();
       
       String jsonData = StringUtil.getString(commandMap.get("jsonData"));
       
       int result = 0;
       
       if(!jsonData.equals("") && jsonData != null){
           // 추가혜택 등록
           result = this.benefitManagerService.insertBenefitManager(request, commandMap);
       }
       
       // view Page Info
       if(result > 0)
       {
           mv.addObject("alertMsg", "등록 되었습니다.");
           mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/benefitManagerList.do");
       }
       else
       {
           mv.addObject("alertMsg", "등록에 실패하였습니다.");
           mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/benefitManagerList.do");
       }
       mv.setViewName("/am/common/result");
       
       return mv;
    }
	
   @RequestMapping("/am/site/benefitManagerEdit")
   public ModelAndView benefitManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
   {
       ModelAndView mv = new ModelAndView();
       
       if(!"".equals(StringUtil.getString(commandMap.get("BNF_MST_IDX"), "")))
       {
           // 추가혜택관리 상세정보
           Map<String, Object> resultMap = this.benefitManagerService.selectBenefitManagerInfo(commandMap);
           mv.addObject("row", resultMap.get("row"));
           mv.addObject("detailList", resultMap.get("detailList"));
       }

       mv.addObject("commandMap", commandMap);
       
       return mv;
   }
   
   @RequestMapping("/am/site/benefitManagerModify")
   public ModelAndView benefitManagerModify(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
   {
       ModelAndView mv = new ModelAndView();
       int result = 0;
       if(!"".equals(StringUtil.getString(commandMap.get("BNF_MST_IDX"), "")))
       {
    	   String jsonData = StringUtil.getString(commandMap.get("jsonData"));
    	   if(!jsonData.equals("") && jsonData != null)
    	   {
    		// 추가혜택 관리 수정
               result = this.benefitManagerService.updateBenefitManager(request, commandMap);
    	   }
           // view Page Info
           if(result > 0)
           {
               mv.addObject("alertMsg", "수정 되었습니다.");
               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/benefitManagerList.do");
           }
           else
           {
               mv.addObject("alertMsg", "수정에 실패하였습니다.");
               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/benefitManagerList.do");
           }
           mv.addObject("commandMap", commandMap);
           mv.setViewName("/am/common/result");
       }
       return mv;
   }

}
