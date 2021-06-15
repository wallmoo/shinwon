package com.market.mall.am.site.controller;

import java.util.ArrayList;
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
import com.market.mall.am.site.service.PopularSearchWordService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;


/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : PopularSearchWordController.java
 * @Date : 2016. 8. 18.
 * @프로그램 설명 : 관리자 > 사이트관리 > 인기 검색어 관리를 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class PopularSearchWordController 
{
    @Resource(name="popularSearchWordService")
    private PopularSearchWordService popularSearchWordService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
     * <pre>
     * 1. MethodName : popularSearchWordList
     * 2. ClassName  : PopularSearchWordController.java
     * 3. Comment    : 관리자 > 사이트관리 > 인기 검색어 관리 목록/수정 폼 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/site/popularSearchWordList")
    public ModelAndView popularSearchWordList(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int totalCount = this.popularSearchWordService.selectPopularSearchWordListCount(commandMap);
        
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        if(totalCount >0){
            list = this.popularSearchWordService.selectPopularSearchWordList(commandMap); //목록 조회
        }
        
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    

    /**
     * <pre>
     * 1. MethodName : popularSearchWordRegist
     * 2. ClassName  : PopularSearchWordController.java
     * 3. Comment    : 관리자 >  사이트관리 > 인기검색어 등록
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/site/popularSearchWordRegist")
    public ModelAndView popularSearchWordRegist(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int result = this.popularSearchWordService.insertPopularSearchWord(request, commandMap);
        
        if(result > 0){
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/popularSearchWordList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/popularSearchWordList.do");
            
        }
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : popularSearchWordModify
     * 2. ClassName  : PopularSearchWordController.java
     * 3. Comment    : 관리자 > 사이트관리 > 인기검색어 수정
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/site/popularSearchWordModify")
    public ModelAndView popularSearchWordModify(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
  
        int result = this.popularSearchWordService.updatePopularSearchWord(request, commandMap);
        if(result > 0){
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/popularSearchWordList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/popularSearchWordList.do");
            
        }
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    
    
    
    
}
