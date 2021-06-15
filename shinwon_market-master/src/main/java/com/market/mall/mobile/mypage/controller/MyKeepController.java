package com.market.mall.mobile.mypage.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.mypage.service.MyKeepService;
import com.market.mall.pc.mypage.service.MyPageService;

/**
 * @PackageName: com.market.mall.mobile.mypage.controller
 * @FileName : MyKeepController.java
 * @Date : 2016. 2. 18.
 * @프로그램 설명 : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백을 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller("mobileMyKeepController")
public class MyKeepController {

	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
    @Resource(name="pcMyKeepService")
    private MyKeepService pcMyKeepService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_SMALL;
	
	/**
	* <pre>
	* 1. MethodName : myKeepProductList
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑상품 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myKeepProductList")
    public ModelAndView myKeepProductList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);

            commandMap.put("pageSize", 5); //페이지당 5개
            
            //키핑 상품 MOBILE 구분 값
            commandMap.put("CHN_GBN",Code.USER_ENV_TYPE_MOBILE);
            
            int totalCount = this.pcMyKeepService.selectKeepProductListCount(commandMap);
            
            commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
            
            if(totalCount > 0)
            {
            	list = this.pcMyKeepService.selectKeepProductList(commandMap);	
            }
            
            mv.addObject("totalCount",totalCount);
            mv.addObject("paging", paging);
            mv.addObject("list", list);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : deleteKeepProductAjax
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑상품 > 선택 상품 삭제
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/mypage/deleteKeepProductAjax.do", method = RequestMethod.POST)
	public JSON deleteKeepProductAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

			String[] keep_idx_arr = request.getParameterValues("MEM_KEP_IDX[]");
			List<String> MEM_KEP_IDXs = Arrays.asList(keep_idx_arr);
			commandMap.put("MEM_KEP_IDXs", MEM_KEP_IDXs);
			
			// 선택 키핑상품 삭제
			int delKeepProductCount = this.pcMyKeepService.deleteKeepProduct(commandMap);
			
			if(delKeepProductCount > 0)
			{
				json.put("result","Y");
			}
			else
			{
				json.put("result", "N");
			}

			return json;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteSoldOutKeepProductAjax
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑상품 > 품절 상품 삭제
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/deleteSoldOutKeepProductAjax")
	public JSON deleteSoldOutKeepProductAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

			// 품절 키핑상품 삭제
			int delSoldOutKeepProductCount = this.pcMyKeepService.deleteSoldOutKeepProduct(commandMap);
			
			if(delSoldOutKeepProductCount > 0)
			{
				json.put("result","Y");
			}
			else if(delSoldOutKeepProductCount == 0)
			{
				json.put("result", "N");
			}
			else
			{
				json.put("result","E"); 	// 에러
			}

			return json;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : myKeepContentsList
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑콘텐츠 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myKeepContentsList")
	public ModelAndView myKeepContentsList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);

            commandMap.put("pageSize", 5); //페이지당 12개
            
            //키핑 콘텐츠 MOBILE 목록 이미지 구분 값
            commandMap.put("CHN_GBN",Code.USER_ENV_TYPE_MOBILE);
            
            int totalCount = this.pcMyKeepService.selectKeepContentsListCount(commandMap);
            
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
            String MGZ_MST_CTS = "";
            
            if(totalCount > 0)
            {
            	list = this.pcMyKeepService.selectKeepContentsList(commandMap);	
            	
            	for (int i = 0; i < list.size(); i++) {
            		MGZ_MST_CTS = (String)list.get(i).get("MGZ_MST_CTS");
            		MGZ_MST_CTS = StringUtil.replace(MGZ_MST_CTS, "&nbsp;", " ");
            		list.get(i).put("MGZ_MST_CTS", StringUtil.getEditerHtmlOut(MGZ_MST_CTS));
    			}
            }
            
            mv.addObject("totalCount",totalCount);
            mv.addObject("paging", paging);
            mv.addObject("list", list);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteKeepContentsAjax
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑콘텐츠 > 선택 콘텐츠 삭제
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/mypage/deleteKeepContentsAjax.do", method = RequestMethod.POST)
	public JSON deleteKeepContentsAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

			String[] cts_idx_arr = request.getParameterValues("MEM_CTS_IDX[]");
			List<String> MEM_CTS_IDXs = Arrays.asList(cts_idx_arr);
			commandMap.put("MEM_CTS_IDXs", MEM_CTS_IDXs);
			
			// 선택 키핑콘텐츠 삭제
			int delKeepContentsCount = this.pcMyKeepService.deleteKeepContents(commandMap);
			
			if(delKeepContentsCount > 0)
			{
				json.put("result","Y");
			}
			else
			{
				json.put("result", "N");
			}

			return json;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : myKeepPlanList
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑기획전 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myKeepPlanList")
	public ModelAndView myKeepPlanList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);

            commandMap.put("pageSize", 5); //페이지당 12개
            
            //키핑 기획전 MOBILE 목록 이미지 구분 값
            commandMap.put("CHN_GBN",Code.USER_ENV_TYPE_MOBILE);
            commandMap.put("PLN_MST_CHANNEL_MOBILE_YN","Y");
            
            int totalCount = this.pcMyKeepService.selectKeepPlanListCount(commandMap);
            
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
            
            if(totalCount > 0)
            {
            	list = this.pcMyKeepService.selectKeepPlanList(commandMap);	
            }
            
            mv.addObject("totalCount",totalCount);
            mv.addObject("paging", paging);
            mv.addObject("list", list);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteKeepPlanAjax
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑기획전 > 선택 기획전 삭제
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/mypage/deleteKeepPlanAjax.do", method = RequestMethod.POST)
	public JSON deleteKeepPlanAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

			String[] cts_idx_arr = request.getParameterValues("MEM_CTS_IDX[]");
			List<String> MEM_CTS_IDXs = Arrays.asList(cts_idx_arr);
			commandMap.put("MEM_CTS_IDXs", MEM_CTS_IDXs);
			
			// 선택 키핑콘텐츠 삭제
			int delKeepContentsCount = this.pcMyKeepService.deleteKeepContents(commandMap);
			
			if(delKeepContentsCount > 0)
			{
				json.put("result","Y");
			}
			else
			{
				json.put("result", "N");
			}

			return json;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteEndKeepPlanAjax
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑기획전 > 종료된 기획전 삭제
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/mypage/deleteEndKeepPlanAjax.do", method = RequestMethod.POST)
	public JSON deleteEndKeepPlanAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

			// 종료된 기획전 삭제
			int delEndKeepPlanCount = this.pcMyKeepService.deleteEndKeepPlan(commandMap);
			
			if(delEndKeepPlanCount > 0)
			{
				json.put("result","Y");
			}
			else
			{
				json.put("result", "N");
			}

			return json;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : myKeepEventList
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 사용자 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑이벤트 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myKeepEventList")
	public ModelAndView myKeepEventList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);

            commandMap.put("pageSize", 5); //페이지당 12개
            
            //키핑 이벤트 MOBILE 목록 이미지 구분 값
            commandMap.put("CHN_GBN",Code.USER_ENV_TYPE_MOBILE);  
            commandMap.put("EVT_MST_MB_YN","Y");
            
            int totalCount = this.pcMyKeepService.selectKeepEventListCount(commandMap);
            
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
            
            if(totalCount > 0)
            {
            	list = this.pcMyKeepService.selectKeepEventList(commandMap);	
            }
            
            mv.addObject("totalCount",totalCount);
            mv.addObject("paging", paging);
            mv.addObject("list", list);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteKeepEventAjax
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑이벤트 > 선택 이벤트 삭제
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/mypage/deleteKeepEventAjax.do", method = RequestMethod.POST)
	public JSON deleteKeepEventAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

			String[] cts_idx_arr = request.getParameterValues("MEM_CTS_IDX[]");
			List<String> MEM_CTS_IDXs = Arrays.asList(cts_idx_arr);
			commandMap.put("MEM_CTS_IDXs", MEM_CTS_IDXs);
			
			// 선택 키핑콘텐츠 삭제
			int delKeepContentsCount = this.pcMyKeepService.deleteKeepContents(commandMap);
			
			if(delKeepContentsCount > 0)
			{
				json.put("result","Y");
			}
			else
			{
				json.put("result", "N");
			}

			return json;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteEndKeepEventAjax
	* 2. ClassName  : MyKeepController.java
	* 3. Comment    : 모바일 > MYPAGE > 쇼핑컨텐츠 > 키핑백 > 키핑이벤트 > 종료된 이벤트 삭제
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/mypage/deleteEndKeepEventAjax.do", method = RequestMethod.POST)
	public JSON deleteEndKeepEventAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

			// 종료된 이벤트 삭제
			int delEndKeepEventCount = this.pcMyKeepService.deleteEndKeepEvent(commandMap);
			
			if(delEndKeepEventCount > 0)
			{
				json.put("result","Y");
			}
			else
			{
				json.put("result", "N");
			}

			return json;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
	
}
