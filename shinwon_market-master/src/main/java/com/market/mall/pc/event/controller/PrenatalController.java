package com.market.mall.pc.event.controller;

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
import com.market.mall.common.SessionsUser;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.event.service.PrenatalService;

@Controller("pcPrenatalController")
public class PrenatalController {
	
	@Resource(name="prenatalService")
	private PrenatalService prenatalService;
	
	@Resource(name="cartService") 
	private CartService cartService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : prenatalEventMain
	 * 2. ClassName : PrenatalController.java
	 * 3. Comment : 태교 이벤트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 20.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/prenatal/prenatalEventMain")
	public ModelAndView prenatalEventMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		commandMap.put("EVNT_SNO", 312);
		commandMap.put("EVNT_LNO", 1);
		commandMap.put("pageSize", "15");
		
		if(SessionsUser.isLogin(request) ){
			
			 // 로그인 회원정보
	        User user = SessionsUser.getSessionUser(request);
	        
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_MST_MEM_NM", user.getMEM_MST_MEM_NM());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			int iCnt		= this.prenatalService.selectPrenatalCnt(commandMap);
			
			Map info		= null;
			
			Map<String, Object> userInfo 	= this.cartService.selectUserInfo(commandMap);
			mv.addObject("userInfo", userInfo);
			
			if(iCnt > 0){
				info		= this.prenatalService.selectPrenatalInfo(commandMap);
				mv.addObject("info", info);
				mv.addObject("upIngb", "UPD");
			}else{
				mv.addObject("upIngb", "INS");
			}
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int totalCount	= this.prenatalService.selectPrenatalTotalCount(commandMap);
		
		Paging paging	= new Paging(totalCount, commandMap);
		mv.addObject("paging", 	paging );
		
		if(totalCount > 0){
			List list		= this.prenatalService.selectPrenatalList(commandMap);
			mv.addObject("list", list);
		}
		
		
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/pc/prenatal/prenatalEventMain");
		return mv;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : prenatalProcess
	 * 2. ClassName : PrenatalController.java
	 * 3. Comment : 태교 이벤 트 프로세스 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 20.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/prenatal/prenatalProcess")
	public JSON prenatalProcess(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		JSON json		= new JSON();
		
		String upIngb	= StringUtil.getString(commandMap.get("upIngb"));
		if(SessionsUser.isLogin(request) ){
			 // 로그인 회원정보
	        User user = SessionsUser.getSessionUser(request);
	        commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
	        
	        if("INS".equals(upIngb)){
				this.prenatalService.insertPrenatal(commandMap);
				json.addObject("resultMsg", "신청되었습니다.");
			}else if("UPD".equals(upIngb)){
				this.prenatalService.updatePrenatal(commandMap);
				json.addObject("resultMsg", "수정되었습니다.");
			}
		}else{
			json.addObject("resultMsg", "로그인 후에 이용 가능합니다.");
		}
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : prepare2
	 * 2. ClassName : PrenatalController.java
	 * 3. Comment : 태교  팝업
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 20.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/prenatal/prepare2")
	public ModelAndView prepare2(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/pc/prenatal/prepare2");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : prenatalEventListAjax
	 * 2. ClassName : PrenatalController.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 20.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/prenatal/prenatalEventListAjax")
	public JSON prenatalEventListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		JSON json		= new JSON();
		
		commandMap.put("pageSize", 15);
		commandMap.put("EVNT_SNO", 312);
		commandMap.put("EVNT_LNO", 1);
		
		int totalCount	= this.prenatalService.selectPrenatalTotalCount(commandMap);
		json.addObject("totalCount",				totalCount);
		
		Paging paging	= new Paging(totalCount, commandMap);
				
		if(totalCount > 0){
			List list		= this.prenatalService.selectPrenatalList(commandMap);
			
			json.addObject("list", list);
			json.addObject("firstpageno", 				paging.getFirstPageNo());
			json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
			json.addObject("totalPageCount",  			paging.getTotalPageCount());
			json.addObject("lastPageNoOnPageList", 		paging.getLastPageNoOnPageList());	
			json.addObject("cPage", 					paging.getcPage());
			json.addObject("lastPageNo", 				paging.getLastPageNo());
			json.addObject("pageSize",  				paging.getPageSize());
			json.addObject("pagingSize", 				paging.getPagingSize());
			json.addObject("listNum",					paging.getListNum());
			json.addObject("totalRecordCount",			paging.getTotalRecordCount());
		    
		}
		
		
		return json;
	}
}
