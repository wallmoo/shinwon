package com.market.mall.mobile.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyPointService;


/**
 * @PackageName: com.market.mall.mobile.mypage.controller
 * @FileName : MyPointController.java
 * @Date : 2015. 7. 15.
 * @프로그램 설명 : 모바일 > 마이페이지 > 포인트를 처리하는 Controller Class
 * @author DEV_SONGJEONGEUN
 */
@Controller("mobileMyPointController")
public class MyPointController {
	
    @Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
    @Resource(name="pcMyPointService")
    private MyPointService pcMyPointService;

    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	
	/**
	 * <pre>
	 * 1. MethodName	: myPointList
	 * 2. ClassName		: MyPointController.java
     * 3. Comment    	: 모바일 > 마이페이지 > 나의 포인트 
	 * 4. 작성자			: DEV_SONGJEONGEUN
	 * 5. 작성일			: 2015. 7. 15.
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myPointList")
    public ModelAndView myPointList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
        	ModelAndView mv = new ModelAndView();
            
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request,commandMap);
            
            // 포인트 거래내역 갯수
            int totalCount = this.pcMyPointService.selectMyPointListCount(request,commandMap);
            commandMap.put("pageSize", 10);
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount > 0)
            {
                // 포인트 거래내역
            	list = this.pcMyPointService.selectMyPointList(request,commandMap);
            }  
            
            //RETURN OBJECT
            mv.addObject("list", list);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("paging", paging);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
}
