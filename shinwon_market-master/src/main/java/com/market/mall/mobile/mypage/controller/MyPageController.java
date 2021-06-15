package com.market.mall.mobile.mypage.controller;

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
import com.epasscni.common.exception.MobileAuthenticationException;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.mypage.service.MyPageService;

@Controller("mobileMyPageController")
public class MyPageController {

    @Resource(name="pcMyPageService")		private MyPageService pcMyPageService;
    
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    /**
    * <pre>
    * 1. MethodName : myPageMain
    * 2. ClassName  : MyPageController.java
    * 3. Comment    : 모바일 > 마이페이지 > 메인
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 8. 6.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myPageMain")
    public ModelAndView myPageMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
        	ModelAndView mv = new ModelAndView();
            
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            // 배송현황
            Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
            
            // 킹저 여부
            int kingerCount = this.pcMyPageService.selectKingerCount(commandMap);
                  
            if(kingerCount > 0)
            {
            	// 킹저의 상품후기 갯수 및 IDX
            	List<Map<String,Object>> kingerProductCommentList = this.pcMyPageService.selectkingerProductCommentList(commandMap);
            	
            	mv.addObject("kingerProductCommentList", kingerProductCommentList);
            }
            
    		// 해당 브랜드로 이동
            mv.setViewName("mobile/mypage/myPageMain");
            
    		//RETURN OBJECT
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("myPageOrderInfo", myPageOrderInfo);
            mv.addObject("kingerCount", kingerCount);
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
     * 1. MethodName : myPageOrderListAjax
     * 2. ClassName  : MyPageController.java
     * 3. Comment    : 마이페이지 메인 최근 주문내역 ajax
     * 4. 작성자       : DEV_KANGHYUNKYU
     * 5. 작성일       : 2016. 1. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @FrontBannerSkip
     @AccessLevelUser(ROLEUSER.user)
     @RequestMapping("/mobile/mypage/myPageOrderListAjax")
     public ModelAndView myPageOrderListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
         
         // 상품 채널 타입
      	commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용
      	
         // 최근 주문내역 목록 갯수
      	commandMap.put("ORD_MST_ORD_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
         int totalOrderCount = this.pcMyPageService.selectMyPageOrderListCount(commandMap);
         commandMap.put("pageSize", 5);
         Paging paging = new Paging(totalOrderCount, commandMap); 
         List<Map<String, Object>> orderList = null;
         if(totalOrderCount>0)
         {
             // 나의 쇼핑내역 목록
         	orderList = this.pcMyPageService.selectMyPageOrderList(commandMap);
         }
         
         mv.addObject("commandMap",commandMap);
         mv.addObject("orderList", orderList);
         mv.addObject("paging", paging);
         
         return mv;
     }
}
