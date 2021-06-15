package com.market.mall.mobile.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.brand.service.BrandStoreIntroService;
import com.market.mall.pc.mypage.service.MyRegularStoreService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyRegularStoreController.java
 * @Date : 2015. 6. 16.
 * @프로그램 설명 : 사용자 > 퀵메뉴 > 단골매장 관련하여 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */

@Controller("mMyRegularStoreController")
public class MyRegularStoreController 
{
	@Resource(name="pcMyRegularStoreService") private MyRegularStoreService pcMyRegularStoreService;
	@Resource(name="pcBrandStoreIntroService") private BrandStoreIntroService pcBrandStoreIntroService;
	
	/**
	* <pre>
	* 1. MethodName : regularStorePopup
	* 2. ClassName : MyRegularStoreController.java
	* 3. Comment : 사용자 > 퀵메뉴 > 설정 클릭 시 단골매장 팝업
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobilemypage/regularStorePopup")
	public ModelAndView regularStorePopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			// 검색 된 상태로 화면 로딩 
			commandMap.put("searchYn", "Y");
			
			// 회사코드
			commandMap.put("COMP_CD", request.getAttribute("serverCompCd"));
			
			// 매장 지역 관련 목록
	        List<Map<String,Object>> storeAreaList = this.pcBrandStoreIntroService.selectStoreAreaList(commandMap);
			
			if(StringUtil.getString(commandMap.get("searchYn"),"Y").equals("Y"))
			{
				//commandMap.put("pageSize", "5");
		        // 단골매장 목록 갯수
				int totalCount = this.pcMyRegularStoreService.selectRegularStoreCount(commandMap);
		        //Paging paging = new Paging(totalCount, commandMap); 
		        //mv.addObject("paging", paging);
		        
		        if(totalCount > 0)
		        {
		        	// 단골매장 목록
		            mv.addObject("regularStoreList",  this.pcMyRegularStoreService.selectRegularStoreList(commandMap));
		        }      
			}
	        
	        // 해당 브랜드로 이동
	        mv.setViewName("pc/mypage/regularStorePopup");
	        
	        //RETURN OBJECT
	        mv.addObject("commandMap", commandMap);
	        mv.addObject("storeAreaList",storeAreaList);
	        
	        return mv;
        }
		else
	    {
			throw new PcAuthenticationException();
	    }
	}
	
	/**
	* <pre>
	* 1. MethodName : updateRegularStore
	* 2. ClassName : MyRegularStoreController.java
	* 3. Comment : 사용자 > 퀵메뉴 > 단골매장 팝업 > 단골 매장 변경
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobilemypage/updateRegularStore")
	public ModelAndView updateRegularStore (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			//사용자 정보
			User user = SessionsUser.getSessionUser(request);
			
			if(SessionsUser.isLogin(request)){
				commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
				commandMap.put("MEM_MST_MEMBER_NO", SessionsUser.getSessionUserValue("MEM_MST_MEMBER_NO"));
			}
			
			int result = this.pcMyRegularStoreService.updateRegularStore(commandMap);
			
			if(result > 0)
			{
				mv.addObject("closeMsg", "단골매장 변경되었습니다.");
			}
			else
			{
				mv.addObject("closeMsg", "단골매장 변경 실패하였습니다.");
			}
			mv.addObject("commandMap", commandMap);
			// 해당 브랜드로 이동
	        mv.setViewName("pc/common/result");
			
	        return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
}
