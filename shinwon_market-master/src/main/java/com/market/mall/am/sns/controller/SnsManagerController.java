package com.market.mall.am.sns.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.sns.service.SnsManagerService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Paging;

/**
 * @PackageName: com.market.mall.am.sns.controller
 * @FileName : SnsManagerController.java
 * @Date : 2016. 8. 17.
 * @프로그램 설명 : 관리자 > SNS관리 처리하는 Controller Class
 * @author DEV_KIMYEONGJUN
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class SnsManagerController {  
    
    @Resource(name="snsManagerService")   
    private SnsManagerService snsManagerService;    
    
    @Resource(name="commonService")
    private CommonService commonService;
      
    /**
     * <pre>
     * 1. MethodName : snsManagerList
     * 2. ClassName  : SnsManagerController.java
     * 3. Comment    : 관리자 > SNS관리 > SNS목록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return  
     * @throws Exception
     */
    @RequestMapping("/am/sns/snsManagerList")    
    public ModelAndView snsManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {  
        ModelAndView mv = new ModelAndView();
          
        // SNS목록 갯수  
        int totalCount = this.snsManagerService.selectSnsManagerListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );   
             
        List<Map<String, Object>> list = null;  
        if (totalCount > 0){   
             
            // SNS목록 
            list = this.snsManagerService.selectSnsManagerList(commandMap);
        } 
        
        // SNS 구분코드 목록
        mv.addObject("codeList", this.commonService.selectCode("SNS_TYPE_CODE"));
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }  
    
    /**
     * <pre>
     * 1. MethodName : snsManagerForm
     * 2. ClassName  : SnsManagerController.java
     * 3. Comment    : 관리자 > SNS관리 > SNS등록 폼
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/sns/snsManagerForm")
    public ModelAndView snsManagerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        // SNS 구분코드 목록
        mv.addObject("codeList", this.commonService.selectCode("SNS_TYPE_CODE"));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
      
    /**
    * <pre>
    * 1. MethodName : checkIdAjax
    * 2. ClassName  : JoinMemberController.java
    * 3. Comment    : 관리자 > SNS관리 > SNS등록 폼 > SNS 타입 중복 체크
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 11. 13.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/am/sns/checkSnsTypeAjax")
    public JSON checkSnsTypeAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        if(!"".equals(StringUtil.getString(commandMap.get("SNS_MST_TYPE"), "")))
        {  
            // SNS 타입 중복 체크
            int snsTypeCount = this.snsManagerService.selectSnsManagerListCount(commandMap);
            
            if( snsTypeCount > 0) 
            {
                json.put("resultYn", "N");
            }
            else
            {
                json.put("resultYn", "Y");
            }
            json.put("successYn", "Y");
        }
        else 
        { 
            json.put("successYn", "N");
        }
        
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : snsManagerRegist
     * 2. ClassName  : SnsManagerController.java
     * 3. Comment    : 관리자 > SNS관리 > SNS등록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/sns/snsManagerRegist") 
    public ModelAndView snsManagerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
          
        // SNS 등록 
        int result = this.snsManagerService.insertSnsManager(request, commandMap);
        
        // 등록 성공 여부
        if(result > 0)        
        {   
            mv.addObject("alertMsg", "SNS관리 등록에 성공하셨습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/sns/snsManagerList.do");
        }
        else if(result == 0)
        {   
            mv.addObject("alertMsg", "SNS관리 등록을 실패하였습니다.");  
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/sns/snsManagerForm.do");
        }
        else
        {
            mv.addObject("alertMsg", "SNS관리 등록을 실패하였습니다. \\n 문제가 계속 발생시 관리자에게 문의해주세요.");   
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/sns/snsManagerForm.do");
        }
            
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName : snsManagerEdit
     * 2. ClassName  : SnsManagerController.java
     * 3. Comment    : 관리자 > SNS관리 > SNS 수정 폼
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/sns/snsManagerEdit")
    public ModelAndView snsManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("SNS_MST_IDX"), "")))
        {
           // SNS 상세정보  
           mv.addObject("row", this.snsManagerService.selectSnsManagerInfo(commandMap));
        }
        else
        {
            mv.addObject("alertMsg", "데이터가 누락되었습니다. SNS 관리 목록으로 이동합니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/sns/snsManagerList.do");
            mv.setViewName("/am/common/result");
        }
 
        mv.addObject("commandMap", commandMap);
         
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : snsManagerModify
     * 2. ClassName  : SnsManagerController.java
     * 3. Comment    : 관리자 > SNS관리 > SNS 수정
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap 
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/sns/snsManagerModify")
    public ModelAndView snsManagerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
         
        if(!"".equals(StringUtil.getString(commandMap.get("SNS_MST_IDX"), "")))
        {
            // SNS 수정
            int result = this.snsManagerService.updateSnsManager(request, commandMap); 
             
            if(result > 0)
            {
                mv.addObject("alertMsg", "SNS관리 수정에 성공하셨습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/sns/snsManagerEdit.do");
            }
            else if(result == 0)
            {   
                mv.addObject("alertMsg", "SNS관리 수정을 실패하였습니다.");  
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/sns/snsManagerEdit.do");
            }
            else
            {
                mv.addObject("alertMsg", "SNS관리 수정을 실패하였습니다. \\n 문제가 계속 발생시 관리자에게 문의해주세요.");   
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/sns/snsManagerEdit.do");
            } 
        }
        else  
        {
            mv.addObject("alertMsg", "데이터가 누락되었습니다. SNS 관리 목록으로 이동합니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/sns/snsManagerList.do");
        } 
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
        return mv;
    }
}
