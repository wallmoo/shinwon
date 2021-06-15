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
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyEventService;
import com.market.mall.pc.mypage.service.MyPageService;

/**
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyEventController.java
 * @Date : 2016. 2. 16.
 * @프로그램 설명 : 마이랜드 > 참여한이벤트를 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
@Controller("pcMyEventController")
public class MyEventController {
	
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
    @Resource(name="pcMyEventService")
    private MyEventService pcMyEventService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	* <pre>
	* 1. MethodName : myEventList
	* 2. ClassName : MyEventController.java
	* 3. Comment : 참여한 이벤트 내역
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 7.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myEventList")
    public ModelAndView myEventList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            //내가 참여한 이벤트 카운트
            int totalCount = this.pcMyEventService.selectMyEventListCount(commandMap);
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
                // 사용가능 쿠폰 목록
            	list = this.pcMyEventService.selectMyEventList(commandMap);
            }  
            
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("totalCount", totalCount);
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("commandMap", commandMap);
            
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }

}
