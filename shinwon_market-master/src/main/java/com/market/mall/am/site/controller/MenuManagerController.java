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
import com.epasscni.viewer.JSON;
import com.market.mall.am.site.service.MenuManagerService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : MenuManagerController.java
 * @Date : 2014. 4. 2.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 메뉴관리를 처리하는 Controller Class
 * @author jangsin
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class MenuManagerController {

    @Resource(name="menuManagerService")
    private MenuManagerService menuManagerService;
    
    /**
    * <pre>
    * 1. MethodName : menuManagerList
    * 2. ClassName  : MenuManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 목록
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/menuManagerList")
    public ModelAndView menuManagerList(HttpServletRequest request, @RequestParams Map<String, Object>commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        commandMap.put("ADM_MNU_LEVEL", "0");
        // 메뉴 관리 목록 갯수
        int totalCount = this.menuManagerService.selectMenuManagerListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0)
        {
            // 메뉴 관리 목록
            list = this.menuManagerService.selectmenuManagerList(commandMap);
        }
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : menuManagerForm
    * 2. ClassName  : MenuManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 등록 폼
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/menuManagerForm")
    public ModelAndView menuManagerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("ADM_MNU_IDX"), "")))
        {
            // 메뉴 관리 상세정보
            mv.addObject("row", this.menuManagerService.selectMenuManagerInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : menuManagerRegist
    * 2. ClassName  : MenuManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 등록
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/menuManagerRegist")
    public ModelAndView menuManagerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 메뉴관리 등록
        int result = this.menuManagerService.insertMenuManager(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/menuManagerList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/menuManagerList.do");
        }
        
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : menuManagerEdit
    * 2. ClassName  : MenuManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 상세정보
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/menuManagerEdit")
    public ModelAndView menuManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("ADM_MNU_IDX"), "")))
        {
            // 메뉴 관리 상세정보
            Map<String, Object> row = this.menuManagerService.selectMenuManagerInfo(commandMap);
            mv.addObject("row", row);
            if (!"".equals(StringUtil.getString(row.get("ADM_MNU_IDX"), "")))
            {
                commandMap.put("ADM_MNU_UP_IDX", StringUtil.getString(row.get("ADM_MNU_IDX"), ""));
                // 하위 메뉴 리스트
                mv.addObject("list", this.menuManagerService.selectmenuManagerList(commandMap));
            }
        }
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : menuManagerModify
    * 2. ClassName  : MenuManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 수정 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/menuManagerModify")
    public ModelAndView menuManagerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("ADM_MNU_IDX"), "")))
        {
         // 메뉴관리 등록
            int result = this.menuManagerService.updateMenuManager(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                
                if("0".equals(StringUtil.getString(commandMap.get("ADM_MNU_LEVEL"), "0")))
                {
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/menuManagerList.do");
                }
                else
                {
                    commandMap.put("ADM_MNU_IDX", StringUtil.getString(commandMap.get("ADM_MNU_UP_IDX")));
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/menuManagerEdit.do");
                }
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                
                if("0".equals(StringUtil.getString(commandMap.get("ADM_MNU_LEVEL"), "0")))
                {
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/menuManagerList.do");
                }
                else
                {
                    commandMap.put("ADM_MNU_IDX", StringUtil.getString(commandMap.get("ADM_MNU_UP_IDX")));
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/menuManagerEdit.do");
                }
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : menuManagerSortArrayAjax
     * 2. ClassName  : MenuManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 순서 변경 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/site/menuManagerSortArrayAjax")
     public JSON menuManagerSortArrayAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
     {
         JSON json = new JSON();
         int result = 0;
         
         if(commandMap.get("ADM_MNU_IDX[]") != null && commandMap.get("ADM_MNU_SORT[]") != null)
         {
             result = this.menuManagerService.updateMenuManagerSortArray(request, commandMap);
         }
         else
         {
             json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
         }
         if(result > 0)
         {
             json.put("message", "저장에 성공하였습니다.");
         }
         else
         {
             json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
         }
         return json;
     }
} 
