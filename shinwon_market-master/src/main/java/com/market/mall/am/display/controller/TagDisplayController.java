package com.market.mall.am.display.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.display.service.TagDisplayService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.util.MakeCategoryHtmlUtil;
import com.market.mall.model.Code;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class TagDisplayController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="tagDisplayService")
    private TagDisplayService tagDisplayService;
    
    @RequestMapping(value="/am/display/tagView")
    public ModelAndView tagView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("CMN_COM_IDX", Code.COMMON_DISPLAY_TAG);
    
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    @RequestMapping("/am/display/tagCategoryAjax")
    public JSON tagCategoryAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        commandMap.put("CMN_COM_IDX", commandMap.get("CMN_COM_IDX" ) );
        List<Map<String, Object>> list = this.tagDisplayService.selectTagDisplayCategoryList(commandMap);
        String categoryHtml = MakeCategoryHtmlUtil.makeCategoryHtml(list, "CMN_COM_LEVEL", "CMN_COM_IDX", "CMN_COM_NM");
        json.put("tagCategoryList", categoryHtml);
        
        return json;
    }
    
    @RequestMapping("/am/display/tagDisplayList")
    public ModelAndView tagDisplayList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	if("".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), "")))
    	{
    		return mv;
    	}
    	commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY);
    	List<Map<String, Object>> list = tagDisplayService.selectTagDisplayList(commandMap);
    	
    	List<Map<String, Object>> tagDisplayCodeList = tagDisplayService.selectTagDisplayCategoryCodeList(commandMap);
    	
    	mv.addObject("tagDisplayCodeList", tagDisplayCodeList);
    	mv.addObject("commandMap", commandMap);
    	mv.addObject("list", list);
    	
    	return mv;
    }
    
    @RequestMapping("/am/display/tagDispalyRegist")
    public ModelAndView tagDispalyRegist(HttpServletRequest request, @RequestParams String[] TAG_MST_IDs, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	commandMap.put("TAG_MST_IDs", TAG_MST_IDs);
    	int result = this.tagDisplayService.insertTagDisplay(commandMap);
    	
		if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/tagView.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/tagView.do");
        }
		commandMap.put("SUB_CMN_COM_IDX", commandMap.get("CMN_COM_IDX"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
    	return mv;
    }
}
