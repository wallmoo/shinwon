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
import com.market.mall.am.site.service.AuthManagerService;
import com.market.mall.am.site.service.MenuManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;


/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : AuthManagerController.java
 * @Date : 2014. 3. 25.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 권한관리 처리하는 Controller Class
 * @author jangsin
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class AuthManagerController {
    
    @Resource(name="authManagerService")
    private AuthManagerService authManagerService;
    
    @Resource(name="menuManagerService")
    private MenuManagerService menuManagerService;

    @Resource(name="commonService")
    private CommonService commonService;
    
     /**
    * <pre>
    * 1. MethodName : basicManagerList
    * 2. ClassName  : AuthManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/authManagerList")
     public ModelAndView authManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         
         if("admin".equals(admin.getADM_MST_ID()))
         {
        	// 권한관리 목록 갯수
             int totalCount = this.authManagerService.selectAuthManagerListCount(commandMap);
             
             Paging paging = new Paging(totalCount, commandMap);
             mv.addObject( "paging", paging );

             commandMap.put("startNum", paging.getStartNum());
             commandMap.put("endNum", paging.getEndNum());
             
             List<Map<String, Object>> list = null;
             if (totalCount > 0){
                 
                 // 권한관리 목록
                 list = this.authManagerService.selectAuthManagerList(commandMap);
             }
             
             mv.addObject("totalCount", totalCount);
             mv.addObject("commandMap", commandMap);
             mv.addObject("list", list);
         }
         else
         {
        	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
             
             mv.setViewName("/am/common/result");
         }
         
         return mv;
     }
    
    /**
     * <pre>
     * 1. MethodName : basicManagerForm
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 등록 폼
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/site/authManagerForm")
     public ModelAndView authManagerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         
         if("admin".equals(admin.getADM_MST_ID()))
         {
        	 // 관리자 메뉴 리스트
        	 commandMap.put("searchAdmMnuOnYN","Y");
             mv.addObject("menuList", this.menuManagerService.selectmenuManagerList(commandMap));
             
             mv.addObject("commandMap", commandMap);
             
         }
         else
         {
        	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
             
             mv.setViewName("/am/common/result");
         }
         
         return mv;
     }
     
     
     /**
    * <pre>
    * 1. MethodName : authManagerRegist
    * 2. ClassName  : AuthManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 등록
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/authManagerRegist")
     public ModelAndView authManagerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         int result = this.authManagerService.insertAuthManager(request, commandMap);
         
         // view Page Info
         if(result > 0)
         {
             mv.addObject("alertMsg", "등록 되었습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/authManagerList.do");
             
         }
         else
         {
             mv.addObject("alertMsg", "등록에 실패하였습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/authManagerList.do");
         }
         mv.setViewName("/am/common/result");
         
         return mv;
     }
    
    /**
    * <pre>
    * 1. MethodName : authManagerEdit
    * 2. ClassName  : AuthManagerController.java
    * 3. Comment    :  관리자 > 사이트 관리 > 권한관리 수정 폼
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/authManagerEdit.do")
    public ModelAndView authManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
	        if(!"".equals(StringUtil.getString(commandMap.get("AUT_MST_IDX"), "")))
	        {
	            // 관리자 메뉴 리스트
	            commandMap.put("ADM_AUT_MST_IDX", StringUtil.getString(commandMap.get("AUT_MST_IDX"), ""));
	            commandMap.put("searchAdmMnuOnYN","Y");
	            mv.addObject("menuList", this.menuManagerService.selectmenuManagerList(commandMap));
	            commandMap.remove("ADM_AUT_MST_IDX");
	            
	            // 권한관리 상세 정보
	            mv.addObject("row", this.authManagerService.selectAuthManagerInfo(commandMap));
	            mv.addObject("commandMap", commandMap);
	            
	        }
        }
        else
        {
        	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            
            mv.setViewName("/am/common/result");
        }
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : authmanagerModify
    * 2. ClassName  : AuthManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 수정
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/authManagerModify")
    public ModelAndView authmanagerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("AUT_MST_IDX"), "")))
        {
            int result = this.authManagerService.updateAuthManager(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/authManagerList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/authManagerList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
}
