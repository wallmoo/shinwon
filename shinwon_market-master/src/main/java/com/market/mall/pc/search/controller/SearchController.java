package com.market.mall.pc.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.display.service.TagDisplayService;
import com.market.mall.am.site.service.PopularSearchWordService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.contents.service.ContentListService;
import com.market.mall.pc.customer.service.CustomerService;

/**
 * @PackageName: com.market.mall.pc.search.controller
 * @FileName : SearchController.java
 * @Date : 2015. 6. 19.
 * @프로그램 설명 : 사용자 > top영역의 검색을 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */


@Controller("pcSearchController")
@AccessLevelUser(ROLEUSER.guest)
public class SearchController {
	
	@Resource(name="pcCustomerService")
    private CustomerService pcCustomerService;
	
	@Resource(name="popularSearchWordService")
	private PopularSearchWordService popularSearchWordService;
	
	@Resource(name="pcCommonService")		
	private CommonService pcCommonService;	
	
	@Resource(name="tagDisplayService")
	private TagDisplayService tagDisplayService;
	
	 @Resource(name="contentListService")
	 private ContentListService contentListService;
	 
	/**
	* <pre>
	* 1. MethodName : search
	* 2. ClassName  : SearchController.java
	* 3. Comment    : 사용자 > top영역의 검색 > 검색 결과
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/search/search.do")
	public ModelAndView search (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{

		commandMap.put("MEM_MST_MEM_GBN", SessionsUser.getSessionUserValue("MEM_MST_MEM_GBN"));
		commandMap.put("MEM_MST_MEM_GRD", SessionsUser.getSessionUserValue("MEM_MST_MEM_GRD"));
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		mv.setViewName("pc/search/search");
		
	    Map<String, Object> tagParamMap = new HashMap<>();
        tagParamMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY);
        tagParamMap.put("CMN_COM_IDX", "3725");
        mv.addObject("searchTagList", this.tagDisplayService.selectTagDisplayList(tagParamMap));
        
        List<Map<String, Object>> prdColors = this.pcCommonService.selectCode("COMMON_PRODUCT_COLOR");
        
        commandMap.put("color_name", "전체");
        commandMap.put("color_style", "");
        if(commandMap.containsKey("color")) {
        	String prevColor = commandMap.get("color").toString();
        	if(StringUtils.isNotEmpty(prevColor)) {
        		for(int i = 0 ; i < prdColors.size(); i++) {
        			if(prevColor.equals(prdColors.get(i).get("CMN_COM_IDX").toString())) {
        				commandMap.put("color_name", prdColors.get(i).get("CMN_COM_NM").toString());
        				commandMap.put("color_style", "style='background:" + prdColors.get(i).get("CMN_COM_ETC2").toString() +  ";'");
        				
        			}
        		}
        	}
        	
        }
        mv.addObject("colorList", prdColors);
        
		return mv;
	}
	
	@RequestMapping("/pc/search/noSearch.do")
	public ModelAndView noSearch (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : searchFaq
	* 2. ClassName  : SearchController.java
	* 3. Comment    : 사용자 > 고객센터 > faq > 검색결과
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 9.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/search/searchFaq")
	public ModelAndView searchFaq (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		commandMap.put("CMN_COM_UP_IDX", 105);
        Map<String, Object> dataMap = this.pcCustomerService.selectCustomerMain(commandMap);
        
        mv.addObject("fqaCodeList", dataMap.get("fqaCodeList"));
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	
	@FrontBannerSkip
	@RequestMapping("/pc/search/ark/ark_trans")
	public ModelAndView ark_trans (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	@FrontBannerSkip
	@RequestMapping("/pc/search/popword/popword")
	public ModelAndView popword (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	
	
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : searchResultListAjax
	  * 2. ClassName : ContentListService.java
	  * 3. Comment : 컨텐트 리스트 Ajax
	  * 4. 작성자 : MR.Park
	  * 5. 작성일 : 2020. 05. 02.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/search/searchResultListAjax.do")
	 public JSON contentListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json = new JSON();
		 
		 //product : 제품, time : 타임세일, fund : 펀딩, plan : 기획전, event : 이벤트, haul : 채널온
		 String searchType = commandMap.get("search_type").toString();
		 int offset = !commandMap.containsKey("offset") ? 1 : Integer.parseInt(commandMap.get("offset").toString());

		 commandMap.put("STARTNUM", offset);
		 commandMap.put("ENDNUM", 8);
		 
		 User curUser = SessionsUser.getSessionUser(request);
		 commandMap.put("MEM_MST_ID", curUser.getMEM_MST_MEM_ID());
		 commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
		 commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE);
		 
		 commandMap.put("MAN_CODE", Code.COMMON_GENDER_MAN);
		 commandMap.put("FEMAIL_CODE", Code.COMMON_GENDER_WOMAN);
		 commandMap.put("UNISEX_CODE", Code.COMMON_GENDER_UNISEX);
		 
		 /*
		 JSONArray jsonArray = new JSONArray(commandMap.get("tag_bnd_id").toString());
		 ArrayList<String> ids =new ArrayList<>();
		 
		 for(int i = 0 ; i <  jsonArray.length(); i++) 
			 ids.add(jsonArray.getString(i));
			 
		 commandMap.put("tag_list", ids);
		 */
		 
		 
		 List<Map<String, Object>> resultList = new ArrayList<>();
		 if("product".equals(searchType)) {
			 resultList = contentListService.selectSearchProductList(commandMap);
		 } else if("time".equals(searchType)) {
			 resultList = contentListService.selectSearchTimeList(commandMap);
		 } else if ("fund".equals(searchType)) {
			 resultList = contentListService.selectSearchFundList(commandMap);
		 } else if ("plan".equals(searchType)) {
			 resultList = contentListService.selectSearchPlanList(commandMap);
		 } else if ("event".equals(searchType)) {
			 resultList = contentListService.selectSearchEventList(commandMap);
		 }  else if ("haul".equals(searchType)) {
			 resultList = contentListService.selectSearchHaulList(commandMap);
		 }
		 
		 
		 json.addObject("type", searchType);
		 json.addObject("list", resultList);
		 json.addObject("offset", offset + resultList.size());
		 json.addObject("count", resultList.size());

		 return json;
	 }

	 /**
	  * 
	  * <pre>
	  * 1. MethodName : searchResultCountAjax
	  * 2. ClassName : ContentListService.java
	  * 3. Comment : 컨텐트 리스트 Ajax
	  * 4. 작성자 : MR.Park
	  * 5. 작성일 : 2020. 05. 02.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/search/searchResultCountAjax.do")
	 public JSON searchResultCountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json = new JSON();
		 
		 //product : 제품, time : 타임세일, fund : 펀딩, plan : 기획전, event : 이벤트, haul : 채널온

		 User curUser = SessionsUser.getSessionUser(request);
		 commandMap.put("MEM_MST_ID", curUser.getMEM_MST_MEM_ID());
		 commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
		 commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE);
		 
		 commandMap.put("MAN_CODE", Code.COMMON_GENDER_MAN);
		 commandMap.put("FEMAIL_CODE", Code.COMMON_GENDER_WOMAN);
		 commandMap.put("UNISEX_CODE", Code.COMMON_GENDER_UNISEX);
		 
		 /*
		 JSONArray jsonArray = new JSONArray(commandMap.get("tag_bnd_id").toString());
		 ArrayList<String> ids =new ArrayList<>();
		 
		 for(int i = 0 ; i <  jsonArray.length(); i++) 
			 ids.add(jsonArray.getString(i));
			 
		 commandMap.put("tag_list", ids);
		 */
		 
		 json.addObject("product", contentListService.selectSearchProductCount(commandMap));
		 json.addObject("time", contentListService.selectSearchTimeCount(commandMap)); 
		 json.addObject("fund", contentListService.selectSearchFundCount(commandMap)); 
		 json.addObject("plan", contentListService.selectSearchPlanCount(commandMap));
		 
		 json.addObject("event", contentListService.selectSearchEventCount(commandMap)); 
		 json.addObject("haul", contentListService.selectSearchHaulCount(commandMap));  
		 
		 return json;
	 }
	 
	/**
	* <pre>
	* 1. MethodName : searchApi
	* 2. ClassName  : SearchController.java
	* 3. Comment    : 사용자 > content영역 Ajax
	* 4. 작성자       : 조준철
	* 5. 작성일       : 2016. 4. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	//콘텐츠 ajax
	@FrontBannerSkip()
	@RequestMapping("/pc/search/searchEmagazineAjax")
	public ModelAndView searchEmagazineAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	//기획전 ajax
	@FrontBannerSkip()
	@RequestMapping("/pc/search/searchExhibitionsAjax")
	public ModelAndView searchExhibitionsAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	//상품 ajax
	@FrontBannerSkip()
	@RequestMapping("/pc/search/searchProductAjax")
	public ModelAndView searchProductAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	//리뷰 ajax
	@FrontBannerSkip()
	@RequestMapping("/pc/search/searchReviewAjax")
	public ModelAndView searchReviewAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	
	
	/**
	 * <pre>
	 * 1. MethodName : popularSearchWordAjax
	 * 2. ClassName  : SearchController.java
	 * 3. Comment    : 프론트 > 검색 > 인기검색어 선택시 조회수 증가
	 *               : 인기검색어 선택 시 해당 text 조회 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 23.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping("/pc/search/popularSearchWordAjax")
    public JSON popularSearchWordAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("PPL_WRD_IDX"), "")))
        {
            int result = this.popularSearchWordService.updatePopularSearchWordHit(request, commandMap); //인기검색어 조회수 증가
            if(result > 0)
            {
                Map<String, Object> popWordMap = this.popularSearchWordService.selectPopSearchWordInfo(commandMap);//인기검색어 text
                String popWord = StringUtil.getString(popWordMap.get("PPL_WRD_TEXT"),"");
                json.put("popWord", popWord);
                json.put("resultYn", "Y");
            }
        }
        else
        {
            json.put("resultMsg", "잘못된 접근입니다. 올바른 경로로 접근해 주십시오.");
            json.put("resultYn", "N");
        }
        return json;
    }
}
