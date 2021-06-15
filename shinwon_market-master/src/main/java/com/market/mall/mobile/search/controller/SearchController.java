package com.market.mall.mobile.search.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.User.ROLEUSER;

/**
 * @PackageName: com.market.mall.mobile.search.controller
 * @FileName : SearchController.java
 * @Date : 2016. 2. 25.
 * @프로그램 설명 : 모바일 > 검색을 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */

@Controller("mobileSearchController")
@AccessLevelUser(ROLEUSER.guest)
public class SearchController {
	
	/**
	* <pre>
	* 1. MethodName : search
	* 2. ClassName  : SearchController.java
	* 3. Comment    : 모바일 > 검색 > 검색 결과
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 25.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/search/search")
    public ModelAndView search(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		
		commandMap.put("MEM_MST_MEM_GBN", SessionsUser.getSessionUserValue("MEM_MST_MEM_GBN"));
		commandMap.put("MEM_MST_MEM_GRD", SessionsUser.getSessionUserValue("MEM_MST_MEM_GRD"));
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : searchFaq
	* 2. ClassName  : SearchController.java
	* 3. Comment    : 모바일 > 고객센터 > faq > 검색결과
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 9.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/search/searchFaq")
	public ModelAndView searchFaq (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	@FrontBannerSkip
	@RequestMapping("/mobile/search/ark/ark_trans")
	public ModelAndView ark_trans (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	@FrontBannerSkip
	@RequestMapping("/mobile/search/popword/popword")
	public ModelAndView popword (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	//모바일 상품검색 ajax 페이지
	@FrontBannerSkip()
	@RequestMapping("/mobile/search/searchMProductAjax")
	public ModelAndView searchMProductAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	//모바일 콘텐츠 ajax 페이지
	@FrontBannerSkip()
	@RequestMapping("/mobile/search/searchMEmagazineAjax")
	public ModelAndView searchMEmagazineAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	//모바일 기획전 ajax 페이지
	@FrontBannerSkip()
	@RequestMapping("/mobile/search/searchMExhibitionsAjax")
	public ModelAndView searchMExhibitionsAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	//모바일 리뷰 ajax 페이지
	@FrontBannerSkip()
	@RequestMapping("/mobile/search/searchMReviewAjax")
	public ModelAndView searchMReviewAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
}
