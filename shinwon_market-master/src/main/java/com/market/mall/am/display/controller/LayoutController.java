package com.market.mall.am.display.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import org.codehaus.jackson.type.TypeReference;
import com.market.mall.am.display.service.LayoutService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class LayoutController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
   
    @Resource(name="layoutService") private LayoutService layoutService;
    
    @RequestMapping(value="/am/display/layoutView")
    public ModelAndView layoutView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("list", layoutService.selectMenuList()); 
        return mv;
    }
    
    @RequestMapping(value="/am/display/layoutModify")
    public ModelAndView layoutModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //layoutService.deleteMenuList();
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<Map<String, Object>>> typeRef = new TypeReference<List<Map<String, Object>>>(){};
        
        List<Map<String,Object>> menuList = mapper.readValue(commandMap.get("menuList").toString(), typeRef);
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("menuList", menuList);
        layoutService.updateMenuList(param);
        //layoutService.insertMenuList(param);
        
        mv.addObject("alertMsg", "저장 되었습니다.");
        mv.addObject("returnUrl", "/am/display/layoutView.do");
        mv.addObject("list", menuList);     
        mv.setViewName("/am/common/result");
        return mv;
    }
}
