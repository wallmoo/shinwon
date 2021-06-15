

package com.market.mall.pc.customer.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Code;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.customer.service.SitemapService;

@Controller
@AccessLevelUser(ROLEUSER.guest)
public class SitemapController {
	
	@Resource(name="sitemapService")
    private SitemapService sitemapService;

//	@RequestMapping("/pc/customer/sitemap")
//    public ModelAndView sitemap (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        ModelAndView mv = new ModelAndView();
//        
//        // 사이트맵용 메뉴 가져오기.
//        commandMap.put("searchPrdCtgEnv","P");
//        
//        // 카테고리
//        commandMap.put("TOP_CATEGORY",-1);
//        Map<String, Object> categoryMenuMap = this.sitemapService.selectSubCategory(commandMap);
//        
//        mv.addObject("commandMap", commandMap);
//        mv.addObject("categoryMenuMap", categoryMenuMap);
//        return mv;
//    }
}

