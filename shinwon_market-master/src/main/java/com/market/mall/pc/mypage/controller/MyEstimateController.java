														package com.market.mall.pc.mypage.controller;

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
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.mypage.service.MyEstimateService;
import com.market.mall.pc.mypage.service.MyPageService;


@Controller
public class MyEstimateController {

	@Resource(name="myEstimateService") 
	private MyEstimateService myEstimateService;
	
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimate
	 * 2. ClassName : MyEstimateController.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 2.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/mypage/myEstimate")
	public ModelAndView myEstimate(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		ModelAndView mv		= new ModelAndView();
		

		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
      	if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
			mv.addObject("summaryMap", summaryMap);
			
			int totalCount		= this.myEstimateService.selectMyEstimateCount(commandMap);
			
			commandMap.put("pageSize", "5");
			Paging paging = new Paging(totalCount, commandMap);
			
			List list			= this.myEstimateService.selectMyEstimateList(commandMap);
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			
			mv.setViewName("pc/mypage/myEstimate");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			commandMap.put("url", request.getAttribute("frontDomain") + "/pc/mypage/myEstimate.do");
            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/manager/login.do");
            // 해당 브랜드로 이동
            mv.setViewName("pc/common/result");
            
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateDetail
	 * 2. ClassName : MyEstimateController.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > 상세
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 3.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/mypage/myEstimateDetail")
	public ModelAndView myEstimateDetail(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{ 
		ModelAndView mv		= new ModelAndView();
		
		// 로그인 회원정보
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
			mv.addObject("summaryMap", summaryMap);

			Map info			= this.myEstimateService.selectMyEstimateInfo(commandMap);
			
			if(user.getMEM_MST_MEM_ID().equals(info.get("ESM_MST_MEM_ID")) && info.size() > 0){
				
				commandMap.put("ESM_PRD_PCH_IDX", "-1");
				List toplist		= this.myEstimateService.selectMyEstimatePrdList(commandMap);
				
				commandMap.put("ESM_PRD_PCH_IDX", "1");
				List list			= this.myEstimateService.selectMyEstimatePrdList(commandMap);
				List replyList		= this.myEstimateService.selectMyEstimateReplyList(commandMap); 
				
				int replyTot		= 0;
				
				if(replyList.size() > 0){
					replyTot	= replyList.size(); 
				}
				mv.addObject("info", info);
				mv.addObject("toplist", toplist);
				mv.addObject("list", list);
				mv.addObject("replyList", replyList);
				mv.addObject("replyTot", replyTot);
				mv.addObject("commandMap", commandMap);
				mv.setViewName("pc/mypage/myEstimateDetail");
			}else{
				String alertMsg = "잘못된 접근입니다.";
				mv.addObject("alertMsg", alertMsg);
				mv.setViewName("pc/common/result");
			}
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			commandMap.put("url", request.getAttribute("frontDomain") + "/pc/mypage/myEstimate.do");
            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/manager/login.do");
            mv.setViewName("pc/common/result");
		}
	
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateCommentReqAjax
	 * 2. ClassName : MyEstimateController.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > 댓글 등록  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 3.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/mypage/myEstimateCommentReqAjax")
	public JSON myEstimateCommentReqAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		
		String strMemLoginYN	= "";
		String resultMsg		= "";
		
		User user = SessionsUser.getSessionUser(request);
		
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			strMemLoginYN		= "Y";
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			
			strMemLoginYN		= "N";
		}
			
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
		
		if("Y".equals(strMemLoginYN)){
			int result		= this.myEstimateService.insertMyEstimateComment(commandMap);
			
			if(result > 0){
				resultMsg	= "등록했습니다.";
			}else{
				resultMsg	= "등록에 실패했습니다.";
			}
		}else{
			strMemLoginYN	= "로그인 후에 이용 가능합니다.";
		}
		
		json.addObject("resultMsg", resultMsg);
		json.addObject("memLoginYN", strMemLoginYN);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateCommentListAjax
	 * 2. ClassName : MyEstimateController.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > 댓글 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/mypage/myEstimateCommentListAjax")
	public JSON myEstimateCommentListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		
		List replyList		= this.myEstimateService.selectMyEstimateReplyList(commandMap);
		
		int totalCount		= 0;
		
		if(replyList.size() > 0){
			totalCount		= replyList.size();
		}
		
		json.addObject("list", replyList);
		json.addObject("totalCount", totalCount);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : myEstimateChoiceAjax
	 * 2. ClassName : MyEstimateController.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > 구매 확정
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/mypage/myEstimateChoiceAjax")
	public JSON myEstimateChoiceAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
		JSON json			= new JSON();
		
		String strMemLoginYN	= "";
		String resultMsg		= "";
		
		User user = SessionsUser.getSessionUser(request);
		
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
			
			strMemLoginYN		= "Y";
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
			
			strMemLoginYN		= "N";
		}
			
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
		
		if("Y".equals(strMemLoginYN)){
			int result		= this.myEstimateService.updateMyEstimateChoiceAjax(commandMap);
			
			if(result > 0){
				resultMsg	= "구매 확정되었습니다.";
			}else{
				resultMsg	= "등록에 실패했습니다.";
			}
		}else{
			strMemLoginYN	= "로그인 후에 이용 가능합니다.";
		}
		
		json.addObject("resultMsg", resultMsg);
		json.addObject("memLoginYN", strMemLoginYN);
		
		return json;
	}
}
